local M = {}
M.__index = M

function M:new(str)
    local obj = setmetatable({
	opt = str
    }, self)
    return obj
end

function M.__add(current, value)
    vim.cmd(string.format('set %s+=%s', current.opt, value))
    return current
end

function M.__sub(current, value)
    vim.cmd(string.format('set %s-=%s', current.opt, value))
    return current
end

function M.__newindex(t, key, value)
    if key ~= 'val' then
	error([[Doesn't support]])
    end
    vim.cmd(string.format('set %s=%s', t.opt, value))
    return t
end

return M
