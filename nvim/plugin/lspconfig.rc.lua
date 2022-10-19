local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format ]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
        vim.api.nvim_command [[augroup END]]
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
    cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}

nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
