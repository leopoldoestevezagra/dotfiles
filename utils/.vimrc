
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
Plug 'iamcco/markdown-preview.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"=============================================================="
"General"
"=============================================================="

set history=500
let g:tex_flavor = 'latex'

filetype plugin on
filetype indent on


set autoread

set path=$PWD/**

set wildmode=longest,list,full

set splitbelow splitright

set magic

set noerrorbells

set encoding=utf8
set foldmethod=indent
set nofoldenable

autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=4 tabstop=4

let g:vimtex_view_general_viewer = 'evince'
"=============================================================="
"NerdTree"
"=============================================================="

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

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
"Functions"
"=============================================================="

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
            \ 'source': s:list_buffers(),
            \ 'sink*': { lines -> s:delete_buffers(lines) },
            \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
            \ }))


"=============================================================="
"Remapings"
"=============================================================="
let mapleader=","
let g:user_emmet_leader_key=','

"Basic remapings"
:imap jj <Esc>

"File finding fzf"
:nmap <Leader>f :Files<CR>
:nmap <Leader>g :GFiles<CR>
:nmap <Leader>b :Buffers<CR>
:nmap <Leader>db :BD<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


"NerdTree remapings"
map <C-m> :NERDTreeToggle<CR>

"Window resizing"
if bufwinnr(1)
  map + 5<C-W>+
  map - 5<C-W>-
endif


if bufwinnr(1)
  map <F12> 5<C-W>>
  map <F10> 5<C-W><
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

set guicursor=

set background=dark " 282828"
set termguicolors
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
set diffopt+=vertical
let g:gruvbox_invert_selection="0"

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
set ruler

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set hlsearch


set tm=500

set number relativenumber
set colorcolumn=80


" Relative path on lightline at the bottom
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

set completeopt-=preview
let g:ycm_auto_trigger = 0
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>

nnoremap <leader>bb :buffers<cr>:b<space>

