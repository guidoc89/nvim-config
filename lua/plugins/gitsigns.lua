
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
        {"<leader>ghc", ":Gitsigns blame_line<CR>", mode={"n"}, desc="Gitsigns blame line"},
        {"<leader>glb", ":Gitsigns toggle_current_line_blame<CR>", mode={"n"}, desc="Gitsigns toggle blame current line"},
        {"]g", ":Gitsigns next_hunk<CR>", mode={"n"}, desc="Gitsigns next hunk"},
        {"[g", ":Gitsigns prev_hunk<CR>", mode={"n"}, desc="Gitsigns prev hunk"},
        {"<leader>ghd", ":Gitsigns diffthis<CR>", mode={"n"}, desc="Gitsigns diffthis"},
        {"<leader>ghp", ":Gitsigns preview_hunk<CR>", mode={"n"}, desc="Gitsigns preview hunk"},
        {"<leader>ghi", ":Gitsigns preview_hunk_inline<CR>", mode={"n"}, desc="Gitsigns preview hunk inline"},
        {"<leader>gha", ":Gitsigns stage_hunk<CR>", mode={"n"}, desc="Gitsigns stage hunk"},
        {"<leader>ghr", ":Gitsigns reset_hunk<CR>", mode={"n"}, desc="Gitsigns reset hunk"},
        {"<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", mode={"n"}, desc="Gitsigns undo stage hunk"},
    },
}
