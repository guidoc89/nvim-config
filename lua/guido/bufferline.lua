local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- buffer_selected: fg: linea inferior en la seleccion, y las letras, sin simbolo
--                  bg: el rectangulo chico de seleccion (amarillo)
-- separator_selected: bg: las aletas
--                    fg: lo que queda que no son las aletas

bufferline.setup({
    options = {
        mode = "tabs",
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        -- offsets = {
            -- filetype = 'NvimTree'
        -- }
    },
    highlights = {
        indicator_selected = {
            fg = { attribute = 'fg', highlight = 'Function' },
            italic = false
        },
        separator = {
            fg = '#073642',
            bg = '#002b36',

            -- fg = '#133657',
            -- bg = '#b58900',
            -- bg = '#b58900',
            --
            -- fg = '#194065',
            -- bg = '#194065',
        },
        separator_selected = {
            fg = '#073642',
            --
            --
            --
            -- bg = '#e61010',
            --
            -- fg = '#194065',
            -- bg = '#b58900'
        },
        background = {
            bg = '#002b36',
            fg = '#657b83',


            -- fg = '#ffffff',
            -- fg = '#b58900',
            -- bg = '#194065',
        },
        buffer_selected = {  -- done!
            fg = '#fdf6e3',
            --
            --
            -- bg = '#b58900',
            -- bg = '#f3b229',
            -- fg = '#ffffff',
            underline = true,
            bold = true,
            undercurl = true,
            italic = true,

        },
        fill = {
            bg = '#073642'
            --
            -- bg = '#b58900'
            -- bg = '#194065'
            -- fg = '#133657', -- little darker
            -- bg = '#133657'  -- little darker
        }
    },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
