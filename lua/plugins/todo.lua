return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        search = {
            command = "rg",
            args = {
                "--glob=!venv/",
                "--glob=!windows_venv/",
                "--glob=!*.ipynb",
                "--glob=!node_modules*",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                },
        },
    },
    keys = {
        -- stylua: ignore start
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
        { "<leader><leader>t", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
        { "<leader><leader>l", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        -- stylua: ignore end
        -- -- TODO: find out why this doesnt work with projets 
        -- { "<leader>tc", "<Cmd>exe ':TodoQuickFix cwd=' .. fnameescape(expand('%:p'))<CR>" , desc = "search TODOs in current file" },
        --<Cmd>exe ':TodoQuickFix cwd=' .. fnameescape(expand('%:p'))<CR>
    },
}
