vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"
vim.opt.cursorline = true

require('tokyonight').setup({
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    },
    on_highlights = function(hl, colors)
        -- hl.LineNr = {
        --     -- fg = "#004060"
        --     fg = "#364a82"
        -- }
         hl.CursorLineNr = {
             -- fg =   "#008099"
             -- fg = "#b58900"

             fg =   "#7dcfff"
             -- fg =   "#565f89"
        }
--
--         hl.Cursor = {
--             fg = "#ffffff",
--             bg =  "#ffffff"
--         }
-- --
        hl.CursorLine = {
--             -- fg = "#00264b",
            -- bg = "#194065"
            -- bg = "#b58900"
            bg = "#223d57"
            -- bg =   "#364a82"
        }
    end
})


vim.cmd("colorscheme tokyonight")
