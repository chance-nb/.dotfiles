return {
	{
		"mfussenegger/nvim-dap",
		event = "VimEnter",
		version = "*",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", version = "*" },
			{ "nvim-neotest/nvim-nio", version = "*" },
			{ "leoluz/nvim-dap-go", version = "*" },
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			require("dap-go").setup()

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "Debug: continue" })

			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Debug: toggle breakpoint" })

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- vim.keymap.set("n", "<F10>", function()
			-- 	dap.step_over()
			-- end, { desc = "Debug: step over" })
			--
			-- vim.keymap.set("n", "<F11>", function()
			-- 	dap.step_into()
			-- end, { desc = "Debug: step into" })
			--
			-- vim.keymap.set("n", "<F12>", function()
			-- 	dap.step_out()
			-- end, { desc = "Debug: step out" })

			-- vim.keymap.set("n", "<Leader>dB", function()
			-- 	dap.set_breakpoint()
			-- end, { desc = "Debug: set breakpoint" })
			--
			-- vim.keymap.set("n", "<Leader>dlp", function()
			-- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			-- end, { desc = "Debug: set breakpoint with log message" })
			--
			-- vim.keymap.set("n", "<Leader>dr", function()
			-- 	dap.repl.open()
			-- end, { desc = "Debug: repl.open" })
			--
			-- vim.keymap.set("n", "<Leader>dl", function()
			-- 	dap.run_last()
			-- end, { desc = "Debug: run last" })
			--
			-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			-- 	widgets.hover()
			-- end, { desc = "Debug: hover" })
			--
			-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			-- 	widgets.preview()
			-- end, { desc = "Debug: preview" })
			--
			-- vim.keymap.set("n", "<Leader>df", function()
			-- 	widgets.centered_float(widgets.frames)
			-- end, { desc = "Debug: show frames" })
			--
			-- vim.keymap.set("n", "<Leader>ds", function()
			-- 	widgets.centered_float(widgets.scopes)
			-- end, { desc = "Debug: show scopes" })
		end,
	},
}
