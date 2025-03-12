return {
  'esmuellert/nvim-eslint',
  ft = 'javascript,typescript,typescriptreact,javascriptreact',
  config = function()
    local M = require('nvim-eslint')
    -- local prev_work_dir = nil
    M.setup({
      settings = {
        format = true,
        workingDirectory = function(bufnr)
          local new_work_dir = vim.fs.root(bufnr, { 'package.json' })

          -- if has */node_modules/* in path, return previous work dir
          -- if new_work_dir:find('node_modules') then
          --   return { directory = prev_work_dir }
          -- end
          --
          -- prev_work_dir = new_work_dir
          --
          -- print('ESLint: Setting working directory to ' .. new_work_dir)
          return { directory = new_work_dir }
        end,
        workspaceFolder = function(bufnr)
          local git_dir = M.resolve_git_dir(bufnr)
          return {
            uri = vim.uri_from_fname(git_dir),
            name = vim.fn.fnamemodify(git_dir, ':t'),
          }
        end,
      }
    })
  end
}
