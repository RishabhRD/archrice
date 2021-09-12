require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
	-- You can use the capture groups defined in textobjects.scm
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	["ic"] = "@class.inner",
	["ab"] = "@block.outer",
	["ib"] = "@block.inner",
	["as"] = "@scopename.outer",
	["is"] = "@scopename.inner",
	["al"] = "@loop.outer",
	["il"] = "@loop.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>an"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>ap"] = "@parameter.inner",
      },
    },
  },
}
