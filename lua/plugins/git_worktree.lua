return {
    "ThePrimeagen/git-worktree.nvim",
    config = function ()
        require("git-worktree").setup{
            update_on_change_command = "Neotree",
        }
    end,
    keys = {
    { "<leader>wt", "<CMD> lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", desc = "Show git worktrees" },
    { "<leader>wT", "<CMD> lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", desc = "Create git worktree" },
    }
}
