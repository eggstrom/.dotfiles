return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            require('ibl').setup({
                scope = { enabled = false, },
            })
        end,
    },
    {
        'mawkler/modicator.nvim',
        config = function()
            require('modicator').setup()
        end,
    },
}
