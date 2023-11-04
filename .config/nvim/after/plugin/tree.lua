require('nvim-tree').setup()

vim.keymap.set('n', '<leader>t', require('nvim-tree.api').tree.open)
