return {
	{ "nvim-neotest/nvim-nio" },
	{
		"mfussenegger/nvim-dap",
		cmd = { "DapNew" },
		keys = {
        -- stylua: ignore start
          { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
          { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
          { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
          { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
          { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
          { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
          { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
          { "<leader>dj", function() require("dap").down() end, desc = "Down" },
          { "<leader>dk", function() require("dap").up() end, desc = "Up" },
          { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
          { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
          { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
          { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
          { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
          { "<leader>ds", function() require("dap").session() end, desc = "Session" },
          { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
          { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
			-- stylua: ignore end
		},
		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				cmd = { "DapNew" },
				config = function()
					require("nvim-dap-virtual-text").setup({})
				end,
			},
			"rcarriga/nvim-dap-ui",
		},
	},

	{
		"mfussenegger/nvim-dap-python",
		cmd = { "DapNew" },
		ft = "python",
		dependencies = {
			{ "mfussenegger/nvim-dap", cmd = { "DapNew" } },
            { "nvim-treesitter/nvim-treesitter" },
			{ "nvim-neotest/nvim-nio" },
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
		keys = {
            -- stylua: ignore start
			{ "<leader>dM", function() require("dap-python").test_method() end, desc="Dap test method", mode = { "n" }, },
			-- stylua: ignore end
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		cmd = { "DapNew", "DapSession" },
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
