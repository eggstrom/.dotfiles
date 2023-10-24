require('nvim-treesitter.configs').setup{
	ensure_installed = { "bash", "lua", "rust", "vim", "vimdoc" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
