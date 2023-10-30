local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.api.nvim_create_autocmd('BufWritePre', { command = [[:LspZeroFormat]] })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'pylsp', 'rust_analyzer' },
	handlers = {
		lsp_zero.default_setup,
	}
})
