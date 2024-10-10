return {
	"theprimeagen/harpoon",
	event = "VeryLazy",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
        local keymap = vim.keymap.set

		keymap("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
		keymap("n", "<C-h>", ui.toggle_quick_menu)

        -- stylua: ignore start
		keymap("n", "<leader>ha", function() ui.nav_file(1) end, { desc = "Harpoon file 1" })
		keymap("n", "<leader>hf", function() ui.nav_file(2) end, { desc = "Harpoon file 2" })
		keymap("n", "<leader>hk", function() ui.nav_file(3) end, { desc = "Harpoon file 3" })
		keymap("n", "<leader>h;", function() ui.nav_file(4) end, { desc = "Harpoon file 4" })
		-- stylua: ignore end
	end,
}
