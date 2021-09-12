local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  comparators = {
    function(first, second)
      if first.source.name == "nvim_lsp" then
        return true
      else
        if second.source.name == "nvim_lsp" then
          return false
        else
          return nil
        end
      end
    end,
  },
})
