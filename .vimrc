call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'gruvbox-community/gruvbox' " Gruvbox Color Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'tpope/vim-commentary' " Vim Comments gcc

call plug#end()

set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set title
set shortmess=atI

syntax on
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=Black
hi LineNr ctermfg=7

let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

nnoremap <C-t> :NERDTreeToggle<CR>
