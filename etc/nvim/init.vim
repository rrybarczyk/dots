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
"---------------------------------- RUST -------------------------------------
let g:rustfmt_autosave=1            "Auto format with rustfmt on save

" filetype indent on

" display digraphs
nnoremap <leader>hd :Capture digraphs<cr>
let mapleader = "\<space>"  " space is my leader
set pastetoggle=<F9>        " map `:set paste` to F9 (can use in insert mode!)

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

lua << EOF
require'lspconfig'.pyright.setup{}
EOF
" lua << EOF
" require'nvim_lsp'.pyls.setup{}
" EOF
set completeopt-=preview
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" require'lspconfig'.pyright.setup{}

"" rust << EOF
" require'lspconfig'.rust_analyzer.setup{}
" " EOF


"------------------------------------------------------------------
"---------------------------- Fuzzy -------------------------------
" Search files with FZF
nnoremap <c-p> :Files<cr>
nnoremap <C-p> :GFiles<CR>
" ctrl-t -> open file in new tab
" ctrl-s -> open file in new horizontal split
" ctrl-v -> open file in new vertical split
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

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

" Uses silversearcher-ag to ignore searching files in .gitignore and
" node_modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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
