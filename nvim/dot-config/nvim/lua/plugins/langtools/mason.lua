---@diagnostic disable: undefined-field
return {
	{
		"williamboman/mason.nvim",
		version = "*",
		config = function()
			require("mason").setup()
		end,
	},
	{ -- LSPs
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		version = "*",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			local servers = require("mason-lspconfig").get_installed_servers()
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- for completion
			local lspconfig = require("lspconfig")

			-- go through all the installed mason packages, set up all the ones that are servers
			for server_name, package in pairs(servers) do
				if package.type == "server" then
					local server_config = lspconfig[server_name]
					if server_config then
						server_config.setup({
							capabilities = capabilities,
						})
					end
				end
			end
		end,
	},
	{ -- Formatters
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "black", "prettier", "stylua", "beautysh" },
				automatic_installation = false,
				handlers = {},
			})
			require("null-ls").setup({})
			vim.keymap.set("n", "<leader>fr", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "[f]o[r]mat" })
		end,
	},
}
