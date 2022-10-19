vim.cmd("autocmd!")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tab / indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true 
opt.smartcase = true
opt.hlsearch = true

-- general
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.scrolloff = 5 -- minimal number of lines above and below cursor

-- backup
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- file search config
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- backspace 
opt.backspace = "indent,eol,start"

-- window split
opt.splitright = true
opt.splitbelow = true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
