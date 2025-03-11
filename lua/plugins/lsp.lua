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
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, bufopts)
    end

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "vtsls",
        "eslint",
        "lua_ls",
        "html",
        "clangd",
        "dockerls",
        "yamlls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,

        ['eslint'] = function()
          local lsp = require('lspconfig')
          lsp.eslint.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              enabled = false,
              workingDirectories = { mode = 'auto' },
            },
            flags = {
              debounce_text_changes = 1000,
              allow_incremental_sync = false,
            }
          })
        end,

        ['vtsls'] = function()
          local lsp = require('lspconfig')
          lsp.vtsls.setup({
            init_options = { hostInfo = 'neovim' },
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              typescript = {
                tsserver = {
                  maxTsServerMemory = 8192,
                  useSeparateSyntaxServer = false,
                  useSyntaxServer = 'never',
                  experimental = {
                    enableProjectDiagnostics = true,
                  }
                },
                inlayHints = {
                  parameterNames = { enabled = "literals" },
                  parameterTypes = { enabled = true },
                  variableTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  enumMemberValues = { enabled = true },
                }
              },
            },
            handlers = {
              ["textDocument/publishDiagnostics"] = function(
                  _,
                  result,
                  ctx,
                  config
              )
                if result.diagnostics == nil then
                  return
                end

                local ignoreCodes = {
                  80001, -- File is a CommonJS module; it may be converted to an ES module.
                  6133,  -- 'x' is declared but its value is never read.
                  6196,  -- 'x' is declared but its value is never used.
                }

                -- ignore some tsserver diagnostics
                local idx = 1
                while idx <= #result.diagnostics do
                  local entry = result.diagnostics[idx]

                  local formatter = require('format-ts-errors')[entry.code]
                  entry.message = formatter and formatter(entry.message) or entry.message

                  -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
                  if vim.tbl_contains(ignoreCodes, entry.code) then
                    table.remove(result.diagnostics, idx)
                  else
                    idx = idx + 1
                  end
                end

                vim.lsp.diagnostic.on_publish_diagnostics(
                  _,
                  result,
                  ctx,
                  config
                )
              end,
            },

          })
        end,

        ["lua_ls"] = function()
          local lsp = require('lspconfig')
          lsp.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
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
      }
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  end
}
