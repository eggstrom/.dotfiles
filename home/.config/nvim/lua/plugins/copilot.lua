return {
    "github/copilot.vim",
    dependencies = {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            config = function()
                vim.g.copilot_enabled = false
                vim.keymap.set("", "<leader>oh", function()
                    vim.g.copilot_enabled = not vim.g.copilot_enabled
                end)

                require("CopilotChat").setup()

                vim.keymap.set("", "<leader>hc", "<cmd>CopilotChatToggle<CR>")
                vim.keymap.set("", "<leader>he", "<cmd>CopilotChatExplain<CR>")
                vim.keymap.set("", "<leader>hf", "<cmd>CopilotChatFix<CR>")
                vim.keymap.set("", "<leader>ho", "<cmd>CopilotChatOptimize<CR>")
                vim.keymap.set("", "<leader>hd", "<cmd>CopilotChatDocs<CR>")
                vim.keymap.set("", "<leader>ht", "<cmd>CopilotChatTests<CR>")
                vim.keymap.set("", "<leader>hr", "<cmd>CopilotChatReset<CR>")
            end,
        },
        { "nvim-lua/plenary.nvim" },
    },
}
