return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.install({"lua", "javascript"})
    end
}
