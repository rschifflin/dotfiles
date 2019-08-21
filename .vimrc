set shell=/bin/sh
call plug#begin()

"YouCompleteMe:
"Plug 'https://github.com/Valloric/YouCompleteMe'

"syntastic:
"Plug 'https://github.com/scrooloose/syntastic'

"Multiple-entry selection UI (fuzzy finder)
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install'}

"fugitive:
Plug 'https://github.com/tpope/vim-fugitive'

"nerdtree:
Plug 'https://github.com/scrooloose/nerdtree'

"tmux Navigator
Plug 'https://github.com/christoomey/vim-tmux-navigator'

"solarized:
Plug 'https://github.com/altercation/vim-colors-solarized'

"textobj:
Plug 'https://github.com/kana/vim-textobj-user'

"textobj-ruby:
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock'

"rainbow parens:
Plug 'luochen1990/rainbow'

"Language client (currently for RustLang)
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

"rust syntax highlighting
Plug 'https://github.com/rust-lang/rust.vim'

"vim racer
Plug 'racer-rust/vim-racer'

"nvim completion with racer
Plug 'roxma/nvim-cm-racer'

"Neovim python support
Plug 'roxma/python-support.nvim'

"Autocomplete
Plug 'roxma/nvim-completion-manager'

"scala
Plug 'https://github.com/derekwyatt/vim-scala'

"typescript
Plug 'https://github.com/leafgarland/typescript-vim'

"markdown
Plug 'https://github.com/tpope/vim-markdown'

"Coffeescript ReactJS syntax
Plug 'https://github.com/mtscout6/vim-cjsx'

"coffescript
Plug 'https://github.com/kchmck/vim-coffee-script'

"Surround
Plug 'https://github.com/tpope/vim-surround'

"Dot Repeat
Plug 'https://github.com/tpope/vim-repeat'

"Unimpaired
Plug 'https://github.com/tpope/vim-unimpaired'

"Drag visual blocks
Plug 'https://github.com/shinokada/dragvisuals.vim'

"CamelCaseMotion
Plug 'https://github.com/vim-scripts/camelcasemotion'

"Ack Vim
Plug 'https://github.com/mileszs/ack.vim'

"jade
Plug 'https://github.com/digitaltoad/vim-jade'

"stylus
Plug 'https://github.com/wavded/vim-stylus'

"Dash:
Plug 'https://github.com/rizzatti/dash.vim'

"Repl
Plug 'https://gitlab.com/HiPhish/repl.nvim/'

"Ctrl-p:
Plug 'https://github.com/kien/ctrlp.vim'

"funcoo:
Plug 'https://github.com/rizzatti/funcoo.vim'

"slim:
Plug 'https://github.com/slim-template/vim-slim'

"golang:
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

if has("autocmd")
  filetype indent plugin on
endif

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
set nowrapscan

set backup
set backupdir=~/.vim/tmp/backup/

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

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
nmap <Leader>R :redr!<CR>
nmap <Leader>p :set paste<CR>
nmap <Leader>P :set nopaste<CR>
nnoremap <Leader>1 :set background=dark<CR>:!makedark<CR><CR>
nnoremap <Leader>2 :set background=light<CR>:!makelight<CR><CR>
nnoremap <silent><Leader>rs :LanguageClientStart<CR>
nnoremap <silent><Leader>rS :LanguageClientStop<CR>
nnoremap <silent><Leader>ra :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent><Leader>rh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent><Leader>rd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent><Leader>rr :call LanguageClient_textDocument_rename()<CR>

" Repl commands
" Send the text of a motion to the REPL
nmap <leader>ss  <Plug>(ReplSend)
" Send the current line to the REPL
nmap <leader>sss <Plug>(ReplSendLine)
nmap <leader>ss_ <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <leader>ss  <Plug>(ReplSend)

" nnoremap <Leader>D :YcmCompleter GoTo<CR>

"Use ripgrep instead of ack
let g:ackprg = 'rg --nogroup --nocolor --column'

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

"Rainbow parens
augroup rainbow_parens
  au!
  au FileType scm RainbowToggleOn
augroup END

"From https://github.com/luochen1990/rainbow/blob/master/README.md
let g:rainbow_conf = {
	\     'guifgs': ['green', 'red', 'blue', 'purple'],
	\     'ctermfgs': ['green', 'red', 'blue', 'purple'],
	\}

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

"Swap selected text with most-recently deleted text
vnoremap <C-X> <Esc> `.``gvP``P

let g:DVB_TrimWS = 1 "remove trailing whitespace after moving
let g:rust_recommended_style = 0 "Dont default to 4-space tabs in .rs files

"No longer using ycm for autocomplete
"let g:ycm_rust_src_path = "$(rustc --print sysroot)/lib/rustlib/src/rust/src"
"let g:ycm_register_as_syntastic_checker=0

" Python 3 requirements for nvim-completion-manager
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'neovim')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" No Python 2 support
let g:python_support_python2_require = 0

" Run the rust language server for rust IDE tools
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" Always show the sign column while the language server is running
augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

" Color-code LanguageClient signcol signs
highlight SignColumn ctermbg=Black
highlight ALEErrorSign ctermbg=Black ctermfg=DarkRed
highlight ALEWarningSign ctermbg=Black ctermfg=White
highlight ALEInfoSign ctermbg=Black ctermfg=LightGreen

" Tab to cycle through nvim completion manager
inoremap <expr> <silent> <Tab>  pumvisible()?"\<C-n>":"\<TAB>"
inoremap <expr> <silent> <S-TAB>  pumvisible()?"\<C-p>":"\<S-TAB>"

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

let g:go_fmt_command = "goimports"
