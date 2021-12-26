call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'gruvbox-community/gruvbox' " Gruvbox Color Scheme
call plug#end()

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set updatetime=50
:set encoding=UTF-8
:set ruler
:set title
:set cursorline
:set shortmess=atI

:syntax on
:colorscheme gruvbox

:hi Normal guibg=NONE ctermbg=NONE
:hi CursorLine cterm=NONE ctermbg=Black

nnoremap <C-b> :NERDTreeToggle<CR>
