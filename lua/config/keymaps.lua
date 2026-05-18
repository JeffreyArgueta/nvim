-- Saving and quiting
vim.keymap.set('n', '<leader>w', ':lua SaveFile()<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Quit without saving' })

-- Split generation
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Create veritcal split' })
vim.keymap.set('n', '<leader>h', ':split<CR>', { desc = 'Create horizontal split' })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Switch to left split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Switch to right split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Switch to bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Switch to top split' })

-- Split resizing
vim.keymap.set('n', ']', '<C-w>+', { desc = 'Resize the window bigger vertically' })
vim.keymap.set('n', '[', '<C-w>-', { desc = 'Resize the window smaller vertically' })
vim.keymap.set('n', '}', '<C-w>>', { desc = 'Resize the window bigger horizontally' })
vim.keymap.set('n', '{', '<C-w><', { desc = 'Resize the window smaller horizontally' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'Previous buffer' })

-- Better identation in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Left identation in visual mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Right identation in visual mode' })

-- Visual selection move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move up visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move down visual selection' })

-- Buffer move with cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move up in buffer' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move down in buffer' })

-- Toggle search highlighting.
vim.keymap.set('n', '<leader>l', ':set hlsearch!<cr><C-l>', { desc = 'Toggle search highlighting' })

-- Floaterminal
vim.keymap.set('n', '<leader>t', ':Floaterminal<CR>', { desc = 'Open Floaterminal' })
