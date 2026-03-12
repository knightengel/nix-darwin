vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true

opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.undofile = true
opt.cursorline = true
opt.laststatus = 3
opt.pumheight = 10
opt.showmode = false

opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "",
	foldclose = "",
}

opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
