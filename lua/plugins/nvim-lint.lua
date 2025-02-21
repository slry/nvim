return {
  "mfussenegger/nvim-lint",
  config = function()
    local nvimlint = require("lint")
    nvimlint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- vue = { "eslint_d" },
      python = { "flake8" },
      yaml = { "yamllint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
        local client = get_clients({ bufnr = 0 })[1] or {}

        nvimlint.try_lint(nil, { cwd = client.root_dir })
      end,
    })
  end
}
