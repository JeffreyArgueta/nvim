return {
  "catppuccin/nvim",
  name     = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour                = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      no_bold                = true,    -- Force no bold
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
