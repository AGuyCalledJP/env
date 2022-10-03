--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap


-- Save
map('n', '<C-s>', [[:w<cr>]], {})

-- Toggle nvim-tree
map('n', '<C-b>', [[:NvimTreeToggle<cr>]], {})

-- Toggle telescope
map('n', '<C-p>', [[:Telescope find_files<cr>]], {})


-- BARBAR KEY MAPPINGS --

local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<C-S-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<C-S-l>', '<Cmd>BufferMoveNext<CR>', opts)

-- Close buffer
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

-- Goto buffer in position...
-- map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
