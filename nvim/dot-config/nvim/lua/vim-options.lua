local map = vim.keymap.set
local opt = vim.opt
-- 2 spaces instead of tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- leader key
vim.g.mapleader = " "
vim.g.maplocaleader = " "

map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map("x", "gP", '"+P', { desc = "Paste from system clipboard" })

map("n", "yp", '"0p', { desc = "Put from first yank buffer" })

map("n", "se", "mZ$a;<Esc>`Z", { desc = "Add semicolon at end of line" })

-- line numbers
opt.number = true
opt.relativenumber = true

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldminlines = 10
opt.foldnestmax = 6
opt.foldlevelstart = 2
opt.fillchars = "fold: "
opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]

-- dont show mode (is in status line)
opt.showmode = false

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ignore case except when there's capital letters
opt.ignorecase = true
opt.smartcase = true

-- make window switching less annoying
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- window(s) appearance
opt.winblend = 10 -- floating windows slightly transparent

-- misc
opt.scrolloff = 8
opt.breakindent = true
opt.cursorline = true
opt.undofile = true
opt.mouse = "a"
opt.splitbelow = true -- split windows nicerly
opt.splitright = true
opt.wrap = false -- dont wrap lines, wtf
opt.ruler = false -- don't show cursor pos in command line
-- opt.cmdheight = 0
opt.signcolumn = "yes"

-- Set terminal mode mapping for Escape key
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- ctrl+s to save
map("n", "<C-s>", "<cmd>wa<CR>")
-- ctrl+q to quit
map("n", "<C-q>", "<cmd>qa<CR>")
