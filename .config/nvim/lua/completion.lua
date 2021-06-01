require'compe'.setup {
  enabled = true,
  debug = false,
  -- min_length = 1,
  preselect = 'disable',

  source = {
    path = {
      priority = 9
    },
    buffer = {
      priority = 8
    },
    nvim_lsp = {
      priority = 10,
      sort = false
    },
    vsnip = {
      priority = 9
    },
    -- nvim_lua = { ... overwrite source configuration ... };
  };
}
vim.cmd[[command! CompeEnable  call compe#setup(g:compe, 0)]]
vim.cmd[[command! CompeDisable call compe#setup({'enabled': v:false}, 0)]]
