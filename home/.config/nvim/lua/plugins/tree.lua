return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            view = {
                float = {
                    enable = true,
                    open_win_config = { border = "single" },
                },
            },
        })
        vim.keymap.set("", "<leader>t", "<cmd>:NvimTreeFindFileToggle<CR>")
    end,
}
