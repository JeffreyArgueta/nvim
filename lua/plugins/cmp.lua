return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      -- menu = { border = "rounded" },
      -- documentation = { auto_show = true, window = { border = "rounded" } }
    },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    -- Experimental signature help support
    signature = { enabled = true }
  }
}
