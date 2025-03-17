return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      pickers = {
        find_files = {
          hidden = true
        }
      },
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", ".png", ".ttf" },
        mappings = {
          n = {
            ["S"] = actions.select_horizontal,
            ["s"] = actions.select_vertical
          }
        }
      }
    })

    -- open Telescope
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>fd', builtin.lsp_dynamic_workspace_symbols)

    -- Telescope maps
    vim.keymap.set('n', '<leader>gr', '<cmd>lua require"telescope.builtin".lsp_references()<cr>')
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
  end
}
