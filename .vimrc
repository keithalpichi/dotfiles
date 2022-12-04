if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if !(exists('g:did_load_filetypes') && exists('g:did_load_ftplugin') && exists('g:did_indent_on'))
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set backspace=indent,eol,start
set complete-=i
set smarttab
set gdefault " Add the g flag to search/replace by default
let mapleader="\<space>" " Set mapleader to spacebar

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if &laststatus < 2
  set laststatus=2
endif
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" Return to Normal mode with 'jk'
inoremap jk <esc>
nnoremap B ^
" Move to beginning/end of line
nnoremap E $
" Remove use of $ and ^. Forced to use two above.
nnoremap $ :echoe "Use B"<CR>
nnoremap ^ :echoe "Use E"<CR>
" Save file
nnoremap <leader>w :w<cr>
" Force save
nnoremap <leader>w1 :w!<cr>
" Save file and quit
nnoremap <leader>wq :wq<cr>
" Quit file
nnoremap <leader>q :q<cr>
" Quit all buffers
nnoremap <leader>qa :qa<cr>
" Force quit
nnoremap <leader>q1 :q!<cr>
" Force quit all buffers
nnoremap <leader>qa1 :qa!<cr>

" Caution me to use the correct maps
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

colorscheme onedark

set binary
set noeol

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set winwidth=45
set winheight=30                                  " Set current window height to 30 lines
set winminheight=5

" Quicker window movement
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" Don't create backups or swap files
set nobackup
set noswapfile
set nowritebackup

" Enable line numbers
set number
" Highlight current line
set cursorline
" Auto indent
set autoindent
set smartindent
" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
set listchars=tab:\ \ ,eol:↲,nbsp:␣,trail:•
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

set relativenumber

" Start scrolling three lines before the horizontal window border
set scrolloff=3
