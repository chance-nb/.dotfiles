---@diagnostic disable: undefined-field
---@diagnostic disable: undefined-global
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

			vim.lsp.enable("glsl_analyzer")

			-- Keybinds
			local map = Snacks.keymap.set

			-- stylua: ignore start
			map("n", "gd", function() Snacks.picker.lsp_definitions() end,
				{ desc = "Goto Definition", lsp = { method = "textDocument/definition" } })
			map("n", "gD", function() Snacks.picker.lsp_declarations() end,
				{ desc = "Goto Declaration", lsp = { method = "textDocument/declaration" } })
			map("n", "gr", function() Snacks.picker.lsp_references() end,
				{ nowait = true, desc = "References", lsp = { method = "textDocument/references" } })
			map("n", "gI", function() Snacks.picker.lsp_implementations() end,
				{ desc = "Goto Implementation", lsp = { method = "textDocument/implementation" } })
			map("n", "gty", function() Snacks.picker.lsp_type_definitions() end,
				{ desc = "Goto T[y]pe Definition", lsp = { method = "textDocument/typeDefinition" } })
			map("n", "gci", function() Snacks.picker.lsp_incoming_calls() end,
				{ desc = "Calls Incoming", lsp = { method = "textDocument/prepareCallHierarchy" } })
			map("n", "gco", function() Snacks.picker.lsp_outgoing_calls() end,
				{ desc = "Calls Outgoing", lsp = { method = "textDocument/prepareCallHierarchy" } })
			map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end,
				{ desc = "LSP Symbols", lsp = { method = "textDocument/documentSymbol" } })
			map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,
				{ desc = "LSP Workspace Symbols", lsp = { method = "workspace/symbol" } })
			-- stylua: ignore end

			vim.lsp.inlay_hint.enable(true)
			map("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle Inlay Hints" })
			map("n", "<leader>D", vim.diagnostic.open_float, { desc = "show [D]iagnostics at cursor" })
			map("n", "K", vim.lsp.buf.hover, { desc = "show hover information" })
			map(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				{ desc = "[r]e[n]ame", lsp = { method = "textDocument/rename" } }
			)
		end,
	},

	{
		"aznhe21/actions-preview.nvim",
		config = function()
			local ap = require("actions-preview")
			ap.setup({})
			Snacks.keymap.set({ "n", "v" }, "<leader>ca", ap.code_actions, { desc = "[c]ode [a]ction" })
		end,
	},
}
