-- press gc to comment out/in
return {
	"numToStr/Comment.nvim",
	event = "InsertEnter",
	version = "*",
	opts = {
		---Add a space b/w comment and the line
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,

		toggler = {
			line = "<leader>cc",
			block = "<leader>cb",
		},

		opleader = {
			line = "<leader>cc",
			block = "<leader>cb",
		},

		extra = {
			above = "<leader>cO",
			below = "<leader>co",
			eol = "<leader>c$",
		},
		---Enable keybindings
		mappings = {
			basic = true,
			extra = true,
		},
	},
}
