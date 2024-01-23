local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with <Ctrl> + <Shift> + H, J, K, L
keymap("n", "<C-S-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-S-j>", ":resize -2<CR>", opts)
keymap("n", "<C-S-k>", ":resize +2<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize -2<CR>", opts)

-- Insert new lines
keymap("n", "<leader>o", "o<ESC>", opts)
keymap("n", "<leader>O", "O<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines in visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Split windows
keymap('n', '<leader>|', ":vsplit<CR>", opts)
keymap('n', '<leader>-', ":split<CR>", opts)

-- Copy to clipboard only when yanked
keymap('n', 'y', '"*y', opts)
keymap('v', 'y', '"*y', opts)
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)
keymap('n', 'c', '"_c', opts)
keymap('v', 'c', '"_c', opts)
keymap('n', 'x', '"_x', opts)
keymap('v', 'x', '"_x', opts)

-- Disable arrow keys in normal mode
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

-- Autoformat
keymap('n', '<F3>', ':Autoformat()<CR>', opts)

-- Configure mouse menu items for Language Server Protocol (LSP) features: "Goto Definition" and "References"
vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
keymap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- Use W, Q to write, quit
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
