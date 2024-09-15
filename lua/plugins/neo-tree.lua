return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")
    local highlights = require("neo-tree.ui.highlights")

    vim.api.nvim_set_hl(0, 'NeoTreeDir-app', { fg = '#514466' })
    vim.api.nvim_set_hl(0, 'NeoTreeDir-pages', { fg = '#17414A' })
    vim.api.nvim_set_hl(0, 'NeoTreeDir-widgets', { fg = '#244A2B' })
    vim.api.nvim_set_hl(0, 'NeoTreeDir-features', { fg = '#403904' })
    vim.api.nvim_set_hl(0, 'NeoTreeDir-entities', { fg = '#313336' })
    vim.api.nvim_set_hl(0, 'NeoTreeDir-shared', { fg = '#6B3C3F' })

    local fsd_hls = {
      app = { 'app', 'application' },
      pages = { 'pages', 'views' },
      widgets = { 'widgets' },
      features = { 'features' },
      entities = { 'entities' },
      shared = { 'shared' },
    }

    local function get_hl(node_name, dir, hl)
      if string.match(node_name, dir) then
        return 'NeoTreeDir-' .. hl
      end

      return nil
    end

    neotree.setup({
      filesystem = {
        components = {
          icon = function(config, node, state)
            local icon = config.default or " "
            local padding = config.padding or " "
            local highlight = config.highlight or highlights.FILE_ICON

            if node.type == "directory" then
              highlight = highlights.DIRECTORY_ICON
              if node:is_expanded() then
                icon = config.folder_open or "-"
              else
                icon = config.folder_closed or "+"
              end

              -- check if node.path contains 'src'
              if string.match(node.path, 'src') then
                local br = false
                -- iter over fsd_hls array
                for key, hl_value in pairs(fsd_hls) do
                  for _, value in ipairs(hl_value) do
                    local hl = get_hl(node.name, value, key)
                    if hl then
                      highlight = hl
                      br = true
                      break
                    end
                  end

                  if br then
                    break
                  end
                end
              end
            elseif node.type == "file" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              if success then
                local devicon, hl = web_devicons.get_icon(node.name, node.ext)
                icon = devicon or icon
                highlight = hl or highlight
              end
            end

            return {
              text = icon .. padding,
              highlight = highlight,
            }
          end,
        }
      }
    })

    vim.keymap.set('n', '<C-n>', '<cmd>Neotree<cr>', { silent = true })
  end
}
