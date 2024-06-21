return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        if os.getenv("TERM") ~= "linux" then
            require("catppuccin").setup()

            vim.cmd.colorscheme("catppuccin-mocha")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        end
    end,
}
