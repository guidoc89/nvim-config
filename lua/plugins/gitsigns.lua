
return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup{}
    end,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
    },
    keys = {
        {"<leader>ghc", ":Gitsigns blame_line<CR>", mode={"n"}},
        {"]g", ":Gitsigns next_hunk<CR>", mode={"n"}},
        {"[g", ":Gitsigns prev_hunk<CR>", mode={"n"}},
        {"<leader>ghd", ":Gitsigns diffthis<CR>", mode={"n"}},
        {"<leader>ghp", ":Gitsigns preview_hunk<CR>", mode={"n"}},
        {"<leader>ghi", ":Gitsigns preview_hunk_inline<CR>", mode={"n"}},
        {"<leader>gha", ":Gitsigns stage_hunk<CR>", mode={"n"}},
        {"<leader>ghr", ":Gitsigns reset_hunk<CR>", mode={"n"}},
        {"<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", mode={"n"}},
    },
}
