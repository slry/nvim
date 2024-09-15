return {
  'nvim-treesitter/nvim-treesitter',
  --tag = 'v0.9.2',
  version = false,
  build = ':TSUpdate',
  lazy = vim.fn.argc(-1) == 0,
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },

    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
