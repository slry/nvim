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

  -- web dev icons
  use 'nvim-tree/nvim-web-devicons'

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

  -- gitgutter
  use 'airblade/vim-gitgutter'
  use 'neovim/nvim-lspconfig'

  -- autopairs plugins
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'tpope/vim-fugitive'

  -- tab out of pairs
  use 'abecodes/tabout.nvim'

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

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require('copilot_cmp').setup()
    end
  }

  -- copilot
  use { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

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

  -- leap
  use 'ggandor/leap.nvim'

  -- react extract
  use 'napmn/react-extract.nvim'

  -- formatting
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use "MunifTanjim/nui.nvim"

  use({
    'jackMort/ChatGPT.nvim',
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)
