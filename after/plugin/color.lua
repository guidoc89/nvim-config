vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"
vim.opt.cursorline = false

require('tokyonight').setup({
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    },
    on_highlights = function(hl, colors)
        hl.CursorLineNr = {
            fg = '#7dcfff'
        }
        hl.CursorLine = {
            bg = '#223d57'
        }
    end

})

vim.cmd("colorscheme tokyonight")
