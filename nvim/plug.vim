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


