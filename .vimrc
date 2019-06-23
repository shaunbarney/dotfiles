set encoding=utf-8

" Color Scheme
set background=dark
colorscheme molokai

let g:mapleader=' '

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Indentation
filetype plugin indent on
set smartindent
set smarttab
set expandtab tabstop=2 shiftwidth=2 softtabstop=0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

set hidden
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" searching
set incsearch ignorecase smartcase hlsearch
set showmatch
set magic
set gdefault

" UI stuff
syntax on
" Show “invisible” characters
set list
set laststatus=2
set mouse=a
set noerrorbells
set nostartofline
set ruler
set relativenumber
set cursorline
set shortmess=atI
set showmode
set title
set showcmd
set scrolloff=3
set clipboard=unnamed
set wildmenu
set backspace=indent,eol,start
set ttyfast
set encoding=utf-8 nobomb
set binary
set noeol

" Custom vim exscaping
inoremap jj <Esc>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'

" =========== PLUG STARTS HERE ==============
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

" Detect indent
Plug 'tpope/vim-sleuth'

" Comment with gc
Plug 'tpope/vim-commentary'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'json': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
vnoremap <leader>lf :call LanguageClient#textDocument_rangeFormatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<cr>

" Async
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-jedi'
let g:deoplete#sources#jedi#enable_typeinfo = 0

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" Nerd commenter
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 0
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Common langauge syntax
Plug 'sheerun/vim-polyglot'

" Smooth scrolling
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-j>"

Plug 'ervandew/supertab'
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'plasticboy/vim-markdown'
Plug 'tmhedberg/SimpylFold'
Plug 'neomake/neomake'
:highlight NeomakeErrorMsg ctermfg=227 ctermbg=237
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

let g:neomake_open_list = 2
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['pyflakes']
call plug#end()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType sh,python,c,java,javascript  :call <SID>StripTrailingWhitespaces()

call neomake#configure#automake('nrwi', 500)

nnoremap <F9> <Esc>:w<CR>:!clear;python %<CR>
nnoremap <F10> <Esc>:w<CR>:!clear;python -i %<CR>

