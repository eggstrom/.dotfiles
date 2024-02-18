-- Yank/paste to clipboard
vim.keymap.set("", "<leader>y", "\"+yy")
vim.keymap.set("", "<leader>p", "\"+p")

-- Hide search highlight
vim.keymap.set("", "<leader>/", "<cmd>:nohlsearch<CR>")

-- Move to next/previous buffer
vim.keymap.set("", "gb", "<cmd>:bnext<CR>")
vim.keymap.set("", "gB", "<cmd>:bprevious<CR>")

-- Create new tab
vim.keymap.set("", "<leader>T", "<cmd>:tabnew<CR>")

-- Open Lazy
vim.keymap.set("", "<leader>l", "<cmd>:Lazy<CR>")
