require('gitsigns').setup {}

local keymap = vim.keymap.set

keymap('n', '<leader>gc', ':Gitsigns blame_line<CR>')
