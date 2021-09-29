"                Vundle:
"----------------------------------
set nocompatible                              " be iMproved


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"                Bundles:
"----------------------------------
Bundle 'ciaranm/securemodelines'
Bundle 'tomasr/molokai'
Bundle 'skammer/vim-css-color'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'wavded/vim-stylus'
Bundle 'ervandew/supertab'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-fugitive'

"                Security:
"----------------------------------
set modelines=0                               " no modelines [http://www.guninski.com/vim1.html] 
let g:secure_modelines_verbose=0              " securemodelines vimscript
let g:secure_modelines_modelines = 15         " 15 available modelines


"                Settings:
"----------------------------------
filetype off
syntax on
filetype plugin indent on                    " load file type plugins + indentation

set nu

"Spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab

set wildmenu
set wildmode=list:longest,full

set wrap linebreak nolist

set showcmd
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start               " backspace over all kinds of things
set noautowrite                              " don't automagically write on :next
set autoindent smartindent copyindent        " auto/smart indent
set smarttab                                 " tab and backspace are smart
set undolevels=1000                          " 1000 undos
"set undofile                                 " undo after exit, <filename>.un~

set scrolloff=3                              " keep at least 3 lines above/below
set sidescrolloff=5                          " keep at least 5 lines left/right
set display=lastline

" Change font size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 17
  elseif has("gui_win32")
    set guifont=Consolas:h17:cANSI
  endif
endif

" Remove menu for gVim
set guioptions=''


"               Keybindings:
"----------------------------------
let mapleader=','

" forgetting to leave insertmode
imap jj <Esc>
imap kkk <Esc>

" window movement
no <C-L> <C-W>l
no <C-H> <C-W>h
no <C-J> <C-W>j
no <C-K> <C-W>k

" sudo write
cmap w!! w !sudo tee % >/dev/null

" Exit document.
nnoremap <leader><leader>q :q<cr>

" Write to disk
nnoremap <leader><leader>w :w<cr>


"                Search:
"----------------------------------

set incsearch " incremental search
set ignorecase " search ignoring case
set smartcase " Ignore case when searching lowercase
set hlsearch " highlight the search
set showmatch " show matching bracket
set diffopt=filler,iwhite " ignore all whitespace and sync

" regex search, the default is sort of broken
nnoremap / /\v

" search and replace file
noremap <leader>/ :%s/\v

" clear search results
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>


"                Plugins:
"----------------------------------

" EasyMotion
let g:EasyMotion_leader_key = '<leader>'

" Nerdtree
autocmd vimenter * if !argc() | NERDTree | endif " auto open if no file
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp']
let NERDTreeWinPos="left"
let NERDTreeWinSize=28
nmap <leader>m :NERDTreeToggle<cr>

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=0

let g:syntastic_warning_symbol='⚠⚠'
let g:syntastic_style_warning_symbol='⚠⚠'
let g:syntastic_error_symbol='✗✗'
let g:syntastic_style_error_symbol='✗✗'

hi todo guifg=#FFA500 guibg=bg
hi error guifg=#FF0000 guibg=bg

" Powerline
set laststatus=2

"                Style:
"----------------------------------

colorscheme molokai
set ruler                                    " show the line number on the bar
set visualbell t_vb=                         " Disable ALL bells
set noerrorbells                             " no error bells please
set t_Co=256                                 " 256 colors
set cursorline                               " mark current line with a line
set laststatus=2
set noshowmode                               " Hide the default mode text 

" space as vertical character
set fcs+=vert:\ 

" colorcolumn
set colorcolumn=+1                           " A line at 85 characters
hi ColorColumn ctermbg=black guibg=#232728

"                Other:
"----------------------------------

" Always jump to last known cursor pos
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")
