call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'lervag/vimtex'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

filetype plugin indent on
syntax on
colors gruvbox

nnoremap <C-n> <cmd>CHADopen<cr>
nmap <C-l> :tabn<CR>
nmap <C-h> :tabp<CR>

" COC keymaps
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Telescope keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Vim keymaps
nnoremap <Leader>y "*y
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
  execute "silent !python3 -m venv venv"
  execute "silent !source venv/bin/activate"
  execute "silent !pip install -r requirements.txt"
  execute ":FloatermNew! --wintype=split python3 %"
endfunction

function! CompileCProject()
  execute "silent !gcc -o %:r %"
  execute ":FloatermNew! --wintype=split ./%:r"
endfunction

" keymaps for Vimdows
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

nnoremap <leader>hl :set hlsearch!<CR>

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

" coc for frontend development
let g:coc_global_extensions = [
	  \ 'coc-tsserver',
    \ 'coc-pairs',
    \ 'coc-snippets',
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	  let g:coc_global_extensions += ['coc-eslint']
endif

let g:closetag_filenames = '*.html,*.js,*.ts,*.jsx,*.tsx'

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" vimtex configuration
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

lua << EOF
vim.o.mouse = "a"
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

EOF
