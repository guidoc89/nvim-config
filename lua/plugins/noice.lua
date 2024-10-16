return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			progress = {
				enabled = true,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			message = {
				enabled = false,
			},
		},
		messages = {
			enabled = false,
		},
		popupmenu = {
			backend = "cmp",
			enabled = true,
		},
		notify = {
			enabled = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
