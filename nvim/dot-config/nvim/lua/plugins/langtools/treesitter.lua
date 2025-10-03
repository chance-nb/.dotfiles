return {
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
}
