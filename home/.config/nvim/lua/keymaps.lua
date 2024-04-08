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

-- Diagnostics
vim.keymap.set("", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("", "[e", vim.diagnostic.goto_prev)
vim.keymap.set("", "]e", vim.diagnostic.goto_next)

---Function for creating option toggle keymaps
---@param name string Name of the option. Can be anything and is only used when printing option status.
---@param key string Key to use for keymap. If the key is "x", the keymap will be "<leader>ox".
---@param option string Name of the option to change
---@param namespace string? Namespace in vim variable where option is found. Defaults to "o", meaning the option changed is vim.o[option] when not specified.
function set_option_toggle(name, key, option, namespace)
    namespace = namespace or "o"

    vim.keymap.set("", "<leader>o" .. key, function()
        vim[namespace][option] = not vim[namespace][option]
        if vim[namespace][option] then
            print(name .. ": On")
        else
            print(name .. ": Off")
        end
    end)
end

-- Toggle options
set_option_toggle("Relative line numbers", "r", "relativenumber")
set_option_toggle("Wrapping", "w", "wrap")
set_option_toggle("Spell checking", "s", "spell")

-- Open Lazy
vim.keymap.set("", "<leader>l", "<cmd>Lazy<CR>")
