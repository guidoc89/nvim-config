--  -- General nvim config
vim.opt.background = "dark"
vim.o.termguicolors = true  -- is this even necessary?
vim.wo.cursorline = true

-- Catppuccin
return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
     opts = {
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
    },
  },
    config = function()
        require("catppuccin").setup({
            transparent_background = "false",
    --         custom_highlights = function(colors)
    --     return {
    --         -- Comment = { fg = colors.flamingo },
    --         TabLineSel = { bg = colors.pink },
    --         CmpBorder = { fg = colors.surface2 },
    --         Pmenu = { bg = colors.none },
    --     }
    -- end
        })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}


-- -- Oxycarbon
-- return {
--   "sindrets/oxocarbon-lua.nvim",
--     config = function()
--         -- vim.opt.background = "dark" -- set this to dark or light
--         vim.cmd.colorscheme 'oxocarbon-lua'
--     end,
-- }


-- -- Tokyonight configuration
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--     },
--     config = function()
--         require("tokyonight").setup{
--             transparent = false,
--             style = "moon",
--             -- styles = {
--             --     sidebars = "transparent",
--             --     floats = "transparent",
--             -- },
--         }
--         vim.cmd[[colorscheme tokyonight-moon]]
--     end
-- }



-- -- Kanagawa
-- return {
--     "rebelot/kanagawa.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--     },
--     config = function ()
--         require("kanagawa").setup{
--               compile = false,             -- enable compiling the colorscheme
--               undercurl = true,            -- enable undercurls
--               commentStyle = { italic = true },
--               functionStyle = {},
--               keywordStyle = { italic = true},
--               statementStyle = { bold = true },
--               typeStyle = {},
--               transparent = false,         -- do not set background color
--               dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--               terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--               colors = {                   -- add/modify theme and palette colors
--                   palette = {},
--                   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--               },
--               overrides = function(colors) -- add/modify highlights
--                   return {}
--               end,
--               theme = "wave",              -- Load "wave" theme when 'background' option is not set
--               background = {               -- map the value of 'background' option to a theme
--                   dark = "wave",           -- try "dragon" !
--                   light = "lotus"
--               },
--             }
--         vim.cmd("colorscheme kanagawa")
--     end
-- }
