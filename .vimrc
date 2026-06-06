" Load Vim's official sensible defaults (backspace, wildmenu, incsearch,
" history, ttimeout, matchit, <C-L> clears search highlight, <C-U>/<C-W>
" undo breaks, syntax + filetype plugins, etc.)
source $VIMRUNTIME/defaults.vim

" Useful vim-sensible settings not covered by defaults.vim
set autoread        " Reload files changed on disk outside Vim
set nrformats-=octal " Don't treat leading-zero numbers as octal for <C-A>/<C-X>
set complete-=i     " Skip included files when completing (faster on big projects)

" Set mapleader to spacebar
let mapleader="\<space>"

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
