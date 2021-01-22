require'compe'.setup {
  enabled = true,
  debug = false,
  -- min_length = 1,
  preselect = 'disable',

  source = {
    ultisnips = {
      priority = 9
    },
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
    -- nvim_lua = { ... overwrite source configuration ... };
  };
}
