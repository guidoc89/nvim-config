-- return {}

return {
	"matthewmazzanti/nvim-ts-autotag",
	-- event = "VeryLazy",
	config = function()
		require("nvim-ts-autotag").setup{
			autotag = {
				enable = true,
			},
			-- filetypes = {
			-- 	"html",
			-- 	"htmldjango",
			-- 	"javascript",
			-- 	"javascripreact",
			-- 	"typescript",
			-- 	"typescriptreact",
			-- },
		}
	end,
}
