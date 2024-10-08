return {
  "mfussenegger/nvim-lint",
  config = function()
    local nvimlint = require("lint")
    nvimlint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      python = { "flake8" },
      yaml = { "yamllint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        nvimlint.try_lint()
      end,
    })
  end
}
