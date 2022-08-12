" *********************************
" General configuration
" *********************************

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

set path=$PWD/** 
set autoread

set wildmode=full 

set splitbelow splitright
set magic

set noerrorbells
set encoding=utf8

set foldmethod=indent " folding
set nofoldenable

set diffopt+=vertical 
set number relativenumber
set backspace=indent,eol,start
set guicursor=n-v-c:block-Cursor
set guicursor=i:ver100

set hidden

set nobackup
set noswapfile

filetype plugin indent on
syntax on

set autoindent 
set expandtab 
set softtabstop=4 
set shiftwidth=4 
set shiftround 

set linebreak 
set nowrap 

set wildignore+=*/node_modules/*

" *********************************
" Imports 
" *********************************

runtime ./plug.vim
runtime ./maps.vim
runtime ./ui.vim
runtime ./functions.vim

" *********************************
" Change functions functionality 
" *********************************

autocmd VimEnter * command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)
autocmd VimEnter * command! -bang -nargs=? Files call fzf#vim#files(<q-args>, {'options': '--no-preview'}, <bang>0)

let g:pythong3_host_prog = 'C:\Users\Work\AppData\Local\Programs\Python\Python310\python.exe'
