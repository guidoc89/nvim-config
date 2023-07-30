require('gitsigns').setup {}

local keymap = vim.keymap.set

keymap('n', '<leader>ghc', ':Gitsigns blame_line<CR>')
keymap('n', ']g', ':Gitsigns next_hunk<CR>')
keymap('n', '[g', ':Gitsigns prev_hunk<CR>')
keymap('n', '<leader>ghd', ':Gitsigns diffthis<CR>')
keymap('n', '<leader>ghp', ':Gitsigns preview_hunk<CR>')
keymap('n', '<leader>ghi', ':Gitsigns preview_hunk_inline<CR>')
keymap('n', '<leader>gha', ':Gitsigns stage_hunk<CR>')
keymap('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>')
keymap('n', '<leader>ghu', ':Gitsigns undo_stage_hunk<CR>')
