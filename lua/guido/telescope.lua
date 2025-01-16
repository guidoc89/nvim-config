require("telescope").load_extension("media_files")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")

local open_with_trouble = require("trouble.sources.telescope").open

local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local keymap = vim.keymap.set

-- To search git files
keymap("n", "<leader>la", builtin.git_files, { desc = "Git files" })
keymap("n", "<leader>lf", builtin.git_bcommits, { desc = "Git file commits" })
keymap("n", "<leader>lc", builtin.git_commits, { desc = "Git branch commits" })
keymap("n", "<leader>lb", builtin.git_branches, { desc = "Git branches" })
keymap("n", "<leader>vr", builtin.lsp_references, { desc = "Go to references" })
keymap("n", "gt", builtin.lsp_type_definitions, { desc = "Go to type definition" })
keymap("n", "<leader>cc", builtin.colorscheme, { desc = "Change colorscheme" })
keymap("n", "<leader>ht", builtin.help_tags, { desc = "Help tags" })

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

-- stylua: ignore start
keymap("n", "<leader>r", function() builtin.live_grep() end, { desc = "Live grep" })
keymap("n", "<leader>cn", function()
    local opts = require("telescope.themes").get_ivy({
        cwd = vim.fn.stdpath("config")
    })
    builtin.find_files(opts)
end, { desc = "Config files" })
keymap("n", "<leader>cp", function()
    local opts = require("telescope.themes").get_ivy({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
    })
    builtin.find_files(opts)
end, { desc = "Installed packages/plugins" })
keymap("n", "<leader>ba", function() builtin.buffers() end, { desc = "Buffers" })
keymap("n", "<leader>ss", function() builtin.lsp_document_symbols() end, { desc = "Lsp document symbols" })
keymap("n", "<leader>f", function() builtin.find_files() end, { desc = "Find files" })
keymap("n", "<leader>lw", function()
    local opts = require("telescope.themes").get_ivy()
    builtin.diagnostics(opts)
end, { desc = "Workspace diagnostics" })
-- stylua: ignore end
