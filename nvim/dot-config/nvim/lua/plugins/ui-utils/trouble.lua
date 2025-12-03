return {
	"folke/trouble.nvim",
	event = "VimEnter",
	version = "*",
	opts = {
		win = { position = "right" },
		open_no_results = true,
		modes = {
			symbols = {
				mode = "lsp_document_symbols",
				focus = true,
				filter = function(items)
					return vim.tbl_filter(function(item)
						if
							item.kind == "Field"
							or item.kind == "Variable"
							or item.kind == "Constant"
							or item.kind == "EnumMember"
						then
							return false
						end
						return true
					end, items)
				end,
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle win.position=bottom<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>xb",
			"<cmd>Trouble buffer diagnostics toggle win.position=bottom<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle<cr>",
			desc = "[c]ode [s]ymbols",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=true<cr>",
			desc = "[c]ode [l]sp objects",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List",
		},
	},
}
