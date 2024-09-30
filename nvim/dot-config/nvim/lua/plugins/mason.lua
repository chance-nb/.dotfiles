---@diagnostic disable: undefined-field
-- LSP installer
return {
	{
		"williamboman/mason.nvim",
		version = "*",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		version = "*",
		config = function()
			require("mason-lspconfig").setup()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,
			})
		end,
	},
}
