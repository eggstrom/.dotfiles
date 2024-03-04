return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({ preview_config = { border = "none" }, })

        vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>")
        vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>")
        vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
        vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>")
    end,
}
