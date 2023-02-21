local quarto = require'quarto'
local opts = { silent = true, noremap = true }

-- Set quarto keymaps
vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, opts)

require'quarto'.setup{
  debug = true,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    languages = { 'r', 'python', 'julia' },
    diagnostics = {
      enabled = true,
      triggers = { "BufWrite" }
    },
    completion = {
      enabled = true,
    },
  },
  keymap = {
    hover = 'K',
    definition = 'gd'
  }
}
