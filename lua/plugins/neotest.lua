-- return {}

-- return {
-- 	{
-- 		"nvim-neotest/neotest",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-treesitter/nvim-treesitter",
-- 			"antoinemadec/FixCursorHold.nvim",
--             -- "marilari88/neotest-vitest",
-- 		    "nvim-neotest/neotest-python",
-- 		},
--         -- event="VeryLazy",
-- 		config = function()
-- 			require("neotest").setup({
-- 				adapters = {
--                     -- require("neotest-vitest") {
--                     --   -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
--                     --   filter_dir = function(name, rel_path, root)
--                     --     return name ~= "node_modules"
--                     --   end,
--                     -- },
-- 					require("neotest-python")({
-- 						-- dap = { justMyCode = false },
--                         runner = "pytest",
--                         -- python = ".venv/bin/python",
-- 					}),
-- 					-- require("neotest-plenary"),
-- 					-- require("neotest-vim-test")({
-- 					-- 	ignore_file_types = { "python", "vim", "lua" },
-- 					-- }),
-- 				},
-- 			})
-- 		end,
--         keys = {
--             {"<leader>tr", function () require("neotest").run.run() end, mode={"n"}},
--             {"<leader>ta", function () require("neotest").run.run(vim.fn.expand("%")) end, mode={"n"}},
--             {"<leader>td", function () require("neotest").run.run({strategy = "dap"}) end, mode={"n"}},
--             {"<leader>ts", function () require("neotest").run.stop() end, mode={"n"}},
--         },
-- 	},
-- 	-- {
-- 	-- 	"folke/neodev.nvim",
-- 	-- 	config = function()
-- 	-- 		require("neodev").setup({
-- 	-- 			library = { plugins = { "neotest" }, types = true },
-- 	-- 		})
-- 	-- 	end,
-- 	-- },
-- }
--
--
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
 		"nvim-neotest/neotest-python",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})
	end,
}
