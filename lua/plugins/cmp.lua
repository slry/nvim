return {
  'hrsh7th/nvim-cmp',
  dependecies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-vsnip'
  },
  config = function()
    local lspkind = require('lspkind')
    local cmp = require('cmp')

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup({
      performance = {
        max_view_entries = 15
      },
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-space>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        })
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' }
      }),
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)

    -- if colorscheme is gruvbox
    if vim.g.colors_name == 'gruvbox' then
      -- CMP highlights
      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#808080', bg = 'NONE' })
      -- white
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#ffffff', bg = 'NONE' })
      -- red
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#FB4934', bg = 'NONE' })
      -- aqua
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#83A598', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = '#83A598', bg = 'NONE' })
      -- purple
      vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = '#D3869B', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = '#D3869B', bg = 'NONE' })
      -- yellow
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#FABD2F', bg = 'NONE' })
      -- aqua
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#8EC07C', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#8EC07C', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = '#8EC07C', bg = 'NONE' })
      -- orange
      vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#FE8019', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#FE8019', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = '#FE8019', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#FE8019', bg = 'NONE' })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
    end
  end
}
