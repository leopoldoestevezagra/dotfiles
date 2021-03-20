
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

" Installation needs
" silver seacher
" fzf
" npm
" git
" latex-live
call plug#begin('~/.vim/plugged')

" Engines
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Searching engine
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gabesoft/vim-ags' "Word searching
Plug 'lervag/vimtex'
Plug 'dbeniamine/cheat.sh-vim'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive' "Git commands & better integration
Plug 'airblade/vim-gitgutter'

" Completion & Text
Plug 'tpope/vim-abolish' "Substitution & better searching
Plug 'tpope/vim-surround' "Change surrounding tags etc
Plug 'scrooloose/nerdcommenter' "Comments
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Main completion engine

" Highligh & snippets
Plug 'posva/vim-vue'
Plug 'nelsyeung/twig.vim'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Visualization
Plug 'iamcco/markdown-preview.vim'

"Visuals
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'


call plug#end()

" Note : Coc installables
" coc-emmet
" coc-phpls
" coc-tsserver
" coc-snippets
" coc-html
"
" =============================================================="
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
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=4 tabstop=4

let g:vimtex_view_general_viewer = 'evince'
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

filetype indent on
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

let g:jsx_improve_javascriptreact = 0

"=============================================================="
"Remapings"
"=============================================================="
let mapleader=","
let g:user_emmet_leader_key=','

"Basic remapings"
:imap jj <Esc>

"File finding fzf"
:map <Leader>f :Files <CR>
:map <Leader>g :GFiles <CR>
:map <Leader>b :Buffers <CR>
:map <Leader>db :BD <CR>


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


set background=dark

let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set t_Co=256

"let ayucolor="mirage"
"colorscheme ayu
set diffopt+=vertical

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
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set completeopt-=preview
let g:ycm_auto_trigger = 1
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>

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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment' } }
hi Normal guibg=NONE ctermbg=NONE

