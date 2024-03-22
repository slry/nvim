-- move in insert mode
vim.keymap.set('i', '<C-k>', '<C-o>gk')
vim.keymap.set('i', '<C-j>', '<C-o>gj')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- cd to current directory
vim.keymap.set('n', '<leader>cd', ':cd %:h<cr>', { silent = true })

-- Terminal normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Open a .vimrc in a new tab
vim.keymap.set('n', '<F7>', ':tabedit ~/.config/nvim/init.lua<cr>', { silent = true })

-- Move buffers
vim.keymap.set('n', '<M-k>', ':bn<cr>', { silent = true })
vim.keymap.set('n', '<M-j>', ':bp<cr>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { silent = true })
vim.keymap.set('n', '<leader>bc', ':%bd|e#<cr>', { silent = true })

vim.keymap.set('n', '<C-n>', '<cmd>Neotree<cr>', { silent = true })

-- Greatest remap ever
vim.keymap.set('x', '<space>p', '"_dP')

-- open Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')

-- open Terminal
vim.keymap.set('n', '<leader>tt', '<cmd>FloatermNew<cr>')

-- DAP
vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
vim.keymap.set('n', '<F4>', '<cmd>lua require"dap".continue()<cr>')
vim.keymap.set('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>')
vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".step_over()<cr>')
vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<cr>')
vim.keymap.set('n', '<leader>dl', '<cmd>lua require"dap".run_last()<cr>')

vim.keymap.set('n', '<F3>', '<cmd>lua require"dapui".toggle()<cr>')

-- resize window
vim.keymap.set('n', '<C-up>', ':resize -2<cr>')
vim.keymap.set('n', '<C-down>', ':resize +2<cr>')
vim.keymap.set('n', '<C-left>', ':vertical resize -2<cr>')
vim.keymap.set('n', '<C-right>', ':vertical resize +2<cr>')

-- copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')

-- split
vim.keymap.set('n', '<leader>vs', ':vsplit<cr>')
vim.keymap.set('n', '<leader>hs', ':split<cr>')

-- copilot accept remap
vim.cmd([[
  imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

-- autosession
vim.keymap.set('n', '<leader>ss', require('auto-session.session-lens').search_session, { noremap = true })
