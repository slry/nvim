local status, conform = pcall(require, 'conform')
if not status then
  return
end

conform.setup({
  formatters_by_ft = {
    python = { "autopep8", "autoflake" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true
  }
})
