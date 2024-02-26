return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.sql_formatter,
            },
        })

        vim.keymap.set("", "<leader>F", function()
            vim.lsp.buf.format({ async = true })
        end)
    end,
}
