return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({ preview_config = { border = "none" } })

        vim.keymap.set("", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
        vim.keymap.set("", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>")
        vim.keymap.set("", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>")
        vim.keymap.set("", "<leader>gb", "<cmd>Gitsigns blame_line<CR>")
        vim.keymap.set("", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
        vim.keymap.set("", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
        vim.keymap.set("", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
        vim.keymap.set("", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
        vim.keymap.set("", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>")
        vim.keymap.set("", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    end,
}
