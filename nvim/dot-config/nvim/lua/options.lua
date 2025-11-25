local opt = vim.opt
-- 2 spaces instead of tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- line numbers
opt.number = true
opt.relativenumber = true

-- folding
opt.foldmethod = "expr"
opt.foldminlines = 10
opt.foldnestmax = 6
opt.foldlevelstart = 2
opt.fillchars = "fold: "
opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]

opt.showmode = false

-- whitespace character display
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- highlight on search
opt.hlsearch = true

-- ignore case except when there's capital letters
opt.ignorecase = true
opt.smartcase = true

-- window(s) appearance
opt.winblend = 10 -- floating windows slightly transparent

opt.scrolloff = 8
opt.breakindent = true
opt.cursorline = true
opt.undofile = true
-- opt.undodir = "~/.undofiles/"
opt.mouse = "a"
opt.splitbelow = true -- split windows nicerly
opt.splitright = true
opt.wrap = false -- dont wrap lines, ew
opt.ruler = false -- no cursor pos in command line
opt.signcolumn = "yes"

-- fonts
opt.guifont = "JetbrainsMono Nerd Font:h11"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.conceallevel = 1

-- LSP Behaviour

-- format function to hide virtual text on current line since .current_line = false doesn't work for whatever reason
---@param diagnostic vim.Diagnostic
local function virtual_text_format(diagnostic)
	local line = vim.fn.line(".")
	if diagnostic.lnum + 1 <= line and line <= diagnostic.end_lnum + 1 then
		return nil
	end

	return diagnostic.message
end

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		current_line = false,
		format = virtual_text_format,
	},
	virtual_lines = {
		current_line = true,
	},
})
