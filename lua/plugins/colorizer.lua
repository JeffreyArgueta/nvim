return {
  "catgoose/nvim-colorizer.lua",
  event = "VeryLazy",
  opts = { lazy_load = true },
  config = function()
    require("colorizer").setup({
      user_default_options = { names = false, xterm = true }
    })
  end
}
