return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      pickers = {
        find_files = {
          hidden = true
        }
      },
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        mappings = {
          n = {
            ["S"] = actions.select_horizontal,
            ["s"] = actions.select_vertical
          }
        }
      }
    })

    -- open Telescope
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

    -- Telescope maps
    vim.keymap.set('n', '<leader>gr', '<cmd>lua require"telescope.builtin".lsp_references()<cr>')
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
  end
}
