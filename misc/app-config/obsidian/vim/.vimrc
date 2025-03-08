" escape with jk
imap jk <Esc>

" move to start/end of line
nmap H 0
nmap L $

" move down in a line wrap
nmap j gj
nmap k gk

" surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
nunmap gsa
vunmap gsa
vmap [[ :surround_wiki
map gsa" :surround_double_quotes
map gsa' :surround_single_quotes
map gsa( :surround_brackets
map gsa) :surround_brackets
map gsa[ :surround_square_brackets
map gsa{ :surround_curly_brackets
map gsa} :surround_curly_brackets

" open links
exmap openlink obcommand editor:open-link-in-new-leaf
nmap gd :openlink

" window splits
exmap vs obcommand workspace:split-vertical
exmap hs obcommand workspace:split-horizontal
nmap <C-w>\ :vs
nmap <C-w>- :hs

" focus windows
exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
nmap <C-j> :focusBottom
nmap <C-k> :focusTop
nmap <C-h> :focusLeft
nmap <C-l> :focusRight

" close windows
exmap wq obcommand workspace:close
exmap q obcommand workspace:close
