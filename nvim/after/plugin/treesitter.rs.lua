local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    ensure_installed = {
        'javascript',
        'typescript',
        'tsx',
        'lua',
        'vim',
        'markdown',
        'markdown_inline'
    },
    autotag = {
        enable = true -- Requires windwp/nvim-ts-autotag
    }
}
