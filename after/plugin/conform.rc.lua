local status, conform = pcall(require, 'conform')
if not status then
  return
end

conform.setup({
  formatters_by_ft = {
    python = { "autopep8", "autoflake" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    vue = { "prettier" }
  },
  format_on_save = {
    timeout_ms = 2500,
    lsp_fallback = true
  }
})
