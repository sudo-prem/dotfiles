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
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Theme
syntax on
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=7

" Settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set encoding=UTF-8
set title
set shortmess=atI
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set scrolloff=4
set display+=lastline
set cursorline
set ttimeout
set ttimeoutlen=1
set ttyfast

" Cursor Style
autocmd VimEnter * call system('printf "\e[2 q" > $TTY')
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Nerd Tree
nnoremap <C-t> :NERDTreeToggle<CR>

" Move Lines
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-e> :E <CR>

" Snippets Trigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Multiple Cursor Exit
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" Copy Paste
vmap <C-c> "*y
vmap <C-x> "*c
vmap <C-v> c<ESC>"*P
imap <C-v> <ESC>"*Pa

" Vim Bindings on tmux
if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xLeft>=\e[1;*D"
	execute "set <xRight>=\e[1;*C"
endif

" Integrate Autoformat
noremap <F3> :Autoformat<CR>

" Other Keybindings
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Use W,Q as w,q
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>

