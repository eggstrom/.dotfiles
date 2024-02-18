return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
        vim.keymap.set("", "<leader>c", "<cmd>:ColorizerToggle<CR>")
    end,
}
