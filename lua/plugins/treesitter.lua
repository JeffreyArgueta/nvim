return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      ensure_installed = {
        "markdown", "markdown_inline",
        "c", "cpp", "python", "make", "cmake",
        "lua", "vim", "vimdoc", "query", "regex", "bash",
        "javascript", "typescript", "tsx", "php", "php_only",
        "html", "css", "json", "jsonc", "xml", "yaml", "toml",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore"
      },
      highlight             = { enable = true },
      indent                = { enable = true },
      incremental_selection = {
        enable  = true,
        keymaps = {
          init_selection    = "<C-s>",
          node_incremental  = "<C-s>",
          node_decremental  = "<bs>",
          scope_incremental = false,
        },
      },
    })
  end
}
