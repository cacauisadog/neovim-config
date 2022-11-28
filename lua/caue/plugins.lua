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
    print "Installing packer - close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save this file
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
        end
    },
}


-- Install plugins here
return packer.startup(function(use)
    -- my plugins here
    use "wbthomason/packer.nvim"  -- Have packer manage itself
    use "nvim-lua/popup.nvim"  --  An implementation of the Popup API from vim in neovim
    use "nvim-lua/plenary.nvim"  --  Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim"  -- Easily comment stuff
    use "akinsho/bufferline.nvim"  -- Buffer "tabs" kinda like vscode
    use "moll/vim-bbye"  -- Better closing of buffers
    use "nvim-lualine/lualine.nvim"  -- Status line
    use "akinsho/toggleterm.nvim"  -- Toggle terminal
    use "ahmedkhalf/project.nvim"  -- Project manager
    use "lewis6991/impatient.nvim"  -- Faster plugins load
    use "lukas-reineke/indent-blankline.nvim"  --  Shows vertical indentation
    use "goolord/alpha-nvim"  -- Launcher menu
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use "folke/which-key.nvim"  -- Shows possible next key presses for shortcuts
    use "Shatur/neovim-session-manager"  -- Session manager
    use "nvim-telescope/telescope-ui-select.nvim"  -- Change the default ui.select to telescope
    use "ThePrimeagen/harpoon"  --  Better mark system to switch between files
    use "karb94/neoscroll.nvim" -- Smooth scrolling

    -- colorschemes
    use 'folke/tokyonight.nvim'
    use "gruvbox-community/gruvbox"
    use "martinsione/darkplus.nvim"
    use "haishanh/night-owl.vim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp"  -- The completion plugin
    use "hrsh7th/cmp-buffer"  -- buffer completions
    use "hrsh7th/cmp-path"  -- path completions
    use "hrsh7th/cmp-cmdline"  --  cmdline completions
    use "saadparwaiz1/cmp_luasnip"  --  snippet completions
    use "hrsh7th/cmp-nvim-lsp"  -- lsp completions
    use "hrsh7th/cmp-nvim-lua"  -- lua completions


    -- snippets
    use "L3MON4D3/LuaSnip"  --  snippet engine
    use "rafamadriz/friendly-snippets"  --  a bunch of snippets to use

    -- LSP 
    use "neovim/nvim-lspconfig"  -- enable LSP
    use "williamboman/nvim-lsp-installer"  -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim"  -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "nvim-telescope/telescope-live-grep-args.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "windwp/nvim-ts-autotag"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Nvim Tree, for file tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",  -- optional for file icons
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end, after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
