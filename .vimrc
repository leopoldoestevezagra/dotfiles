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
"Colors and fonts"
"=============================================================="

syntax enable

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set encoding=utf8

"=============================================================="
"User interface"
"=============================================================="

set ruler

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set hlsearch

set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set number relativenumber
set colorcolumn=80

set guicursor=n-v-c:block-Cursor

set background=dark
set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


let NERDTreeShowLineNumbers=1


" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"Nerdtree git symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "Um",
    \ "Deleted"   : "D",
    \ "Dirty"     : "Dr",
    \ "Clean"     : "CL",
    \ 'Ignored'   : 'I',
    \ "Unknown"   : "?"
    \ }

""
let g:ycm_auto_trigger=0

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
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable ='~' 
let g:NERDTreeDirArrowCollapsible = '/'

"Autofix on save"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1



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
set nowrap 

"=============================================================="
"Remapings"
"=============================================================="

"Basic remapings"
:imap jj <Esc>

"File finding fzf"
:map <F2> :Files <CR>

"NerdTree remapings"
map <C-m> :NERDTreeToggle<CR>

"Window resizing"
if bufwinnr(1)
  map + 5<C-W>+
  map - 5<C-W>-
endif


if bufwinnr(1)
  map <F12> <C-W>>
  map <F10> <C-W><
endif

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
Plug 'editorconfig/editorconfig-vim'
Plug 'gabesoft/vim-ags'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.vim'
Plug 'vim-scripts/c.vim'

call plug#end()

colorscheme gruvbox
