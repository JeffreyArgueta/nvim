local keymap = vim.api.nvim_set_keymap
local opt    = { noremap = true, silent = true }

-- Saving and quiting
keymap("n", "<leader>w", ":lua SaveFile()<CR>", opt) -- Save file
keymap("n", "<leader>q", ":q<CR>", opt)              -- Quit file
keymap("n", "<leader>Q", ":q!<CR>", opt)             -- Quit without save

-- Split generation
keymap("n", "<leader>v", ":vsplit<CR>", opt) -- Creates a veritcal split
keymap("n", "<leader>h", ":split<CR>", opt)  -- Creates a horizontal split

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opt) -- Switches to left split
keymap("n", "<C-l>", "<C-w>l", opt) -- Switches to right split
keymap("n", "<C-j>", "<C-w>j", opt) -- Switches to bottom split
keymap("n", "<C-k>", "<C-w>k", opt) -- Switches to top split

-- Split resizing
keymap("n", "]", [[<cmd>vertical resize +5<cr>]], opt)   -- Resize the window bigger vertically
keymap("n", "[", [[<cmd>vertical resize -5<cr>]], opt)   -- Resize the window smaller vertically
keymap("n", "}", [[<cmd>horizontal resize +2<cr>]], opt) -- Resize the window bigger horizontally
keymap("n", "{", [[<cmd>horizontal resize -2<cr>]], opt) -- Resize the window smaller horizontally

-- Buffer navigation
keymap("n", "<C-n>", ":bnext<CR>", opt)     -- Switches to next buffer
keymap("n", "<C-p>", ":bprevious<CR>", opt) -- Swithes to previous buffer

-- Better identation in visual mode
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)

-- Move lines down and up in visual selection
keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)

-- Move buffer down and up with cursor centered
keymap("n", "<C-d>", "<C-d>zz", opt)
keymap("n", "<C-u>", "<C-u>zz", opt)

-- Why not?
keymap("x", "<leader>p", [["_dP]], opt)

-- Floaterminal
keymap("n", "<leader>t", ":Floaterminal<CR>", opt) -- Open Floaterminal
