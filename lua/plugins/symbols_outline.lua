-- return {}
return {
    "simrat39/symbols-outline.nvim",
    opts = {
        keymaps={
            close={"q"},
        },
    },
    keys = {
        {"<leader>u", "<cmd>SymbolsOutlineOpen<CR>", mode={"n"}, desc = "Outline symbols toggle"},
    },
}
