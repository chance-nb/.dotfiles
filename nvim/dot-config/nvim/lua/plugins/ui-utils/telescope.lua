return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					selection_strategy = "closest",
					path_display = { "smart" },
					mappings = {
						i = {
							["<tab>"] = "move_selection_worse",
							["<s-tab>"] = "move_selection_better",
						},
						n = {
							["<space>"] = "toggle_selection",
						},
					},
				},
			})
			telescope.load_extension("ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "search files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "search buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "search help tags" })
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		version = "*",
	},
}
