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
vim.opt.expandtab      = true
vim.opt.autoindent     = true
vim.opt.smartindent    = true

-- UI enhancements
vim.opt.termguicolors  = true
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

-- Performance tweaks
vim.opt.clipboard      = "unnamedplus"
vim.opt.virtualedit    = "block"
vim.opt.inccommand     = "split"
vim.opt.updatetime     = 250

-- Powershell
vim.opt.shell          = "pwsh"
vim.opt.shellcmdflag   = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote     = "\""
vim.opt.shellxquote    = ""

local keymap           = vim.api.nvim_set_keymap
local opt              = { noremap = true, silent = true }

-- Saving and quiting
keymap("n", "<leader>w", ":lua SaveFile()<CR>", opt) -- Save file
keymap("n", "<leader>q", ":q<CR>", opt)              -- Quit file
keymap("n", "<leader>Q", ":q!<CR>", opt)             -- Quit without save

-- Split generation
keymap("n", "<leader>v", ":vsplit<CR>", opt) -- Creates a veritcal split
keymap("n", "<leader>s", ":split<CR>", opt)  -- Creates a horizontal split

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opt) -- Switches to left split
keymap("n", "<C-l>", "<C-w>l", opt) -- Switches to right split
keymap("n", "<C-j>", "<C-w>j", opt) -- Switches to bottom split
keymap("n", "<C-k>", "<C-w>k", opt) -- Switches to top split

-- Buffer navigation
keymap("n", "<leader>n", ":bnext<CR>", opt)     -- Switches to next buffer
keymap("n", "<leader>p", ":bprevious<CR>", opt) -- Swithes to previous buffer

-- Autopairs
keymap("i", "'", "''<left>", opt)
keymap("i", "\"", "\"\"<left>", opt)
keymap("i", "(", "()<left>", opt)
keymap("i", "[", "[]<left>", opt)
keymap("i", "{", "{}<left>", opt)

-- Move lines down and up in visual selection
keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)

-- Move buffer down and up with cursor centered
keymap("n", "<C-d>", "<C-d>zz", opt)
keymap("n", "<C-u>", "<C-u>zz", opt)

-- Why not?
keymap("x", "<leader>p", [["_dP]], opt)

-- Floaterminal
keymap("n", "<leader>t", ":Floaterminal<CR>", opt) -- Open Floaterminal

-- Custom save file function
function SaveFile()
  -- Check if the current buffer is an Oil.nvim buffer
  if vim.bo.filetype == "oil" or require("oil").get_current_dir() then
    vim.cmd("w") -- Save changes in Oil.nvim
    vim.notify("Oil buffer saved!")
    return
  end

  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename

  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!")                  -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end
