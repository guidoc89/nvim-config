local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("n", "<Space>", "<NOP>", opts)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Source curr file
keymap("n", "<space><space>x", "<cmd>source %<CR>", { noremap = true, silent = true, desc = "Source file"  })
keymap("n", "<space>x", ":.lua<CR>", { noremap = true, silent = true, desc = "Source line"  })
keymap("v", "<space>x", ":.lua<CR>", { noremap = true, silent = true, desc = "Source selection"  })

-- To yank from and to system clipboard
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>p", '"+p', opts)

-- Hate escape
keymap("i", "kj", "<ESC>", term_opts)
keymap("c", "kj", "<ESC>", term_opts)

-- Easier delete line (awesome)
keymap("n", "<BS>", "dd", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Dont yank with X
keymap("n", "x", '"_x', opts)

-- Split window
keymap("n", "<C-w>i", ":split<Return><C-w>w", { noremap = true, silent = true, desc = "Split horizontal"  })
keymap("n", "<C-w>u", ":vsplit<Return><C-w>w", { noremap = true, silent = true, desc = "Split vertical"  })

-- Resize window
keymap("n", "<C-w><left>", "<C-w>6<", { noremap = true, silent = true, desc = "Resize window left"  })
keymap("n", "<C-w><right>", "<C-w>6>", { noremap = true, silent = true, desc = "Resize window right"  })
keymap("n", "<C-w><up>", "<C-w>6+", { noremap = true, silent = true, desc = "Resize window up"  })
keymap("n", "<C-w><down>", "<C-w>6-", { noremap = true, silent = true, desc = "Resize window down" })

-- New tab
keymap("n", "te", ":tabedit<Return>", term_opts)

-- Move between tabs
keymap("n", "<Tab>", ":tabNext<CR>", term_opts)
keymap("n", "<S-Tab>", ":tabprevious<CR>", term_opts)

-- Better indenting
keymap("v", "<", "<gv", term_opts)
keymap("v", ">", ">gv", term_opts)

-- Switch buffer
keymap("n", "L", ":bnext<CR>", term_opts)
keymap("n", "H", ":bprevious<CR>", term_opts)

-- Move selected line/block in Visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Erase current word
keymap("n", "<Tab>", "ciw", opts)

-- Increment/decrement numbers
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Telescope
keymap("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { noremap = true, silent = true, desc = "Buffer diagnostics" })

-- Toggle spellcheck
keymap("n", "<leader>wo", "<cmd>set spell!<cr>", { noremap = true, silent = true, desc = "Toggle spell check" })
