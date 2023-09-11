require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Toggle nvim-tree
vim.keymap.set('n', '<C-b>', [[:NvimTreeToggle<cr>]], {})
