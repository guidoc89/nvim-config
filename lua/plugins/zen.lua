return
{
        "folke/zen-mode.nvim",
        opt = {
            plugins = {
                gitsigns = true,
                tmux = true,
                kitty = { enabled = false, font = "+2" },
            },
        },
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" }
        },
}
