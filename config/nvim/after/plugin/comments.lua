require('Comment').setup()

local api = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
)

-- Toggle current line (linewise) using C-/
vim.keymap.set('n', '<C-_>', api.toggle.linewise.current)

-- Toggle selection (linewise)
vim.keymap.set('x', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)
