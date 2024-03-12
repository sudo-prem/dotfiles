local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local util = require("lazyvim.util")
local whichkey = util.safe_keymap_set
local cmp_enabled = true

-- Move lines in visual
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move to start/end of line
keymap("n", "H", "0", opts)
keymap("n", "L", "$", opts)

-- Paste in visual: do not copy text back
keymap("x", "p", [["_dP]])

-- Copy to clipboard only when yanked
keymap("n", "y", '"*y', opts)
keymap("v", "y", '"*y', opts)
keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "c", '"_c', opts)
keymap("v", "c", '"_c', opts)

-- Disable arrow keys in normal mode
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- Indent in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Enter Normal mode on jk
keymap("i", "jk", "<ESC>", opts)

-- Navigate buffers
whichkey("n", "<Right>", ":bnext<CR>", { desc = "Next buffer" })
whichkey("n", "<Left>", ":bprevious<CR>", { desc = "Prev buffer" })

-- Split line with X
whichkey("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { desc = "Split line" })

-- Current buffer's location
whichkey("n", "<C-p>", ":echo expand('%:p')<CR>", { desc = "Print Working Directory" })

-- Multiple cursor
whichkey("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" })
whichkey("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" })
whichkey("n", "<M-C-j>", "<Plug>(VM-Select-Cursor-Down)", { desc = "Select cursor down" })
whichkey("n", "<M-C-k>", "<Plug>(VM-Select-Cursor-Up)", { desc = "Select cursor up" })

-- Disable code completion
whichkey("n", "<leader>cc", function()
	if cmp_enabled then
		require("cmp").setup.buffer({ enabled = false })
		cmp_enabled = false
	else
		require("cmp").setup.buffer({ enabled = true })
		cmp_enabled = true
	end
end, { desc = "Toggle Code Completion" })
