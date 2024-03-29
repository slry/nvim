local status, nvimlint = pcall(require, "lint")
if not status then
  return
end

nvimlint.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "flake8" },
  dockerfile = { "hadolint" }
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    nvimlint.try_lint()
  end,
})
