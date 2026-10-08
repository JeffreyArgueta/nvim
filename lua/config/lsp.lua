vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/b0o/SchemaStore.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/xzbdmw/colorful-menu.nvim',
})

require('mason').setup({
  ui = {
    icons = {
      package_installed = " ",
      package_pending = "",
      package_uninstalled = " "
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'csharp_ls',                       -- C#
    'clangd',                          -- C, C++
    'cmake',                           -- CMake
    'cssls',                           -- CSS, SCSS, LESS
    'docker_compose_language_service', -- Docker
    'docker_language_server',          -- Docker
    'eslint',                          -- TypeScript, JavaScript
    'css_variables',                   -- CSS, SCSS, LESS
    'html',                            -- HTML
    'jdtls',                           -- Java
    'jsonls',                          -- JSON
    'lemminx',                         -- XML
    'lua_ls',                          -- Lua
    'tombi',                           -- TOML
    'ts_ls',                           -- TypeScript, JavaScript
    'vimls',                           -- VimScript
    'vue_ls',                          -- Vue
    'yamlls',                          -- YAML
  }
})

require('lazydev').setup({
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = true, window = { border = 'rounded' } },
    accept = { auto_brackets = { enabled = true } },
    menu = {
      border = 'rounded',
      draw = {
        columns = { { 'kind_icon' }, { 'label', gap = 1 }, { 'kind' } },
        components = {
          label = {
            text = function(ctx)
              return require('colorful-menu').blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require('colorful-menu').blink_components_highlight(ctx)
            end
          }
        }
      }
    }
  },
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = {
      -- sql = { 'snippets', 'dadbod', 'buffer' },
      lua = { inherit_defaults = true, 'lazydev' }
    },
    providers = {
      -- dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      }
    }
  },
  -- Experimental signature help support
  -- signature = { enabled = true }
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
local installed_servers = require('mason-lspconfig').get_installed_servers()

vim.lsp.config('*', { capabilities = capabilities })

for _, server_name in pairs(installed_servers) do
  vim.lsp.enable(server_name)
end

-- Diagnostics
vim.diagnostic.config({
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    }
  } or {},
  virtual_text = { current_line = true }
})
vim.keymap.set('n', 'gd', vim.diagnostic.open_float, { desc = 'Open float diagnostic list' })

vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, { desc = 'LSP: [g]oto code [a]ction' })
vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { desc = 'LSP: [g]oto [i]mplementation' })
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = 'LSP: [g]oto [r]e[n]ame' })
vim.keymap.set('n', 'grr', vim.lsp.buf.references, { desc = 'LSP: [g]oto [r]eference' })
vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { desc = 'LSP: [g]oto [t]ype definition' })
vim.keymap.set('n', 'grx', vim.lsp.codelens.run, { desc = 'LSP: [g]oto codelens run' })
vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = 'LSP: [g]oto [d]efinition' })
vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { desc = 'LSP: [g]oto [d]eclaration' })
vim.keymap.set('n', 'grf', vim.lsp.buf.format, { desc = 'LSP: [g]oto [f]ormat filf' })
vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, { desc = 'LSP: [g]oto document symbols' })
vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, { desc = 'LSP: [g]oto [w]orkspace symbols' })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'LSP: documentation' })
