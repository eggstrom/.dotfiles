-- Tree
vim.keymap.set('n', '<leader>t', require('nvim-tree.api').tree.open)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.builtin, {})    -- All
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})  -- Help
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- Buffers
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- Grep
