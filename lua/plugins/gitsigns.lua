return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "<leader>gha", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
				map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>ghc", gitsigns.blame_line, { desc = "Blame line" })
				map("n", "<leader>glb", gitsigns.toggle_current_line_blame, { desc = "Toggle curr line blame" })
				map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Gitsigns diff buffer" })
				map("n", "[g", gitsigns.prev_hunk, { desc = "Prev hunk" })
				map("n", "]g", gitsigns.next_hunk, { desc = "Next hunk" })
			end,
		})
	end,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
	},
}
