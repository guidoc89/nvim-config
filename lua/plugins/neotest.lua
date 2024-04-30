-- return {}

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
        event="VeryLazy",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
                        python = ".venv/bin/python",
					}),
					-- require("neotest-plenary"),
					-- require("neotest-vim-test")({
					-- 	ignore_file_types = { "python", "vim", "lua" },
					-- }),
				},
			})
		end,
        keys = {
        {"<leader>tr", function () require("neotest").run.run() end, mode={"n"}},
        {"<leader>ta", function () require("neotest").run.run(vim.fn.expand("%")) end, mode={"n"}},
        {"<leader>td", function () require("neotest").run.run({strategy = "dap"}) end, mode={"n"}},
        {"<leader>ts", function () require("neotest").run.stop() end, mode={"n"}},
        },
	},
	{
		"nvim-neotest/neotest-python",
	},
	-- {
	-- 	"folke/neodev.nvim",
	-- 	config = function()
	-- 		require("neodev").setup({
	-- 			library = { plugins = { "neotest" }, types = true },
	-- 		})
	-- 	end,
	-- },
}
