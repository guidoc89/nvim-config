require("telescope").load_extension("media_files")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("harpoon")

local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions
local keymap = vim.keymap.set


-- To search git files
keymap("n", "<leader>la", builtin.git_files, { desc = "Git files" })
keymap("n", "<leader>lf", builtin.git_bcommits, { desc = "Git file commits" })
keymap("n", "<leader>lc", builtin.git_commits, { desc = "Git branch commits" })
keymap("n", "<leader>lb", builtin.git_branches, { desc = "Git branches" })
keymap("n", "<leader>vr", builtin.lsp_references, { desc = "Go to references" })
keymap("n", "gt", builtin.lsp_type_definitions, { desc = "Go to type definition" })
keymap("n", "<leader>cc", builtin.colorscheme, { desc = "Change colorscheme" })

telescope.setup({
    pickers = {
        colorscheme = {
          enable_preview = true
        }
    },
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<leader>i"] = actions.select_horizontal,
				["<leader>u"] = actions.select_vertical,
				["<leader>0"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
			i = {
				["<leader>q"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<C-w>i"] = actions.select_horizontal,
				["<C-w>u"] = actions.select_vertical,
				["<C-0>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
		},
	},
})

-- stylua: ignore start
keymap("n", "<leader>r", function() builtin.live_grep() end, { desc = "Live grep" })
keymap("n", "<leader>ba", function() builtin.buffers() end, { desc = "Buffers" })
keymap("n", "<leader>ss", function() builtin.lsp_document_symbols() end, { desc = "Lsp document symbols" })
keymap("n", "<leader>f", function() builtin.find_files({ no_ignore = false, hidden = true }) end, { desc = "Find files" })
keymap("n", "<leader>ls", function() builtin.diagnostics() end, { desc = "Workspace diagnostics" })
-- stylua: ignore end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_ignore_patterns = {
			"windows_venv/*",
			"venv/*",
			"node_modules/.*",
			".git/.*",
			"%.ipynb",
			"%.xlsx",
		},
		mappings = {
			n = {
				["q"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<leader>i"] = actions.select_horizontal,
				["<leader>u"] = actions.select_vertical,
				["<leader>0"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
					["<leader>q"] = actions.close,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,

					["<leader>i"] = actions.select_horizontal,
					["<leader>u"] = actions.select_vertical,
					["<leader>0"] = actions.select_tab,

					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					-- ["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})
--telescope.load_extension("file_browser")

keymap("n", "<leader>sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = true,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end, { desc = "File browser" })
