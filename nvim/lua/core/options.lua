-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- do not create backup file
vim.opt.backup = false

-- do not create swapfile
vim.opt.swapfile = false

-- do not persist undo
vim.opt.undofile = false

-- edit a file which is being edited
vim.opt.writebackup = false

-- do not wrap text
vim.opt.wrap = false

-- vertical scroll offset
vim.opt.scrolloff = 8

-- horizontal scroll offset
vim.opt.sidescrolloff = 8

-- move to next/prev line with l/h
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- inoreabbrev  (Insert mode abbreviations)
-- iabbrev      (Insert and Command-line mode abbreviations)
-- cnoreabbrev  (Command-line abbreviations)
vim.cmd([[
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
inoreabbrev dont don't
inoreabbrev youre you're
]])

-- set colorscheme
vim.cmd[[colorscheme tokyonight]]