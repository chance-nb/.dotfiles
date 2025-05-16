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
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
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
opt.mouse = "a"
opt.splitbelow = true -- split windows nicerly
opt.splitright = true
opt.wrap = false -- dont wrap lines, ew
opt.ruler = false -- no cursor pos in command line
opt.signcolumn = "yes"
