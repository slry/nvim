require('lazy_init')

require('base')
require('maps')
require('highlights')
require('custom')

require('lazy').setup({
  spec = {
    { import = 'plugins' }
  },
  checker = { enabled = true },
  change_detection = { enabled = true, notify = false },
})
