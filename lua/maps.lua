-- Move tabs
vim.keymap.set('n', '<C-l>', ':tabn<cr>')
vim.keymap.set('n', '<C-h>', ':tabp<cr>')

-- cd to current directory
vim.keymap.set('n', '<leader>cd', ':cd %:h<cr>', { silent = true })

-- Terminal normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Open a .vimrc in a new tab
vim.keymap.set('n', '<F7>', ':tabedit ~/.config/nvim/init.lua<cr>', { silent = true })

-- Move in Vimdows
vim.keymap.set('n', '<up>', '<C-w>k')
vim.keymap.set('n', '<down>', '<C-w>j')
vim.keymap.set('n', '<left>', '<C-w>h')
vim.keymap.set('n', '<right>', '<C-w>l')

vim.keymap.set('n', '<C-n>', '<cmd>Neotree<cr>', { silent = true })

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
