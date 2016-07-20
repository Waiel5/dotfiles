" ~/.vimrc
" maintained by waiel

" ============================================================================
" General
" ============================================================================
set nocompatible
filetype off
syntax on
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set hidden
set noswapfile
set nobackup
set nowritebackup

" ============================================================================
" UI
" ============================================================================
set number
set relativenumber
set cursorline
set showmatch
set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set laststatus=2
set ruler
set scrolloff=8
set signcolumn=yes

" ============================================================================
" Search
" ============================================================================
set incsearch
set hlsearch
set ignorecase
set smartcase

" ============================================================================
" Indentation
" ============================================================================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" ============================================================================
" Key Mappings
" ============================================================================
let mapleader = ','

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :wq<CR>

" Clear search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" ============================================================================
" Status Line
" ============================================================================
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ 

" ============================================================================
" Autocommands
" ============================================================================
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Filetype specific settings
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
