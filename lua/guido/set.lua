vim.cmd('autocmd!')
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = 'zsh'

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim.cmd.('set foldlevelstart')
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.o.foldlevelstart= 99

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "

vim.cmd("set signcolumn=yes:1")
-- vim.opt.path:append { '**' } -- finding files, search down into subdirs
-- vim.opt.wildignore:append { '*/node_modules/*' }
