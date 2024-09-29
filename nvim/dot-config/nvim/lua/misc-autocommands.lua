-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -- format on write
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	desc = "format on write",
-- 	callback = function()
-- 		vim.lsp.buf.format({ async = true })
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- Schedule the check to run asynchronously
		vim.schedule(function()
			local buffers = vim.api.nvim_list_bufs()
			for _, buf in ipairs(buffers) do
				local is_visible = false

				-- Check if the buffer is visible in any window
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_win_get_buf(win) == buf then
						is_visible = true
						break
					end
				end

				-- If the buffer is not visible and is empty, delete it
				if not is_visible then
					local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
					if #lines <= 1 then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end
		end)
	end,
})
