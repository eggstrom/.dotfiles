return {
    { -- Comments
        "numToStr/Comment.nvim",
        opts = {
            toggler = { block = "gCC" },
            opleader = { block = "gC" },
        },
    },
    { -- Indentation guides
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { show_start = false, show_end = false },
        },
    },
    { -- Status line
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    { -- Tab line
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "tabs",
                diagnostics = "nvim_lsp",
                show_duplicate_prefix = false,
                always_show_bufferline = false,
            }
        },
    },
}
