return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", "<cmd> DapToggleBreakpoint <CR>", mode = { "n", "v" } },
			{ "<leader>ds", "<cmd> DapContinue<CR>", mode = { "n", "v" } },
		},
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			-- require("dap-python").resolve_python = function()
   --              local cwd = vim.fn.getcwd()
			-- 	return cwd .. "/venv/bin/python"
			-- end
		end,
		keys = {
			{
				"<leader>dp",
				function()
					require("dap-python").test_method()
				end,
				mode = { "n" },
			},
			{
				"<leader>dc",
				function()
					require("dap-python").continue()
				end,
				mode = { "n" },
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.open()
			end
		end,
	},
}
