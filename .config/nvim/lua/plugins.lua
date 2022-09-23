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

  use { 'folke/tokyonight.nvim',  branch= 'main' }

  use 'mattn/emmet-vim'
  use 'NvChad/nvim-colorizer.lua'
  use "ziontee113/color-picker.nvim"
  use {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
    require("colortils").setup()
  end,
}

  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'jvgrootveld/telescope-zoxide'
  use 'cljoly/telescope-repo.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'kelly-lin/telescope-ag'
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }

  use { 'ibhagwan/fzf-lua' }

  -- use 'justinmk/vim-dirvish'
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

  -- -- " For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'honza/vim-snippets'


  -- -- " For vsnip grs.
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'

  -- use { 'echasnovski/mini.nvim', branch = 'stable' }
  use "lukas-reineke/indent-blankline.nvim"

  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'
 
  use "stevearc/dressing.nvim"
  use({
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker")
    end,
  })

end)

