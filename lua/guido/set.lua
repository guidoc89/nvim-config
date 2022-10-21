vim.cmd('autocmd!')
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = 'fish'


vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "

vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' } -- TODO: what does this do?

-- Turn off paste mode when leaving insert
--vim.api.nvim_create_auocmd("InsertLeave", {
--    pattern = '*',
--    command = 'set nopaste'
--})
