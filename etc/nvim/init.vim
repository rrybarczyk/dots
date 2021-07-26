" https://otavio.dev/2018/09/30/migrating-from-vim-to-neovim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

set rtp+=~/.fzf
"------------------------------------------------------------------
"---------------------------- Plug --------------------------------
"https://github.com/junegunn/vim-plug
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" NERDTree
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree',     {'on': 'NERDTreeToggle'} " nerd tree file drawer

" NERDCommenter
Plug 'preservim/nerdcommenter'

" Adds syntax for nerdtree on most common file extensions
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'

" Rust Synatx
Plug 'rust-lang/rust.vim'

" TOML Syntax
Plug 'cespare/vim-toml'

" C++ Syntax
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown Syntax
Plug 'tpope/vim-markdown'

" ARMv6/7 Assembly Syntax
Plug 'ARM9/arm-syntax-vim'
au BufNewFile,BufRead *.s,*.S set filetype=arm

" OpenCL (Open Computing Language) Syntax
Plug 'petRUShka/vim-opencl'

" Python Flake8 Linter
Plug 'nvie/vim-flake8'

" Matlab Syntax
Plug 'lazywei/vim-matlab'

" LaTeX Syntax
Plug 'lervag/vimtex'

" Haskell Syntax
Plug 'neovimhaskell/haskell-vim'

" Fuzzy searching using fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A very fast, multi-syntax context-sensitive color name highlighter
Plug 'ap/vim-css-color'

" Highlight sass colors and color variables
Plug 'cakebaker/scss-syntax.vim'

Plug 'alvan/vim-closetag'

" C++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

call plug#end()

"------------------------------------------------------------------
"---------------------------- My Syntax ----------------------------
let mapleader = "\<space>"  " space is my leader
set pastetoggle=<F9>        " map `:set paste` to F9 (can use in insert mode!)

if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox
if has ("autocmd")
   filetype plugin indent on
endif
set hidden
set backspace=indent,eol,start

set nu rnu								   "Hybrid relative line number
set ru									   "Ruler
" The ":syntax enable" command will keep your current color settings.  This
" allows using ":highlight" commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use: > :syntax on
" syntax on
syntax enable
set encoding=UTF-8

set shiftwidth=2
set softtabstop=2                   "Indent by 2 spaces when pressing <TA>
set autoindent                      "Keep indentation from previous line
set smartindent                     "Automatically inserts indentation in some cases
set cindent                         "Like smartindent, but stricter and more customizable
set tabstop=2                       "Sets tab to be 2 spaces
set expandtab
set nowrap                          "Do not visually wrap long lines
set smartcase					    "Search case-insensitive if everything is lower case
set hlsearch					    "Highlight search terms
set incsearch					    "Highlight search terms as you type
set nobackup			            "Do not create backup files
set spell spelllang=en_us           "Spell check

"Intuitive vim split jump commands
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Quickly switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"-----------------------------------------------------------------------------
"---------------------------------- RUST-ANALYZER LSP BEGIN ------------------
" https://sharksforarms.dev/posts/neovim-rust/

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

"---------------------------------- RUST-ANALYZER LSP END --------------------
"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
"---------------------------------- LSP BEGIN --------------------------------
" LSP tab completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Code actions
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" """ Diagnostics
" " Set updatetime for CursorHold
" " 300ms of no cursor movement to trigger CursorHold
" set updatetime=300
" " Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" "vim.lsp.util.buf_clear_diagnostics(0, vim.lsp.util.get_line_diagnostics())
"
"
" " Goto previous/next diagnostic warning/error
" nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"
" " Fixed column for the diagnostics, removes warnings/errors jitter
" set signcolumn=yes
"
" " Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
" \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

"---------------------------------- LSP END ----------------------------------
"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
"---------------------------------- RUST -------------------------------------
let g:rustfmt_autosave=1            "Auto format with rustfmt on save


"------------------------------------------------------------------
"---------------------------- Fuzzy -------------------------------
" Search files with FZF
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

" Uses silversearcher-ag to ignore searching files in .gitignore and
" node_modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"------------------------------------------------------------------
"---------------------------- NERDCommenter -----------------------
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

"---------------------------------------------------------------------------
"---------------------------- NERDTree Side Bar ----------------------------
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

" NERDTree Git Plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"-----------------------------------------------------------------------------
"---------------------------- Solarized Color Scheme -------------------------
let g:closetag_filenames = '*.html'

"---- HDL highlighting settings---
hi link vhdlError Normal " Remove annoying highlight

"-----------------------------------------------------------------------------
"---------------------------- Lightline --------------------------------------
let g:lightline = {
  \     'colorscheme': 'powerlineish',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

"-----------------------------------------------------------------------------
"---------------------------- Goyo & Limelight -------------------------------
nnoremap <Leader>gy :Goyo<CR>
" Only use Limelight when using Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!




"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
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
