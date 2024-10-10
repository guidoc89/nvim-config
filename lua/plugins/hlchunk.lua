return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			blank = {
				enable = false,
			},
            line_num = {
                enable = false,
            },
            indent = {
                enable = true,
            }
		})
	end,
}
