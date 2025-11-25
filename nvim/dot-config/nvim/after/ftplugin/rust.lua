vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust" },
	callback = function(event)
		local map = vim.keymap.set
		-- overrides for rustaceanvim-specific actions
		map("n", "K", "", { buffer = event.buf, silent = true })
		map("n", "K", function()
			vim.cmd.RustLsp({ "hover", "actions" })
		end, { silent = true, buffer = event.buf })

		map("n", "<leader>rt", function()
			vim.cmd.RustLsp({ "testables" })
		end, { desc = "run [r]ust [t]estables" })

		map("n", "<leader>rr", function()
			vim.cmd.RustLsp({ "runnables" })
		end, { desc = "run rust runnables" })

		map("n", "<leader>rd", function()
			vim.cmd.RustLsp({ "relatedDiagnostics" })
		end, { desc = "jump to related diagnostic(s)" })

		map("n", "<leader>rc", function()
			vim.cmd.RustLsp({ "openCargo" })
		end, { desc = "open Cargo.toml" })

		map("n", "<leader>rk", function()
			vim.cmd.RustLsp({ "moveItem", "up" })
		end, { desc = "move item up" })
		map("n", "<leader>rj", function()
			vim.cmd.RustLsp({ "moveItem", "down" })
		end, { desc = "move item down" })

		map("n", "<leader>re", function()
			vim.cmd.RustLsp({ "explainError", "current" })
		end, { desc = "explain error on current line" })

		map("n", "<leader>D", "")
		map("n", "<leader>D", function()
			vim.cmd.RustLsp({ "renderDiagnostic", "current" })
		end, { desc = "show Diagnostics on current line" })

		map("n", "<leader>rD", function()
			vim.cmd.RustLsp({ "openDocs" })
		end, { desc = "open docs.rs for Symbol under cursor" })

		map("n", "<leader>sr", function()
			vim.cmd.RustLsp({ "ssr" })
		end, { desc = "structural search and replace" })

		vim.api.nvim_create_user_command("Bacon", function()
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_open_win(buf, false, { win = -1, split = "right", width = math.floor(vim.go.columns / 3) })
			vim.api.nvim_buf_call(buf, function()
				vim.cmd("terminal bacon")
				vim.cmd("set filetype=bacon")
				vim.cmd("set nobuflisted")
			end)
		end, { desc = "Open Bacon" })

		map("n", "<leader>rb", "<Cmd>Bacon<CR>", { desc = "Open Bacon" })
	end,
})
