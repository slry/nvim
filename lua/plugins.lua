vim.cmd([[packadd packer.nvim]])

vim.g.neo_tree_remove_legacy_commands = 1
vim.g.copilot_proxy = vim.fn.readfile(vim.fn.expand("~/.copilot/.proxy"))[1]

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- startup screen
  use {
    'goolord/alpha-nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
  }

  -- colorscheme
  use 'ellisonleao/gruvbox.nvim'

  -- old vim
  --  use 'morhetz/gruvbox'
  --  use 'sainnhe/everforest'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- web dev icons
  use 'nvim-tree/nvim-web-devicons'

  -- tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- gitgutter
  use 'airblade/vim-gitgutter'
  use 'neovim/nvim-lspconfig'

  -- autopairs plugins
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'tpope/vim-fugitive'

  -- highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    tag = 'v0.9.2'
  }

  -- terminal
  use 'voldikss/vim-floaterm'

  -- telescope
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4'
  }

  -- mason
  use 'williamboman/mason.nvim'

  -- LaTeX stuff
  use 'lervag/vimtex'

  -- cmp stuff
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

  -- surround
  use 'kylechui/nvim-surround'

  -- copilot
  use 'github/copilot.vim'

  -- snips
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- lspkind
  use 'onsails/lspkind-nvim'

  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- leap
  use 'ggandor/leap.nvim'

  -- formatting
  use "stevearc/conform.nvim"

  -- linting
  use "mfussenegger/nvim-lint"

  use "MunifTanjim/nui.nvim"

  -- react styled components
  use "styled-components/vim-styled-components"

  -- auto session
  use "rmagatti/auto-session"

  -- tmux integration
  use "christoomey/vim-tmux-navigator"

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- indents
  use "lukas-reineke/indent-blankline.nvim"

  -- comment
  use 'numToStr/Comment.nvim'
end)
