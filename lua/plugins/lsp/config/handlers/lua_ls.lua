return function()
  local lsp = require('lspconfig')
  local utils = require('plugins.lsp.config.utils')

  lsp.lua_ls.setup({
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
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
end
