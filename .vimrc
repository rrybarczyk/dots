"------------------------------------------------------------------
"---------------------------- Plug --------------------------------
"https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" NERDTree
Plug 'scrooloose/nerdtree',     {'on': 'NERDTreeToggle'} " nerd tree file drawer

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

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

" Close HTML Tags
Plug 'docunext/closetag.vim'

" Solaraized Color Scheme
Plug 'altercation/vim-colors-solarized'

" " Syntastic
" Plug 'vim-syntastic/syntastic'

" JS-Indent
Plug 'jason0x43/vim-js-indent'

call plug#end()
"------------------------------------------------------------------
"---------------------------- My Syntax ----------------------------
set nu rnu								   "Hybrid relative line number
set ru									   "Ruler
syntax on								   "Turns on syntax

if has ("autocmd")
   filetype plugin indent on
endif

"colorscheme codeschool	
set expandtab                       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4                    "Indent by 3 spaces when using >>, <<, == ect.
set softtabstop=4                   "Indent by 3 spaces when pressing <TA>
set autoindent                      "Keep indentation from pervious line
set smartindent                     "Automatically inserts indentation in some cases
set cindent                         "Like smartindent, but stricter and more customisable
set tabstop=4                       "sets tab to be 3 spaces
set expandtab
set nowrap                          "Do not visually wrap long lines
set smartcase					    "Search case-insensitive if everything is lower case
set hlsearch					    "Highlight search terms
set incsearch					    "Highlight search terms as you type
set title						    "Set the terminal title
set nobackup			            "Do not create backup files
set colorcolumn=80                  "Put a vertical column at line 80

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>


" "----------------------------------------------------------------
" "--------------------------- Syntastic ---------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"----------------------------------------------------------------
"--------------------------- HTML File Indent ---------------------------
filetype indent on
set filetype=html

"----------------------------------------------------------------
"--------------------------- CloseTag ---------------------------
"https://github.com/docunext/closetag.vim.git
"  Integlligently close HTML tags

let g:closetag_html_style=1
" source /Users/rachelrybarczyk/.vim/bundle/closetag/plugin/closetag.vim

"------------------------------------------------------------------
"---------------------------- NERDCommenter ----------------------------
"https://github.com/docunext/closetag.vim.git 
" open NERDTree on the right side
" let g:NERDTreeWinPos = "right"
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

"--------------------------------------------------------------------------------
"---------------------------- Solarized Color Scheme ----------------------------
"https://github.com/altercation/vim-colors-solarized.git
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

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

call NERDTreeHighlightFile('rs', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('hpp', 'green', 'none', '#151515', '#151515')
call NERDTreeHighlightFile('cpp', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('py', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('go', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('sol', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('txt', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')

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

"---------------------------------------------------------------------------
"---------------------------- NERDTree Side Bar ----------------------------
" https://github.com/jason0x43/vim-js-indent.git
"let to 1 to make `case` statements align with their containing `switch`
let js_indent_flat_switch = 0
" Set to 0 to disable use of the JavaScript indenter for TypeScript buffers 
let js_indent_typescript = 1 
