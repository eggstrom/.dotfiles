-- General options
vim.o.mouse = 'a'                     -- Enable mouse in all modes
vim.o.clipboard = 'unnamedplus'       -- Sync clipboard with OS
vim.o.undofile = true                 -- Save undo history
vim.o.cursorline = true               -- Highlight current line
vim.o.number = true                   -- Enable line numbers
vim.o.relativenumber = true           -- Enable relative line numbers
vim.o.wrap = false                    -- Disable wrapping
vim.o.signcolumn = 'yes'              -- Always show sign column
vim.o.ignorecase = true               -- Disable case-sensitive searching
vim.o.smartcase = true                -- Enable case-sensitive searching when using caps
vim.o.completeopt = 'menuone,preview' -- Show completion menu even if there's only 1 match

-- Tab character
vim.o.expandtab = true -- Replace tab with spaces
vim.o.softtabstop = 4  -- Number of spaces in tab
vim.o.tabstop = 4      -- Width of tab
vim.o.shiftwidth = 4   -- Width of an indentation level

-- Folds (TODO: Enable fold column when PR #17446 gets merged)
vim.o.foldlevel = 99   -- Keep folds open by default
vim.o.foldcolumn = '0' -- Width of fold column
vim.opt.fillchars = {  -- Characters in fold column
    foldopen  = '',
    foldclose = '',
    foldsep   = ' ',
}

-- Enable borders on windows
vim.diagnostic.config({ float = { border = 'single' } })
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = 'single' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = 'single' }
)

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
