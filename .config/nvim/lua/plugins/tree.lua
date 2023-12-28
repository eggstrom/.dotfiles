return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = {
                float = {
                    enable = true,
                    open_win_config = { border = "single" },
                },
            },
        })
        vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeFindFileToggle<CR>")
    end,
}
