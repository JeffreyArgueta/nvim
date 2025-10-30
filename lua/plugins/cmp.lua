return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" },
  version = "*",
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = true, window = { border = "rounded" } },
      menu = {
        border = "rounded",
        draw = {
          -- We don't need label_description now because label and label_description are already
          -- combined together in label by colorful-menu.nvim.
          columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end
            }
          }
        }
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        -- sql = { 'snippets', 'dadbod', 'buffer' },
        lua = { inherit_defaults = true, 'lazydev' }
      },
      providers = {
        -- dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        }
      }
    },
    -- Experimental signature help support
    signature = { enabled = true }
  }
}
