-- highlight when yanking
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- format on write
vim.g.autofmt = false
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "format on write",
	callback = function()
		if vim.g.autofmt then
			vim.lsp.buf.format({ async = true })
		end
	end,
})
-- convenience func to toggle autofmt
vim.api.nvim_create_user_command("AFmt", function()
	vim.g.autofmt = not vim.g.autofmt
	if vim.g.autofmt then
		vim.api.nvim_echo({ { "Autoformat toggled on" } }, true, {})
	else
		vim.api.nvim_echo({ { "Autoformat toggled off" } }, true, {})
	end
end, { desc = "Toggle auto format on write" })

-- close unused buffers
local id = vim.api.nvim_create_augroup("autoclose-buffers", {
	clear = false,
})
local persistbuffer = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	vim.fn.setbufvar(bufnr, "bufpersist", 1)
end
vim.api.nvim_create_autocmd({ "BufRead" }, {
	group = id,
	pattern = { "*" },
	callback = function()
		vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
			buffer = 0,
			once = true,
			callback = function()
				persistbuffer()
			end,
		})
	end,
})
vim.keymap.set("n", "<leader>bad", function()
	local curbufnr = vim.api.nvim_get_current_buf()
	local buflist = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buflist) do
		if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
			vim.cmd("bd " .. tostring(bufnr))
		end
	end
end, { silent = true, desc = "Close unused buffers" })
