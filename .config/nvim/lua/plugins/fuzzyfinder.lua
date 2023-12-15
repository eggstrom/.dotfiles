return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fa', builtin.builtin)        -- All
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)      -- Help
        vim.keymap.set('n', '<leader>fb', builtin.buffers)        -- Buffers
        vim.keymap.set('n', '<leader>ff', builtin.find_files)     -- Files
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)      -- File grep
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics)    -- Diagnostics
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references) -- References
    end,
}
