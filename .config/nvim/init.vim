" Show line number
set number
set relativenumber

" Show row and column ruler information
set ruler

" Backspace (because apparently it acts wierd if I don't)
set backspace=indent,eol,start

" Tab and indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" The /g flag on :s substitutions by default
set gdefault

" Search
set hlsearch " Highlight all search result
set smartcase
set ignorecase
" Searches for strings as you type
set incsearch 

" Highlight matching brace
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Keep n lines off the edges of the screen when scrolling
set scrolloff=4

" Allow vim to hide modified buffers without abandoning them
set hidden

" Add a bit extra margin to the left beside line number
set foldcolumn=1

" Number of undo levels
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Set how many history vim has to remember
set history=1000

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin('~/.local/share/nvim/plugins')
Plug 'vmchale/just-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'othree/html5.vim'
Plug 'elmcast/elm-vim'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'dpelle/vim-languagetool'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rust-lang/rust.vim'
call plug#end()

syntax enable
filetype plugin indent on  " Suggested by rust.vim

" For vim-racer... no clue if they work
set hidden
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
