local telescope = require("telescope.builtin")
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "add LSP keybinds on LSP attach",
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),

	callback = function(ev)
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[g]oto [D]eclaration" })
		vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, { buffer = ev.buf, desc = "[g]oto [d]efinition" })
		vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, { buffer = ev.buf, desc = "[g]oto [i]mplementation" })
		vim.keymap.set("n", "<leader>gr", telescope.lsp_references, { buffer = ev.buf, desc = "[g]oto [r]eferences" })
		vim.keymap.set("n", "<leader>gt", telescope.lsp_type_definitions, { buffer = ev.buf, desc = "[g]oto [t]ype definition" })
		vim.keymap.set("n", "<leader>gT", vim.lsp.buf.typehierarchy, { buffer = ev.buf, desc = "show [T]ype hierarchy" })
		vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { buffer = ev.buf, desc = "show [D]iagnostics at cursor" })
		vim.keymap.set({"n", "c"}, "<leader>fs", telescope.lsp_document_symbols, { buffer = ev.buf, desc = "[f]ind [s]ymbols in document" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "show hover information" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[r]e[n]ame" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[c]ode [a]ction" })
	end,
})
