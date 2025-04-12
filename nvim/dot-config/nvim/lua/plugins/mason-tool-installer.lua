return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	version = "*",
	opts = {
		ensure_installed = {
			"lua_ls",
			"stylua",
			"pyright",
			"black",
			"bashls",
			"beautysh",
			"prettier",
		}, -- don't forget to add linters, formatters, etc to lsp/none-ls.lua as well
	},
}
