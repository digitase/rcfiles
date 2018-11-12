
"
" Init
"

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Change current dir on open
set autochdir

" enable loading the plugin files for specific file types
filetype plugin on

" Load the language specific indent files
filetype indent on

"
" Colors and fonts
"

" Turn on syntax highlighting
syntax on

" Gui specific options
if has('gui_running')
    set guifont=Monospace
endif

"
" UI
"

" Stop annoying people
set visualbell

" Display the cursor position on the last line of the screen or in the status line of a window
set ruler

" Display line numbers on the left
set number

" highlight current line
set cursorline

" show the last (partial) command entered
set showcmd     
" Set the command window height to 2 lines"
set cmdheight=2

" Always display the status line, even if only one window is displayed
set laststatus=2

" Maintain 3 lines of space between cursor and edge
set scrolloff=3

" Do not wrap lines
set nowrap

" showmatch: Show the matching bracket for the last ')'?
set showmatch

"
" Editing
"

" 1 tab == 4 spaces
set shiftwidth=4 " width of an indent when displayed
set tabstop=4 " width of a TAB when displayed

set expandtab " insert spaces instead of tabs
set softtabstop=4 " number of spaces inserted in place of a TAB

" Be smart when using tabs
set smarttab

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Prevent auto wrapping of text and continuation of comments
set formatoptions=q

"
" Search
"

" do incremental searches, highlight matches
set incsearch 
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Search for visually selected text
vnoremap // y/<C-R>"<CR>"

"
" Autocompletion
"

" Omnicompletion
set omnifunc=syntaxcomplete#Complete

" Press Enter to accept the selected word. Hit Esc to cancel completion and go back to the original word. 
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" Add a completion menu to command completion
" That means that on first <Tab> it will complete to the longest common string
" and will invoke wildmenu (an horizontal and unobstructive little menu). On
" next <Tab> it will complete the first altenative and the will start to cycle
" through the rest. You can go back and forth with <Tab> and <S-Tab>
" respectively.
set wildmenu
set wildmode=longest,list

" but rather just inserts the longest common text of all
" matches; and the menu will come up even if there's only one match
set completeopt=longest,menuone

" Turn off completion from unloaded buffers
" Stops vim searching closed large files.
set complete=.,w,b,t,i

"
" History
"

" do not keep a backup files 
set nobackup
set nowritebackup

" keep 50 lines of command line history
set history=50  

"
" Key mappings
"

" remap esc
inoremap jj <Esc>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Remap semicolon to colon
nmap ; :

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Allow arrow keys to work on a remote shell
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" Split navigation without C-w
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" Advanced split navigation integration with tmux
" function! s:NavigateTermSplits(direction)
  " let windowNumber = winnr()
  " execute 'wincmd ' . a:direction
  " if windowNumber == winnr()
    " silent call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
  " endif
" endfunction

" nnoremap <silent> <C-h> :call <SID>NavigateTermSplits('h')<CR>
" nnoremap <silent> <C-j> :call <SID>NavigateTermSplits('j')<CR>
" nnoremap <silent> <C-k> :call <SID>NavigateTermSplits('k')<CR>
" nnoremap <silent> <C-l> :call <SID>NavigateTermSplits('l')<CR>

"
" vim-plug section
" A minimalist vim plugin manager
"

" auto-install plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" begin the section
call plug#begin('~/.vim/plugged')

" list plugins with Plug commands

" vim REPL 
Plug 'jpalardy/vim-slime'

" vim plugin to work with R
" Vim >= 8.0.0, R >= 3.0.0
" Plug 'jalvesaq/Nvim-R'

" fuzzy filesystem finder
Plug 'ctrlpvim/ctrlp.vim'

"  Seamless navigation between tmux panes and vim splits
"  NOTE: This requires tmux v1.8 or higher.
" Plug 'christoomey/vim-tmux-navigator'

" as you type code completion engine
" Plug 'valloric/youcompleteme'

" A super simple, super minimal, super light-weight tab-completion plugin for Vim.
" Plug 'ajh17/vimcompletesme'
"
" https://github.com/vim-scripts/indentpython.vim For better indentation"
 Plug 'https://github.com/vim-scripts/indentpython.vim.git'

" perform insert mode completions with tab
Plug 'ervandew/supertab'

" syntax checking hacks
" Plug 'scrooloose/syntastic'

" precision colorscheme for vim
Plug 'altercation/vim-colors-solarized'

" commenting plugin
Plug 'scrooloose/nerdcommenter'

" tree explorer plugin
Plug 'scrooloose/nerdtree'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" vim motions on speed
Plug 'easymotion/vim-easymotion'

" Better Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'

" manip brackets/parens/quotes in pairs
" Too aggressive
" Plug 'jiangmiao/auto-pairs'

" AutoPairs is surely great plugin, but, to me, it behaves too aggressively
Plug 'vim-scripts/auto-pairs-gentle'

" A modern vim plugin for editing LaTeX files.
Plug 'lervag/vimtex'

" Inserts matching bracket, paren, brace or quote
" http://vimawesome.com/plugin/autoclose-with-ourselves
" Plug 'vim-scripts/AutoClose'

" end the section to add plugins to &runtimepath
" Reload .vimrc and :PlugInstall to install plugins.
call plug#end()

"
" Solarized config
"
let g:solarized_termcolors=256
set t_Co=256 
set background=dark
colorscheme solarized

"
" SuperTab config
"

" Lets SuperTab decide which completion mode to use and should play well with OmniCompletion
let g:SuperTabDefaultCompletionType = "context"

"
" VimCompletesMe options
"
" You can change it to cycle backwards through the list by putting the following in your vimrc
" let g:vcm_direction = 'p'

"
" NERDCommenter config
"

" place spaces after comment chars
let NERDSpaceDelims=1

" don't recomment commented lines
let NERDDefaultNesting=0

" Add your own custom formats or override the defaults
" Get rid of extra space, presumably the default left is '# '
let g:NERDCustomDelimiters = {'python': {'left': '#'}}

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let NERDCommentEmptyLines=1

" Enable trimming of trailing whitespace when uncommenting
let NERDTrimTrailingWhitespace=1

"
" vim-slime config
"

" Use tmux instead of screen (default)
let g:slime_target = "tmux"

" IPython has a %cpaste magic function that allows for error-free pasting.
let g:slime_python_ipython = 1

"
" AutoPairsGentle mandatory config
"
let g:AutoPairsUseInsertedCount = 1

"
" RainbowParentheses config
" 
" Keep always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"
" vimR config
"
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
" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

" Disable underscore(_) automatically converted to (<-) for vimR
let vimrplugin_assign = 0

" Show extra info during omnicompletion
let vimrplugin_show_args = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

