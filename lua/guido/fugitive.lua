local keymap = vim.keymap.set

keymap('n', '<leader>gs', vim.cmd.Git)
keymap('n', '<leader>gb', ":Git blame<CR>")
keymap('n', '<leader>gr', ":Git reset<CR>")
keymap('n', '<leader>gd',vim.cmd.Gdiffsplit) 
keymap('n', '<leader>gll',vim.cmd.Gclog) -- show the logs, but with no file names
keymap('n', '<leader>gln', ":Gclog --name-only<CR>") -- show the logs, but with no file names, just the individual commits
keymap('n', '<leader>ga',vim.cmd.Gw)  -- 'git add <current-bufnr>' works when in a buffer (git add it)
