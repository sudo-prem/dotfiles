vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 0

vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 50
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.whichwrap = 'bs<>[]hl'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8
vim.o.relativenumber = true
vim.o.numberwidth = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.backspace = 'indent,eol,start'
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 1
vim.o.autoindent = true

vim.wo.number = true
vim.wo.signcolumn = 'yes'

vim.opt.termguicolors = true
vim.opt.smarttab = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.encoding = "utf-8"
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1
vim.opt.ttyfast = true
vim.opt.shortmess:append 'catI'
vim.opt.iskeyword:append '-'
vim.opt.isfname:append("@-@")
vim.opt.display:append("lastline")
vim.opt.formatoptions:remove { 'c', 'r', 'o' }
