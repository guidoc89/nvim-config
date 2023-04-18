-- TODO: So I can use Visual block (for some reason it conflicted with Windows paste)

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key 
keymap('n', '<Space>', '<NOP>', opts)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- No hl
keymap('n', '<Leader>h', 'set hlsearch!<CR>', opts)

-- To yank from and to system clipboard
keymap('v', '<leader>y', '"+y', opts)
keymap('v', '<leader>p', '"+p', opts)

-- Hate escape
keymap('i', 'kj', '<ESC>', term_opts)
keymap('c', 'kj', '<ESC>', term_opts)

-- Netrw remap
keymap('n', '<leader>pq', '<cmd>Ex<CR>', term_opts)

-- Increment/decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Dont yank with X
keymap('n', 'x', '"_x', opts)

-- Split window
keymap('n', '<C-w>i', ':split<Return><C-w>w', opts)
keymap('n', '<C-w>u', ':vsplit<Return><C-w>w', opts)

-- Resize window
keymap('n', '<C-w><left>', '<C-w>6<', opts)
keymap('n', '<C-w><right>', '<C-w>6>', opts)
keymap('n', '<C-w><up>', '<C-w>6+', opts)
keymap('n', '<C-w><down>', '<C-w>6-', opts)

-- New tab
keymap('n', 'te', ':tabedit<Return>', term_opts)


-- Move between tabs
keymap('n', '<Tab>', ':tabNext<CR>', term_opts)
keymap('n', '<S-Tab>', ':tabprevious<CR>', term_opts)

-- Better indenting
keymap('v', '<', '<gv', term_opts)
keymap('v', '>', '>gv', term_opts)

-- Tab switch buffer
keymap('n', '<Leader>]', ':bnext<CR>', term_opts)
keymap('n', '<Leader>[', ':bprevious<CR>', term_opts)

-- Move selected line/block in Visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Increment/decrement numbers
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files({no_ignore = false, hidden = true})<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
keymap("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", opts)
