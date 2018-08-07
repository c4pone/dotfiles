"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/flo/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/flo/.cache/dein')
  call dein#begin('/home/flo/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/flo/.cache/dein/repos/github.com/Shougo/dein.vim')

  " " VIM
  " " ------
  call dein#add('dracula/vim')
  call dein#add('joshdick/onedark.vim')
  " call dein#add('vim-scripts/gitignore')
  call dein#add('Shougo/neco-vim', { 'on_i' : 1, 'loadconf_before' : 1})
  call dein#add('roxma/nvim-completion-manager')
  call dein#add('tpope/vim-commentary')
  " call dein#add('vim-syntastic/syntastic')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) " best fucking thing ever
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('scrooloose/nerdtree.git', {'on_cmd': 'NERDTreeToggle', 'loadconf' : 1})
  call dein#add('mileszs/ack.vim', {'on_cmd': 'Ack'})
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Townk/vim-autoclose')
  " " ------
  
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })


  " " Python  
  " " ------
  call dein#add('Vimjas/vim-python-pep8-indent', {'on_ft' : 'python'})
  call dein#add('lepture/vim-jinja')
  call dein#add('Glench/Vim-Jinja2-Syntax', {'on_ft': 'html'})
  " " ------
  
  " " YML  
  " " ------
  call dein#add('chase/vim-ansible-yaml', {'on_ft' : 'yaml'})
  " " ------

  " " PHP  
  " " ------
  call dein#add('2072/PHP-Indenting-for-VIm', { 'on_ft' : 'php'})
  call dein#add('roxma/LanguageServer-php-neovim', {'on_ft' : 'php', 'build': 'composer install && composer run-script parse-stubs'})
  " "-------

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


let g:python_host_prog = '/home/flo/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/flo/.pyenv/versions/neovim3/bin/python'

"" Map leader to ,
let mapleader=','

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set bomb
set binary
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Ctags
set tags=tags

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nowrap

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/zsh

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
color onedark
set t_Co=256

syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1

let g:CSApprox_loaded = 1
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"autoreload file if changed outside of vim
set autoread

augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

augroup filetypedetect
    au BufRead,BufNewFile *.yml set filetype=ansible
    au BufRead,BufNewFile *.yaml set filetype=ansible
augroup END

"*****************************************************************************
"" Language Protocol Server
"*****************************************************************************"
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
" set signcolumn=yes
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.pyenv/shims/pyls', '-v'],
    \ 'go': ['go-langserver'],
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:LanguageClient_selectionUI = 'fzf'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"*****************************************************************************
"" Mappings
"*****************************************************************************

"Move windows with ctrl + direction key
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" FZF bindings
" `Files [PATH]`    | Files (similar to  `:FZF` )
" `GFiles [OPTS]`   | Git files ( `git ls-files` )
" `GFiles?`         | Git files ( `git status` )
" `Buffers`         | Open buffers
" `Colors`          | Color schemes
" `Ag [PATTERN]`    | {ag}{5} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
" `Lines [QUERY]`   | Lines in loaded buffers
" `BLines [QUERY]`  | Lines in the current buffer
" `Tags [QUERY]`    | Tags in the project ( `ctags -R` )
" `BTags [QUERY]`   | Tags in the current buffer
" `Marks`           | Marks
" `Windows`         | Windows
" `Locate PATTERN`  |  `locate`  command output
" `History`         |  `v:oldfiles`  and open buffers
" `History:`        | Command history
" `History/`        | Search history
" `Snippets`        | Snippets ({UltiSnips}{6})
" `Commits`         | Git commits (requires {fugitive.vim}{7})
" `BCommits`        | Git commits for the current buffer
" `Commands`        | Commands
" `Maps`            | Normal mode mappings
" `Helptags`        | Help tags [1]
" `Filetypes`       | File types
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
nmap <Leader>; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>g :GFiles?<CR>
nmap <Leader>w :call LanguageClient#workspace_symbol()


"" Ack.vim
" nnoremap <leader>a :Ack<space>
" let g:ackprg = 'ag --nogroup --nocolor --column'

"Browse through tags
"ctrl + ] = jump into defintiion
"ctrl + t = jump back
"
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Ansible 
nnoremap <leader>1 :! ansible-vault encrypt %<CR>
nnoremap <leader>2 :! ansible-vault decrypt %<CR>

" Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif
