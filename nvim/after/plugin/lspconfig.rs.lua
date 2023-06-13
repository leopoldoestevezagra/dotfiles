local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function () end

lspconfig.lua_ls.setup ({
capabilities = cmp_capabilities,
    on_attach = on_attach
})

lspconfig.tsserver.setup ({
    capabilities = cmp_capabilities,
    on_attach = on_attach
})
