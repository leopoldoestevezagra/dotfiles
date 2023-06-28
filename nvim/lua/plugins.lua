return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'windwp/nvim-autopairs'
    use {
        'morhetz/gruvbox',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    }

    -- cmp for completion & luasnip as the required snippet engine
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use {
        'glepnir/lspsaga.nvim',
        require = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
    }

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'windwp/nvim-ts-autotag'

    use 'lewis6991/gitsigns.nvim'
    use 'github/copilot.vim'
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-fugitive'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
end)
