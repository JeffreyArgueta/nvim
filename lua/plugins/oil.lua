require('oil').setup({
  watch_for_changes = true,
  win_options = { signcolumn = "yes:2" },
  columns = { 'icon' },
  view_options = { show_hidden = true },
  keymaps = {
    ['q'] = 'actions.close', -- Allows closing with 'q'
  },
})

require('oil-git-status').setup({
  show_ignored = false,
  symbols = {   -- customize the symbols that appear in the git status columns
    index = {
      ["!"] = "!",
      ["?"] = "?",
      ["A"] = "A",
      ["C"] = "C",
      ["D"] = "D",
      ["M"] = "M",
      ["R"] = "R",
      ["T"] = "T",
      ["U"] = "U",
      [" "] = " ",
    },
    working_tree = {
      ["!"] = "!",
      ["?"] = "?",
      ["A"] = "A",
      ["C"] = "C",
      ["D"] = "D",
      ["M"] = "M",
      ["R"] = "R",
      ["T"] = "T",
      ["U"] = "U",
      [" "] = " ",
    },
  },
})

local oil = require('oil')
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<space>-', function() oil.toggle_float() end, { desc = 'Open float parent directory' })
