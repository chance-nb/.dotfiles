return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local telescope = require("telescope")
		notify.setup()
		vim.notify = notify

		telescope.load_extension("notify")
		vim.keymap.set(
			"n",
			"<leader>fn",
			require("telescope").extensions.notify.notify,
			{ desc = "search notifications" }
		)
	end,
}
