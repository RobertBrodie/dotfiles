" Required before Vundle — disable Vi compatibility mode
set nocompatible
" Required by Vundle — re-enabled after vundle#end()
filetype off

"--- Vundle Plugin Manager ---"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'
" File explorer tree
Plugin 'preservim/nerdtree'

call vundle#end()
" Re-enable filetype detection, plugins, and indent rules
filetype plugin indent on

"--- Indentation Options ---"
" New lines inherit the indentation of previous lines.
set autoindent
" Convert tabs to spaces.
set expandtab
" When shifting lines, round the indentation to the nearest multiple of shiftwidth.
set shiftround
" When shifting, indent using four spaces.
set shiftwidth=4
" Insert tabstop number of spaces when the tab key is pressed.
set smarttab
" Indent using four spaces.
set tabstop=4

"--- Search Options ---"
" Enable search highlighting.
set hlsearch
" Ignore case when searching.
set ignorecase
" Incremental search that shows partial matches.
set incsearch
" Automatically switch search to case-sensitive when search query contains an uppercase letter.
set smartcase

"--- Text Rendering Options ---"
" Always try to show a paragraph's last line.
set display+=lastline
" Use an encoding that supports unicode.
set encoding=utf-8
" Avoid wrapping a line in the middle of a word.
set linebreak
" The number of screen lines to keep above and below the cursor.
set scrolloff=1
" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5
" Enable syntax highlighting.
syntax enable
" Enable line wrapping.
set wrap

"--- User Interface Options ---"
" Always display the status bar.
set laststatus=2
" Always show cursor position.
set ruler
" Display command line's tab complete options as a menu.
set wildmenu
" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=50
" Highlight the line currently under cursor.
set cursorline
" Highlight the current line number only.
set cursorlineopt=number
" Highlight the current column.
set cursorcolumn
" Set cursor column highlight to dark grey — visible without masking any syntax colours.
hi CursorColumn ctermbg=236
" Set line-length guide column to a visible dark red.
hi ColorColumn ctermbg=52
" Show line numbers on the sidebar.
set number
" Disable beep on errors.
set noerrorbells
" Flash the screen instead of beeping on errors.
set visualbell
" Disable mouse for scrolling and resizing.
set mouse-=a
" Set the window's title, reflecting the file currently being edited.
set title
" Use colors that suit a dark background.
set background=dark
" Do not prompt for save when switching buffers.
set hidden

"--- Misc Options ---"
" Automatically re-read files if unmodified inside Vim.
set autoread
" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start
" Directory to store backup files.
set backupdir=~/tmp
" Display a confirmation dialog when closing an unsaved file.
set confirm
" Increase the undo limit.
set history=1000
" Ignore file's mode lines; use vimrc configurations instead.
set nomodeline
" Disable swap files.
set noswapfile
" Write files before opening another file.
set autowrite
" Show matching parenthesis.
set showmatch
" Open new horizontal splits below the current pane.
set splitbelow
" Open new vertical splits to the right of the current pane.
set splitright

"--- Config Reload ---"
" Reload .vimrc with <leader>r and display a confirmation message.
nnoremap <leader>r :source ~/.vimrc<CR>:echo ".vimrc reloaded!"<CR>

"--- Split Navigation ---"
" Navigate splits with Ctrl + vim direction keys.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--- Folding ---"
" Fold based on indentation level.
set foldmethod=indent
" Open all folds by default up to level 99.
set foldlevel=99
" Disable the fold column.
set foldcolumn=0
" Toggle folds with the spacebar.
nnoremap <space> za

"--- Python3 Settings ---"
" Use Vim's filetype detection rather than relying solely on file extension.
" All settings use setlocal so they only apply to Python buffers.
" Enable all Python syntax highlight groups (builtins, exceptions, strings etc).
" Must be set as a global before the syntax file is loaded.
let python_highlight_all=1
augroup python3
    autocmd!
    " Explicitly apply Python syntax highlighting for this buffer.
    autocmd FileType python syntax on
    " PEP 8: indent with 4 spaces, no tabs.
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal expandtab
    " PEP 8: maximum line length of 79 characters.
    autocmd FileType python setlocal textwidth=79
    " Highlight the column after textwidth as a line-length guide.
    autocmd FileType python setlocal colorcolumn=80
    " Inherit indentation from the previous line automatically.
    autocmd FileType python setlocal autoindent
    " Use Unix line endings.
    autocmd FileType python setlocal fileformat=unix
augroup END

"--- Golang Settings ---"
" All settings use setlocal so they only apply to Go buffers.
" Enable extra highlight groups supported by Vim's built-in go.vim syntax file.
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
augroup golang
    autocmd!
    " Explicitly apply Go syntax highlighting for this buffer.
    autocmd FileType go syntax on
    " gofmt mandates tabs for indentation — do not expand to spaces.
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal shiftwidth=4
    autocmd FileType go setlocal noexpandtab
    " Go has no strict line limit; 120 characters is widely adopted.
    autocmd FileType go setlocal textwidth=120
    " Inherit indentation from the previous line automatically.
    autocmd FileType go setlocal autoindent
    " Use Unix line endings.
    autocmd FileType go setlocal fileformat=unix
augroup END

"--- Shell Script Settings ---"
" All settings use setlocal so they only apply to shell script buffers.
" FileType sh covers sh, bash, and zsh files detected by Vim's filetype engine.
" Treat all shell scripts as bash for syntax highlighting purposes.
let g:is_bash=1
" Enable syntax-based folding for functions and heredocs in shell scripts.
let g:sh_fold_enabled=3
augroup shell
    autocmd!
    " Explicitly apply shell syntax highlighting for this buffer.
    autocmd FileType sh syntax on
    " Indent with 4 spaces — tabs are non-standard in shell scripts.
    autocmd FileType sh setlocal tabstop=4
    autocmd FileType sh setlocal softtabstop=4
    autocmd FileType sh setlocal shiftwidth=4
    autocmd FileType sh setlocal expandtab
    " 80 characters is the widely adopted line length limit for shell scripts.
    autocmd FileType sh setlocal textwidth=80
    " Highlight the column after textwidth as a line-length guide.
    autocmd FileType sh setlocal colorcolumn=81
    " Inherit indentation from the previous line automatically.
    autocmd FileType sh setlocal autoindent
    " Unix line endings are mandatory — Windows line endings break shebangs.
    autocmd FileType sh setlocal fileformat=unix
augroup END

"--- NERDTree ---"
" Toggle NERDTree with \n.
nnoremap <leader>n :NERDTreeToggle<CR>
" Close Vim if NERDTree is the only window remaining.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
