return {
  'github/copilot.vim',
  init = function()
    vim.g.copilot_proxy = vim.fn.readfile(vim.fn.expand("~/.copilot/.proxy"))[1]
    vim.cmd([[
      imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")
      let g:copilot_no_tab_map = v:true
    ]])
  end
}
