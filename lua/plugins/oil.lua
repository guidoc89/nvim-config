return {
    "stevearc/oil.nvim",
    keys = {
        {"<leader>o", "<cmd>Oil<cr>", mode={"n"}},
    },
    config = function ()
       require("oil").setup{} 
    end
}
