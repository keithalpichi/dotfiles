" ----------------------------------------------- SYNTAX HIGHLIGHTING & COLORS (START)
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
set background=dark
" ----------------------------------------------- SYNTAX HIGHLIGHTING & COLORS (END)
" ----------------------------------------------- VIM-PLUG PLUGIN MANAGER (START)
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'                       " Language highlight support
call plug#end()
" ----------------------------------------------- VIM-PLUG PLUGIN MANAGER (END)
" ----------------------------------------------- OTHER (START)
set nocompatible
set clipboard=unnamed                             " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                                      " Enhance command-line completion
set esckeys                                       " Allow cursor keys in insert mode
" set backspace=indent,eol,start                  " Allow backspace in insert mode
set ttyfast                                       " Optimize for fast terminal connections
set gdefault                                      " Add the g flag to search/replace by default
set encoding=utf-8 nobomb                         " Use UTF-8 without BOM
" ----------------------------------------------- OTHER (START)
" ----------------------------------------------- CUSTOM MAPPINGS (START)
let mapleader="\<space>"                          " Set mapleader to spacebar
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
nnoremap<leader>w1 :w!<cr>
" Save file and quit
nnoremap <leader>wq :wq<cr>
" Quit
nnoremap <leader>q :q<cr>
" Force quit
nnoremap <leader>q1 :q!<cr>

" Caution me to use the correct maps
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Don’t add empty newlines at the end of files
set binary
set noeol
" ----------------------------------------------- CUSTOM MAPPINGS (START)
" ----------------------------------------------- WINDOWS & FILE BROWSING (START)
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Not sure what this does?
" nnoremap <C-n> <c-w><
" nnoremap <C-m> <c-w>>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" File Browsing
let g:netrw_banner=0                              " disable annoying banner
let g:netrw_browse_split=4                        " open in prior window
let g:netrw_altv=1                                " open splits to the right
let g:netrw_liststyle=3                           " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" ----------------------------------------------- WINDOWS & FILE BROWSING (END)

" Don't create backups or swap files
set nobackup
set noswapfile
set nowritebackup

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
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
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" ----------------------------------------------- SNIPPETS (START)
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/snippets/skeleton.html<CR>4jwf>a
" ----------------------------------------------- SNIPPETS (END)
