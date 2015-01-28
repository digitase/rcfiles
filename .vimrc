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

