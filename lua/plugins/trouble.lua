return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	specs = {
		"folke/snacks.nvim",
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts or {}, {
				picker = {
					actions = require("trouble.sources.snacks").actions,
					win = {
						input = {
							keys = {
								["<c-q>"] = { "trouble_open", mode = { "n", "i" }, },
							},
						},
					},
				},
			})
		end,
	},
}
