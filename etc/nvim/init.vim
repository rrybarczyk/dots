" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" LSP configuration
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" " Autocompletion plugin (optional, but recommended)
Plug 'hrsh7th/nvim-cmp'          " Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'      " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'        " Buffer completions
Plug 'hrsh7th/cmp-path'          " Path completions
Plug 'hrsh7th/cmp-cmdline'       " Command-line completions
Plug 'hrsh7th/cmp-vsnip'         " Snippet completions
Plug 'hrsh7th/vim-vsnip'         " Snippet engine

" " Optional: Status line plugin
Plug 'nvim-lualine/lualine.nvim'

Plug 'christoomey/vim-tmux-navigator'                   " Tmux integration
Plug 'preservim/nerdtree',     {'on': 'NERDTreeToggle'} " File drawer
Plug 'preservim/nerdcommenter'                          " Easy commenting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Nerdtree file ext highlights
Plug 'preservim/nerdtree'                               " File explorer

Plug 'junegunn/fzf'         " Fuzzy find
Plug 'junegunn/fzf.vim'     " Fuzzy find

" Initialize plugin system
call plug#end()

"------------------------------------------------------------------
"---------------------------- My Syntax ----------------------------
let mapleader = "\<space>"  " space is my leader
set pastetoggle=<F9>        " map `:set paste` to F9 (can use in insert mode!)

" Enable 24-bit RGB colors
if (has("termguicolors"))
 set termguicolors
endif
colorscheme codedark

set hidden
set backspace=indent,eol,start

syntax enable
set encoding=UTF-8

set nu rnu                  " Hybrid relative line number
set shiftwidth=4            " Number of spaces to use for autoindent
set softtabstop=4           " Number of spaces tab counts
set autoindent              " Keep indentation from previous line
set smartindent             " Auto-indent on new lines
set cindent                 " Like smartindent, but stricter and more customizable
set tabstop=2               " Sets tab to be 2 spaces
set expandtab               " Use spaces not tabs
set nowrap                  " Do not visually wrap long lines
set smartcase					      " Search case-insensitive if everything is lower case
set hlsearch					      " Highlight search terms
set incsearch					      " Highlight search terms as you type
set nobackup			          " Do not create backup files
set spell spelllang=en_us   " Spell check
set cursorline              " Highlight the current line
set colorcolumn=100
" Enable code folding
" zc to close a fold at the cursor.
" zo to open a fold at the cursor.
" zM to close all folds.
" zR to open all folds.
" za to toggle a fold at the cursor.
" zC to close all folds under the cursor recursively.
" zO to open all folds under the cursor recursively.
" set foldmethod=syntax " alternative to indent
" set foldmethod=indent   " alternative to syntax


" ctrl-t finds all capital letters in a file
nmap <c-t> /[A-Z]<return>

"Intuitive vim split jump commands
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Quickly switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Enable LSP support for Rust
lua << EOF
require'lspconfig'.rust_analyzer.setup{
    cmd = { "rust-analyzer" },
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-w>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    end,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
        }
    }
}
EOF

" Optional: Setup nvim-cmp for autocompletion
lua << EOF
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})
EOF

" Optional: Configure lualine for a nice status line
lua << EOF
require'lualine'.setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  }
}
EOF

" Optional: Key mapping to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Optional: FZF key mapping to find files
nnoremap <C-p> :Files<CR>


nnoremap <c-p> :GFiles<cr>
nnoremap <C-p> :Files<CR>
" ctrl-t -> open file in new tab
" ctrl-s -> open file in new horizontal split
" ctrl-v -> open file in new vertical split
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" ----------------------------------------------- RUST --------------------------------------------
let g:rustfmt_autosave=1            "Auto format with rustfmt on save

" ----------------------------------------------- SEARCH ------------------------------------------
nnoremap <c-p> :GFiles<cr>
nnoremap <C-p> :Files<CR>
" ctrl-t -> open file in new tab
" ctrl-s -> open file in new horizontal split
" ctrl-v -> open file in new vertical split
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'rg --files'

" ----------------------------------------------- NERDCommenter -----------------------------------
" automatically close nerd tree when you open a file
let NERDTreeQuitOnOpen = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------- NERDTree Side Bar -------------------------------
"https://github.com/scrooloose/nerdtree.git
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open and close NERDTree with ctrl-o
map <C-o> :NERDTreeToggle<CR>
" close vim with q if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Close file
nnoremap <leader>q :bp<cr>:bd #<cr>
" Toggles NERDTree side bar
map <C-o> :NERDTreeToggle<CR>
" Disables bookmarks and 'Press ? for help' text
let NERDTreeMinimalUI = 1
" Displays line numbers
let NERDTreeShowLineNumbers = 1
" Show hidden files
let NERDTreeShowHidden = 1
" Change current working dir based on file location
let NERDTreeChDirMode = 2
" Use natural sort order
let NERDTreeNaturalSort = 1
let g:NERDTreeWinSize = 35 

" -------------------------------------------------------------------------------------------------
"put cursor on file upon startup
autocmd VimEnter * wincmd p
" mapping for moving files
nnoremap gT :bprev<CR>
nnoremap gt :bnext<CR>
" mapping for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>:nohl<cr>

" For when I press shift accidentally
" :command W w
" :command Q q
" :command Wa wa
" :command WA wa
" :command Wq wq
" :command WQ wq
" :command Wqa wqa
" :command WQa wqa
" :command WQA wqa
