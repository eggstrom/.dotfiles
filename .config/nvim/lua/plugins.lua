-- Set up plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Download plugins
require('lazy').setup({
    { -- Colorscheme
        'catppuccin/nvim',
        name = 'catppuccin'
    },
    { -- File tree
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { -- Telescope
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'nvim-lualine/lualine.nvim', -- Status line
    'mawkler/modicator.nvim',    -- Change line number color based on mode

    {                            -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
    },
    { -- LSP
        { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        { 'williamboman/mason.nvim',   config = true },
        'williamboman/mason-lspconfig.nvim',
    },
    'folke/neodev.nvim', -- Neodev
    {                    -- Indentation guide
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
    },
    { -- Folds
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
    },
})

-- Configure plugins
require('plugins.colorscheme')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.statusline')
require('plugins.misc')
