return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fr",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "[f]o[r]mat buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				python = { "black" },
				sh = { "beautysh" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters = {},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
		opts = {},
	},
}
