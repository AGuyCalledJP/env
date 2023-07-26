-- [[ plug.lua ]]

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

function get_setup(name)
    return string.format('require("user/%s")', name)
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end                                                                                                                                              
]]                                                                                                                                                         
                                                                                                                                                           
-- Use a protected call so we don't error out on first use                                                                                                 
local status_ok, packer = pcall(require, "packer")                                                                                                         
if not status_ok then                                                                                                                                      
    return                                                                                                                                                 
end                                                                                                                                                        
                                                                                                                                                           
-- Have packer use a popup window                                                                                                                          
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons" -- icons
  use "kyazdani42/nvim-tree.lua" -- File tree
  use "DanilaMihailov/beacon.nvim" -- cursor jump
  use "nvim-lualine/lualine.nvim" -- statusline
  use "nvim-telescope/telescope.nvim" -- fuzzy finder
  use "majutsushi/tagbar" -- code structure
  use "Yggdroot/indentLine" -- see indentation
  use "tpope/vim-fugitive" -- git integration
  use "junegunn/gv.vim" -- commit history
  use "windwp/nvim-autopairs" -- auto close brackets, etc.
  use "nvim-treesitter/nvim-treesitter" -- better syntax highlighting
  use "romgrk/barbar.nvim" -- icons for pretty things
  use "mbbill/undotree"
  use "nvim-treesitter/playground"
  use {
      "oncomouse/lushwal",
      requires = {
        {"rktjmp/lush.nvim", opt = true },
        {"rktjmp/shipwright.nvim", opt = true },
      }
  }
  use "theprimeagen/harpoon"
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)
