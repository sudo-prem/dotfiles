" Install VimPlug if not installed
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VimPlug Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'                  " Statusline
Plug 'ghifarit53/tokyonight-vim'                " Colorscheme
Plug 'ryanoasis/vim-devicons'                   " File icons
Plug 'tpope/vim-commentary'                     " Easy commenting
Plug 'jiangmiao/auto-pairs'                     " Auto-pair brackets, quotes
Plug 'tpope/vim-surround'                       " Surrounding modifiers
Plug 'terryma/vim-multiple-cursors'             " Multiple cursors
Plug 'octol/vim-cpp-enhanced-highlight'         " C++ syntax highlighting
Plug 'junegunn/fzf.vim'                         " FZF integration with Vim
Plug 'vim-autoformat/vim-autoformat'			" Autoformat source code
Plug 'justinmk/vim-sneak'						" Jump motions
call plug#end()

" General Settings
set number                        " Show line numbers
set relativenumber                " Show relative line numbers
set autoindent                    " Auto-indent
set tabstop=4                     " Tab width
set shiftwidth=4                  " Indentation width
set smarttab                      " Smart tab handling
set softtabstop=4                 " Soft tab width
set encoding=UTF-8                " Encoding
set shortmess=atI                 " Shorten messages
set backspace=indent,eol,start    " Backspace behavior
set whichwrap+=<,>,h,l,[,]        " Allow wrap with certain keys
set scrolloff=4                   " Keep 4 lines above/below cursor
set display+=lastline             " Ensure last line is displayed
set cursorline                    " Highlight cursor line
set ttimeout                      " Timeout for key sequences
set ttimeoutlen=1                 " Shorten timeout length
set ttyfast                       " Fast terminal refresh
set rtp+=/opt/homebrew/opt/fzf    " Add FZF to runtime path
set clipboard=unnamedplus         " Use system clipboard

" Netrw Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Theme Settings
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

" Airline Settings
let g:airline_symbols_ascii = 1

" Set leader key
let mapleader = " "

" Cursor Style
autocmd VimEnter * call system('printf "\e[2 q" > $TTY')
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Snippets trigger for UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Multiple cursor exit modes
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" Use jk to escape insert mode
inoremap jk <Esc>

" Close the current buffer
nnoremap <leader>x :bd<CR>
nnoremap <leader>q :q<CR>

" Window splits
nnoremap <silent> <C-w>\ :vsplit<CR>
nnoremap <silent> <C-w>- :split<CR>

" Pane navigation with Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines in visual mode
xnoremap <silent> J :m '>+1<CR>gv=gv
xnoremap <silent> K :m '<-2<CR>gv=gv

" Move to start/end of line
nnoremap <silent> H 0
nnoremap <silent> L $
vnoremap <silent> H 0
vnoremap <silent> L $

" Paste in visual mode without copying the replaced text
xnoremap <silent> p "_dP

" Copy to clipboard only when yanked, don't overwrite register for delete/change
nnoremap <silent> y "*y
vnoremap <silent> y "*y
nnoremap <silent> d "_d
vnoremap <silent> d "_d
nnoremap <silent> D "_D
vnoremap <silent> D "_D
nnoremap <silent> c "_c
vnoremap <silent> c "_c
nnoremap <silent> C "_C
vnoremap <silent> C "_C
nnoremap <silent> s "_s
vnoremap <silent> s "_s
nnoremap <silent> S "_S
vnoremap <silent> S "_S

" Disable arrow keys in normal mode
nnoremap <silent> <Up> <Nop>
nnoremap <silent> <Down> <Nop>

" Navigate buffers
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprevious<CR>

" Indent in visual mode and keep selection
xnoremap <silent> < <gv
xnoremap <silent> > >gv

" Keep cursor in the middle when navigating
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" Split line at cursor position and re-indent
nnoremap <silent> X :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==^<CR>

" Print current buffer's location
nnoremap <silent> <C-p> :echo expand('%:p')<CR>

" Move lines in normal/visual mode
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" Duplicate current line or selected lines
nnoremap <A-S-Up> :t.<CR>
nnoremap <A-S-Down> :t.<CR>
vnoremap <A-S-Up> :t '<-1<CR>gv
vnoremap <A-S-Down> :t '>+1<CR>gv

" FZF file search
nnoremap <silent> <leader><leader> :Files<CR>

" Format source code
noremap <F3> :Autoformat<CR>

" Jump with f/F
noremap f <Plug>Sneak_s
noremap F <Plug>Sneak_S

" Toggle Netrw (File Explorer)
function! ToggleNetrw()
	if exists("t:netrw_is_open") && t:netrw_is_open
		bd % | redraw! | wincmd p
		let t:netrw_is_open = 0
	else
		Explore
		let t:netrw_is_open = 1
	endif
endfunction
nnoremap <leader>e :call ToggleNetrw()<CR>

" Use W, Q, Wq in command mode
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

