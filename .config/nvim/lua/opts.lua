local a = vim.api
local validate = vim.validate

local if_nil = vim.F.if_nil
local nil_wrap = vim.F.nil_wrap

local function make_meta_accessor(get, set, del, validator)
  validator = validator or function() return true end

  validate {
    validator = {validator, 'f'};
    get = {get, 'f'};
    set = {set, 'f'};
    del = {del, 'f', true};
  }

  local mt = {}
  if del then
    function mt:__newindex(k, v)
      if not validator(k, v) then
        return
      end

      if v == nil then
        return del(k)
      end
      return set(k, v)
    end
  else
    function mt:__newindex(k, v)
      if not validator(k, v) then
        return
      end
      return set(k, v)
    end
  end
  function mt:__index(k)
    if not validator(k) then
      return
    end

    return get(k)
  end
  return setmetatable({}, mt)
end

vim.b = make_meta_accessor(
  nil_wrap(function(v) return a.nvim_buf_get_var(0, v) end),
  function(v, k) return a.nvim_buf_set_var(0, v, k) end,
  function(v) return a.nvim_buf_del_var(0, v) end
)
vim.w = make_meta_accessor(
  nil_wrap(function(v) return a.nvim_win_get_var(0, v) end),
  function(v, k) return a.nvim_win_set_var(0, v, k) end,
  function(v) return a.nvim_win_del_var(0, v) end
)
vim.t = make_meta_accessor(
  nil_wrap(function(v) return a.nvim_tabpage_get_var(0, v) end),
  function(v, k) return a.nvim_tabpage_set_var(0, v, k) end,
  function(v) return a.nvim_tabpage_del_var(0, v) end
)
vim.g = make_meta_accessor(nil_wrap(a.nvim_get_var), a.nvim_set_var, a.nvim_del_var)
vim.v = make_meta_accessor(nil_wrap(a.nvim_get_vvar), a.nvim_set_vvar)

local all_options_info = vim.api.nvim_get_all_options_info()

local reduce = vim.tbl_reduce
local filter = vim.tbl_filter

local accumulate = function(reducer, t)
  return reduce({}, reducer, t)
end

local scope_filter = function(scope)
  return function(v) return v.scope == scope end
end

local filter_options_to_scope = function(scope)
  return filter(scope_filter(scope), all_options_info)
end

-- [ { name = 'filetype', shortname = 'ft' }, ... ]
-- -> { 'filetype' = true, 'ft' = true, ... }
local name_accumulator = function(acc, v)
  acc[v.name] = true
  if v.shortname ~= "" then acc[v.shortname] = true end
end

local buf_options = accumulate(name_accumulator, filter_options_to_scope("buf"))
local glb_options = accumulate(name_accumulator, filter_options_to_scope("global"))
local win_options = accumulate(name_accumulator, filter_options_to_scope("win"))

local buf_validator = function(k, v)
  if type(k) == 'string' then
    if win_options[k] then
      error(string.format([['%s' is a window option, not a buffer option. See ":help %s"]], k, k))
    elseif glb_options[k] then
      error(string.format([['%s' is a global option, not a buffer option. See ":help %s"]], k, k))
    end
  end

  return true
end

local win_validator = function(k, v)
  if type(k) == 'string' then
    if buf_options[k] then
      error(string.format([['%s' is a buffer option, not a window option. See ":help %s"]], k, k))
    elseif glb_options[k] then
      error(string.format([['%s' is a global option, not a window option. See ":help %s"]], k, k))
    end
  end

  return true
end
vim.o = make_meta_accessor(a.nvim_get_option, a.nvim_set_option)

local function getenv(k)
  local v = vim.fn.getenv(k)
  if v == vim.NIL then
    return nil
  end
  return v
end
vim.env = make_meta_accessor(getenv, vim.fn.setenv)

local function new_buf_opt_accessor(bufnr)
  local function get(k)
    if bufnr == nil and type(k) == "number" then
      return new_buf_opt_accessor(k)
    end

    return a.nvim_buf_get_option(bufnr or 0, k)
  end

  local function set(k, v)
    return a.nvim_buf_set_option(bufnr or 0, k, v)
  end

  return make_meta_accessor(get, set, nil, buf_validator)
end
vim.bo = new_buf_opt_accessor(nil)

local function new_win_opt_accessor(winnr)
  local function get(k)
    if winnr == nil and type(k) == "number" then
      return new_win_opt_accessor(k)
    end
    return a.nvim_win_get_option(winnr or 0, k)
  end
  local function set(k, v) return a.nvim_win_set_option(winnr or 0, k, v) end
  return make_meta_accessor(get, set, nil, win_validator)
end
vim.wo = new_win_opt_accessor(nil)

local singular_values = {
  ['boolean'] = true,
  ['number']  = true,
  ['nil']     = true,
}

local set_key_value = function(t, key_value_str)
  assert(string.find(key_value_str, ":"), "Must have a :" .. tostring(key_value_str))

  local key, value = unpack(vim.split(key_value_str, ":"))
  key = vim.trim(key)
  value = vim.trim(value)

  t[key] = value
end

local convert_vimoption_to_lua = function(option, val)
  -- Short circuit if we've already converted!
  if type(val) == 'table' then
    return val
  end

  if singular_values[type(val)] then
    return val
  end

  if type(val) == "string" then
    -- TODO: Bad hax I think
    if string.find(val, ":") then
      local result = {}
      local items = vim.split(val, ",")
      for _, item in ipairs(items) do
        set_key_value(result, item)
      end

      return result
    else
      return vim.split(val, ",")
    end
  end
end

-- local concat_keys = function(t, sep)
--   return table.concat(vim.tbl_keys(t), sep)
-- end

local concat_key_values = function(t, sep, divider)
  local final = {}
  for k, v in pairs(t) do
    table.insert(final, string.format('%s%s%s', k, divider, v))
  end

  table.sort(final)
  return table.concat(final, sep)
end

local remove_duplicate_values = function(t)
  local result = {}
  for _, v in ipairs(t) do
    result[v] = true
  end

  return vim.tbl_keys(result)
end

local remove_value = function(t, val)
  if vim.tbl_islist(t) then
    local remove_index = nil
    for i, v in ipairs(t) do
      if v == val then
        remove_index = i
      end
    end

    if remove_index then
      table.remove(t, remove_index)
    end
  else
    t[val] = nil
  end

  return t
end

local add_value = function(current, new)
  if singular_values[type(current)] then
    error(
      "This is not possible to do. Please do something different: "
      .. tostring(current)
      .. " // "
      .. tostring(new)
    )
  end

  if type(new) == 'string' then
    if vim.tbl_islist(current) then
      table.insert(current, new)
    else
      set_key_value(current, new)
    end

    return current
  elseif type(new) == 'table' then
    if vim.tbl_islist(current) then
      assert(vim.tbl_islist(new))
      vim.list_extend(current, new)
    else
      assert(not vim.tbl_islist(new), vim.inspect(new) .. vim.inspect(current))
      current = vim.tbl_extend("force", current, new)
    end

    return current
  else
    error("Unknown type")
  end
end

local convert_lua_to_vimoption = function(t)
  if vim.tbl_islist(t) then
    t = remove_duplicate_values(t)

    table.sort(t)
    return table.concat(t, ',')
  else
    return concat_key_values(t, ',', ':')
  end
end

local clean_value = function(v)
  if singular_values[type(v)] then
    return v
  end

  local result = v:gsub('^,', '')

  return result
end

local literal_keys = {
  _value = true,
  _option = true,
}

local opt_mt

opt_mt = {
  __index = function(t, k)
    if literal_keys[k] then
      return rawget(t, k)
    end

    return setmetatable({ _option = k, }, opt_mt)
  end,

  __newindex = function(t, k, v)
    if literal_keys[k] then
      return rawset(t, k, v)
    end

    if type(v) == 'table' then
      local new_value
      if getmetatable(v) ~= opt_mt then
        new_value = v
      else
        assert(v._value, "Must have a value to set this")
        new_value = v._value
      end

      vim.o[k] = convert_lua_to_vimoption(new_value)
      return
    end

    if v == nil then
      v = ''
    end

    -- TODO: Figure out why nvim_set_option doesn't override values the same way.
    -- @bfredl said he will fix this for me, so I can just use nvim_set_option
    if type(v) == 'boolean' then
      vim.o[k] = clean_value(v)
      if v then
        vim.cmd(string.format("set %s", k))
      else
        vim.cmd(string.format("set no%s", k))
      end
    else
      vim.cmd(string.format("set %s=%s", k, clean_value(v)))
    end
  end,

  --[[
  opt.wildignore = opt.wildignore + 'hello'
  opt.wildignore = opt.wildignore + { '*.o', '*~', }
  --]]
  __add = function(left, right)
    assert(left._option, "must have an option key")
    if left._option == 'foldcolumn' then
      error("not implemented for foldcolumn.. use a string")
    end

    local existing = if_nil(left._value, vim.o[left._option])
    local current = convert_vimoption_to_lua(left._option, existing)
    if not current then
      left._value = convert_vimoption_to_lua(right)
    end

    left._value = add_value(current, right)
    return left
  end,

  __sub = function(left, right)
    assert(left._option, "must have an option key")

    local existing = if_nil(left._value, vim.o[left._option])
    local current = convert_vimoption_to_lua(left._option, existing)
    if not current then
      return left
    end

    left._value = remove_value(current, right)
    return left
  end,

  __tostring = function(t)
    return 
  end,
}

return  setmetatable({}, opt_mt)
