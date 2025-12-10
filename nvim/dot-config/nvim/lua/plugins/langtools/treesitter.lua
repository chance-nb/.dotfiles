local function array_sub(t2, t1)
	local t = {}
	for i = 1, #t1 do
		t[t1[i]] = true
	end
	for i = #t2, 1, -1 do
		if t[t2[i]] then
			table.remove(t2, i)
		end
	end
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup()
			treesitter.install({ "lua", "bash", "diff", "regex" }, { summary = true })

			local function enable_treesitter(buf)
				vim.treesitter.start(buf)
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end

			-- automatically enable treesitter for installed languages
			vim.api.nvim_create_autocmd("FileType", {
				pattern = treesitter.get_installed(),
				callback = function(args)
					enable_treesitter(args.buf)
				end,
			})

			-- automatically install missing treesitter parsers
			local not_installed_langs = treesitter.get_available()
			array_sub(not_installed_langs, treesitter.get_installed())
			vim.api.nvim_create_autocmd("FileType", {
				pattern = not_installed_langs,
				callback = function(args)
					vim.notify("Missing Treesitter parser detected")
					local ft = vim.filetype.match({ buf = args.buf })
					vim.schedule(function()
						treesitter.install({ ft }):wait(300000)
						enable_treesitter(args.buf)
					end)
				end,
			})
		end,
	},

	-- mini.ai doesn't work when this is gone for some reason
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufEnter",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufEnter",
		opts = {
			max_lines = 6,
			multiline_threshold = 6,
			min_window_height = 10,
		},
	},
}
