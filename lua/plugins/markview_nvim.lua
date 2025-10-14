return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
    dependencies = {
        "saghen/blink.cmp",
    },
    keys = {
        { "<leader>mo", "<cmd>Markview splitToggle<cr>", mode = {"n"}, desc = "Markview split view toggle"},
        { "<leader>mt", "<cmd>Markview toggle<cr>", mode = {"n"}, desc = "Markview toggle"},
    },
    opts = {
        preview = {
            enable = false,
            icon_provider = "mini",
        },
    },
}
