return {
  "artemave/workspace-diagnostics.nvim",
  name = "workspace-diagnostics",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    vim.api.nvim_set_keymap('n', '<space>x', '', {
      noremap = true,
      callback = function()
        for _, client in ipairs(vim.lsp.get_clients()) do
          require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
      end
    })
  end
}
