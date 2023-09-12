return {
  "echasnovski/mini.bufremove",
  -- stylua: ignore
  keys = {
    { "<leader>bi", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    { "<leader>bI", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
  },
    event="VeryLazy",
}
