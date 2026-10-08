-- Saving and quiting
vim.keymap.set('n', '<leader>w', function() require('functions.save').save() end, { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<CR>', { desc = 'Quit without saving' })

-- Split generation
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Create veritcal split' })
vim.keymap.set('n', '<leader>h', '<cmd>split<CR>', { desc = 'Create horizontal split' })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Switch to left split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Switch to right split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Switch to bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Switch to top split' })

-- Split resizing
vim.keymap.set('n', '<C-Up>', '2<C-w>+', { desc = 'Resize the window bigger vertically' })
vim.keymap.set('n', '<C-Down>', '2<C-w>-', { desc = 'Resize the window smaller vertically' })
vim.keymap.set('n', '<C-Left>', '2<C-w>>', { desc = 'Resize the window bigger horizontally' })
vim.keymap.set('n', '<C-Right>', '2<C-w><', { desc = 'Resize the window smaller horizontally' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Alternate buffer' })
vim.keymap.set('n', '<leader>b*', '<cmd>bufdo bd<cr>', { desc = 'Delete all buffers' })  -- careful

-- Buffer deletion
vim.keymap.set('n', '<leader>bd', function() require('functions.buffer').delete() end, { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bD', function() require('functions.buffer').delete(true) end, { desc = 'Delete buffer (force)' })

-- Better identation in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Left identation in visual mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Right identation in visual mode' })

-- Visual selection move
vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv", { desc = 'Move up visual selection' })
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv", { desc = 'Move down visual selection' })

-- Buffer move with cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move up in buffer' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move down in buffer' })

-- Toggle search highlighting.
vim.keymap.set('n', '<leader>l', '<cmd>set hlsearch!<cr><C-l>', { desc = 'Toggle search highlighting' })

-- Floaterminal
vim.keymap.set('n', '<leader>t', '<cmd>Floaterminal<CR>', { desc = 'Open Floaterminal' })
