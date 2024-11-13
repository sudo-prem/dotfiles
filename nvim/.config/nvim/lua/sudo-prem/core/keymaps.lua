local setKeymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
setKeymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

setKeymap("i", "jk", "<ESC>", opts)
setKeymap("n", "H", "0", opts)
setKeymap("v", "J", ":m '>+1<CR>gv=gv", opts)
setKeymap("v", "K", ":m '<-2<CR>gv=gv", opts)
setKeymap("n", "L", "$", opts)

setKeymap("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", opts)
setKeymap('n', '<Esc>', ':noh<CR>', opts)
setKeymap("n", "<C-p>", ":echo expand('%:p')<CR>", opts)
setKeymap('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)
setKeymap({ "v", "x" }, "<", "<gv", opts)
setKeymap({ "v", "x" }, ">", ">gv", opts)

setKeymap('n', '<A-h>', ':vertical resize +2<CR>', opts)
setKeymap('n', '<A-j>', ':resize +2<CR>', opts)
setKeymap('n', '<A-k>', ':resize -2<CR>', opts)
setKeymap('n', '<A-l>', ':vertical resize -2<CR>', opts)

setKeymap({ 'n', 'v' }, '<leader>\\', '<C-w>v', opts)
setKeymap({ 'n', 'v' }, '<leader>-', '<C-w>s', opts)
setKeymap({ 'n', 'v' }, '<leader>x', ':close<CR>', opts)

setKeymap("n", "<C-h>", "<C-w>h", opts)
setKeymap("n", "<C-j>", "<C-w>j", opts)
setKeymap("n", "<C-k>", "<C-w>k", opts)
setKeymap("n", "<C-l>", "<C-w>l", opts)

setKeymap('n', '<leader>to', ':tabnew<CR>', opts)
setKeymap('n', '<leader>tx', ':tabclose<CR>', opts)
setKeymap('n', '<leader>tn', ':tabn<CR>', opts)
setKeymap('n', '<leader>tp', ':tabp<CR>', opts)

setKeymap("x", "p", [["_dP]], opts)
setKeymap({ "n", "v" }, "y", '"*y', opts)
setKeymap({ "n", "v" }, "d", '"_d', opts)
setKeymap({ "n", "v" }, "c", '"_c', opts)
setKeymap({ "n", "v" }, "D", '"_D', opts)
setKeymap({ "n", "v" }, "C", '"_C', opts)

setKeymap("n", "<C-d>", "<C-d>zz", opts)
setKeymap("n", "<C-u>", "<C-u>zz", opts)
setKeymap("n", "n", "nzzzv", opts)
setKeymap("n", "N", "Nzzzv", opts)
