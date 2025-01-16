return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
    -- stylua: ignore start
  keys = {
    { "<leader>ll", "<cmd>Telescope undo<cr>", desc = "Undo history" },
    -- stylua: ignore end
  },
  opts = {
    extensions = {
      undo = {
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
