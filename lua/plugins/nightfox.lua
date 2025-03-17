return {
  "EdenEast/nightfox.nvim",
  config = function()
    require('nightfox').setup({
      options = {
        transparent = true,
      },
      -- groups = {
      --   duskfox = {
      --     NormalFloat = { bg = "NONE" }
      --   }
      -- }
    })
    vim.cmd.colorscheme("duskfox")
  end
}
