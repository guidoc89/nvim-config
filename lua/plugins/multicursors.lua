return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		local keymap = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
        -- stylua: ignore start
		keymap({ "n", "v" }, "<up>", function() mc.lineAddCursor(-1) end, { desc = "Add multicursor up" })
		keymap({ "n", "v" }, "<down>", function() mc.lineAddCursor(1) end, { desc = "Add multicursor down" })
		keymap({ "n", "v" }, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip multicursor up" })
		keymap({ "n", "v" }, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "Skip multicursor down" })

		-- Add or skip adding a new cursor by matching word/selection
		keymap({ "n", "v" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Multicursor match next word" })
		keymap({ "n", "v" }, "<leader>si", function() mc.matchSkipCursor(1) end, { desc = "Multicursor skip next word" })
		keymap({ "n", "v" }, "<C-p>", function() mc.matchAddCursor(-1) end, { desc = "Multicursor match prev word" })
		keymap({ "n", "v" }, "<leader>sI", function() mc.matchSkipCursor(-1) end, { desc = "Multicursor skip prev word" })

		-- Add all matches in the document
		keymap({ "n", "v" }, "<leader>A", mc.matchAllAddCursors, { desc = "Multicursor add all buffer matches" })

		-- You can also add cursors with any motion you prefer:
		-- keymap("n", "<right>", function()
		--     mc.addCursor("w")
		-- end)
		-- keymap("n", "<leader><right>", function()
		--     mc.skipCursor("w")
		-- end)

		-- Rotate the main cursor.
		keymap({ "n", "v" }, "<C-s>", mc.prevCursor, { desc = "Multicursor rotate cursor left" })
		keymap({ "n", "v" }, "<C-f>", mc.nextCursor, { desc = "Multicursor rotate cursor right" })

		-- Delete the main cursor.
		keymap({ "n", "v" }, "<leader>x", mc.deleteCursor, { desc = "Multicursor delete main cursor" })

		-- Easy way to add and remove cursors using the main cursor.
		keymap({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Multicursor add here" })

		-- Clone every cursor and disable the originals.
		keymap({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors, { desc = "Multicursor clone and disable originals" })

        -- Default <esc> handler.
        -- Same as lazygit <esc> replace (keep consistent)
		keymap("n", "<C-[>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
			end
		end, { desc = "Multicursor delete all" })

		-- bring back cursors if you accidentally clear them
		keymap("n", "<leader>gv", mc.restoreCursors, { desc = "Multicursor bring back all" })

		-- Align cursor columns.
		keymap("v", "<leader>a", mc.alignCursors, { desc = "Multicursor align cols" })

		-- Split visual selections by regex.
		keymap("v", "S", mc.splitCursors, { desc = "Multicursor split by regex" })

		-- Append/insert for each line of visual selections.
		keymap("v", "I", mc.insertVisual, { desc = "Multicursor insert visual" })
		keymap("v", "A", mc.appendVisual, { desc = "Multicursor append visual" })

		-- match new cursors within visual selections by regex.
		keymap("v", "M", mc.matchCursors, { desc = "Multicursor match with regex" })

		-- Rotate visual selection contents.
		keymap("v", "<leader>t", function() mc.transposeCursors(1) end, { desc = "Multicursor rotate pos selection contents" })
		keymap("v", "<leader>T", function() mc.transposeCursors(-1) end, { desc = "Multicursor rotate neg selection contents" })

		-- Jumplist support
		keymap({ "v", "n" }, "<c-i>", mc.jumpForward, { desc = "Multicursor jump forward" })
		keymap({ "v", "n" }, "<c-o>", mc.jumpBackward, { desc = "Multicursor jump backward" })
		-- stylua: ignore end

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	end,
}
