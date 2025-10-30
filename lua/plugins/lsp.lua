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
        "clangd", "cmake",
        "lua_ls", "vimls",
        "html", "cssls", "css_variables",
        "java_language_server",
        "ts_ls", "jsonls"
      },
    })
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local installed_servers = require("mason-lspconfig").get_installed_servers()

    vim.lsp.config("*", { capabilities = capabilities })

    for _, server_name in ipairs(installed_servers) do
      vim.lsp.enable(server_name)
    end

    -- vim.lsp.config("java-language-server", {
    --   cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/java-language-server') },
    --   single_file_support = true
    -- })

    vim.diagnostic.config({ virtual_text = { current_line = true } })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP format file" })
  end
}
