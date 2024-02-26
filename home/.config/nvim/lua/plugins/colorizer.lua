return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            filetypes = { "*", "!NvimTree", "!TelescopePrompt", "!TelescopeResults" },
        })

        vim.keymap.set("", "<leader>c", "<cmd>:ColorizerToggle<CR>")
    end,
}
