return {
	"Vigemus/iron.nvim",
    cmd = "IronRepl",
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
					python = {
						command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
					},
				},
				repl_filetype = function(_, ft)
					return ft
				end,
				repl_open_cmd = {
                    -- right split
					view.split.vertical.rightbelow("%40"),
				},
			},
			keymaps = {
				toggle_repl = "<space>jo",
				restart_repl = "<space>jR",
				send_motion = "<space>js",
				visual_send = "<space>js",
				send_file = "<space>jf",
				send_line = "<space>jl",
				send_paragraph = "<space>jp",
				send_until_cursor = "<space>ju",
				send_code_block = "<space>jb",
				send_code_block_and_move = "<space>jn",
				cr = "<space>j<cr>",
				interrupt = "<space>j<space>",
				exit = "<space>jq",
				clear = "<space>jl",
			},
			highlight = {
				italic = true,
			},
            -- ignore blank lines when sending visual select lines
			ignore_blank_lines = true,
		})

		vim.keymap.set("n", "<space>jw", "<cmd>IronFocus<cr>")
	end,
}
