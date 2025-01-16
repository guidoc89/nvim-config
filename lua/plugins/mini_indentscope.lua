return {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    symbol = "│",
    options = { try_as_border = true },
        mappings = {
            goto_top = "[e",
            goto_bottom = "]e"
        },
  },
      init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "Trouble",
        "alpha",
        "dashboard",
        "fzf",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "toggleterm",
        "trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function(data)
        vim.b[data.buf].miniindentscope_disable = true
      end,
    })
  end,
}
