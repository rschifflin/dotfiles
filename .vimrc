let $BASH_ENV = "~/.bashrc"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"ios.vim:
Bundle 'eraserhd/vim-ios.git'

"YouCompleteMe:
Bundle 'Valloric/YouCompleteMe.git'

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

"rust
Bundle 'wting/rust.vim'

"scala
Bundle 'derekwyatt/vim-scala'

"markdown
Bundle 'tpope/vim-markdown'

"coffescript
Bundle 'kchmck/vim-coffee-script'

"Surround
Bundle 'tpope/vim-surround'

"Dot Repeat
Bundle 'tpope/vim-repeat'

"Unimpaired
Bundle 'tpope/vim-unimpaired'

"Drag visual blocks
Bundle 'shinokada/dragvisuals.vim'

"CamelCaseMotion
Bundle 'vim-scripts/camelcasemotion'

"Ack Vim
Bundle 'mileszs/ack.vim'

"Leader is space
let mapleader=" "

"Ignore garbage
set wildignore+=*.class,*.jar,*.xml

"Colorschemes
"VIM solarized
let t_Co=256
set background=dark
colorscheme solarized

syntax enable
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
set synmaxcol=256

"Pressing enter clears search
nnoremap <silent> <CR> :noh<CR>

"Disable insert-mode F1 triggering Help
imap <F1> <nop>

"Shift h moves to the start of the line
map <S-h> ^

"Shift l moves to the end of the line
map <S-l> $

"Useful functions
nmap <Leader>a :Ack "
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>g :call ToggleGitStatus()<CR>
nmap <Leader>d :Gdiff<CR>
nmap <Leader>o :diffo<CR>
nmap <Leader>u :diffu<CR>
nmap <Leader>r :redr!<CR>
nmap <Leader>p :set paste<CR>
nmap <Leader>P :set nopaste<CR>
nnoremap <Leader>1 :set background=dark<CR>:!makedark<CR><CR>
nnoremap <Leader>2 :set background=light<CR>:!makelight<CR><CR>

"Use silver searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

"Hex editing
nmap <Leader>h :%!xxd<CR>
nmap <Leader>H :%!xxd -r<CR>

"Unbind ex mode
map Q <Nop>

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

"Stripping trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Maps for moving around text
  "using tpope/vim-unimpaired.vim for lines
  nmap <S-Up> [e
  nmap <S-Down> ]e
  nmap <S-Left> <<
  nmap <S-Right> >>

  "using vim-scripts/CamelCaseMotion to jump around camel cased word"
  "map <silent> <c-W> <Plug>CamelCaseMotion_w
  "map <silent> <c-E> <Plug>CamelCaseMotion_e
  "map <silent> <c-B> <Plug>CamelCaseMotion_b
  "sunmap <c-w>
  "sunmap <c-b>
  "sunmap <c-e>

  "using shinokada/dragvisuals.vim for visual blocks
  vmap <expr> <S-Up> DVB_Drag('up')
  vmap <expr> <S-Down> DVB_Drag('down')
  vmap <expr> <S-Left> DVB_Drag('left')
  vmap <expr> <S-Right> DVB_Drag('right')
  vmap <expr> D DVB_Duplicate()

let g:DVB_TrimWS = 1 "remove trailing whitespace after moving

let g:ycm_register_as_syntastic_checker=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
