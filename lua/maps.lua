-- Move tabs
vim.keymap.set('n', '<C-l>', ':tabn<cr>')
vim.keymap.set('n', '<C-h>', ':tabp<cr>')

-- cd to current directory
vim.keymap.set('n', '<leader>cd', ':cd %:h<cr>', {silent = true})

-- Terminal normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Open a .vimrc in a new tab
vim.keymap.set('n', '<F7>', ':tabedit ~/.config/nvim/init.lua<cr>', {silent = true})

-- Move in Vimdows
vim.keymap.set('n', '<up>', '<C-w>k')
vim.keymap.set('n', '<down>', '<C-w>j')
vim.keymap.set('n', '<left>', '<C-w>h')
vim.keymap.set('n', '<right>', '<C-w>l')

-- toggle CHADtree
vim.keymap.set('n', '<C-n>', '<cmd>CHADopen<cr>')

-- open Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')

-- open Terminal
vim.keymap.set('n', '<leader>tt', '<cmd>FloatermNew<cr>')


