return function()
  local lsp = require('lspconfig')
  local utils = require('plugins.lsp.config.utils')

  lsp.vtsls.setup({
    init_options = { hostInfo = 'neovim' },
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = {
      vtsls = {
        autoUseWorkspaceTsdk = false
      },
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
end
