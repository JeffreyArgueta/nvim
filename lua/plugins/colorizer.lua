vim.pack.add({ { src = 'https://github.com/catgoose/nvim-colorizer.lua' } })

require('colorizer').setup({
  user_default_options = { names = false, xterm = true }
})
