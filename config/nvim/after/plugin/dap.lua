local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>db", [[::lua require'dap'.toggle_breakpoint()<cr>]], {})
vim.keymap.set("n", "<leader>dd", [[::lua require'dap'.continue()<cr>]], {})
vim.keymap.set("n", "<leader>dso", [[::lua require'dap'.step_over()<cr>]], {})
vim.keymap.set("n", "<leader>dsi", [[::lua require'dap'.step_into()<cr>]], {})
vim.keymap.set("n", "<leader>di", [[::lua require'dap'.repl.open()<cr>]], {})
