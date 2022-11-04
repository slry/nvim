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

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymaps = {
    jump_to_mark = '<leader>ll',
  }
}
