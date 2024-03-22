-- set yaml.ansible filetype to yamls in ansible directory
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*/ansible/*.yml", "*/ansible/*.yaml" },
  callback = function()
    vim.api.nvim_set_option_value("filetype", "yaml.ansible", { scope = "local" })
  end

})
