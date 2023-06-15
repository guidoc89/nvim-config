--  -- General nvim config
vim.opt.background = "dark"
vim.opt.cursorline = true

-- -- Tokyonight config
-- vim.g.tokyonight_transparent_sidebar = false
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- require('tokyonight').setup({
--     transparent = true,
--     styles = {
--         sidebars = 'transparent',
--         floats = 'transparent',
--     },
--     on_highlights = function(hl, colors)
--         hl.CursorLineNr = {
--             fg = '#7dcfff'
--         }
--         hl.CursorLine = {
--             bg = '#223d57'
--         }
--     end
-- })
-- vim.cmd("colorscheme tokyonight")

-- Kanagawa config:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {
            ui = {
                bg_gutter = 'none',
            },
        } },
    },
overrides = function(colors)
    local theme = colors.theme
    return {
        -- String = { fg = colors.palette.springGreen, italic = false },
        -- DiffAdd = { fg = colors.palette.springGreen, bg = colors.palette.sumiInk1 } ,
        DiffChange = { bg = colors.palette.waveBlue1 },
        DiffAdd = { fg = colors.palette.springGreen },
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default: set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd("colorscheme kanagawa")
