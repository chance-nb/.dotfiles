-- filesystem
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local pos = "left"
		local ntree = require("neo-tree.command")
		require("neo-tree").setup({
			window = {
				mappings = { -- open w/o losing focus
					["<Tab>"] = function(state)
						state.commands["open"](state)
						ntree.execute({ action = "focus" })
					end,
					["<CR>"] = function(state)
						state.commands["open"](state)
						ntree.execute({ action = "close" })
					end,
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "/",
						unstaged = "",
						staged = "+",
						conflict = "",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ee", function()
			ntree.execute({
				action = "focus",
				source = "filesystem",
				position = pos,
				reveal = true,
			})
		end, { desc = "Open filesystem" })

		vim.keymap.set("n", "<leader>eb", function()
			ntree.execute({
				action = "focus",
				source = "buffers",
				position = pos,
				reveal = true,
			})
		end, { desc = "Open buffers" })

		vim.keymap.set("n", "<leader>eg", function()
			ntree.execute({
				action = "focus",
				source = "git_status",
				position = pos,
				reveal = true,
			})
		end, { desc = "Open git status" })
	end,
}
