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
  call dein#add('rakr/vim-one')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('vim-scripts/CSApprox')
  call dein#add('vim-scripts/gitignore')
  call dein#add('tweekmonster/exception.vim')
  call dein#add('mhinz/vim-lookup')
  call dein#add('Shougo/neco-vim', { 'on_i' : 1, 'loadconf_before' : 1})
  call dein#add('tweekmonster/helpful.vim', {'on_cmd': 'HelpfulVersion'})
  call dein#add('roxma/nvim-completion-manager')
  call dein#add('tpope/vim-commentary')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) " best fucking thing ever
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('scrooloose/nerdtree.git', {'on_cmd': 'NERDTreeToggle', 'loadconf' : 1})
  call dein#add('mileszs/ack.vim', {'on_cmd': 'Ack'})
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Shougo/neosnippet.vim', { 'on_i'  : 1 , 'on_ft' : 'neosnippet', 'loadconf' : 1, 'on_cmd' : 'NeoSnippetEdit'})
  call dein#add('Shougo/neosnippet-snippets', {'merged' : 0})
  call dein#add('Shougo/neopairs.vim', { 'on_i' : 1})
  " " ------

  " " Python  
  " " ------
  call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
  call dein#add('nvie/vim-flake8', {'on_ft' : 'python'})
  call dein#add('fisadev/vim-isort', {'on_ft' : 'python'})
  call dein#add('Vimjas/vim-python-pep8-indent', {'on_ft' : 'python'})
  call dein#add('tell-k/vim-autopep8', {'on_ft': 'python'})
  call dein#add('lepture/vim-jinja')
  call dein#add('Glench/Vim-Jinja2-Syntax', {'on_ft': 'html'})
  " " ------
  
  " " YML  
  " " ------
  call dein#add('chase/vim-ansible-yaml', {'on_ft' : 'yaml'})
  " " ------

  " " PHP  
  " " ------
  call dein#add('StanAngeloff/php.vim', { 'on_ft' : 'php'})
  call dein#add('2072/PHP-Indenting-for-VIm', { 'on_ft' : 'php'})
  call dein#add('rafi/vim-phpspec', { 'on_ft' : 'php'})
  call dein#add('xsbeats/vim-blade', { 'on_ft' : 'php'})
  call dein#add('phpactor/phpactor', { 'on_ft' : 'php', 'build' : 'composer install'})
  call dein#add('roxma/LanguageServer-php-neovim', {'on_ft' : 'php', 'build': 'composer install && composer run-script parse-stubs'})

  " "-------
  
  " " GO
  " " -----
  call dein#add('fatih/vim-go', { 'on_ft' : 'go', 'loadconf_before' : 1})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'on_ft' : 'go', 'build': 'make'})

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

"syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd'] ",'phpmd']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_sh_checkers = ['shellcheck', 'sh']

" These are things that the devs don't agree make the code more readable
" E302 expected 2 blank lines
" E261 at least two spaces before inline comment
let g:flake8_ignore="E302,E261"

" go lang
set completeopt+=noselect
let g:python3_host_skip_check = 1
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:go_snippet_engine = 'neosnippet'


" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_echo_command_info= 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1

let g:cm_auto_popup=1

"jedi-vim"
let g:pymode_rope = 0
let g:jedi#completions_enabled = 0
let g:jedi#goto_command="gd"

"" isort.vim 
" sort imports in python
autocmd FileType python map <buffer> <leader>i :Isort<CR>

"" vim-autoflake 
autocmd FileType python map <buffer> <leader>o :Autopep8<CR>
let g:autopep8_max_line_length=160
let g:autopep8_disable_show_diff=1


" vim-python
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
