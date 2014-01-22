set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"Pathogen plugins:
"YouCompleteMe: 
Bundle '/Valloric/YouCompleteMe.git'

"Ctrl-p: 
Bundle 'kien/ctrlp.vim.git'

"Dash: 
Bundle 'rizzatti/dash.vim.git'

"funcoo: 
Bundle 'rizzatti/funcoo.vim.git'

"nerdtree: 
Bundle 'scrooloose/nerdtree.git'

"slim: 
Bundle 'slim-template/vim-slim.git'

"syntastic: 
Bundle 'scrooloose/syntastic.git'

"solarized: 
Bundle 'altercation/vim-colors-solarized.git'

"fugitive: 
Bundle 'tpope/vim-fugitive.git'

"textobj: 
Bundle 'kana/vim-textobj-user.git'

"textobj-ruby: 
Bundle 'nelstrom/vim-textobj-rubyblock.git'

syntax on

"Allows manipulating ruby block
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif

set hidden
set wildmenu
set showcmd
set hlsearch
set nomodeline
set ignorecase
set smartcase
set smartindent
set ruler
set number
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=8
set backspace=indent,eol,start

"Pressing enter clears search
nnoremap <silent> <CR> :noh<CR>

"Disable insert-mode F1 triggering Help
imap <F1> <nop>

map <S-h> ^
map <S-l> $
nmap <F1> :NERDTreeToggle<CR>
map <F5> :!ruby %<CR>

"Navigate windows easier
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"Toggle git status
function! ToggleGitStatus()
  if getwinvar(bufwinnr('.git/index'), '&previewwindow')
    pclose
  else
    Gstatus
  endif
endfunction
nnoremap <F2> :call ToggleGitStatus()<CR>

"VIM solarized
syntax enable
set background=dark
colorscheme solarized

"Open file tree browser if no file is passed to vim
"autocmd vimenter * if !argc() | NERDTree | endif

"Highlight the current window we're working in
autocmd WinEnter * highlight StatusLine ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold

"Swap absolute and relative numbering
nnoremap <C-n> :set relativenumber!<CR>


set statusline =%{fugitive#statusline()} "Git branch
set statusline +=\ %t                     "Filename
set statusline +=%m                       "Modified flag
set statusline +=%r                       "Read-only flag
set statusline +=%=                       "Remaining statusline is right-aligned
set statusline +=\ B%n                    "Buffer number
set statusline +=,\ L%l                   "Line number
set statusline +=,\ C%c                   "Column Number

"Highlights
highlight Directory guifg=#FFFF00 ctermfg=yellow
highlight MatchParen guifg=#FFFF00 ctermfg=yellow guibg=NONE ctermbg=NONE gui=BOLD cterm=BOLD
highlight rspecOK guifg=#00FF00 ctermfg=green
highlight Search guibg=#ADD8E6 ctermbg=lightblue


let g:ycm_register_as_syntastic_checker=0
