vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.laststatus= 3

vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.opt.number = true
vim.opt.ruler = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.lazyredraw = true
vim.opt.showmode = false

vim.g.mapleader = " "
vim.g.mousemoveevent =true

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.cmd('colorscheme tokyodark')
