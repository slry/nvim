vim.cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps'
  }
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
--  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-autopairs'
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }
  use {
    'ms-jpq/coq.thirdparty',
    branch = '3p'
  }
  use 'tpope/vim-fugitive'
  use 'github/copilot.vim'
--  use 'jparise/vimtex'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'voldikss/vim-floaterm'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0'
  }
  use 'williamboman/mason.nvim'
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use 'rcarriga/nvim-dap-ui'
end)
