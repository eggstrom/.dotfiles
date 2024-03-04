return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = { block = "gCC" },
            opleader = { block = "gC" },
        })
    end,
}
