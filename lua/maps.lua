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

-- get current buffer file path
vim.keymap.set('n', '<space>;', ":lua print(vim.fn.expand('%'))<cr>")

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

-- quickfix list maps
vim.keymap.set('n', '<space>]', '<cmd>cnext<cr>')
vim.keymap.set('n', '<space>[', '<cmd>cprev<cr>')

-- reload lsp
vim.keymap.set('n', '<leader>r', '<cmd>LspRestart<cr>')
