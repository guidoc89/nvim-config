return {
	"saghen/blink.cmp",
	version = "1.*",
	build = "cargo build --release",
	opts = {
		keymap = {
			preset = "enter",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-N>"] = { "select_next", "show" },
			["<C-P>"] = { "select_prev", "show" },
			["<C-J>"] = { "select_next", "fallback" },
			["<C-K>"] = { "select_prev", "fallback" },
			["<C-U>"] = { "scroll_documentation_up", "fallback" },
			["<C-D>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-y>"] = { "select_and_accept" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				"select_prev",
				"snippet_backward",
				function(cmp)
					if vim.api.nvim_get_mode().mode == "c" then
						return cmp.show()
					end
				end,
				"fallback",
			},
		},
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = require("utils").icons.kinds,
		},

		signature = { enabled = true, window = { show_documentation = false } },
		completion = {
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
			trigger = {
				-- Add ":" for python!! TODO: from global to filetype=python only
				show_on_blocked_trigger_characters = { " ", "\n", "\t", ":" },
			},
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			menu = {
				border = nil,
				draw = {
					align_to = "label",
					-- Left icons
					-- columns = { { "kind_icon", "kind" }, { "label", gap = 1 } },
					--  Cmp-like right icons
					columns = {
						{ "kind_icon", "label", gap = 1 },
						-- { "kind_icon", "kind", gap = 0 },
						{ "kind", gap = 0 },
						{ "source_name" },
					},
					treesitter = { "lsp" },
					components = {
						label = {
							width = { fill = true, max = 60 },
							text = function(ctx)
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									return highlights_info.label
								else
									return ctx.label
								end
							end,
							highlight = function(ctx)
								local highlights = {}
								local highlights_info = require("colorful-menu").blink_highlights(ctx)
								if highlights_info ~= nil then
									highlights = highlights_info.highlights
								end
								for _, idx in ipairs(ctx.label_matched_indices) do
									table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
								end
								return highlights
							end,
						},
						kind_icon = { width = { fill = false } },
						kind = { width = { fill = false } },
						label_description = { width = { fill = true, max = 30 } },
						source_name = { width = { fill = true, max = 30 } },
					},
				},
			},
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			per_filetype = { sql = { "dadbod" } },
			providers = {
				lsp = {
					name = "[LSP]",
				},
				buffer = {
					name = "[Buf]",
				},
				cmdline = {
					name = "",
				},
				lazydev = {
					name = "[LazyDev]",
					module = "lazydev.integrations.blink",
					-- Make lazydev completions top priority
					score_offset = 100,
				},
				dadbod = {
					name = "[DB]",
					module = "vim_dadbod_completion.blink",
				},
				path = {
					name = "[Path]",
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
		cmdline = {
			enabled = true,
			keymap = {
				preset = "inherit",
				["<CR>"] = { "accept_and_enter", "fallback" },
			},
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = { auto_show = true },
				ghost_text = { enabled = false },
			},
		},
	},
	opts_extend = { "sources.default" },
}
