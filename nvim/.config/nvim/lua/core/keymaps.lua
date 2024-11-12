local setKeymap = vim.keymap.set
local deleteKeymap = vim.keymap.del
local opts = { noremap = true, silent = true }

-- local util = require("lazyvim.util")
-- local whichkey = util.safe_keymap_set
local cmp_enabled = true

-- Move lines in visual
setKeymap("v", "J", ":m '>+1<CR>gv=gv", opts)
setKeymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move to start/end of line
setKeymap("n", "H", "0", opts)
setKeymap("n", "L", "$", opts)

-- Paste in visual: do not copy text back
setKeymap("x", "p", [["_dP]])

-- Copy to clipboard only when yanked
setKeymap("n", "y", '"*y', opts)
setKeymap("v", "y", '"*y', opts)
setKeymap("n", "d", '"_d', opts)
setKeymap("v", "d", '"_d', opts)
setKeymap("n", "c", '"_c', opts)
setKeymap("v", "c", '"_c', opts)
setKeymap("n", "D", '"_D', opts)
setKeymap("v", "D", '"_D', opts)
setKeymap("n", "C", '"_C', opts)
setKeymap("v", "C", '"_C', opts)

-- Pane navigation with Ctrl + h/j/k/l
setKeymap("n", "<C-h>", "<C-w>h", opts)
setKeymap("n", "<C-j>", "<C-w>j", opts)
setKeymap("n", "<C-k>", "<C-w>k", opts)
setKeymap("n", "<C-l>", "<C-w>l", opts)

-- Disable arrow keys in normal mode
setKeymap("n", "<Up>", "<Nop>", opts)
setKeymap("n", "<Down>", "<Nop>", opts)
setKeymap("n", "<Left>", "<Nop>", opts)
setKeymap("n", "<Right>", "<Nop>", opts)

-- Indent in visual mode
setKeymap("v", "<", "<gv", opts)
setKeymap("v", ">", ">gv", opts)
setKeymap("x", "<", "<gv", opts)
setKeymap("x", ">", ">gv", opts)

-- Keep cursor in the middle
setKeymap("n", "<C-d>", "<C-d>zz")
setKeymap("n", "<C-u>", "<C-u>zz")
setKeymap("n", "n", "nzzzv")
setKeymap("n", "N", "Nzzzv")

-- Enter Normal mode on jk
setKeymap("i", "jk", "<ESC>", opts)

-- -- Navigate buffers
-- whichkey("n", "<Right>", ":bnext<CR>", { desc = "Next buffer" })
-- whichkey("n", "<Left>", ":bprevious<CR>", { desc = "Prev buffer" })

-- -- Split line with X
-- whichkey("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { desc = "Split line" })

-- -- Current buffer's location
-- whichkey("n", "<C-p>", ":echo expand('%:p')<CR>", { desc = "Print Working Directory" })

-- -- Multiple cursor
-- whichkey("n", "<A-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" })
-- whichkey("n", "<A-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" })
-- whichkey("n", "<M-A-j>", "<Plug>(VM-Select-Cursor-Down)", { desc = "Select cursor down" })
-- whichkey("n", "<M-A-k>", "<Plug>(VM-Select-Cursor-Up)", { desc = "Select cursor up" })

-- -- Window splits
-- whichkey("n", "<C-w>\\", ":vsplit<CR>", opts)
-- whichkey("n", "<C-w>-", ":split<CR>", opts)

-- -- Disable code completion
-- whichkey("n", "<leader>cc", function()
-- 	if cmp_enabled then
-- 		require("cmp").setup.buffer({ enabled = false })
-- 		cmp_enabled = false
-- 	else
-- 		require("cmp").setup.buffer({ enabled = true })
-- 		cmp_enabled = true
-- 	end
-- end, { desc = "Toggle Code Completion" })
