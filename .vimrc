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
Plug 'lifepillar/vim-mucomplete'                  " Autocomplete
call plug#end()
let g:mucomplete#enable_auto_at_startup = 1       " Autocomplete- Auto start plugin on startup
set completeopt+=menuone                          " Autocomplete- Menu
set completeopt+=noinsert                         " Autocomplete- Enter autocomplete prompt on 'enter'
set shortmess+=c   																" Autocomplete- Shut off completion messages
set belloff+=ctrlg 																" Autocomplete- Remove beeping during completion
" Autocomplete- Ctrl-e to exit Autocomplete
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
" Autocomplete- Return to complete and exit Autocomplete
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
" ----------------------------------------------- VIM-PLUG PLUGIN MANAGER (END)
" ----------------------------------------------- OTHER (START)
set nocompatible
set clipboard=unnamed                             " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                                      " Enhance command-line completion
set esckeys                                       " Allow cursor keys in insert mode
set backspace=indent,eol,start                    " Format backspace in insert mode
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

" Don’t add empty newlines at the end of files
set binary
set noeol
" ----------------------------------------------- CUSTOM MAPPINGS (START)
" ----------------------------------------------- WINDOWS & FILE BROWSING (START)
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set winwidth=45
set winheight=30                                  " Set current window height to 30 lines
set winminheight=5                                " Set minimum height of all windows at 5 lines
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Not sure what this does?
" nnoremap <C-n> <c-w><
" nnoremap <C-m> <c-w>>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" File Browsing with Netrw
let g:netrw_banner=0                              " disable annoying banner
let g:netrw_browse_split=4                        " open in prior window
let g:netrw_altv=1                                " open splits to the right
let g:netrw_liststyle=3                           " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25                          " set default window size
let g:netrw_preview = 1                           " Preview window in vertical split

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction
map <silent> <C-e> :call ToggleVExplorer()<CR>
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
" Auto indent
set autoindent
set smartindent
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
