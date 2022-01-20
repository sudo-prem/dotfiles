call plug#begin('~/.vim/plugged')

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary' 
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

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
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set scrolloff=4

syntax on
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=Black
hi LineNr ctermfg=7

let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

nnoremap <C-t> :NERDTreeToggle<CR>
imap jk <Esc>
vnoremap <C-c> "*y

nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
