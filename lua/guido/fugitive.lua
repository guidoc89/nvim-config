local keymap = vim.keymap.set

keymap("n", "<leader>gr", "<cmd>Git reset<CR>", { desc = "Git reset (fugitive)" })
keymap("n", "<leader>ga", vim.cmd.Gw, { desc = "Git add file (fugitive)" }) -- 'git add <current-bufnr>' works when in a buffer (git add it)
