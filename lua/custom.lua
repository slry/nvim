local autocmd = vim.api.nvim_create_autocmd
-- set yaml.ansible filetype to yamls in ansible directory
autocmd("BufRead", {
  pattern = { "*/ansible/*.yml", "*/ansible/*.yaml" },
  callback = function()
    vim.api.nvim_set_option_value("filetype", "yaml.ansible", { scope = "local" })
  end

})

-- stop LSP for node_modules
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*/node_modules/*',
  callback = function()
    vim.defer_fn(function()
      vim.cmd 'LspStop'
    end, 1000)
  end
})
