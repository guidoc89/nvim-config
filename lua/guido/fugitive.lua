local keymap = vim.keymap.set

keymap('n', '<leader>gs', vim.cmd.Git)
keymap('n', '<leader>gb', ":Git blame<CR>")
keymap('n', '<leader>gr', ":Git reset<CR>")
keymap('n', '<leader>gd',vim.cmd.Gdiffsplit)
keymap('n', '<leader>gl',vim.cmd.Gclog)
keymap('n', '<leader>ga',vim.cmd.Gw)
