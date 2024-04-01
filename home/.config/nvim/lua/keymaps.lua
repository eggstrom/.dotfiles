-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank/paste to clipboard
vim.keymap.set("", "<leader>y", "\"+y")
vim.keymap.set("", "<leader>p", "\"+p")

-- Hide search highlight
vim.keymap.set("", "<leader>/", "<cmd>nohlsearch<CR>")

-- Move to next/previous buffer
vim.keymap.set({ "n", "v" }, "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set({ "n", "v" }, "<S-Tab>", "<cmd>bprevious<CR>")

-- Toggle options
vim.keymap.set("", "<leader>or", "<cmd>set relativenumber!<CR>") -- Relative line numbers
vim.keymap.set("", "<leader>ow", "<cmd>set wrap!<CR>")           -- Wrapping
vim.keymap.set("", "<leader>os", "<cmd>set spell!<CR>")          -- Spell checking

-- Open Lazy
vim.keymap.set("", "<leader>l", "<cmd>Lazy<CR>")
