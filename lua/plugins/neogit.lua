return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gy", "<cmd>Neogit kind=vsplit<cr>", mode = { "n" }, desc="Neogit open vertical split" },
	},
	config = function()
		require("neogit").setup({})
	end,
}
