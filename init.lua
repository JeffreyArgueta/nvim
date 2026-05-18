-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("options")
-- require("keymaps")
-- require("save")
-- require("terminal")
-- require("lazy").setup("plugins")

require('config.globals')
require('config.options')
require('config.keymaps')
require('config.lsp')

require('functions.save')
require('functions.terminal')

require('plugins.autopairs')
require('plugins.catppuccin')
require('plugins.colorizer')
require('plugins.devicons')
require('plugins.git')
require('plugins.lualine')
require('plugins.markdown-preview')
require('plugins.noice')
require('plugins.oil')
require('plugins.telescope')
require('plugins.todo-comments')
require('plugins.treesitter')

vim.cmd.colorscheme 'catppuccin-nvim'
