-- return {}

return {
	"matthewmazzanti/nvim-ts-autotag",
	-- event = "VeryLazy",
	config = function()
		require("nvim-ts-autotag").setup{
			autotag = {
				enable = true,
			},
			-- filetypes = {
			-- 	"html",
			-- 	"htmldjango",
			-- 	"javascript",
			-- 	"javascripreact",
			-- 	"typescript",
			-- 	"typescriptreact",
			-- },
		}
	end,
}



-- return {
-- 	"windwp/nvim-ts-autotag",
-- 	event = "VeryLazy",
-- 	config = function()
-- 		-- safely import tree-sitter
-- 		local treesitter = require("nvim-treesitter.configs")
--
-- 		-- local register = vim.treesitter.language.register
-- 		local register = vim.treesitter.language.register
-- 		register("html", "htmldjango") -- enable html parser in htmldjango file
--
-- 		-- local import_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
-- 		-- if import_parsers then
-- 		-- 	local parsername = parsers.filetype_to_parsername
-- 		-- 	parsername.htmldjango = "html"
-- 		-- end
--
-- 		-- require("nvim-treesitter.configs").setup({
-- 		-- 	autotag = {
-- 		-- 		enable = true,
-- 		-- 		enable_rename = true,
-- 		-- 		enable_close = true,
-- 		-- 		enable_close_on_slash = true,
-- 		-- 		filetypes = { "html", "xml", "htmldjango" },
-- 		-- 	},
-- 		-- })
--
-- 		require("nvim-ts-autotag").setup({
-- 			autotag = {
-- 				enable = true,
-- 			},
-- 			filetypes = {
-- 				"html",
-- 				"htmldjango",
-- 			},
-- 		})
-- 	end,
-- }

