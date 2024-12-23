return {
  'stevearc/oil.nvim',
  enabled = false,
  config = function()
    vim.keymap.set('n', '<C-n>', ':Oil<cr>')
    require('oil').setup({
      default_file_explorer = true,
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["s"] = { "actions.select", opts = { vertical = true } },
        ["S"] = { "actions.select", opts = { horizontal = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
      use_default_keymaps = false,

    })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
