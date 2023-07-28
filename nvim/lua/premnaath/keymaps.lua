-- Set the mapleader
vim.g.mapleader = ' '

-- Snippets Trigger
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Open file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

-- Move lines
vim.api.nvim_set_keymap('n', '<S-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Add/Remove indentation
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true })

-- Remove Highlighting
vim.api.nvim_set_keymap('n', '<leader>nh', ':nohlsearch<CR>', { noremap = true })

-- Select all text in buffer
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true })

-- Insert a new line in normal mode
vim.api.nvim_set_keymap('n', '<leader>o', 'o<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>O', 'O<ESC>', { noremap = true })

-- Copy Paste
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-x>', '"*c', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', 'c<ESC>"*P', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<ESC>"*Pa', { noremap = true })

-- Use W, Q as w, q
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev Wq wq')
vim.cmd('cnoreabbrev WQ wq')

-- Change cursor style
vim.cmd([[
  augroup RestoreCursorShape
    autocmd!
    autocmd VimLeave * lua vim.cmd("set guicursor=a:block-blinkon0")
  augroup END
]])
