-- highlights certain strings in comments
return {
	"folke/todo-comments.nvim",
	event = "BufRead",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
}
