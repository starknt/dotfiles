require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'sumneko_lua',
		'tsserver',
		'graphql',
		'rust_analyzer',
		'tailwindcss',
		'cssls',
		'bashls',
		'jsonls',
		'volar',
		'prismals',
		'denols'
	},

	automatic_installation = true
})
