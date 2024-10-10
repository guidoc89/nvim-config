return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
    cmd= {"ToggleTerm"},
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			-- direction = "horizontal",
			direction = "float",
			float_opts = {
				border = "single",
				width = 270,
				height = 100,
				-- winblend = 10,
				zindex = 20,
			},
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true , desc="Lazygit toggle"})

		require("toggleterm").setup({
			close_on_exit = true,
			hide_numbers = true,
			insert_mappings = true,
			autochdir = false,
			-- shading_factor = 20,
			size = 12,
			-- direction = "float",
			direction = "horizontal",
			-- direction = "vertical",
			open_mapping = [[<c-\>]],
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved",
				-- like `size`, width and height can be a number or function which is passed the current terminal
				-- width = <value>,
				-- height = <value>,
				-- winblend = 10,
				zindex = 10,
			},
		})
	end,
}
