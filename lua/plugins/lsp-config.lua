return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
            --require("lspconfig").clangd.setup({
            --    cmd = { "C:/LSPs/clangd_19.1.2/bin/" .. "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
            --    init_options = { fallbackFlags = { "-std=gnu++17" }, },
            --})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
    --[[
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local bin_path = "C:/Users/Jeffrey Argueta/AppData/Local/nvim-data/mason/bin/"
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                cmd = { bin_path .. "lua-language-server.cmd" },
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = { bin_path .. "clangd.cmd" },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                cmd = { bin_path .. "rust-analyzer.cmd" },
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
                cmd = { bin_path .. "cmake-language-server.cmd" },
            })
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
                cmd = { bin_path .. "csharp-ls.cmd" },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
    --]]
}
