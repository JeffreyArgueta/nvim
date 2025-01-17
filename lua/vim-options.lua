-- General settings
vim.g.mapleader        = " "

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false

-- Identation
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.autoindent     = true
vim.opt.smartindent    = true

-- UI enhancements
vim.opt.termguicolors  = true
vim.opt.scrolloff      = 999
vim.opt.list           = true
vim.opt.listchars      = { tab = "→ ", trail = "·" }

-- Search improvements
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.hlsearch    = false -- Avoid highlighting all matches
vim.opt.incsearch   = true  -- Show matches while typing

-- Scrolling and Editing
vim.opt.clipboard   = "unnamedplus"
vim.opt.virtualedit = "block"
vim.opt.inccommand  = "split"
vim.opt.updatetime  = 999

-- Keybindings
local keymap        = vim.api.nvim_set_keymap
keymap("n", "<leader>w", ":w<CR>", { noremap = true })  -- Save file
keymap("n", "<leader>q", ":q<CR>", { noremap = true })  -- Quit file
keymap("n", "<leader>Q", ":q!<CR>", { noremap = true }) -- Quit without save
