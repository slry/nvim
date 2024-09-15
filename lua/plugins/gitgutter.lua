return {
  'airblade/vim-gitgutter',
  config = function()
    vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = '#6CC644', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#FABD2F', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = '#FB4934', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'GitGutterChangeDelete', { fg = '#FE8019', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { fg = '#282828', bg = 'NONE' })
  end
}
