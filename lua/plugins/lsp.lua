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
        "ts_ls", "jsonls",
        "powershell_es"
      },
    })
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({ capabilities = capabilities })
      end,
    })
    vim.diagnostic.config({ virtual_text = { current_line = true } })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP format file" })
  end
}
