local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader before plugins are required (stated by lazyvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
