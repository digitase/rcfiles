" Turn on syntax highlighting
syntax on

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" do not keep a backup files 
set nobackup
set nowritebackup

" keep 50 lines of command line history
set history=50  

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" show (partial) commands
set showcmd     

" do incremental searches (annoying but handy);
set incsearch 
set hlsearch

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Set the command window height to 2 lines"
set cmdheight=2

" Display line numbers on the left
set number

" Always display the status line, even if only one window is displayed
set laststatus=2

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Remap semicolon to colon
nmap ; :

" Gui options
if has('gui_running')
    set guifont=Monospace
    colorscheme wombat
endif

" Change current dir on open
set autochdir

" Stop annoying people
set visualbell

" Maintain 3 lines of space between cursor and edge"
set scrolloff=3

" Add completion menu to command completion
set wildmenu
set wildmode=list:longest

" Do not wrap lines
set nowrap

" place spaces after comment chars
let NERDSpaceDelims=1

" don't recomment commented lines
let NERDDefaultNesting=0

" Omnicompletion
set omnifunc=syntaxcomplete#Complete

" Lets SuperTab decide which completion mode to use and should play well with OmniCompletion
let g:SuperTabDefaultCompletionType = "context"

" You can enable loading the plugin files for specific file types
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/vim-r-plugin/.vimrc
" Vim-R-Tmux installation info at:
" http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r
" sample settings for vim-r-plugin and screen.vim
" Installation 
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement 
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session  
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vimrplugin_show_args = 1

" Allow arrow keys to work on a remote shell
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" Disable underscore(_) automatically converted to (<-) for vimR
let vimrplugin_assign = 0
