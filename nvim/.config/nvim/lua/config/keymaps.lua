local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)
vim.keymap.set({ "n", "v" }, "H", "0", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set({ "n", "v" }, "L", "$", opts)

vim.keymap.set("n", "<C-p>", ":echo expand('%:p')<CR>", opts)
vim.keymap.set("n", "<leader>s", "<cmd>noautocmd w <CR>", opts)
vim.keymap.set({ "v", "x" }, "<", "<gv", opts)
vim.keymap.set({ "v", "x" }, ">", ">gv", opts)

vim.keymap.set("n", "<A-h>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<A-j>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<A-k>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-l>", ":vertical resize -2<CR>", opts)

vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("x", "p", [["_dP]], opts)
vim.keymap.set({ "n", "v" }, "y", '"*y', opts)
vim.keymap.set({ "n", "v" }, "d", '"_d', opts)
vim.keymap.set({ "n", "v" }, "D", '"_D', opts)
vim.keymap.set({ "n", "v" }, "c", '"_c', opts)
vim.keymap.set({ "n", "v" }, "C", '"_C', opts)
vim.keymap.set({ "n", "v" }, "s", '"_s', opts)
vim.keymap.set({ "n", "v" }, "S", '"_S', opts)

vim.keymap.set("n", "<C-j>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-k>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)

vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

vim.keymap.set({ "n", "v" }, "\\", function()
  Snacks.explorer()
end, opts)

vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-h>", "<Left>", opts)
