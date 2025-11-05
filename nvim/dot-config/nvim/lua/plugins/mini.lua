return {
	{
		"echasnovski/mini.surround",
		event = "BufRead",
		version = "*",
		opts = {
			n_lines = 500,
		},
	},

	{
		"echasnovski/mini.move",
		event = "BufRead",
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
		"echasnovski/mini.jump",
		event = "BufRead",
		version = "*",
		config = function()
			require("mini.jump").setup()
			-- Link the MiniJump highlight group to the Search highlight group
			vim.api.nvim_set_hl(0, "MiniJump", { link = "Search" })
		end,
	},

	{ "echasnovski/mini.icons", version = "*", opts = {} },

	{
		"echasnovski/mini.pairs",
		event = "BufEnter",
		version = "*",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_unbalanced = true,
			markdown = true,
		},
	},

	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-mini/mini.extra", version = "*" },
		},
		-- taken from LazyVim
		config = function()
			local ai = require("mini.ai")
			require("mini.ai").setup({
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					s = ai.gen_spec.treesitter({ a = "@assignment.rhs", i = "@assignment.rhs" }),
					-- al = ai.gen_spec.treesitter({ a = "@assignment.lhs", i = "@assignment.lhs" }),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					g = require("mini.extra").gen_ai_spec.buffer(), -- buffer
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			})
		end,
	},
}
