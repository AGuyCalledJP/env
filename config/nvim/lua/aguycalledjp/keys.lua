vim.g.mapleader = ","

local map = vim.api.nvim_set_keymap

-- Save
map('n', '<C-s>', [[:w<cr>]], {})

-- Toggle nvim-tree
map('n', '<C-b>', [[:NvimTreeToggle<cr>]], {})

-- Toggle telescope
map('n', '<C-p>', [[:Telescope find_files<cr>]], {})
map('n', '<C-f>', [[:Telescope live_grep<cr>]], {})

-- Barbar
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<C-S-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C-S-l>', '<Cmd>BufferMoveNext<CR>', opts)

-- Close buffer
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

-- Move highlighted lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Append last line to current line without moving cursor
map("n", "J", "mzJ`z", opts)

-- Half page jumping with d and u
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Keep search terms in the middle of the page
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Allow paste without losing paste buffer
map("x", "<leader>p", [["_dP]], opts)

map("n", "<C-Q>", "[[:qa<cr>]]", opts)

-- Allow replace of current word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Change file to executable from nvim
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

