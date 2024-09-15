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
    'hrsh7th/cmp-vsnip'
  },
  config = function()
    local node_path = '/home/slrypc/.nvm/versions/node/v20.12.0/lib/node_modules/'
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "tailwindcss",
        "cssmodules_ls",
        "cssls",
        "html",
        "clangd",
        "dockerls",
        "yamlls",
        "volar",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["lua_ls"] = function()
          local lsp = require('lspconfig')
          lsp.lua_ls.setup({
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT',
                },
                diagnostics = {
                  globals = { 'vim', 'require' }
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                  enable = false,
                },
              }
            }
          })
        end,

        ["ts_ls"] = function()
          local lsp = require('lspconfig')
          lsp.ts_ls.setup({
            capabilities = capabilities,
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = node_path .. '@vue/typescript-plugin',
                  languages = { "javascript", "typescript", "vue" },
                },
              },
            },
            filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
            cmd = { "typescript-language-server", '--stdio' },
          })
        end,

        ["volar"] = function()
          local lsp = require('lspconfig')
          lsp.volar.setup({
            capabilities = capabilities,
            init_options = {
              typescript = {
                tsdk = node_path .. 'typescript/lib',
              }
            },
            on_new_config = function(new_config, _)
              new_config.init_options.typescript.tsdk = node_path .. 'typescript/lib'
            end
          })
        end,

        ["cssls"] = function()
          local lsp = require('lspconfig')
          lsp.cssls.setup({
            capabilities = capabilities,
            filetypes = { 'css' },
          })
        end,
      }
    })
  end
}
