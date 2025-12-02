vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.have_nerd_font = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1
vim.opt.ttyfast = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.numberwidth = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.mousescroll = "ver:0,hor:0"

vim.opt.wrap = true
vim.opt.whichwrap = "bs<>[]hl"
vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "

vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 7
vim.opt.pumheight = 7
vim.opt.conceallevel = 0
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.foldenable = false
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.shortmess:append("catI")
vim.opt.iskeyword:append("-")
vim.opt.isfname:append("@-@")
vim.opt.display:append("lastline")

vim.filetype.add({ extension = { tex = "none" } })
