require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")

local open_with_trouble = require("trouble.sources.telescope").open

local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local keymap = vim.keymap.set

-- stylua: ignore start
keymap("n", "<leader>lb", builtin.git_branches, { desc = "Git branches" })
keymap("n", "<leader>cc", builtin.colorscheme, { desc = "Change colorscheme" })
keymap("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Lsp document symbols" })
-- stylua: ignore end

telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
       find_files = {
           no_ignore = false,
           hidden = true,
           layout_config = { width = 0.80, preview_width = 0.6 }
       },
	},
	extensions = {
		fzf = {},
    },
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
				["<C-q>"] = open_with_trouble,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key,
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
				["<C-q>"] = open_with_trouble,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key,
			},
		},
	},
})

