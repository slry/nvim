return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "autopep8", "autoflake" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      -- vue = { "prettier", "eslint_d" },
      css = { "prettierd" }
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_fallback = true,
    }
  }
}
