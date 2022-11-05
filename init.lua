require('base')
require('plugins')
require('maps')
require('commands')

vim.cmd([[
  syntax on
  colors gruvbox
  hi Normal guibg=NONE ctermbg=NONE
  hi Error NONE
]])
