return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = function()
        local icons = require("utils").icons

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        -- theme = "catppuccin",
        -- theme = 'tokyonight',
        -- theme = 'kanagawa',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {
                    "alpha",
                },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
                {'mode'},
                },
        lualine_b = {'branch'},
        lualine_c = {
                    {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        hint = icons.diagnostics.Hint,
                        info = icons.diagnostics.Info,
                    },
                },
                    -- { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
                    {
                        -- function() return require("lspsaga.symbol.winbar").get_bar() end,

                       -- function() return require("nvim-navic").get_location() end,
                        -- cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                    },
                },
        lualine_x = {
                    -- 'encoding',
                    { "filetype", icon_only = false, separator = "", padding = { left = 0, right = 1 } },
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                    },
                },
        lualine_y = {
                    { "progress", separator = " ", padding = { left = 0, right = 1 } },
                    -- { "location", padding = { left = 0, right = 1 } },
                    --
                    {"g:colors_name"},
                },
        lualine_z = {
            function()
              return " " .. os.date("%R") .. " " .. os.date("%x")
            end,
          },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "neo-tree", "lazy" }
                }
    end
}
