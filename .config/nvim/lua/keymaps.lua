-- Hide search highlight
vim.keymap.set("n", "<leader>/", "<cmd>:nohlsearch<CR>")

-- Move to next/previous buffer
vim.keymap.set("n", "gb", "<cmd>:bnext<CR>")
vim.keymap.set("n", "gB", "<cmd>:bprevious<CR>")

-- Create new tab
vim.keymap.set("n", "<leader>T", "<cmd>:tabnew<CR>")

-- Lazy and Mason
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>:Mason<CR>")
