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

			vim.keymap.set("n", "<f5>", function()
				dap.continue()
			end, { desc = "debug: continue" })

			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "debug: toggle breakpoint" })

			vim.keymap.set("n", "<leader>dlp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("log point message: "))
			end, { desc = "debug: set breakpoint with log message" })

			vim.keymap.set("n", "<f10>", function()
				dap.step_over()
			end, { desc = "debug: step over" })

			vim.keymap.set("n", "<f11>", function()
				dap.step_into()
			end, { desc = "debug: step into" })

			vim.keymap.set("n", "<f12>", function()
				dap.step_out()
			end, { desc = "debug: step out" })

			vim.keymap.set("n", "<leader>duo", function()
				dapui.open()
			end, { desc = "debug: open ui" })

			vim.keymap.set("n", "<leader>duc", function()
				dapui.close()
			end, { desc = "debug: close ui" })

			-- setup dapui hooks
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
		end,
	},
}
