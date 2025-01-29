return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup({})
	end,
	keys = {
		{ "<leader>gb", "<CMD>BlameToggle<CR>", desc = "Git blame (blame)", mode = { "n" } },
	},
}
