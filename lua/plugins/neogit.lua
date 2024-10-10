-- return {}

-- return {}

return {
    'NeogitOrg/neogit',
     dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        require("neogit").setup{}
    end,
	keys = {
		{ "<leader>gy", "<cmd>Neogit kind=vsplit<cr>", mode = { "n" }, desc="Neogit open vertical split" },
	},
}
