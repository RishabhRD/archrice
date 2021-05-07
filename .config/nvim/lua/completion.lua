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
