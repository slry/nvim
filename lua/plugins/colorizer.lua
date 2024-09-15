return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup(nil, {
      RRGGBBAA = true,
      rgb_fn = true
    })
  end
}
