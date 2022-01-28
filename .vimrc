" VimPlug Plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" Theming
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
hi LineNr ctermfg=7

" Cursor Style
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

" Nerd Tree
nnoremap <C-t> :NERDTreeToggle<CR>

" Move Lines
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" Snippets Trigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Multiple Cursor Exit
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" Copy Paste
vnoremap <C-c> "*y
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

" Vim Bindings on tmux
if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xLeft>=\e[1;*D"
	execute "set <xRight>=\e[1;*C"
endif

" Integrate clang-format
noremap <F3> :Autoformat<CR>

" Other Keybindings
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
