return {
    "sindrets/diffview.nvim",
    keys = {
        {"<leader>gd", "<cmd>DiffviewFileHistory %<cr>", mode={"n"}, desc="Diffview File History"},
        {"<leader>go", "<cmd>DiffviewOpen<cr>", mode={"n"}, desc="Diffview Open"},
        {"<leader>q", "<cmd>DiffviewClose<cr>", mode={"n"},desc="Diffview close"},
        {"<leader>gll", "<cmd>DiffviewFileHistory<cr>", mode={"n"},desc="Diffview  Total History"}
    }
}
