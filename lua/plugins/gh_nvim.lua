return {
	"ldelossa/gh.nvim",
	cmd = { "GHOpenPR" },

	dependencies = {
		{
			"ldelossa/litee.nvim",
			config = function()
				require("litee.lib").setup()
			end,
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>g", group = "Git" },
			{ "<leader>gj", group = "Github" },
			{ "<leader>gjc", group = "Commits" },
			{ "<leader>gjcc", "<cmd>GHCloseCommit<cr>", desc = "Close" },
			{ "<leader>gjce", "<cmd>GHExpandCommit<cr>", desc = "Expand" },
			{ "<leader>gjco", "<cmd>GHOpenToCommit<cr>", desc = "Open To" },
			{ "<leader>gjcp", "<cmd>GHPopOutCommit<cr>", desc = "Pop Out" },
			{ "<leader>gjcz", "<cmd>GHCollapseCommit<cr>", desc = "Collapse" },
			{ "<leader>gji", group = "Issues" },
			{ "<leader>gjip", "<cmd>GHPreviewIssue<cr>", desc = "Preview" },
			{ "<leader>gjl", group = "Litee" },
			{ "<leader>gjlt", "<cmd>LTPanel<cr>", desc = "Toggle Panel" },
			{ "<leader>gjp", group = "Pull Request" },
			{ "<leader>gjpc", "<cmd>GHClosePR<cr>", desc = "Close" },
			{ "<leader>gjpd", "<cmd>GHPRDetails<cr>", desc = "Details" },
			{ "<leader>gjpe", "<cmd>GHExpandPR<cr>", desc = "Expand" },
			{ "<leader>gjpo", "<cmd>GHOpenPR<cr>", desc = "Open" },
			{ "<leader>gjpp", "<cmd>GHPopOutPR<cr>", desc = "PopOut" },
			{ "<leader>gjpr", "<cmd>GHRefreshPR<cr>", desc = "Refresh" },
			{ "<leader>gjpt", "<cmd>GHOpenToPR<cr>", desc = "Open To" },
			{ "<leader>gjpz", "<cmd>GHCollapsePR<cr>", desc = "Collapse" },
			{ "<leader>gjr", group = "Review" },
			{ "<leader>gjrb", "<cmd>GHStartReview<cr>", desc = "Begin" },
			{ "<leader>gjrc", "<cmd>GHCloseReview<cr>", desc = "Close" },
			{ "<leader>gjrd", "<cmd>GHDeleteReview<cr>", desc = "Delete" },
			{ "<leader>gjre", "<cmd>GHExpandReview<cr>", desc = "Expand" },
			{ "<leader>gjrs", "<cmd>GHSubmitReview<cr>", desc = "Submit" },
			{ "<leader>gjrz", "<cmd>GHCollapseReview<cr>", desc = "Collapse" },
			{ "<leader>gjt", group = "Threads" },
			{ "<leader>gjtc", "<cmd>GHCreateThread<cr>", desc = "Create" },
			{ "<leader>gjtn", "<cmd>GHNextThread<cr>", desc = "Next" },
			{ "<leader>gjtt", "<cmd>GHToggleThread<cr>", desc = "Toggle" },
		})
		require("litee.gh").setup()
	end,
}
