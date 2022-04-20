-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'christoomey/vim-system-copy'
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'

  use 'tpope/vim-commentary'

  use 'voldikss/vim-floaterm'
  use 'windwp/nvim-autopairs'
  use {'andymass/vim-matchup', event = 'VimEnter'}


  use { 'tami5/lspsaga.nvim' }  -- nightly
  use 'folke/trouble.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('gitsigns').setup() end }
  use 'kyazdani42/nvim-web-devicons'
  use { 'dsych/galaxyline.nvim', branch = 'bugfix/diagnostics', config = function() require'statusline' end, }

  -- use 'sainnhe/sonokai'
  -- use 'joshdick/onedark.vim'
  -- use 'chuling/vim-equinusocio-material'
  -- use 'arcticicestudio/nord-vim'
  -- use 'rakr/vim-one'
  -- use 'mhartington/oceanic-next'
  -- use 'haishanh/night-owl.vim'
  -- use {'dracula/vim', as = 'dracula'}
  -- use "EdenEast/nightfox.nvim" -- Packer
  -- use 'morhetz/gruvbox'

  use { 'folke/tokyonight.nvim',  branch= 'main' }

  use 'mattn/emmet-vim'
  use {'tjdevries/colorbuddy.vim'}

  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'jvgrootveld/telescope-zoxide'
  use 'cljoly/telescope-repo.nvim'

  -- use 'justinmk/vim-dirvish'
  use 'kyazdani42/nvim-tree.lua'
  use {
	"luukvbaal/nnn.nvim",
	config = function() require("nnn").setup() end
  }

  -- " interactions "leader ww
  -- use 'wesQ3/vim-windowswap' 
  use 'ggandor/lightspeed.nvim'
  use 'camspiers/lens.vim'
  -- use 'camspiers/animate.vim' -- cause issue with telescope

  use 'kabouzeid/nvim-lspinstall' 
  use 'neovim/nvim-lspconfig' 
  use 'jose-elias-alvarez/null-ls.nvim' 

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-calc'

  use 'MunifTanjim/prettier.nvim' 

  -- " For vsnip grs.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"

  -- use { 'echasnovski/mini.nvim', branch = 'stable' }
  use "lukas-reineke/indent-blankline.nvim"

end)

