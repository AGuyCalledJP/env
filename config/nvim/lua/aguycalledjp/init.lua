require('aguycalledjp.vars')  -- Variables
require('aguycalledjp.opts')  -- Options
require('aguycalledjp.keys')  -- Keymaps
require('aguycalledjp.plug')  -- Plugins

require('leap').add_default_mappings()
require('gitsigns').setup()

vim.cmd.colorscheme "lushwal"
