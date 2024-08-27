vim.cmd([[
  syntax on
  hi Error NONE
]])
--  colors gruvbox
--  hi Normal guibg=NONE ctermbg=NONE
--  hi Visual guibg=#505050 guifg=NONE gui=NONE

-- CMP highlights
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#808080', bg = 'NONE' })
-- white
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#ffffff', bg = 'NONE' })
-- red
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#FB4934', bg = 'NONE' })
-- aqua
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#83A598', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = '#83A598', bg = 'NONE' })
-- purple
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = '#D3869B', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = '#D3869B', bg = 'NONE' })
-- yellow
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#FABD2F', bg = 'NONE' })
-- aqua
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#8EC07C', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#8EC07C', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = '#8EC07C', bg = 'NONE' })
-- orange
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- git gutter highlights

vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = '#6CC644', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#FABD2F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = '#FB4934', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitGutterChangeDelete', { fg = '#FE8019', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = '#282828', bg = 'NONE' })
