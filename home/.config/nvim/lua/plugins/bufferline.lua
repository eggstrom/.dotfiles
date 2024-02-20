return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
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
