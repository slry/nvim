vim.cmd([[packadd packer.nvim]])
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'morhetz/gruvbox'
  use 'sainnhe/everforest'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  -- use {
  --   'ms-jpq/chadtree',
  --   branch = 'chad',
  --   run = 'python3 -m chadtree deps'
  -- }
  -- use 'tiagofumo/vim-nerdtree-syntax-highlight'

  -- gitgutter
  use 'airblade/vim-gitgutter'
  use 'neovim/nvim-lspconfig'

  -- autopairs plugins
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'tpope/vim-fugitive'

  -- copilot
  use 'github/copilot.vim'

  -- highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- terminal
  use 'voldikss/vim-floaterm'

  -- telescope
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0'
  }

  -- mason
  use 'williamboman/mason.nvim'

  -- dap
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use 'rcarriga/nvim-dap-ui'

  -- LaTeX stuff
  use 'lervag/vimtex'

  -- cmp stuff
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

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

  -- jupyter python
  use { "untitled-ai/jupyter_ascending.vim" }

end)
