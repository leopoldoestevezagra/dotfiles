local status, mason = pcall(require, 'mason')
if (not status) then return end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup({})

lspconfig.setup {
    automatic_installation = true,
    run_on_start = true,
    ensure_installed = { 'html', 'emmet_ls', 'cssls', 'tsserver', 'sumneko_lua' }
}
