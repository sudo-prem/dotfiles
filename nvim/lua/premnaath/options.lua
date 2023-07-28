-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable autoindentation
vim.opt.autoindent = true

-- Set tab-related options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

-- Set the file encoding to UTF-8
vim.opt.encoding = "UTF-8"

-- Configure backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Configure which keys can wrap to the previous/next line
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- Set the number of lines to keep in view above/below the cursor when scrolling
vim.opt.scrolloff = 8

-- Highlight the current line where the cursor is
vim.opt.cursorline = true

-- Disable highlighting of search matches after a search
vim.opt.hlsearch = false

-- Incremental search for search matches as you type
vim.opt.incsearch = true

