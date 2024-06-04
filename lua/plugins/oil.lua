return {
	"stevearc/oil.nvim",
	keys = {
		{ "<leader>O", "<cmd>lua require('oil').open_float()<CR>", mode = { "n" } },
		{ "<leader>o", "<cmd>lua require('oil').open()<CR>", mode = { "n" } },
		-- { "<leader>o", "<cmd>lua require('oil').open_float('.')<CR>", mode = { "n" } },
	},
	config = function()
		require("oil").setup({
			keymaps = {
				["<s-h>"] = "actions.toggle_hidden",
                 ["q"] = "actions.close",
			},
			show_hidden = true,
			float = {
				-- Padding around the floating window
				padding = 2,
				max_width = 100,
				max_height = 40,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			-- delete_to_trash = true,
		})
	end,
}
