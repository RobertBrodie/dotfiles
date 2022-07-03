au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"--- Indentation Options ---"
set autoindent
" New lines inherit the indentation of previous lines.
set expandtab
" Convert tabs to spaces.
set shiftround
" When shifting lines, round the indentation to the nearest multiple of shiftwidth.
set shiftwidth=4
" When shifting, indent using four spaces.
set smarttab
" Insert tabstop number of spaces when the tab key is pressed.
set tabstop=4
" Indent using four spaces.
set hlsearch
" Enable search highlighting.
set ignorecase
" Ignore case when searching.
set incsearch
" Incremental search that shows partial matches.
set smartcase
" Automatically switch search to case-sensitive when search query contains an uppercase letter.

"--- Text Rendering Options ---"
set display+=lastline
" Always try to show a paragraph’s last line.
set encoding=utf-8
" Use an encoding that supports unicode.
set linebreak
" Avoid wrapping a line in the middle of a word.
set scrolloff=1
" The number of screen lines to keep above and below the cursor.
set sidescrolloff=5
" The number of screen columns to keep to the left and right of the cursor.
syntax enable
" Enable syntax highlighting.
set wrap
" Enable line wrapping.

"--- User Interface Options ---"
set laststatus=2
" Always display the status bar.
set ruler
" Always show cursor position.
set wildmenu
" Display command line’s tab complete options as a menu.
set tabpagemax=50
" Maximum number of tab pages that can be opened from the command line.
set cursorline
" Highlight the line currently under cursor.
set number
" Show line numbers on the sidebar.
set noerrorbells
" Disable beep on errors.
set visualbell
" Flash the screen instead of beeping on errors.
set mouse-=a
" Disable mouse for scrolling and resizing.
set title
" Set the window’s title, reflecting the file currently being edited.
set background=dark
" Use colors that suit a dark background.

"--- Misc Options ---"
set autoread
" Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start
" Allow backspacing over indention, line breaks and insertion start.
set backupdir=~/tmp
" Directory to store backup files.
set confirm
" Display a confirmation dialog when closing an unsaved file.
set history=1000
" Increase the undo limit.
set nomodeline
" Ignore file’s mode lines; use vimrc configurations instead.
set noswapfile
" Disable swap files.
set autowrite
" Write files before opening another file
set showmatch
" Show matching parenthesis
set nocompatible
filetype off

set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let python_highlight_all=1
syntax on


" Vundle Plugin Management

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here 
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
