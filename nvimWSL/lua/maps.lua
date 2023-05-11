local keymap = vim.keymap

vim.g.mapleader = ','

-- exit insert mode
keymap.set('i', 'jj', '<ESC>')

-- increment / decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- delete fullword
keymap.set('n', 'dw', 'vb"_d')

-- tabs & splitting
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'ss', ':split<Return>', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return>', { silent = true })

-- move windows
keymap.set('', '<Space>', '<C-w>w')
keymap.set('n', '<S-h>', '<C-w>h')
keymap.set('n', '<S-j>', '<C-w>j')
keymap.set('n', '<S-k>', '<C-w>k')
keymap.set('n', '<S-l>', '<C-w>l')

-- resize windows
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber')
