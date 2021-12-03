"=============================================================="
"Plugins"
"=============================================================="
"Autoload plug"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Engines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tools
Plug 'tpope/vim-fugitive' " Git integration
Plug 'qpkorr/vim-bufkill' " Delete buffer keeping split
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'

" Note visualization tools
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.vim'

" Visuals
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"HL
Plug 'nelsyeung/twig.vim'

call plug#end()

" =============================================================="
"General Configuration"
"=============================================================="

set path=$PWD/** 
set autoread

set wildmode=full 

set splitbelow splitright
set magic " regex on find

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

" =============================================================="
" External tools configuration "
"=============================================================="

let g:vimtex_view_general_viewer = 'evince'

"=============================================================="
"Files and backup"
"=============================================================="

set nobackup
set noswapfile

"=============================================================="
"Text,tab,indent and syntax"
"=============================================================="

filetype plugin indent on
syntax on

set autoindent " Indent acording with previous line
set expandtab " Spaces instead of tabs
set softtabstop=4 " Tab key indents by 4 spaces.
set shiftwidth=4 " >> indents by 4 spaces.
set shiftround " >> indents to next multiple of 'shiftwidth'.

set linebreak " break on line break not last char that fits
set nowrap " disables line wrap

"=============================================================="
"Remapings"
"=============================================================="
let mapleader=","

" Movement
imap jj <Esc>
nmap <S-h> <C-w>h
nmap <S-j> <C-w>j
nmap <S-l> <C-w>l
nmap <S-k> <C-w>k
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

nmap te :tabedit <Return>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"File finding fzf"
nmap <Leader>f :Files <CR>
nmap <Leader>g :GFiles <CR>
nmap <Leader>b :Buffers <CR>
nmap <Leader>db :DB <CR>

" Nerdtree
nmap <Leader>m :NERDTreeToggle <CR>
nmap <Leader>n :NERDTreeFind <CR>

" Tagbar
nmap <Leader>t :TagbarToggle <CR>

" Coc related 
nnoremap <space> <NOP>
nnoremap <c-space> <NOP>

nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"=============================================================="
"UI and colors"
"=============================================================="
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"

set background=dark

let g:gruvbox_guisp_fallback = 'bg'
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

highlight Normal ctermbg=none
highlight NonText ctermbg=none


"=============================================================="
" Tool configuration "
"=============================================================="

"lightline
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

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment' } }

"=============================================================="
" custom functions "
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

command! DB call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

autocmd VimEnter * command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)
autocmd VimEnter * command! -bang -nargs=? Files call fzf#vim#files(<q-args>, {'options': '--no-preview'}, <bang>0)
