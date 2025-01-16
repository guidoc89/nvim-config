vim.opt.background = "dark"
vim.o.termguicolors = true
vim.wo.cursorline = true

return {

	{
		"dgox16/oldworld.nvim",
	},
	{
		"olimorris/onedarkpro.nvim",
	},
	{
		"sho-87/kanagawa-paper.nvim",
	},
	{
		"anAcc22/sakura.nvim",
		config = function()
			vim.cmd.colorscheme("sakura")
		end,
	},

	{
		"tiagovla/tokyodark.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				enable = {
					terminal = true,
					legacy_highlights = true,
					migrations = true,
				},
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		opts = {
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				illuminate = {
					enabled = true,
					lsp = false,
				},
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				neogit = true,
				mason = true,
				flash = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				neotest = true,
				neotree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
			},
		},
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "moon",
			})
		end,
	},
	{
		"joshdick/onedark.vim",
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				theme = "wave",
				background = {
					dark = "dragon",
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = false,
			})
		end,
	},
}
