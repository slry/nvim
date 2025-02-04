return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "autopep8", "autoflake" },
      javascript = { "prettierd", "eslint_d" },
      typescript = { "prettierd", "eslint_d" },
      javascriptreact = { "prettierd", "eslint_d" },
      typescriptreact = { "prettierd", "eslint_d" },
      vue = { "prettier", "eslint" },
      css = { "prettierd" }
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_fallback = true
    }
  }
}
