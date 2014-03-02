set nocompatible

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
			\ 'build': {
			\   'unix': 'make -f make_unix.mak'
			\ }
			\ }

NeoBundle 'benmills/vim-golang-alternate'
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mbbill/undotree'
NeoBundle 'baskerville/vim-sxhkdrc'

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
let g:hydra_use_colorspace = 1
colorscheme hydra

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
set showmode
set showcmd
set colorcolumn=80
set scrolloff=8
set sidescroll=1
set nostartofline
set showmatch
set matchtime=5

set laststatus=2
set statusline=
set statusline+=%F%m%r%h%w
set statusline+=\ %=%Y
set statusline+=\ [%{strlen(&fenc)?&fenc:'n/a'}]
set statusline+=\ [%{&ff}]
set statusline+=\ %l,%v\ %p%%

set list
set listchars=eol:¬,tab:▸\ ,trail:✗,conceal:†,nbsp:␣

" ---------------
" Behaviors
" ---------------
set autoread
set autowrite
set wildmenu
set hidden
set history=768
set clipboard+=unnamedplus
set timeoutlen=400
set cf

" ---------------
" Format
" ---------------
set encoding=utf-8
set modeline
set formatoptions=nrql
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent
set autoindent
set smartindent
set smarttab
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
let mapleader=';'

nnoremap <silent> <leader>n :set relativenumber!<cr>
nnoremap <silent> <F8> :TagbarToggle<cr>

" ---------------
" Functions
" ---------------

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
	au BufRead * normal zR
augroup END

if !exists(':DiffOrig')
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif
