---@diagnostic disable: assign-type-mismatch
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		local pos = "left"
		local ntree = require("neo-tree.command")
		require("neo-tree").setup({
			filesystem = {
				components = {
					harpoon_index = function(config, node, _)
						local harpoon_list = require("harpoon"):list()
						local path = node:get_id()
						---@diagnostic disable-next-line: undefined-field
						local harpoon_key = vim.uv.cwd()

						for i, item in ipairs(harpoon_list.items) do
							local value = item.value
							if string.sub(item.value, 1, 1) ~= "/" then
								value = harpoon_key .. "/" .. item.value
							end

							if value == path then
								vim.print(path)
								return {
									text = string.format(" ⥤ %d", i),
									highlight = config.highlight or "NeoTreeDirectoryIcon",
								}
							end
						end
						return {}
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name", use_git_status_colors = true },
						{ "harpoon_index" },
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
				window = {
					mappings = { -- open w/o losing focus
						["<Tab>"] = function(state)
							state.commands["open"](state)
						end,
						["<S-Tab>"] = function(state)
							state.commands["open"](state)
							ntree.execute({ action = "focus" })
						end,
						["<CR>"] = function(state)
							state.commands["open"](state)
							ntree.execute({ action = "close" })
						end,
					},
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚"
						modified = "", -- or ""
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "/",
						unstaged = "",
						staged = "+",
						conflict = "!",
					},
				},
			},
			event_handlers = {
				{
					event = require("neo-tree.events").NEO_TREE_BUFFER_ENTER,
					handler = function()
						vim.cmd("highlight! Cursor blend=100")
					end,
				},
				{
					event = require("neo-tree.events").NEO_TREE_BUFFER_LEAVE,
					handler = function()
						vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
					end,
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
