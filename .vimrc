" ----------------------------------------------- SYNTAX HIGHLIGHTING & COLORS (START)
filetype plugin on
"set background=dark
"set t_Co=256
syntax on
colorscheme onedark
call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'                   " Vertical indent guides
Plug 'scrooloose/nerdcommenter'                   " Comment shortcuts (ie, comment/uncomment line with `<leader>cc` & `<leader>cu`)
Plug 'sheerun/vim-polyglot'                       " Language support
Plug 'lifepillar/vim-mucomplete'                  " Autocomplete
Plug 'fatih/vim-go'                               " Go specific
Plug 'vim-airline/vim-airline'                    " Custom statusline
Plug 'vim-airline/vim-airline-themes'             " Custom statusline theme
Plug 'airblade/vim-gitgutter'                     " Show git diffs in gutter
Plug 'vim-syntastic/syntastic'                    " Syntax checker
Plug 'mattn/emmet-vim'                            " HTML toolkit

" Plug Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'
call plug#end()

" Plugin- vim-indent-guides: Indent guides enable on startup
let g:indent_guides_enable_on_vim_startup = 1

" Plugin- mucomplete
let g:mucomplete#enable_auto_at_startup = 1       " Autocomplete- Auto start plugin on startup
set completeopt+=menuone                          " Autocomplete- Menu
set completeopt+=noinsert                         " Autocomplete- Enter autocomplete prompt on 'enter'
set shortmess+=c   								" Autocomplete- Shut off completion messages
set belloff+=ctrlg 								" Autocomplete- Remove beeping during completion
" Autocomplete- Ctrl-e to exit Autocomplete
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
" Autocomplete- Return to complete and exit Autocomplete
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

" Plugin- vim airline: config
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='deus'

" Plugin- Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint']
let g:syntastic_js_checkers = ['eslint']

" Vim Go config
set autowrite                                     " Write file after successful Go build
let g:go_list_type = "quickfix"                   " Use quickfix for errors
let g:go_fmt_command = "goimports"                " Use goimports instead of gofmt
" let g:go_highlight_types = 1
let g:go_highlight_fields = 1                     " Highlight types
" Set packages for metalinter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1                  " run metalinter on save
let g:go_auto_type_info = 1                       " Show type info on cursor hover


set nocompatible
set clipboard=unnamed                             " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                                      " Enhance command-line completion
set esckeys                                       " Allow cursor keys in insert mode
set backspace=indent,eol,start                    " Format backspace in insert mode
set ttyfast                                       " Optimize for fast terminal connections
set gdefault                                      " Add the g flag to search/replace by default
set encoding=utf-8 nobomb                         " Use UTF-8 without BOM

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

" Don’t add empty newlines at the end of files
set binary
set noeol

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set winwidth=45
set winheight=30                                  " Set current window height to 30 lines
set winminheight=5                                " Set minimum height of all windows at 5 lines
nnoremap <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" Set window to full height and width
" nnoremap <Leader>\ <C-W>|

" Not sure what this does?
" nnoremap <C-n> <c-w><
" nnoremap <C-m> <c-w>>

" Quicker window movement
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

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
