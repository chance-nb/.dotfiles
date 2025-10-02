return {
	{
		"echasnovski/mini.surround",
		event = "BufEnter",
		version = "*",
		opts = {
			n_lines = 500,
		},
	},

	{
		"echasnovski/mini.sessions",
		event = "BufEnter",
		version = "*",
		config = function()
			local sessions = require("mini.sessions")
			sessions.setup({})
			vim.keymap.set("n", "<leader>sw", function()
				local name = vim.fn.input("Save session as: ")
				sessions.write(name)
			end, { desc = "save session" })
			vim.keymap.set("n", "<leader>sl", function()
				sessions.select("read")
			end, { desc = "select session to load" })
			vim.keymap.set("n", "<leader>sd", function()
				sessions.select("delete")
			end, { desc = "delete session" })
		end,
	},

	{
		"echasnovski/mini.move",
		event = "BufEnter",
		version = "*",
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

	{
		"echasnovski/mini.cursorword",
		event = "BufEnter",
		opts = {},
		version = "*",
	},

	{
		"echasnovski/mini.indentscope",
		event = "BufEnter",
		version = "*",
		config = function()
			local indentscope = require("mini.indentscope")
			indentscope.setup({
				draw = {
					animation = indentscope.gen_animation.cubic({
						easing = "in",
						duration = 80,
						unit = "total",
					}),
				},
			})
		end,
	},

	{
		"echasnovski/mini.jump",
		event = "BufEnter",
		version = "*",
		config = function()
			require("mini.jump").setup()
			-- Link the MiniJump highlight group to the Search highlight group
			vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
		end,
	},

	{
		"echasnovski/mini.animate",
		version = "*",
		opts = {
			resize = { enable = false },
			scroll = { enable = false }
		},
	},

	{ "echasnovski/mini.icons", version = "*", opts = {} },

	{ "echasnovski/mini.starter", version = "*", opts = {} },

	{ "echasnovski/mini.pairs", event = "BufEnter", version = "*", opts = {} },
}
