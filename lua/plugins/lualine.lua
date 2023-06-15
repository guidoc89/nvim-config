return {
    'nvim-lualine/lualine.nvim',
    config = function()

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {
                    'packer',
                    'NvimTree',
                },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
                {'mode'},
                    {
                      'diff',
                      colored = true, -- Displays a colored diff status if set to true
                      diff_color = {
                        -- Same color values as the general color option can be used here.
                        added    = 'DiffAdd',    -- Changes the diff's added color
                        modified = 'DiffChange', -- Changes the diff's modified color
                        removed  = 'DiffDelete', -- Changes the diff's removed color you
                      },
                      symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
                      source = nil, -- A function that works as a data source for diff.
                                    -- It must return a table as such:
                                    --   { added = add_count, modified = modified_count, removed = removed_count }
                                    -- or nil on failure. count <= 0 won't be displayed.
                    }
                },
        -- lualine_b = {'branch', 'diff', 'diagnostics'}, -- GUIDO(ORIGINAL)
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'fugitive' }
    }
    end
}
