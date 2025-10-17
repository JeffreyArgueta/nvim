return {
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = "VeryLazy",
    config = function()
      local theme_colors = require("catppuccin.palettes").get_palette("mocha")
      require('tiny-devicons-auto-colors').setup({ colors = theme_colors, })
    end
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "rachartier/tiny-devicons-auto-colors.nvim" },
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
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<space>-", function() oil.toggle_float() end, { desc = "Open float parent directory" })
    end
  }
}
