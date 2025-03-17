require('lazy_init')

require('base')
require('maps')
require('highlights')
require('custom')

require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins.utilities' },
    { import = 'plugins.lsp' }
  },
  checker = { enabled = true },
  change_detection = { enabled = true, notify = false },
})
