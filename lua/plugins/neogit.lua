-- return {}


return {
    'NeogitOrg/neogit',
     dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        {"<leader>gy", "<cmd>Neogit kind=vsplit<cr>", mode={"n"}},
    },
    config = function()
        require("neogit").setup{}
    end
}
