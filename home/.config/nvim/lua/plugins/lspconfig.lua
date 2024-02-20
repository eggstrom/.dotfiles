return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function()
        require("lspconfig.ui.windows").default_options.border = "single"

        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

        local settings = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("", "<leader>F", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end,
        }

        local lspconfig = require("lspconfig")

        lspconfig.bashls.setup(settings)
        lspconfig.clangd.setup(settings)
        lspconfig.cssls.setup(settings)
        lspconfig.html.setup(settings)
        lspconfig.jdtls.setup(settings)
        lspconfig.jsonls.setup(settings)
        lspconfig.lemminx.setup(settings)
        lspconfig.lua_ls.setup(vim.tbl_extend("force", settings, {
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
            on_init = function()
                require("neodev").setup()
            end,
        }))
        lspconfig.pyright.setup(settings)
        lspconfig.rnix.setup(settings)
        lspconfig.rust_analyzer.setup(settings)
        lspconfig.taplo.setup(settings)
        lspconfig.tsserver.setup(settings)
        lspconfig.vimls.setup(settings)
        lspconfig.yamlls.setup(settings)
    end,
}
