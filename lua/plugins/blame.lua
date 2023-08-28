return {
  "FabijanZulj/blame.nvim",
    config = function()
        require('blame').setup({})
    end,
    keys = {
        { "<leader>ghb", "<CMD>ToggleBlame<CR>", mode={"n"}}
    },
}
