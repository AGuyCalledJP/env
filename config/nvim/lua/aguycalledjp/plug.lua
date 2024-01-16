-- [[ plug.lua ]]

return require("lazy").setup({
	"MunifTanjim/nui.nvim",
	"RRethy/vim-illuminate",
	"Yggdroot/indentLine",
	"folke/flash.nvim",
	"folke/noice.nvim",
	"folke/trouble.nvim",
	"junegunn/gv.vim",
	"lewis6991/gitsigns.nvim",
	"majutsushi/tagbar",
	"mbbill/undotree",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"rcarriga/nvim-notify",
	"romgrk/barbar.nvim",
	"stevearc/conform.nvim",
	"tpope/vim-fugitive",
	"windwp/nvim-autopairs",
	{ "AlphaTechnolog/pywal.nvim", name = "pywal" },
	{ "epwalsh/obsidian.nvim", lazy = true },
	{ "simrat39/symbols-outline.nvim", lazy = true },
	{ "stevearc/aerial.nvim", lazy = true },
	{ "yorickpeterse/nvim-window", lazy = true },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"oncomouse/lushwal",
		dependencies = {
			{ "rktjmp/lush.nvim", lazy = true },
			{ "rktjmp/shipwright.nvim", lazy = true },
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
})
