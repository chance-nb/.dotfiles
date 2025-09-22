---@diagnostic disable: undefined-field
return {
	{
		"williamboman/mason.nvim",
		version = "*",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		version = "*",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			-- Keybinds
			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[g]oto [D]eclaration" })
			vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, { desc = "[g]oto [d]efinition" })
			vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations,
				{ desc = "[g]oto [i]mplementation" })
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, { desc = "[g]oto [r]eferences" })
			vim.keymap.set("n", "<leader>gt", telescope.lsp_type_definitions,
				{ desc = "[g]oto [t]ype definition" })
			vim.keymap.set("n", "<leader>gT", vim.lsp.buf.typehierarchy,
				{ desc = "show [T]ype hierarchy" })
			vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float,
				{ desc = "show [D]iagnostics at cursor" })
			vim.keymap.set({ "n", "c" }, "<leader>fs", telescope.lsp_document_symbols,
				{ desc = "[f]ind [s]ymbols in document" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show hover information" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
				{ desc = "[c]ode [a]ction" })
		end,
	},
}
