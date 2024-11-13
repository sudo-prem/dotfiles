vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.o.whichwrap = "bs<>[]hl"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.encoding = "utf-8"
vim.opt.shortmess:append("atI")
vim.opt.backspace = "indent,eol,start"
vim.opt.display:append("lastline")

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1
vim.opt.ttyfast = true
vim.opt.updatetime = 50

vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
