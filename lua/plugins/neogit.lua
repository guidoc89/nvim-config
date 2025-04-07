return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>gy", "<cmd>Neogit kind=vsplit<cr>", mode = { "n" }, desc="Neogit open vertical split" },
		{ "<leader>gY", "<cmd>Neogit<cr> ", mode = { "n" }, desc="Neogit" },
	},
	config = function()
		require("neogit").setup({})
	end,
}
