return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        width = 60
      }
    }

    vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeOpen<cr>', { silent = true })
  end,
}
