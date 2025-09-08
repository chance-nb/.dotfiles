return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = "BufEnter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "bash" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			ignore_install = {},
			modules = {},
			sync_install = false,
		})
	end,
}
