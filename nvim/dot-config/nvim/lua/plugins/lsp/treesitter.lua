-- AST builder
return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "bash", "hyprlang" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
