vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim',                 name = 'catppuccin' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/catgoose/nvim-colorizer.lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/rachartier/tiny-devicons-auto-colors.nvim',
  'https://github.com/iamcco/markdown-preview.nvim',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/refractalize/oil-git-status.nvim',
})

require('plugins.colorscheme')
require('plugins.treesitter')
require('plugins.autopairs')
require('plugins.telescope')
require('plugins.colorizer')
require('plugins.devicons')
require('plugins.markdown-preview')
require('plugins.todo-comments')
require('plugins.lualine')
require('plugins.noice')
require('plugins.git')
require('plugins.oil')
