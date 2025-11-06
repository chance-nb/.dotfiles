-- INFO: install zathura and zathura_pdf-mupdf to view files
return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function(ev)
				local minipairs = require("mini.pairs")
				minipairs.map_buf(ev.buf, "i", "$", {
					action = "closeopen",
					pair = "$$",
				})
				vim.keymap.set({ "o", "x" }, "am", "<Plug>vimtex-a$", { buffer = true })
				vim.keymap.set({ "o", "x" }, "im", "<Plug>vimtex-i$", { buffer = true })
				vim.keymap.set({ "o", "x" }, "ii", "<Plug>vimtex-im", { buffer = true })
				vim.keymap.set({ "o", "x" }, "ai", "<Plug>vimtex-am", { buffer = true })
			end,
		})
	end,
	keys = {
		{ "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
	},
}
