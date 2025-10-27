return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("bufferline").setup({ auto_hide = 1, insert_at_end = true, maximum_padding = 0 })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferPick<cr>", { desc = "Pick buffer" })
		vim.keymap.set("n", "<leader>bd", "<cmd>BufferClose<cr>", { desc = "Pick buffer" })
		vim.keymap.set("n", "<C-S-w>", "<cmd>BufferClose<cr>", { desc = "Pick buffer" })
		vim.keymap.set("n", "<C-A-l>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<C-A-h>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<C-A-k>", "<cmd>BufferMoveNext<CR>", { desc = "Move Buffer next" })
		vim.keymap.set("n", "<C-A-j>", "<cmd>BufferMovePrevious<CR>", { desc = "Move Buffer previous" })
	end,
	version = "^1.0.0",
}
