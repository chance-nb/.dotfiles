-- fancy status bar
return {
	"nvim-lualine/lualine.nvim",
	version = "*",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
		})
	end,
}
