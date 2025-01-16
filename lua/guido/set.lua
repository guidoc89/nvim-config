vim.cmd("autocmd!")
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = "zsh"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.o.foldlevelstart = 99

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "


vim.api.nvim_create_autocmd("User", {
    pattern = "SnacksDashboardClosed",
    callback = function()
        vim.o.listchars = "trail:-,nbsp:+,tab:▏ ,eol:↴"
        vim.o.list = true
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
        vim.cmd([[match TrailingWhitespace /\s\+$/]])

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
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "SnacksDashboardOpened",
    callback = function()
        vim.opt.listchars.trail = nil
        vim.o.listchars = nil
        vim.o.list = false
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
        vim.cmd([[match none]])
    end,
})
-- Set python host
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python3")

vim.cmd("set signcolumn=yes:1")

-- Clipboard in WSL
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
