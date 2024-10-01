return {
	"nvimtools/none-ls.nvim",
	event = "VimEnter",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
			},
			vim.keymap.set("n", "<leader>fr", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "[f]o[r]mat" }),
		})
	end,
}
