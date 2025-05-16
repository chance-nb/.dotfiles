local map = vim.keymap.set

-- leader key
vim.g.mapleader = " "
vim.g.maplocaleader = " "

-- yanḱy stuff
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gP", '"+P', { desc = "Paste from system clipboard" })
map("n", "yp", '"0p', { desc = "Put from first yank buffer" })

map("n", "se", "mZ$a;<Esc>`Z", { desc = "Add semicolon at end of line" })

-- clear search higlight on esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- make window switching less annoying
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- rebind horizontal split to h
map("n", "<C-w>h", "<C-w>s", { desc = "Split horizontally" })

-- Set terminal mode mapping for Escape key
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- ctrl+s to save, ctrl+q to quit
map("n", "<C-s>", "<cmd>wa<CR>")
map("n", "<C-q>", "<cmd>qa<CR>")
