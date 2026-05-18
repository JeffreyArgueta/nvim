vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/rachartier/tiny-devicons-auto-colors.nvim' }
})

local theme_colors = require('catppuccin.palettes').get_palette()
require('tiny-devicons-auto-colors').setup({ colors = theme_colors })
