return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>dB", dap.clear_breakpoints)
        vim.keymap.set("n", "<leader>dc", dap.continue)
        vim.keymap.set("n", "<leader>dr", dap.restart)
        vim.keymap.set("n", "<leader>dt", dap.terminate)

        -- Install and configure adapters
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "codelldb",
                "delve",
                "python",
            },
            handlers = {},
        })

        -- Configure DAP UI
        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
