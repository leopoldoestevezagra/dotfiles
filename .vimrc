

"=============================================================="
"General"
"=============================================================="

set history=500

filetype plugin on
filetype indent on

set autoread


set path=$PWD/**
set wildignore+=**/node_modules/** 
set wildignore+=**/var/** 
set wildignore+=**/vendor/** 

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

" Relative path on lightline at the bottom
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


"=============================================================="
"User interface"
"=============================================================="

set ruler

set cursorline

set hlsearch

set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set relativenumber
"set colorcolumn=80

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"=============================================================="
"Autoloads"
"=============================================================="

"Autoload plug"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Autoload NerdTree"
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Autofix on save"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"=============================================================="
"Colors and fonts"
"=============================================================="

syntax enable

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set encoding=utf8

"=============================================================="
"Files and backup"
"=============================================================="

set nobackup
set nowb
set noswapfile

"=============================================================="
"Text,tab and indent"
"=============================================================="

set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai 
set si 
set wrap 

"=============================================================="
"Remapings"
"=============================================================="

"Basic remapings"
:imap jj <Esc>

"NerdTree remapings"
map <C-m> :NERDTreeToggle<CR>

"Window resizing"
if bufwinnr(1)
  map + 5<C-W>+
  map - 5<C-W>-
endif

if bufwinnr(1)
  map > <C-W>>
  map < <C-W><
endif

" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 

"=============================================================="
"Plugins"
"=============================================================="

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'nelsyeung/twig.vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf.vim'
Plug 'gabesoft/vim-ags'
Plug 'kien/ctrlp.vim'

call plug#end()




