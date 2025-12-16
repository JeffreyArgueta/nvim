-- General settings
vim.g.mapleader        = " "
vim.g.maplocalleader   = ","

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false

vim.opt.number         = true  -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.splitbelow     = true  -- Open new horizontal splits below the current window
vim.opt.splitright     = true  -- Open new vertical splits to the right of the current window
vim.opt.wrap           = false -- Disable line wrapping

-- Identation
vim.opt.tabstop        = 2    -- Number of spaces per tab
vim.opt.shiftwidth     = 2    -- Number of spaces for autoindent
vim.opt.softtabstop    = 2    -- Number of spaces for a Tab key press
vim.opt.expandtab      = true -- Convert tabs to spaces
vim.opt.autoindent     = true -- Copy indentation from the current line
vim.opt.smartindent    = true -- Automatically insert indentation in code blocks

-- UI enhancements
vim.opt.termguicolors  = true   -- Enable 24-bit RGB colors
if vim.fn.has("nvim-0.11") == 1 then
  vim.opt.winborder = "rounded" -- Use rounded borders for floating windows (Neovim 0.11+ feature)
end
vim.opt.scrolloff     = 8       -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8       -- Keep 8 columns visible to the left/right of the cursor
vim.opt.list          = true    -- Show invisible characters
vim.opt.listchars     = { tab = "→ ", trail = "·", extends = ">", precedes = "<" }

-- Search improvements
vim.opt.ignorecase    = true  -- Ignore case in search patterns
vim.opt.smartcase     = true  -- Override ignorecase if search contains uppercase letters
vim.opt.hlsearch      = false -- Avoid highlighting all matches
vim.opt.incsearch     = true  -- Show matches while typing

-- QoL improvements
vim.opt.undofile      = true -- Persistent undo
vim.opt.mouse         = "a"  -- Enable mouse support
vim.opt.cursorline    = true -- Highlight current line
vim.opt.swapfile      = false

-- Performance tweaks
vim.opt.clipboard     = "unnamedplus" -- Use system clipboard for copy/paste
vim.opt.virtualedit   = "block"       -- Allow cursor to move freely in visual block mode
vim.opt.inccommand    = "split"       -- Show live preview of command results
vim.opt.updatetime    = 250           -- Improves responsiveness

-- Powershell
-- vim.opt.shell          = "pwsh"
-- vim.opt.shellcmdflag   = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
-- vim.opt.shellquote     = "\""
-- vim.opt.shellxquote    = ""
