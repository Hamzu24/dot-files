" General Settings
set nocompatible              " Disable vi compatibility mode
set encoding=utf-8            " Use UTF-8 encoding
set fileencoding=utf-8        " Use UTF-8 for file encoding
set nodigraph

" Line Numbers
set relativenumber            " Enable relative line numbers
set number                    " Enable absolute line number for current line (hybrid mode)

" Syntax Highlighting and Colors
syntax enable                 " Enable syntax highlighting

" Search Settings
set hlsearch                  " Highlight search results
set incsearch                 " Show search matches as you type

" Indentation and Tabs
set expandtab                 " Convert tabs to spaces
set tabstop=4                 " Tab width of 4 spaces
set shiftwidth=4              " Indentation width of 4 spaces
set softtabstop=4             " Soft tab stop of 4 spaces
set autoindent                " Auto indent new lines
filetype plugin indent on

" Display Settings
set showmatch                 " Highlight matching brackets
set ruler                     " Show cursor position
set showcmd                   " Show command in status line
set wildmenu                  " Enhanced command line completion
set scrolloff=8               " Keep 8 lines visible above/below cursor

" Editor Behavior
set backspace=indent,eol,start " Allow backspace over everything
set mouse=a                   " Enable mouse support
set clipboard=
set wrap                      " Wrap long lines
set showbreak=↪\ 
set linebreak                 " Break lines at word boundaries
set history=500               " Keep 1000 lines of command history
set undolevels=500            " Keep 1000 levels of undo

" File Handling
set autoread                  " Auto reload files changed outside vim
set backup                    " Keep backup files
set backupdir=~/.config/vim/backup// " Backup directory
set directory=~/.config/vim/swap//   " Swap file directory
set undofile                  " Persistent undo
set undodir=~/.config/vim/undo//     " Undo directory
set viminfo+=n~/.config/vim/viminfo
let g:netrw_home = expand('~/.config/vim')


" Performance
set lazyredraw               " Don't redraw during macros
set ttyfast                  " Fast terminal connection

" Key Mappings
" Map Ctrl+j to scroll half page down and center cursor
nnoremap <C-j> <C-d>zz

" Map Ctrl+k to scroll half page up and center cursor
nnoremap <C-k> <C-u>zz

" Clear search highlighting with Esc
nnoremap <Esc> :noh<CR>

" Repurpose H and L to something more useful
nnoremap H ^
nnoremap L $

"" Exit insert mode with ii
"inoremap ii <Esc>

" Move lines up/down with Alt+j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Add the correct behaviour of Y
nnoremap Y y$

" Set leader to comma
let mapleader = "\<Space>"

" Add ways to create lines without entering insert mode
nnoremap <Leader>o o<Space><BS><Esc>
nnoremap <Leader>O O<Space><BS><Esc>
nnoremap <Leader>! :q!<CR>

" Pre-defined macros!
let @f = "F\"if\<Esc>"
let @c = "I# \<Esc>j"
let @u = "^2xj"
let @w = 'ciw"pa"'

" Make yanked text highlighted
function! HighlightYank()
    silent! execute 'match CursorLine /\%'.line("'[").'l\%'.col("'[").'c\_.*\%'.line("']").'l\%'.col("']").'c/'
    call timer_start(500, {tid -> execute('match none')})
endfunction

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * call HighlightYank()
augroup END

" File Type Specific Settings
augroup FileTypeSettings
    autocmd!
    " Python files
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
    " JavaScript/TypeScript files
    autocmd FileType javascript,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    " HTML/CSS files
    autocmd FileType html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2
    " YAML files
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END
