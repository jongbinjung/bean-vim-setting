" Always use ViM (not Vi)
set nocompatible " be iMproved

" <Leader> to ,
let mapleader=","

" Allow external configs for project-specific settings
set exrc

""" Vundle settings {{{
filetype off  " required by Vundle

if has("unix")
  let path=$HOME. '/.vim/bundle/'
elseif has("win32")
  let path=$HOME . '_vim/bundle/'
  let &runtimepath=&runtimepath . ',' . $HOME . '_vim'
endif


" Set the appropriate runtimepath
let rtp_path=path . 'Vundle.vim'
let &runtimepath=&runtimepath . ',' . rtp_path

call vundle#begin(path)  " Start Vundle plugins {{{

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" File/text navigation {{{
" Plugin: vim-surround  {{{
  Plugin 'tpope/vim-surround'
  " cs: change surround
  " ds: delete surround
  " yss: create surround (whole line)
  " ysiw: create surround (text object)
" }}}
" Plugin: vim-repeat {{{
  Plugin 'tpope/vim-repeat'
  " repeat plugins with . (e.g., vim-surround)
" }}}
" Plugin: NERDtree {{{
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  " set <C-n> to toggle
  map <C-n> :NERDTreeMirrorToggle<CR>
  " use arrows to look prettier
  let g:NERDTreeDirArrows=1
  let g:nerdtree_tabs_open_on_gui_startup = 0
"}}}
" Plugin: easymotion (because I'm not good with <count>) {{{
  Plugin 'Lokaltog/vim-easymotion'
"}}}
" Plugin: CtrlP (fuzzy file/directory search matching) {{{
  Plugin 'kien/ctrlp.vim'
  let g:ctrlp_show_hidden = 1
  " Use silver_searcher (https://github.com/ggreer/the_silver_searcher) instead of ack
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore review
    \ -g ""'
"}}}
" Plugin: vim-tmux-navigator {{{
  Plugin 'christoomey/vim-tmux-navigator'
" }}}
" }}} END: File/text navigation
" Visual enhancements {{{
" Plugin: color schemes {{{
  Plugin 'altercation/vim-colors-solarized'
  "let g:solarized_termcolors=256
  "Plugin 'crusoexia/vim-monokai'
"}}}
" Plugin: Dim inactive windows {{{
  Plugin 'blueyed/vim-diminactive'
  let g:diminactive_use_syntax = 1  " disable syntax hl for inactive windows
  let g:diminactive_enable_focus = 1
"}}}
" Plugin: Vim-tmux focus events fix {{{
  " TODO(jongbin): Using Ctrl to show mouse location in Gnome will mess-up
  " Ctrl key bindings -- Ctrl-down will be captured as losing focus from vim!
  Plugin 'tmux-plugins/vim-tmux-focus-events'
"}}}
" Plugin: Airline (for fancy status bar) {{{
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1

  " set tabs with Airline
  let g:airline_theme='solarized'
  " set terminal colors to 256 for solarized theme
  set t_Co=256

  " Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1

  " Show just the filename
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>a <Plug>AirlineSelectPrevTab
  nmap <leader>s <Plug>AirlineSelectNextTab

  let g:airline#extensions#tabline#fnamemod = ':t'
"}}}
" Plugin: absolute/relative line number toggle {{{
  Plugin 'jeffkreeftmeijer/vim-numbertoggle'
  let g:NumberToggleTrigger="<F2>"
  set relativenumber
" }}}
" Plugin: Markdown folding {{{
  Plugin 'gabrielelana/vim-markdown'
  let g:markdown_enable_folding = 1
" }}}
" Plugin: Table formating {{{
  Plugin 'godlygeek/tabular'
" }}}
" }}} END: Visual enhancements
" Version Control (git) {{{
" Plugin: Fugitive {{{
  Plugin 'tpope/vim-fugitive'

  nnoremap <silent> gs :Gstatus<CR>
  nnoremap <silent> gk :Gpush<CR>
  nnoremap <silent> gj :Gpull<CR>
  nnoremap <silent> gd :Gdiff<CR>
" }}}
" Plugin: signify (visualize diffs in the gutter) {{{
  Plugin 'mhinz/vim-signify'
  let g:signify_line_highlight = 0
  let g:signify_vcs_list = [ 'git' ]
  let g:signify_sign_change = '~'
  let g:signify_sign_changedelete = '/'

  let g:signify_cursorhold_insert     = 1
  let g:signify_cursorhold_normal     = 1
  let g:signify_update_on_bufenter    = 0
  let g:signify_update_on_focusgained = 1
"}}}
" }}} END: VCS (git)
" IDE plugins {{{
" basic IDE capabilities {{{
" Plugin: Auto Pairs (Pair parentheses) {{{
  Plugin 'jiangmiao/auto-pairs'
  let g:AutoPairsFlyMode = 1
  let g:AutoPairsShortcutBackInsert = '<C-b>'
" }}}
" Plugin: Editorconfig {{{
" see editorconfig.org for documentation
  Plugin 'editorconfig/editorconfig'
" }}}
" Plugin: ultisnips {{{
  Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger = "<C-j>"
  let g:UltiSnipsJumpForwardTrigger = "<C-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
  let g:UltiSnipsEditSplit = "context"
  let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
" }}}
" Plugin: vim-snippets {{{
  Plugin 'honza/vim-snippets'
" }}}
" Plugin: skeletons {{{
  Plugin 'pgilad/vim-skeletons'
  let skeletons#autoRegister = 1
" }}}
" Plugin: vim-tmux-runner {{{
  " send commands to a tmux pane
  Plugin 'christoomey/vim-tmux-runner'

  " Options for retaining whitespaces when used with python
  let g:VtrStripLeadingWhitespace = 0
  let g:VtrClearEmptyLines = 1
  let g:VtrAppendNewline = 1

  " Vim-tmux-runner Mappings
  vmap <leader><Space> :VtrSendLinesToRunner<cr>
  nmap <leader><Space> :VtrSendLinesToRunner<cr><Down>
  nmap <leader>or :VtrOpenRunner<cr>
"}}}
" Plugin: Supertab (for completion with Tab) {{{
  Plugin 'ervandew/supertab'
" }}}
" Plugin: nerdcommenter {{{
  Plugin 'scrooloose/nerdcommenter'
" }}}
" Plugin: TaskList {{{
  " Create a list of TODO/FIXME
  Plugin 'vim-scripts/TaskList.vim'
  map <leader>td <Plug>TaskList
" }}}
" Plugin: syntastic {{{
  Plugin 'scrooloose/syntastic'
" }}}
" Plugin: YCM {{{
  Plugin 'Valloric/YouCompleteMe'
" }}}
"}}} END: basic IDE capabilities
" Plugin: Collection of python-specific plugins {{{
  Plugin 'tmhedberg/SimpylFold'
  Plugin 'vim-scripts/indentpython.vim'
  Plugin 'nvie/vim-flake8'

  let g:flake8_show_in_gutter=0  " show
"}}}
" Plugin: Nvim-R {{{
  Plugin 'jalvesaq/Nvim-R'

  " Use tmux
  let R_in_buffer = 0
  let R_applescript = 0
  let R_tmux_split = 1
  let R_assign = 0
  let R_vsplit = 1
  let R_rconsole_width = 90
  let R_tmpdir="~/tmp"

  let r_syntax_folding = 1

  " Vim-R plugin mappings
  vmap <Space> <Plug>RDSendSelection
  nmap <Space> <Plug>RDSendLine
  nmap K <Plug>RHelp
" }}}
" Plugin: vim-julia {{{
  Plugin 'JuliaLang/julia-vim'
" }}}
" Plugin: vim-go {{{
  Plugin 'fatih/vim-go'

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

  " Colision prevention between syntastic and go-vim
  let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
" }}}
" Plugin: vimlatex {{{
  Plugin 'lervag/vimtex'

" }}}
" }}} END: IDE plugins
" non-language filetypes {{{
" Plugin: csv.vim {{{
  Plugin 'chrisbra/csv.vim'
" }}}
" Plugin: vim-toml {{{
  Plugin 'cespare/vim-toml'
" }}}
" }}} END: non-language filetypes
" Distraction-free writing {{{
" Plugin: limelight {{{
  Plugin 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 'darkgray'
" }}}
" Plugin: Goyo {{{
  Plugin 'junegunn/goyo.vim'
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
  map <silent> <F3> :Goyo<CR>
" }}}
" }}}

call vundle#end()  " }}} End Vundle plugins
filetype plugin indent on  " set filetype back on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins;
"                     append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo;
"                     append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal
"}}}
" Language/font settings (default to English) {{{
set langmenu=en_US.UTF-8    " sets the language of the menu
language C

" set encoding/font options
set fencs=utf-8,euc-kr
set encoding=utf-8

if has("unix")
    set gfn=Inconsolata-dz\ for\ Powerline
elseif has("mac")
    set gfn=Inconsolata-dz\ for\ Powerline:h10
elseif has("win32")
    set gfn=Inconsolata-dz_for_Powerline:h10:cDEFAULT
endif

" set spelling to ignore CJK languages
set spelllang=en_us,cjk
"}}}
""" Custom functions {{{
function! <SID>StripTrailingWhiteSpaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
""" }}}
""" Visual settings {{{
" solarized color scheme
set background=dark
colorscheme solarized

" Set conceal to hide stuff under the hood
set conceallevel=2

set cursorline

" Make command line one line high
set ch=1

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide
"}}}
""" Key ReMappings                                                           {{{
" <C-l> to clear search highlighting
map <silent> <C-l> :let @/=""<CR>

" Window commands with ;
map ; <C-w>

"}}}
""" Functional stuff {{{

" Remove trailing white spaces on save
autocmd BufWRitePre * :call <SID>StripTrailingWhiteSpaces()

" Tabstops are 2 spaces by default (different specs are defined as ftplugins)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

if has("unix")
    set shell=bash
elseif has("win32")
    " set shell=bash.exe
    set shell=cmd.exe
    " set shell=ksh.exe
endif

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Setting this below makes it so that error messages don't disappear after
" one second on startup. But may result in excessive messaging in plugins such
" as NerdTree or CtrlP
"set debug=msg

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" Set the syntax foldmethod options
let g:vimsyn_folding='afPt'
"
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Make it easier to complete buffers, open files, etc...
set wildignorecase

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars, but don't wrap
set textwidth=80
set colorcolumn=80

" Set the textwidth to 72 for gitcommits
au FileType gitcommit set tw=72

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

" Don't make backups. Because I enjoy the thrill ...
"set nobackup
"set nowritebackup

" ...But when I do make backups, make sure that they don't get in the way :D

if has("unix")
    set backupdir=~/.vim/tmp,.
    set directory=~/.vim/tmp,.
elseif has("win32")
    set backupdir=~/_vim/tmp,.
    set directory=~/_vim/tmp,.
endif

" Set the update to 250ms for signs and whatnot
set updatetime=250
" }}}
