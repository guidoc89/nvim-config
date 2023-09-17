return {
    "stevearc/oil.nvim",
    keys = {
        {"<leader>o", "<cmd>Oil<cr>", mode={"n"}},
    },
    config = function ()
       require("oil").setup{
            keymaps={
                   ["<s-h>"] = "actions.toggle_hidden",
            }
        }
    end
}
