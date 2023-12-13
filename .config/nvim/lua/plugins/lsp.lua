return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'folke/neodev.nvim',
    },
    config = function()
        require('mason').setup({ ui = { border = 'single' } })
        require('mason-lspconfig').setup({ automatic_installation = true, })
        require('neodev').setup()

        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>F', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig.bashls.setup({})  -- Bash
        lspconfig.clangd.setup({})  -- C, C++
        lspconfig.cssls.setup({})   -- CSS
        lspconfig.html.setup({})    -- HTML
        lspconfig.jdtls.setup({})   -- Java
        lspconfig.jsonls.setup({})  -- JSON
        lspconfig.lemminx.setup({}) -- XML
        lspconfig.lua_ls.setup({    -- Lua
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = 'Replace'
                    },
                },
            },
        })
        lspconfig.pyright.setup({})       -- Python
        lspconfig.rust_analyzer.setup({}) -- Rust
        lspconfig.taplo.setup({})         -- TOML
        lspconfig.tsserver.setup({})      -- JavaScript, TypeScript
        lspconfig.vimls.setup({})         -- VimL
        lspconfig.yamlls.setup({})        -- YAML
    end,
}
