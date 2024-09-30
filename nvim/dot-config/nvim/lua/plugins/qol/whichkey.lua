return {
	"folke/which-key.nvim",
	version = "*",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function()
		require("which-key").setup()
	end,
}
