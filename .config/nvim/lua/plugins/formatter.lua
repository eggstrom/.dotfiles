return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "prettier" },
                html = { "prettier" },
                javascript = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                python = { { "isort", "black" } },
                scss = { "prettier" },
                sh = { "shfmt" },
                typescript = { "prettier" },
                yaml = { "prettier" },
                zsh = { "shfmt" },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>F", function()
            conform.format({ lsp_fallback = true })
        end)
    end,
}
