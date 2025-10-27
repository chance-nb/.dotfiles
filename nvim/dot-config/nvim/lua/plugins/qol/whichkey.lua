return {
	"folke/which-key.nvim",
	version = "*",
	event = "VimEnter",
	config = function()
		require("which-key").setup({
			preset = "helix",
		})
	end,
}
