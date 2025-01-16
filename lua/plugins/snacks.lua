--
local Utils = require("utils")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = false },
		picker = {
            formatters = {
                file = {
                    filename_first = false,
                },
            },
			win = {
				input = {
					keys = {
						["<c-u>"] = "preview_scroll_up",
						["<c-d>"] = "preview_scroll_down",
						["<c-f>"] = "list_scroll_up",
						["<c-b>"] = "list_scroll_down",
					},
				},
			},
		},
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = "<leader>f" },
					{ icon = " ", key = "r", desc = "Recent Files", action = "<leader>sf" },
					{ icon = " ", key = "g", desc = "Find Text", action = "<leader>r" },
					{ icon = " ", key = "c", desc = "Config", action = "<leader>cn" },
					{ icon = " ", key = "p", desc = "Packages", action = "<leader>cp" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "",
					height = 5,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
		indent = { enabled = false },
		input = { enabled = false },
		notifier = {
			enabled = false,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 2, total = 350 },
				easing = "linear",
			},
		},
		statuscolumn = { enabled = false },
		words = { enabled = false },
		styles = {
			zen = {
				width = 160,
				height = 0,
			},
			lazygit = {
				width = 170,
			},
		},
	},
	keys = {
        -- stylua: ignore start
		---- PICKERS ----
        -- General
		{ "<leader>f", function() Snacks.picker.files(Utils.snacks_telescope_opts) end, desc = "Find Files", },
		{ "<leader>ba", function() Snacks.picker.buffers(Utils.snacks_telescope_opts) end, desc = "Buffers", },
		{ "<leader>r", function() Snacks.picker.grep(Utils.snacks_telescope_opts) end, desc = "Grep", },
        { "<leader>bl", function() Snacks.picker.lines() end, desc = "Grep Buffer Lines" },
		{ "<leader>ht", function() Snacks.picker.help(Utils.snacks_telescope_opts) end, desc = "Help Tags", },
		{ "<leader>ma", function() Snacks.picker.keymaps(Utils.snacks_telescope_opts) end, desc = "Keymaps", },

        -- Config / plugin files
		{ "<leader>cn", function() Snacks.picker.files(Utils.add_opts_to_base(Utils.snacks_ivy_opts, {
            cwd = vim.fn.stdpath("config") })) end, desc = "Config Files",
        },
		{ "<leader>cp", function() Snacks.picker.files(Utils.add_opts_to_base(Utils.snacks_ivy_opts, {
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })) end, desc = "Installed Packages/Plugins", },

        -- Dashboard
		{ "<leader>da", function() Snacks.dashboard() end, desc = "Open Dashboard", },
		{ "<leader>sf", function() Snacks.dashboard.pick("oldfiles", Utils.snacks_telescope_opts) end, desc = "Recent Files", },

        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions(Utils.snacks_telescope_opts) end, desc = "Goto Definition" },
        { "gt", function() Snacks.picker.lsp_type_definitions(telescope_opts) end, desc = "Goto Type Definition" },
		{ "<leader>vr", function() Snacks.picker.lsp_references(Utils.snacks_ivy_opts) end, desc = "Lsp References", },
		{ "<leader>lw", function() Snacks.picker.diagnostics(Utils.snacks_ivy_opts) end, desc = "Workspace Diagnostics", },
		{ "<leader>ld", function() Snacks.picker.diagnostics_buffer(Utils.snacks_ivy_opts) end, desc = "Buffer Diagnostics", },

        -- Zen mode
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode (Snacks)", },
		{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom (Snacks)", },

        -- Git / Lazygit
		{ "<leader>la", function() Snacks.picker.git_files(Utils.snacks_telescope_opts) end, desc = "Git Files", },
		{ "<leader>lf", function() Snacks.picker.git_log_file(Utils.snacks_telescope_opts) end, desc = "Git Log File", },
		{ "<leader>lc", function() Snacks.picker.git_log(Utils.snacks_telescope_opts) end, desc = "Git Log", },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History (Snacks)", },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit (Snacks)", },
		{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd) (Snacks)", },
		-- stylua ignore: end
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd
			end,
		})
	end,
}
