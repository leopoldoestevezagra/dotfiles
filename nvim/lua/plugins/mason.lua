return {
    {
        "mason-org/mason.nvim",
        opts = {
            PATH = "prepend",
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "eslint",
                "tsc",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.config("tsc", {
                capabilities = capabilities,
            })

            vim.keymap.set("n", "<leader>p", function()
                vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
            end, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, {})
        end,
    },
}
