return {
	"shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
                exclude_filetypes = {
                    snacks_dashboard = true,
                    dashboard = true,
                    alpha = true,
                },

            }
		})
	end,
}
