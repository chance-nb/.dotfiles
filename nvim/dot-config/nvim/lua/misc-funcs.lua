local function runmanim()
	-- Request document symbols from the LSP
	vim.lsp.buf_request(0, "textDocument/documentSymbol", {
		textDocument = {
			uri = vim.uri_from_bufnr(0),
		},
	}, function(err, result, _, _)
		if err then
			vim.notify("LSP error occured: " .. err.message)
			return
		end

		local current_line = vim.fn.line(".")
		local class_name = nil

		-- Function to recursively search for classes
		local function find_class(symbols)
			for _, symbol in ipairs(symbols) do
				if symbol.kind == vim.lsp.protocol.SymbolKind.Class then
					-- Check if the cursor is within the range of the class
					if symbol.range.start.line <= current_line - 1 and symbol.range["end"].line >= current_line - 1 then
						class_name = symbol.name
					end
				end
				-- If the symbol has children, search them as well
				if symbol.children then
					find_class(symbol.children)
				end
			end
		end

		find_class(result)

		if class_name then
			vim.cmd("!manim -pql " .. vim.api.nvim_buf_get_name(0) .. " " .. class_name)
			return
		end
		vim.notify("Could not find class.")
	end)
end

vim.keymap.set("n", "<leader>mr", runmanim, {
	desc = "Runs manim with the current buffer's filename and class the cursor is in. Ensure your file is in your cwd.",
})
