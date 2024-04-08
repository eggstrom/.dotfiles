return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style={IndentWidth: 4}" },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--tab-width", "4" },
                }),
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.sql_formatter,
            },
        })
    end,
}
