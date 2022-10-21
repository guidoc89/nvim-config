local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.maplocalleader = " "
vim.g.mapleader = " "

--no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Increment/decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Dont yank with X
keymap('n', 'x', '"_x', opts)

-- New tab
keymap('n', 'te', ':tabedit<Return>', term_opts)


-- better windown movement
keymap('n', '<A-h>', '<C-w>h', term_opts)
keymap('n', '<A-j>', '<C-w>j', term_opts)
keymap('n', '<A-k>', '<C-w>k', term_opts)
keymap('n', '<A-l>', '<C-w>l', term_opts)

-- better indenting
keymap('v', '<', '<gv', term_opts)
keymap('v', '>', '>gv', term_opts)

-- hate escape
keymap('i', 'kj', '<ESC>', term_opts)
--vim.api.nvim_set_keymap('n', 'kj', '<ESC>',{noremap=true, silent=true})
keymap('c', 'kj', '<C-C>', term_opts)

-- Tab switch buffer
keymap('n', '<Leader>l', ':bnext<CR>', term_opts)
keymap('n', '<Leader>a', ':bprevious<CR>', term_opts)

-- Move selected line/block in Visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- TAB complete (maybe will get overriden later, just in case)
--keymap('i', '<expr><Tab>', 'pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"', opts)
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

-- Telescope
--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files({no_ignore = false, hidden = true})<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
--keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
--keymap("i", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Split window
keymap('n', '<C-w>i', ':split<Return><C-w>w', opts)
keymap('n', '<C-w>u', ':vsplit<Return><C-w>w', opts)

-- Resize window
keymap('n', '<C-w><left>', '<C-w><', opts)
keymap('n', '<C-w><right>', '<C-w>>', opts)
keymap('n', '<C-w><up>', '<C-w>+', opts)
keymap('n', '<C-w><down>', '<C-w>-', opts)
