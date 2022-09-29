--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree
map('n', 'tr', [[:NvimTreeToggle]], {})
map('n', 'tel', [[:Telescope find_files]], {})
