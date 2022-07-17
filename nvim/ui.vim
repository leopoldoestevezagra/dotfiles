let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"

set background=dark
set colorcolumn=80

let g:gruvbox_guisp_fallback = 'bg'
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

highlight Normal ctermbg=none
highlight NonText ctermbg=none

let g:AutoPairsCenterLine=0

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
