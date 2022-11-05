vim.cmd([[
  syntax on
  colors gruvbox
  hi Normal guibg=NONE ctermbg=NONE
  hi Error NONE
]])

-- CMP highlights
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#808080', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#FB4934', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#83A598', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#FABD2F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#8EC07C', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#8EC07C', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#FE8019', bg = 'NONE' })
