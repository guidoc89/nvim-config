return {
	"danymat/neogen",
	opts = true,
	keys = {
		{
			"<leader>co",
			function()
				require("neogen").generate()
			end,
			desc = "Add Docstring",
		},
	},
}
