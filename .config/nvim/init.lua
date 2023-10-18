-- [[ SETTINGS ]]
vim.wo.number = true            -- Line numbers
vim.o.mouse = 'a'               -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard with OS
vim.o.undofile = true           -- Save undo history
vim.o.breakindent = true        -- Enable break indent
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'
-- Set space as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ PLUGINS ]]
-- Install Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugin', {})
