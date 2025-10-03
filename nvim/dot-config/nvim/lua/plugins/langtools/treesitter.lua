return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = "BufEnter",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup()
			treesitter.install { "lua", "bash" }
			vim.api.nvim_create_autocmd('FileType', {
				pattern = treesitter.get_installed(),
				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		config = function()
			local tsto = require("nvim-treesitter-textobjects")
			tsto.setup {
				select = {
					lookahead = true,
					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'V', -- linewise
						['@class.outer'] = 'V', -- blockwise
					},
					include_surrounding_whitespace = false,
				},
			}

			local set_select_map = function(map, object)
				vim.keymap.set({ "x", "o" }, map, function()
					require("nvim-treesitter-textobjects.select").select_textobject(object, "textobjects")
				end)
			end

			set_select_map("af", "@function.outer")
			set_select_map("if", "@function.inner")
			set_select_map("ac", "@class.outer")
			set_select_map("ic", "@class.inner")
			set_select_map("aC", "@comment.outer")
			set_select_map("ar", "@assignment.rhs")

			vim.keymap.set({ "x", "o" }, "as", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
			end)

			vim.keymap.set("n", "<leader>a", function()
				require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
			end)
			vim.keymap.set("n", "<leader>A", function()
				require("nvim-treesitter-textobjects.swap").swap_next "@parameter.outer"
			end)
		end
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 6,
			multiline_threshold = 6,
			min_window_height = 10
		}
	}
}
