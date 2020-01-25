
"                    .
"    ##############..... ##############
"    ##############......##############
"      ##########..........##########
"      ##########........##########
"      ##########.......##########
"      ##########.....##########..
"      ##########....##########.....
"    ..##########..##########.........
"  ....##########.#########.............
"    ..##################...JJJ...........
"      ################.................
"      ##############.......JJJ..JJJJJJJJJJ
"      ############.........JJJ..JJ..JJ  JJ
"      ##########...........JJJ..JJ..JJ  JJ
"      ########.............JJJ..JJJ JJJ JJJ
"      ######    .........
"                  .....
"                    .
"
"=============================================================="
"Plugins"
"=============================================================="
"
"Autoload plug"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'gabesoft/vim-ags'
Plug 'nelsyeung/twig.vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'mattn/emmet-vim'

call plug#end()


"=============================================================="
"General"
"=============================================================="

set history=500

filetype plugin on
filetype indent on


set autoread

set path=$PWD/**

set wildmode=longest,list,full

set splitbelow splitright

set magic

set noerrorbells

set encoding=utf8
set foldmethod=syntax
set nofoldenable




"=============================================================="
"NerdTree"
"=============================================================="


"Autoload NerdTree"
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"Autofix on save"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd BufWritePre * %s/\s\+$//e

let NERDTreeShowHidden=1


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

let g:goyo_linenr = 1

"=============================================================="
"Remapings"
"=============================================================="
let mapleader=","
let g:user_emmet_leader_key=','


"Basic remapings"
:imap jj <Esc>

"File finding fzf"
:map <F1> :Files <CR>


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

nmap <S-h> <C-w>h
nmap <S-j> <C-w>j
nmap <S-k> <C-w>k
nmap <S-l> <C-w>l
nmap <S-v> <C-w>v
nmap <S-s> <C-w>s

"=============================================================="
"UI and colors"
"=============================================================="


syntax enable

set background=dark
set termguicolors
let ayucolor="mirage"
colorscheme ayu


set ruler

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set hlsearch


set tm=500

set number relativenumber
set colorcolumn=80

set background=dark
set t_Co=256

"##### Lightline #####"
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




