set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'

filetype plugin indent on

" ---------------
" Files
" ---------------
set backup
set undofile
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/tmp

" ---------------
" Color
" ---------------
set background=dark
let g:hybrid_use_Xresources=1
colorscheme hybrid

" ---------------
" UI
" ---------------
syntax on
set title
set ruler
set cursorline
set cursorcolumn
set number
set nowrap
set laststatus=2
set showmode
set showcmd
set colorcolumn=80
set scrolloff=8
set sidescroll=1
set nostartofline

set showmatch
set matchtime=5
set list
set listchars=tab:▸\ ,eol:¬,nbsp:✗,trail:✗
set encoding=utf-8

" ---------------
" Behaviors
" ---------------
set autoread
set autowrite
set wildmenu
set hidden
set history=768
set clipboard+=unnamedplus
"set clipboard+=unnamed
set timeoutlen=400
set cf

" ---------------
" Format
" ---------------
set modeline
set formatoptions=nrql
set backspace=2
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
set smartindent
set smarttab
set expandtab
set noeol

" ---------------
" Search
" ---------------
set ignorecase
set smartcase
set incsearch
set nohlsearch

" ---------------
" Bells
" ---------------
set noerrorbells
set visualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mouse=a
set mousehide

" ---------------
" Mappings
" ---------------
let mapleader=','

inoremap jj <ESC>
nnoremap <silent> <C-n> :call NumberToggle()<CR>
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <silent> <leader>v :e ~/.vimrc<CR>

nnoremap <silent> <F8> :TagbarToggle<CR>

" ---------------
" Functions
" ---------------
function! NumberToggle()
    if (&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" ---------------
" Commands
" ---------------

" Return to last known cursor position when editing a file.
augroup cursor_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
augroup END

if !exists(':DiffOrig')
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
