-- General settings
vim.g.mapleader        = " "
vim.g.maplocalleader   = ","

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false

-- Identation
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.softtabstop    = 2
vim.opt.expandtab      = true
vim.opt.autoindent     = true
vim.opt.smartindent    = true

-- UI enhancements
vim.opt.termguicolors  = true
vim.opt.winborder      = "rounded" -- Neovim 0.11+ feature
vim.opt.scrolloff      = 8
vim.opt.sidescrolloff  = 8
vim.opt.list           = true
vim.opt.listchars      = { tab = "→ ", trail = "·", extends = ">", precedes = "<" }

-- Search improvements
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.hlsearch       = false -- Avoid highlighting all matches
vim.opt.incsearch      = true  -- Show matches while typing

-- QoL improvements
vim.opt.undofile       = true -- Persistent undo
vim.opt.mouse          = "a"  -- Enable mouse support
vim.opt.cursorline     = true -- Highlight current line
vim.opt.swapfile       = false

-- Performance tweaks
vim.opt.clipboard      = "unnamedplus"
vim.opt.virtualedit    = "block"
vim.opt.inccommand     = "split"
vim.opt.updatetime     = 250

-- Powershell
-- vim.opt.shell          = "pwsh"
-- vim.opt.shellcmdflag   = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
-- vim.opt.shellquote     = "\""
-- vim.opt.shellxquote    = ""
