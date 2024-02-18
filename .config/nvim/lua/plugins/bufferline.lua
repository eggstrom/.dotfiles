return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                diagnostics = "nvim_lsp",
                show_duplicate_prefix = false,
                always_show_bufferline = false,
            }
        })
    end,
}
