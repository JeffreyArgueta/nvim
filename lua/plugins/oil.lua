return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- Ensure Oil loads inmediately
  config = function()
    require("oil").setup({
      columns = { "icon" },
      view_options = { show_hidden = true },
      keymaps = {
        ["q"] = "actions.close", -- Allows closing with 'q'
      },
    })
    local oil = require("oil")
    vim.keymap.set("n", "-",        "<CMD>Oil<CR>",                     { desc = "Open parent directory" })
    vim.keymap.set("n", "<space>-", function() oil.toggle_float() end,  { desc = "Open float parent directory" })
  end
}
