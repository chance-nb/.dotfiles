-- theme

-- return {
-- 	"catppuccin/nvim",
-- 	version = "*",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		local catppuccin = require("catppuccin")
--
-- 		catppuccin.setup({
-- 			flavour = "mocha",
-- 			integrations = {
-- 				fidget = true,
-- 				notify = true,
-- 				mason = true,
-- 				mini = { enabled = true },
-- 				copilot_vim = true,
-- 				lsp_trouble = true,
-- 				which_key = true,
-- 				native_lsp = {
-- 					enabled = true,
-- 					virtual_text = {
-- 						errors = { "italic" },
-- 						hints = { "italic" },
-- 						warnings = { "italic" },
-- 						information = { "italic" },
-- 						ok = { "italic" },
-- 					},
-- 					underlines = {
-- 						errors = { "underline" },
-- 						hints = { "underline" },
-- 						warnings = { "underline" },
-- 						information = { "underline" },
-- 						ok = { "underline" },
-- 					},
-- 					inlay_hints = {
-- 						background = true,
-- 					},
-- 				},
-- 			},
-- 			color_overrides = {
-- 				mocha = {
-- 					text = "#F4CDE9",
-- 					subtext1 = "#DEBAD4",
-- 					subtext0 = "#C8A6BE",
-- 					overlay2 = "#B293A8",
-- 					overlay1 = "#9C7F92",
-- 					overlay0 = "#866C7D",
-- 					surface2 = "#705867",
-- 					surface1 = "#5A4551",
-- 					surface0 = "#44313B",
--
-- 					base = "#352939",
-- 					mantle = "#211924",
-- 					crust = "#1a1016",
-- 				},
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = true, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
