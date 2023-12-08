local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',        -- Bash
        'clangd',        -- C, C++
        'cssls',         -- CSS
        'html',          -- HTML
        'jdtls',         -- Java
        'jsonls',        -- JSON
        'lemminx',       -- XML
        'lua_ls',        -- Lua
        'pyright',       -- Python
        'rust_analyzer', -- Rust
        'taplo',         -- TOML
        'tsserver',      -- JavaScript, TypeScript
        'vimls',         -- VimL
        'yamlls',        -- YAML
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

require('neodev').setup()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace'
            }
        }
    }
})
