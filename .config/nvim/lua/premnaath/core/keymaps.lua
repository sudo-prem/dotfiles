local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Paste in visual: do not copy text back
keymap("x", "p", [["_dP]])

-- Indent in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines in visual
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Copy to clipboard only when yanked
keymap('n', 'y', '"*y', opts)
keymap('v', 'y', '"*y', opts)
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)
keymap('n', 'c', '"_c', opts)
keymap('v', 'c', '"_c', opts)

-- Disable arrow keys in normal mode
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

-- Enter Normal mode on jk
keymap("i", "jk", "<ESC>", opts)

-- Move to start/end of line
keymap('n', 'H', '0', opts)
keymap('n', 'L', '$', opts)

-- Copy everything between { and }
keymap("n", "YY", "va{Vy", opts)

-- Navigate buffers
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)

-- Split line with X
keymap('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })
