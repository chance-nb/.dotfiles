return {
	"smoka7/hop.nvim",
	version = "*",
	config = function()
		local hop = require("hop")
		hop.setup({
			keys = "etovxqpdygfblzhckisuran",
		})
		vim.keymap.set("", "H", function()
			---@diagnostic disable: missing-parameter
			hop.hint_words()
		end)
	end,
}
