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
        { "<leader><leader>t", function() Snacks.picker.todo_comments({
            layout = { preset = "ivy", preview = "main" }
        }) end, desc = "Todo" },

		{ "<leader><leader>l", function() Snacks.picker.todo_comments({
					layout = { preset = "ivy", preview = "main" },
					keywords = { "TODO", "FIX", "FIXME", "BUG", "NOTE" },
				})
			end,
			desc = "TODO/FIX/FIXME/BUG/NOTE",
		},
		-- stylua: ignore end
	},
}
