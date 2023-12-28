return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local function on_attach(ev)
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<space>F", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end

        require("lspconfig.ui.windows").default_options.border = "single"
        require("mason").setup({ ui = { border = "single" } })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",               -- Bash
                "clangd",               -- C, C++
                "cssls",                -- CSS, SCSS, Less
                "html",                 -- HTML
                "jdtls",                -- Java
                "jedi_language_server", -- Python
                "jsonls",               -- JSON
                "lemminx",              -- XML
                "lua_ls",               -- Lua
                "rust_analyzer",        -- Rust
                "taplo",                -- TOML
                "tsserver",             -- JavaScript, TypeScript
                "vimls",                -- Vimscript
                "yamlls",               -- YAML
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
                ["lua_ls"] = function()
                    require("neodev").setup()
                    require("lspconfig").lua_ls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                completion = { callSnippet = "Replace" },
                                runtime = { version = "LuaJIT" },
                                workspace = {
                                    checkThirdParty = false,
                                    library = { vim.env.VIMRUNTIME },
                                },
                            },
                        },
                    })
                end
            },
        })
    end,
}
