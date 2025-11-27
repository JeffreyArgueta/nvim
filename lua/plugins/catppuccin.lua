return {
  "catppuccin/nvim",
  name     = "catppuccin",
  priority = 1000,
  config   = function()
    require("catppuccin").setup({
      flavour                = "mocha", -- latte, frappe, macchiato, mocha
      background             = {        -- :h background
        light = "latte",
        dark  = "mocha"
      },
      auto_integrations      = true,
      transparent_background = false, -- disables setting the background color
      no_bold                = true   -- Force no bold
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
