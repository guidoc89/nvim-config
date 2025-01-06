local keymap = vim.keymap.set

keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git status (fugitive)" })
keymap("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame (fugitive)" })
keymap("n", "<leader>gr", "<cmd>Git reset<CR>", { desc = "Git reset (fugitive)" })
keymap("n", "<leader>gln", "<cmd>Gclog --name-only<CR>", { desc = "Git log name-only (fugitive)" }) -- show the logs, but with no file names, just the individual commits
keymap("n", "<leader>ga", vim.cmd.Gw, { desc = "Git add file (fugitive)" }) -- 'git add <current-bufnr>' works when in a buffer (git add it)
