vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Save
map("n", "<C-s>", [[:w<cr>]], opts)

vim.keymap.set("n", "<leader>w", [[:lua require('nvim-window').pick()<CR>]], {})

-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>k", ":resize -5<CR>", opts)
map("n", "<leader>j", ":resize +5<CR>", opts)
map("n", "<leader>h", ":vertical resize -5<CR>", opts)
map("n", "<leader>l", ":vertical resize +5<CR>", opts)

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

-- Allow replace of current word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Change file to executable from nvim
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Send quick terminal command
vim.keymap.set("n", "<leader>t", ":!", {})

-- Add yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
