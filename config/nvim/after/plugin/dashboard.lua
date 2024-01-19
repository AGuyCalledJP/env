require("dashboard").setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Lazy", group = "@property", action = "Lazy", key = "l" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Commands",
				group = "DiagnosticHint",
				action = "Telescope commands",
				key = "c",
			},
		},
	},
})
