return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = "BufEnter",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup()
			treesitter.install({ "lua", "bash" })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = treesitter.get_installed(),
				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	-- mini.ai doesn't work when this is gone for some reason
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufRead",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufRead",
		opts = {
			max_lines = 6,
			multiline_threshold = 6,
			min_window_height = 10,
		},
	},
}
