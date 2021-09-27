"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tpope/vim-fugitive'

    "-------------------=== Other ===-------------------------------
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'vim-airline/vim-airline'

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'mattn/emmet-vim'

    "-------------------=== Python  ===-----------------------------
    Plugin 'dense-analysis/ale'

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme
set bg=dark

set number                                  " show line numbers
set rnu
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set ignorecase

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set autowriteall

set splitbelow

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
set undofile
set undodir=~/.vim/undodir
" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>
inoremap jk <Esc>

" Map for open vimrc file
nnoremap <F12> :tabnew ~/.vimrc<CR>

" Leader Key
let mapleader = ","

" Map for switching windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Terminal
nnoremap <Leader>t :term<CR>

" Execute python code
nnoremap <Leader>r :!clear;python %<CR>

" Clear highlights after searc
nnoremap // :nohl<CR>

" Move to next/previous buffer
nnoremap <F9> :bp<CR>
nnoremap <F10> :bn<CR>

" Move to next/previous method
map <leader>w ]m
map <leader>b [m

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <Leader>p :bp<CR>
nmap <Leader>n :bn<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
" autocmd BufEnter *.py :call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR><C-w>l

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$', 'todo.*', 'done.*', 'requirements.txt', 'venv']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap <c-t> :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'
let g:snipMate = {'snippet_version' : 1}

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" highlight 'long' lines (>= 80 symbols) in python files
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%100v.\+/

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>


" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}

let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = "--ignore=E501"
" CTRLP
" let g:ctrlp_custom_ignore = 'venv\|__pycache__\|.git'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'venv\|__pycache__\|.git',
  \ 'file': 'done\.*\|todo\.*'}

" Emmet
let g:user_emmet_leader_key=','


" Tags
Plugin 'craigemery/vim-autotag'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
