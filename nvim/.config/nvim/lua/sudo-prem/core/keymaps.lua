local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", opts)
vim.keymap.set("n", "<C-p>", "<Cmd>echo expand('%:p')<CR>", opts)
vim.keymap.set("n", "<Leader>s", "<Cmd>noautocmd w <CR>", opts)
vim.keymap.set("n", "sd", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

vim.keymap.set({ "n", "v" }, "H", "^", opts)
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set({ "n", "v" }, "L", "$", opts)

vim.keymap.set("n", "<A-j>", "10j", opts)
vim.keymap.set("n", "<A-k>", "10k", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("x", "p", [["_dP]], opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set({ "n", "v" }, "y", '"*y', opts)
vim.keymap.set({ "n", "v" }, "d", '"_d', opts)
vim.keymap.set({ "n", "v" }, "D", '"_D', opts)
vim.keymap.set({ "n", "v" }, "c", '"_c', opts)
vim.keymap.set({ "n", "v" }, "C", '"_C', opts)
vim.keymap.set({ "n", "v" }, "s", '"_s', opts)
vim.keymap.set({ "n", "v" }, "S", '"_S', opts)

vim.keymap.set("n", "<Right>", "<Cmd>bnext<CR>", opts)
vim.keymap.set("n", "<Left>", "<Cmd>bprevious<CR>", opts)

vim.keymap.set("n", "<M-C-h>", "<Cmd>vsplit<CR><C-w>h", opts)
vim.keymap.set("n", "<M-C-j>", "<Cmd>split<CR><C-w>j", opts)
vim.keymap.set("n", "<M-C-k>", "<Cmd>split<CR><C-w>k", opts)
vim.keymap.set("n", "<M-C-l>", "<Cmd>vsplit<CR><C-w>l", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<A-S-h>", "<Cmd>vertical resize +2<CR>", opts)
vim.keymap.set("n", "<A-S-j>", "<Cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<A-S-k>", "<Cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<A-S-l>", "<Cmd>vertical resize -2<CR>", opts)
