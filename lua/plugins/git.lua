return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  config = function()
    require("telescope").load_extension("lazygit")
  end
}
