vim.keymap.set('n', '<S-F2>', [[:Telescope find_files<cr>]], {})
vim.keymap.set('n', '<S-F1>', [[:Telescope live_grep<cr>]], {})
vim.keymap.set('n', '<leader>vrr', [[:lua require'telescope.builtin'.lsp_references{}<cr>]], {})
