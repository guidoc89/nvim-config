local status, saga = pcall(require, "lspsaga")
if (not status) then return end





saga.init_lsp_saga {
        code_action_icon = '',
        code_action_lightbulb = {
                enable = false,
                enable_in_insert = false,
                cache_code_action = false,
                sign = false,
                update_time = 150,
                sign_priority = 20,
                virtual_text = false,
                },
    server_filetype_map = {
        typescript = 'typescript',
    },
        --css = 'tailwindcss',
        -- python = 'pyright'
}


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', '<C-q>', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<C-l>', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
