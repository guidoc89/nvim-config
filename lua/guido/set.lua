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

vim.o.listchars = "trail:-,nbsp:+,tab:▏ ,eol:↴"
vim.o.list = true
vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
vim.cmd([[match TrailingWhitespace /\s\+$/]])
-- Use these two autcmds together, otherwise is going to flag the whitespace as error while typing normally, override "trail" while in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.listchars.trail = nil
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
	end
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
	end
})

-- Set python host
vim.g.python3_host_prog =vim.fn.expand(  "~/.config/nvim/venv/bin/python3")

vim.cmd("set signcolumn=yes:1")
-- vim.opt.path:append { '**' } -- finding files, search down into subdirs
-- vim.opt.wildignore:append { '*/node_modules/*' }


-- Clipboard in WSL
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
