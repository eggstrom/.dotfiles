local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',        -- Bash
        'clangd',        -- C, C++
        'cssls',         -- CSS
        'html',          -- HTML
        'jsonls',        -- JSON
        'lemminx',       -- XML
        'lua_ls',        -- Lua
        'pylsp',         -- Python
        'rust_analyzer', -- Rust
        'taplo',         -- TOML
        'tsserver',      -- JavaScript, TypeScript
        'vimls',         -- VimL
        'yamlls'         -- YAML
    },
    handlers = {
        lsp_zero.default_setup,
    },
})
