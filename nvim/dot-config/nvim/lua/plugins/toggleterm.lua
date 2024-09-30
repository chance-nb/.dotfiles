return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = "<C-t>",
		autochdir = true,

		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
}
