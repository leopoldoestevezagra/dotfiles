"Autoload plug"
call plug#begin('~/AppData\Local\plugged')

" Engines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tools
Plug 'tpope/vim-fugitive' " Git integration
Plug 'qpkorr/vim-bufkill' " Delete buffer keeping split
Plug 'scrooloose/nerdcommenter'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'


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
