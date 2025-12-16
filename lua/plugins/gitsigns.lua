return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs                        = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '▁' },
      topdelete    = { text = '▔' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged                 = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '▁' },
      topdelete    = { text = '▔' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      interval = 1000,
      follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = true,
    current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      -- Options passed to nvim_open_win
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },

    on_attach                    = function(bufnr)
      local gitsigns = require("gitsigns")
      local function map(mode, key, func, desc)
        vim.keymap.set(mode, key, func, { buffer = bufnr, desc = desc })
      end

      -- Actions
      map("n", "<leader>gs", gitsigns.stage_hunk, "Stage Git Hunk")
      map("n", "<leader>gr", gitsigns.reset_hunk, "Reset Git Hunk")
      map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
        "Visual Stage Git Hunk")
      map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
        "Visual Reset Git Hunk")

      map("n", "<leader>gS", gitsigns.stage_buffer, "Stage Git Buffer")
      map("n", "<leader>gR", gitsigns.reset_buffer, "Reset Git Buffer")
      map("n", "<leader>gb", gitsigns.blame_line, "Git Blame Line")
      -- map("n", "<leader>gd", gitsigns.diffthis, "Git Diff Hunk")

      -- Toggles
      map("n", "<leader>gt", gitsigns.toggle_current_line_blame, "Toggle Current Git Blame Line")
      map("n", "<leader>gw", gitsigns.toggle_word_diff, "Toggle Git Word Diff")
    end,
  },
}
