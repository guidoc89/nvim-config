-- return {}
return {
	{
		"NvChad/nvim-colorizer.lua",
		keys = {
			{ "<leader>ca", "<cmd>ColorizerToggle<cr>", mode = { "n" } },
		},
		opts = {
			user_default_options = {
				tailwind = true,
				mode = "virtualtext",
			},
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- opts = function(_, opts)
		-- 	local format_kinds = opts.formatting.format
		-- 	opts.formatting.format = function(entry, item)
		-- 		format_kinds(entry, item)
		-- 		return require("tailwindcss-colorizer-cmp").formatter(entry, item)
		-- 	end
		-- end,
	},
}
