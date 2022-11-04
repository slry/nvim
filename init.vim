call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'lervag/vimtex'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'
Plug 'rcarriga/nvim-dap-ui'
call plug#end()

filetype plugin indent on
syntax on
colors gruvbox

nnoremap <C-n> <cmd>CHADopen<cr>
nmap <C-l> :tabn<CR>
nmap <C-h> :tabp<CR>

" Telescope keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Terminal
nnoremap <leader>tt <cmd>FloatermNew<cr>

" Vim keymaps
nnoremap <leader>y "*y
nnoremap <silent> <leader>cd :cd %:h<cr>
tnoremap <Esc> <C-\><C-n>

" open a .vimrc in a new tab
nnoremap <silent> <F7> :tabedit /home/slry/.config/nvim/init.vim<CR>

" compile project
command Compile :call CompileProject()

" Maven keymaps
command CreateJavaProject :call CreateJavaProject()
command CompileJavaProject :call CompileJavaProject()

function! CompileProject()
  if expand('%:e') == 'java'
    call CompileJavaProject()
  endif

  if expand('%:e') == 'py'
    call CompilePythonProject()
  endif

  if expand('%:e') == 'c'
    call CompileCProject()
  endif
endfunction

function! CreateJavaProject()
  call inputsave()
  let companyName = input("Enter company name: ")
  let projectName = input("Enter project name: ")
  call inputrestore()
  echo "\r"
  echo "Creating project " . projectName . "..."
  execute "silent !mvn archetype:generate -DgroupId=" . companyName . " -DartifactId=" . projectName . " -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false"
  echo "\r"
  echo "Project " . projectName . " created!"
endfunction

function! CompileJavaProject()
  execute "silent !mvn package"
  let projectName = fnamemodify(getcwd(), ':t')
  execute ":FloatermNew! --wintype=split java -jar target/" . projectName . "-1.0-SNAPSHOT.jar"
endfunction

function! CompilePythonProject()
  execute ":FloatermNew! --wintype=split python3 %"
endfunction

function! CompileCProject()
  execute "silent !gcc -o %:r %"
  execute ":FloatermNew! --wintype=split ./%:r"
endfunction

function! CompileDebugCProject()
  execute "silent !gcc -g -o %:r %"
endfunction

" keymaps for Vimdows
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

nnoremap <leader>hl :set hlsearch!<CR>

" keymaps for DAP
nnoremap <silent> <F4> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F5> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F6> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

" keymaps for DAP UI
nnoremap <silent> <F3> <Cmd>lua require'dapui'.toggle()<CR> 

set number
set cindent
set tabstop=2
set expandtab
set shiftwidth=2
set laststatus=2
set t_Co=256
set incsearch
set nohlsearch

hi Normal guibg=NONE ctermbg=NONE
hi Error NONE

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" vimtex configuration
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

" COQ configuration
let g:coq_settings = { 'auto_start': 'shut-up', 'keymap': {'jump_to_mark': '<leader>ll', } }

lua << EOF
vim.o.mouse = "a"

local mason = require("mason")
local mason_registry = require("mason-registry")
mason.setup()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lsp = require('lspconfig')
local coq = require('coq')

lsp.pyright.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
}))

lsp.clangd.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
}))

lsp.jdtls.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
}))

lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}))

local dap = require('dap')
local dapui = require("dapui")
dap.adapters.python = {
  type = 'executable';
  command = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python";
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000
}

dap.configurations.c = {
  {
        type = 'codelldb';
        request = 'launch';
        program = function()
            startServer()
            return vim.fn.getcwd() .. '/${fileBasenameNoExtension}'
        end;
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}';
        terminal = 'integrated';
  }
}

dap.configurations.cpp = dap.configurations.c

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()

require("nvim-autopairs").setup {}

function startServer()
  vim.cmd('FloatermNew! --silent --autoclose=1 ~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb --port 13000')
  vim.cmd('call CompileDebugCProject()')
end

EOF
