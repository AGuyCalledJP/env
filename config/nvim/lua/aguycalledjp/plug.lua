-- [[ plug.lua ]]

return require("lazy").setup({
	"MunifTanjim/nui.nvim",
	"RRethy/vim-illuminate",
	"Yggdroot/indentLine",
	"folke/noice.nvim",
	"folke/trouble.nvim",
	"lewis6991/gitsigns.nvim",
	"mbbill/undotree",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"rcarriga/nvim-notify",
	"romgrk/barbar.nvim",
	"stevearc/conform.nvim",
	"tpope/vim-fugitive",
	"windwp/nvim-autopairs",
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{ "echasnovski/mini.indentscope", version = "*" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "AlphaTechnolog/pywal.nvim", name = "pywal" },
	{ "simrat39/symbols-outline.nvim", lazy = true },
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
