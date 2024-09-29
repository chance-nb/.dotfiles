return {
	{
		"echasnovski/mini.surround",
		opts = {
			n_lines = 500,
		},
	},

	{
		"echasnovski/mini.sessions",
		config = function()
			local sessions = require("mini.sessions")
			sessions.setup({})
			vim.keymap.set("n", "<leader>s", function()
				local name = vim.fn.input("Save session as: ")
				sessions.write(name)
			end, { desc = "save session" })
		end,
	},

	{
		"echasnovski/mini.move",
		opts = {
			mappings = {
				-- Move visual selection in Visual mode
				left = "<a-h>",
				right = "<a-l>",
				down = "<a-j>",
				up = "<a-k>",

				-- Move current line in Normal mode
				line_left = "<a-h>",
				line_right = "<a-l>",
				line_down = "<a-j>",
				line_up = "<a-k>",
			},
		},
	},

	{ "echasnovski/mini.cursorword", opts = {} },

	{
		"echasnovski/mini.indentscope",
		config = function()
			local indentscope = require("mini.indentscope")
			indentscope.setup({
				draw = {
					animation = indentscope.gen_animation.cubic({
						easing = "in",
						duration = 100,
						unit = "total",
					}),
				},
			})
		end,
	},

	{
		"echasnovski/mini.jump",
		config = function()
			require("mini.jump").setup()
			-- Link the MiniJump highlight group to the Search highlight group
			vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
		end,
	},

	{ "echasnovski/mini.animate", opts = {} },

	{ "echasnovski/mini.icons", opts = {} },

	{ "echasnovski/mini.tabline", opts = {} },

	{ "echasnovski/mini.starter", opts = {} },

	{ "echasnovski/mini.pairs", opts = {} },

	{ "echasnovski/mini.bracketed", opts = {} },
}
