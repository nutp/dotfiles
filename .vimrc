set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'groenewege/vim-less'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leshill/vim-json'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'wavded/vim-stylus'

call vundle#end()

" Key mapping
let mapleader = ","

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
nnoremap <leader>n <C-w>n<C-w>j

nnoremap <leader>f <C-w>_<C-w><Bar>
nnoremap <leader>= <C-w>=

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-n> <C-w><
nnoremap <C-m> <C-w>>
nnoremap _ <C-w>-
nnoremap + <C-w>+

" Preserve indentation while pasting text from the OS X clipboard
nnoremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Lowers timeout when press leader key + command
set timeoutlen=500

" Split window options
set splitbelow
set splitright
set fillchars=vert:\

" Buffer options
set autowrite         " Write the old file out when switching between files.
set hidden            " Switch between buffers without saving
set confirm           " Confirm unsaved changes
set shortmess+=AI     " Don't display swap files warning and intro page
set clipboard=unnamed " Yank text to the OS X clipboard

" Modelines
set modeline
set modelines=2 " OSX vim default to 0 so modeline does not work

" Status line
set statusline=%<%F\ %m%r(#%n)\ %=%-10.(%l,%c%V%)\ %P\ \o\f\ %LL
set laststatus=2 " Always show the status line

set showcmd      " Show command in bottom right portion of the screen

hi ColorColumn ctermfg=NONE ctermbg=darkgray
hi StatusLineNC ctermfg=darkgray ctermbg=black
hi SpecialKey ctermfg=darkgray

" Tab & indent
set tabstop=2
set shiftwidth=2
set expandtab

set smartindent
set smarttab

" Line wrapping
set nowrap
set textwidth=70     " Margin enforcement
set colorcolumn=+1   " Margin guide

" list tabs, trailing spaces and leave markers when wrapping lines
au InsertEnter * set list listchars=tab:»·,trail:\·,precedes:«,extends:»
au InsertLeave * set list listchars=tab:\ \ ,trail:\·,precedes:«,extends:»

" Searching
set incsearch  " Incremental search
set hlsearch   " Highlight search
set ignorecase " Case insensitive
set smartcase  " Case sensitive if first character is capitalized

" Editing
set nostartofline              " Stay at current column when jumping
set showmatch                  " Jump to the matching brace
set foldlevelstart=0           " Don't fold initially

set backspace=indent,eol,start " Backspace over everything

set linespace=3                " Prefer a slightly higher line height
set number                     " Show lines numbers
set cul                        " Highlight current line for active window
au WinEnter * set cul
au WinLeave * set nocul

" Mouse
set mouse=a   " Enable mouse
set mousehide " Hide mouse when typing

" Make CtrlP ignore `node_modules` directory
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }

" Enable vim-jsx plugin with .js extension
let g:jsx_ext_required = 0

" Filetypes
syntax on
filetype plugin indent on
