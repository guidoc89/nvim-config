return {
	{
		"nvim-neorg/neorg",
		ft = "norg", -- lazy load on filetype
		build = ":Neorg sync-parsers",
		cmd = "Neorg", -- lazy load on command, allows to autocomplete :Neorg regardless of whether it's loaded yet!!
		priority = 10, -- since treesitter is by default 50, need to make sure to load TS first, and then norg
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.norg" },
				command = "set conceallevel=3",
			})

			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								progetti_notes = "/mnt/c/Users/CST/Guido castro/progetti_notes",
							},
							default_workspace = "progetti_notes",
						},
					},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
							name = "[Neorg]",
						},
					},
				},
			})
		end,
	},
}
