vim.g.mapleader = " " -- Set <leader> to space.
vim.g.maplocalleader = " " -- Set local <leader> to space.

local options = vim.o

options.number = true -- Show line numbers
options.relativenumber = true -- Show relative line numbers for easier movement
options.undofile = true -- Persist undo history across sessions
options.splitbelow = true -- New splits open below the current one
options.splitright = true -- New splits open to the right
options.expandtab = true -- Convert tabs to spaces
options.smarttab = true -- Spaces - Tab
options.tabstop = 4 -- Tab width (spaces)
options.shiftwidth = 4 -- Indent width (spaces)
options.wrap = false
options.hlsearch = true
options.smartcase = true
options.ignorecase = true
options.encoding = "utf8"
options.backup = false

-- UI feels
options.showmode = false -- no --INSERT-- mode line
options.laststatus = 3 -- global statusline (modern Neovim)
options.pumheight = 10 -- limit popup menu height
options.cmdheight = 0 -- use minimal command line height (nvim 0.9+)
options.termguicolors = true

vim.opt.shortmess:append("I")
