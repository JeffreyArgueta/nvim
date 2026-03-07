return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  lazy = false,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed   = "✓",
          package_pending     = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "csharp_ls",      -- C#
        "clangd",         -- C, C++
        "cmake",          -- CMake
        "cssls",          -- CSS, SCSS, LESS
        "eslint",         -- TypeScript, JavaScript
        "css_variables",  -- CSS, SCSS, LESS
        "html",           -- HTML
        "jdtls",          -- Java
        "jsonls",         -- JSON
        "lemminx",        -- XML
        "lua_ls",         -- Lua
        "tombi",          -- TOML
        "ts_ls",          -- TypeScript, JavaScript
        "vimls",          -- VimScript
        "vue_ls",         -- Vue
        "yamlls",         -- YAML
      },
    })
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local installed_servers = require("mason-lspconfig").get_installed_servers()

    vim.lsp.config("*", { capabilities = capabilities })

    for _, server_name in pairs(installed_servers) do
      vim.lsp.enable(server_name)
    end

    vim.diagnostic.config({ virtual_text = { current_line = true } })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP format file" })
  end
}
