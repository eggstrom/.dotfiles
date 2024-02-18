return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason").setup({ ui = { border = "single" } })
        require("mason-tool-installer").setup({
            auto_update = true,
            ensure_installed = {
                -- LSPs
                "bash-language-server",
                "clangd",
                "css-lsp",
                "html-lsp",
                "jdtls",
                "json-lsp",
                "lemminx",
                "lua-language-server",
                "rnix-lsp",
                "pyright",
                "rust-analyzer",
                "taplo",
                "typescript-language-server",
                "vim-language-server",
                "yaml-language-server",

                -- Formatters
                "black",
                "isort",
                "prettier",
                "shfmt",
                "sql-formatter",
            },
        })

        vim.keymap.set("", "<leader>m", "<cmd>:Mason<CR>")
    end,
}
