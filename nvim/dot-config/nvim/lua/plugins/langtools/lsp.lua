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

			vim.lsp.enable("glsl_analyzer")

			-- Keybinds
			local map = vim.keymap.set

			-- stylua: ignore start
			map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
			map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
			map("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
			map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
			map("n", "gty", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
			map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
			map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
			map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
			map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
			-- stylua: ignore end

			map("n", "<leader>gT", vim.lsp.buf.typehierarchy, { desc = "show [T]ype hierarchy" })
			map("n", "<leader>D", vim.diagnostic.open_float, { desc = "show [D]iagnostics at cursor" })
			map("n", "K", vim.lsp.buf.hover, { desc = "show hover information" })
			map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
		end,
	},
}
