return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        if os.getenv("TERM") ~= "linux" then
            require("colorizer").setup({
                filetypes = { "*", "!NvimTree", "!TelescopePrompt", "!TelescopeResults" },
            })

            vim.keymap.set("", "<leader>c", "<cmd>:ColorizerToggle<CR>")
        end
    end,
}
