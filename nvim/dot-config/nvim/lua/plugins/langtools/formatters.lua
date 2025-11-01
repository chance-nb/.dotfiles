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

		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				python = { "black" },
				sh = { "beautysh" },
				rust = { "rustfmt" },
				tex = { "tex-fmt" },
				lua = { "stylua", lsp_format = "never" },
			},
			default_format_opts = {
				lsp_format = "fallback",
				stop_after_first = true,
			},
			formatters = {},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
		opts = {},
	},
}
