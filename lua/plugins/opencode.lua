return {
  "NickvanDyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    {
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = { enabled = true },
        picker = { enabled = true },
        terminal = {
          enabled = true,
          win = { style = "right" }
        }
      }
    }
  },
  lazy = true,
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps.
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<C-t>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" },    "ga", function() require("opencode").prompt("@this") end,                   { desc = "Add to opencode" })
    vim.keymap.set({ "n", "x" },    "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",             "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })
    -- Configured in Opencode keybinds .json
    -- vim.keymap.set({ "n", "t" }, "<A-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
    -- vim.keymap.set({ "n", "t" }, "<A-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })
  end,
}
