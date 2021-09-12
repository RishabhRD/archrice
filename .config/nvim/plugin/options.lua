local opt = vim.opt

local function set(key_opt)
  opt[key_opt] = true;
end

local function noset(key_opt)
  opt[key_opt] = false;
end

set "cursorline"
set "hidden"
set "wrap"
set "autoread"
set "undofile"
noset "swapfile"
noset "backup"

opt.completeopt = {"menu", "menuone", "noselect"}
opt.softtabstop = 2
opt.shiftwidth = 2
set "expandtab"
set "autoindent"
set "cindent"

noset "hlsearch"
set "ignorecase"
set "smartcase"
opt.inccommand = "split"
set "incsearch"
opt.background = "dark"
set "termguicolors"

set "number"
set "relativenumber"
set "splitbelow"
set "splitright"
set "showcmd"
noset "showmode"
opt.colorcolumn = "80"
opt.signcolumn = "yes"

opt.shortmess = opt.shortmess + "c"
opt.mouse = opt.mouse + "nv"
opt.updatetime = 1000 -- Make updates happen faster

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

