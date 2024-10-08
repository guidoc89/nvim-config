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

-- To search git files
vim.keymap.set("n", "<leader>la", builtin.git_files, {})
vim.keymap.set("n", "<leader>lf", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>lc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>lb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>vr", builtin.lsp_references, {})
vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "<leader>cc", builtin.colorscheme, {})

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

vim.keymap.set("n", "<leader>r", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>ba", function()
	builtin.buffers()
end)
vim.keymap.set("n", "<leader>ss", function()
	builtin.lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>f", function()
	builtin.find_files({no_ignore=false, hidden=true})
end)
vim.keymap.set("n", "<leader>dl", function()
	builtin.diagnostics()
end)

local util = require("utils")

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

vim.keymap.set("n", "<leader>sf", function()
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
end)
