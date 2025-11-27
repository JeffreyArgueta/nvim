return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require("telescope").setup({
      extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "❯ ",
        multi_icon = " "
      }
    })
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files,       { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,        { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,          { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,        { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>ft", builtin.treesitter,       { desc = "Telescope treesitter" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references,   { desc = "Telescope lsp references" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions,  { desc = "Telescope lsp definitions" })

    local nvim_config = function () builtin.find_files { cwd = vim.fn.stdpath("config") } end
    vim.api.nvim_create_user_command("NeovimConfig", nvim_config, {})
    vim.keymap.set("n", "<leader>nc", ":NeovimConfig<CR>", { desc = "Telescope nvim .config find files" })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")
  end
}
