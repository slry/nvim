return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    'hrsh7th/cmp-vsnip',
  },
  config = function()
    local require_lsp = function(path)
      return require('plugins.lsp.config.' .. path)
    end

    local utils = require_lsp('utils')


    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "html",
        "clangd",
        "dockerls",
        "yamlls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          if server_name == "tailwindcss" then return end

          require("lspconfig")[server_name].setup {
            capabilities = utils.capabilities,
            on_attach = utils.on_attach,
          }
        end,

        ['vtsls'] = require_lsp('handlers.vtsls'),
        ["lua_ls"] = require_lsp('handlers.lua_ls'),
      }
    })

    local lspconfig = require('lspconfig')

    lspconfig.ts_query_ls.setup {
      capabilities = utils.capabilities,
      on_attach = utils.on_attach,
    }


    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  end
}
