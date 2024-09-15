return {
  'goolord/alpha-nvim',
  dependecies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('alpha').setup(require('alpha.themes.dashboard').config)
  end
}
