return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        "nvim-lua/plenary.nvim",
    },
    branch = "0.1.x",
    config = function()
        require("telescope").setup({
            defaults = {
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            },
        })
        require('telescope').load_extension('fzf')

        local builtin = require("telescope.builtin")
        vim.keymap.set("", "<leader>fa", builtin.builtin)        -- All
        vim.keymap.set("", "<leader>fh", builtin.help_tags)      -- Help
        vim.keymap.set("", "<leader>fb", builtin.buffers)        -- Buffers
        vim.keymap.set("", "<leader>ff", builtin.find_files)     -- Files
        vim.keymap.set("", "<leader>fg", builtin.live_grep)      -- Live grep
        vim.keymap.set("", "<leader>fd", builtin.diagnostics)    -- Diagnostics
        vim.keymap.set("", "<leader>fr", builtin.lsp_references) -- References
        vim.keymap.set("", "<leader>fj", builtin.jumplist)       -- Jump list
    end,
}
