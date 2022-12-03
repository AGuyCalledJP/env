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
  use "hashivim/vim-terraform" -- terraform highlighting
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
end)
