return {
    "sindrets/diffview.nvim",
    keys = {
        {"<leader>gd", "<cmd>DiffviewFileHistory %<cr>", mode={"n"}},
        {"<leader>go", "<cmd>DiffviewOpen<cr>", mode={"n"}},
        {"q", "<cmd>DiffviewClose<cr>", mode={"n"}},
        {"<leader>gll", "<cmd>DiffviewFileHistory<cr>", mode={"n"}},
    },
}
