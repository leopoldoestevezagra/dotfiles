require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
    return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_wsl = has "wsl"
local is_lin = has "unix"
