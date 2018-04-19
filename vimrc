" Always use ViM (not Vi)
set nocompatible " be iMproved

" <Leader> to ,
let mapleader=";"

" Allow external configs for project-specific settings
set exrc

""" Plugin path settings {{{
if has("unix")
  let path=$HOME. '/.vim/plugs/'
elseif has("win32")
  let path=$HOME . '_vim/plugs/'
  let &runtimepath=&runtimepath . ',' . $HOME . '_vim'
endif

call has('python3')
" Start vim-plug configs and plugins {{{
call plug#begin(path)

" Usability enhancements {{{
" Plugin: vim-unimpaired  {{{
  Plug 'tpope/vim-unimpaired'
" }}}
" Plugin: vim-dispatch - Asynchronous commands! {{{
  Plug 'tpope/vim-dispatch'
" }}}
" Plugin: ZoomWin  {{{
  Plug 'vim-scripts/ZoomWin'
" }}}
" }}} END: Usability enhancements
" File/text navigation {{{
" Plugin: vim-surround  {{{
  Plug 'tpope/vim-surround'

  " cs: change surround
  " ds: delete surround
  " yss: create surround (whole line)
  " ysiw: create surround (text object)
" }}}
" Plugin: vim-repeat {{{
  Plug 'tpope/vim-repeat'
  " repeat plugins with . (e.g., vim-surround)
" }}}
" Plugin: NERDtree {{{
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeMirrorToggle' }
  Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeMirrorToggle' }

  " set <C-n> to toggle
  map <C-n> :NERDTreeMirrorToggle<CR>
  " use arrows to look prettier
  let g:NERDTreeDirArrows=1
  let g:nerdtree_tabs_open_on_gui_startup = 0
"}}}
" Plugin: vim-snipe (replace easymotion) {{{
  Plug 'yangmillstheory/vim-snipe'

  map <leader><leader>F <Plug>(snipe-F)
  map <leader><leader>f <Plug>(snipe-f)
  map <leader><leader>T <Plug>(snipe-T)
  map <leader><leader>t <Plug>(snipe-t)

  map <leader><leader>w <Plug>(snipe-w)
  map <leader><leader>W <Plug>(snipe-W)
  map <leader><leader>e <Plug>(snipe-e)
  map <leader><leader>E <Plug>(snipe-E)
  map <leader><leader>b <Plug>(snipe-b)
  map <leader><leader>B <Plug>(snipe-B)
  map <leader><leader>ge <Plug>(snipe-ge)
  map <leader><leader>gE <Plug>(snipe-gE)
"}}}
" Plugin: CtrlP (fuzzy file/directory search matching) {{{
  Plug 'kien/ctrlp.vim'

  let g:ctrlp_show_hidden = 1
  " Use silver_searcher (https://github.com/ggreer/the_silver_searcher)
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "*.rds"
    \ --ignore "*.png"
    \ --ignore "*.jpg"
    \ --ignore "*.pdf"
    \ --ignore "**/*.pyc"
    \ --ignore review
    \ -g ""'
"}}}
" }}} END: File/text navigation
" Visual enhancements {{{
" Plugin: color schemes {{{
  Plug 'altercation/vim-colors-solarized'
  " Plug 'crusoexia/vim-monokai'
"}}}
" Plugin: Dim inactive windows {{{
  Plug 'blueyed/vim-diminactive'

  let g:diminactive_use_syntax = 0  " disable syntax hl for inactive windows
  let g:diminactive_enable_focus = 1
"}}}
" Plugin: Vim-tmux focus events fix {{{
  " TODO(jongbin): Using Ctrl to show mouse location in Gnome will mess-up
  " Ctrl key bindings -- Ctrl-down will be captured as losing focus from vim!
  Plug 'tmux-plugins/vim-tmux-focus-events'
"}}}
" Plugin: Airline (for fancy status bar) {{{
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'

  let g:airline_powerline_fonts = 1
  let g:airline_left_sep=''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep=''
  let g:airline_right_alt_sep = ''

  let g:airline#extensions#quickfix#quickfix_text = 'Q'
  let g:airline#extensions#quickfix#location_text = 'L'

  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

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
" Plugin: Markdown folding {{{
  Plug 'gabrielelana/vim-markdown', { 'for': ['markdown', 'rmd'] }

  let g:markdown_enable_folding = 1
" }}}
" }}} END: Visual enhancements
" Version Control (git) {{{
" Plugin: Fugitive {{{
  Plug 'tpope/vim-fugitive'

  nnoremap <silent> gs :Gstatus<CR>
  nnoremap <silent> gk :Gpush<CR>
  nnoremap <silent> gj :Gpull<CR>
  nnoremap <silent> gd :Gdiff<CR>
" }}}
" Plugin: signify (visualize diffs in the gutter) {{{
  Plug 'mhinz/vim-signify'

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
  Plug 'jiangmiao/auto-pairs'

  let g:AutoPairsFlyMode = 0
" }}}
" Plugin: Editorconfig {{{
" see editorconfig.org for documentation
  Plug 'editorconfig/editorconfig-vim'

  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}
" Plugin: ultisnips {{{
  Plug 'SirVer/ultisnips'

  let g:UltiSnipsExpandTrigger = "<C-j>"
  let g:UltiSnipsJumpForwardTrigger = "<C-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
  let g:UltiSnipsEditSplit = "context"
  let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
" }}}
" Plugin: vim-snippets {{{
  Plug 'honza/vim-snippets'
" }}}
" Plugin: skeletons {{{
  Plug 'pgilad/vim-skeletons'

  let skeletons#autoRegister = 1
" }}}
" Plugin: vim-tmux-runner {{{
  " send commands to a tmux pane
  Plug 'christoomey/vim-tmux-runner'

  " Percentage and orientation of runner window
  let g:VtrPercentage = 50
  let g:VtrOrientation = "h"  " Open to right of vim

  " Options for retaining whbtespaces when used with python
  let g:VtrStripLeadingWhitespace = 0
  let g:VtrClearEmptyLines = 1
  let g:VtrAppendNewline = 1

  " Vim-tmux-runner Mappings
  " Some filetype specific mappings are defined in ftplugins (e.g., python)
  vnoremap <leader><Space> :VtrSendLinesToRunner<cr>
  nnoremap <leader><Space> :VtrSendLinesToRunner<cr><Down>
  nmap <leader>or :VtrOpenRunner<cr>
  nmap <leader>cr :VtrSendCtrlD<cr>
  nmap <leader>ar :VtrAttachToPane<cr>
"}}}
" Plugin: Supertab (for completion with Tab) {{{
  Plug 'ervandew/supertab'
" }}}
" Plugin: nerdcommenter {{{
  Plug 'scrooloose/nerdcommenter'

  let g:NERDSpaceDelims = 1
" }}}
" Plugin: TaskList {{{
  " Create a list of TODO/FIXME
  Plug 'vim-scripts/TaskList.vim'

  map <leader>td <Plug>TaskList
" }}}
" Plugin: Syntax checker {{{
  Plug 'w0rp/ale'

  map <F8> <Plug>(ale_fix)

  " ALE status line messages Error/Warnings/OK
  let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥']

  let g:ale_sign_error = '!!'
  let g:ale_sign_warning = '>>'

  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1

  " Let shellcheck follow external sources (SC1091)
  let g:ale_sh_shellcheck_options = '-x'

  " Ignore
  "   SC2002: Useless cat
  let g:ale_sh_shellcheck_exclusions = 'SC2002'

  let g:ale_linters = {'python': ['pylint', 'flake8']}

  let g:ale_fixers = {
  \   'python': [
  \       'yapf',
  \   ],
  \}
" }}}
" Plugin: YCM {{{
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }

  let g:ycm_auto_start_csharp_server = 0
  let g:ycm_autoclose_preview_window_after_completion = 1
" }}}
" }}} END: basic IDE capabilities
" Plugin: Python {{{
  Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
  Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
  Plug 'jmcantrell/vim-virtualenv'

  let g:SimpylFold_docstring_preview=1
"}}}
" Plugin: Nvim-R {{{
  Plug 'jalvesaq/R-Vim-runtime'
  Plug 'jalvesaq/Nvim-R'

  " Use tmux
  let R_in_buffer = 0
  let R_applescript = 0
  let R_rconsole_width = 100
  let R_tmpdir="~/tmp"
  let R_nvimpager = "horizontal"

  " Map assignment shortcut to match Rstudio
  set <M-->=-
  let R_assign_map = "<M-->"

  let r_syntax_folding = 1

  " Vim-R plugin mappings
  vmap <Space> <Plug>RDSendSelection
  nmap <Space> <Plug>RDSendLine
  nmap K <Plug>RHelp
" }}}
" Plugin: vim-julia {{{
  Plug 'JuliaLang/julia-vim'
" }}}
" Plugin: vim-go {{{
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
" }}}
" Plugin: Stan {{{
  Plug 'jongbinjung/stan.vim'
" }}}
" Plugin: vimlatex {{{
  Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }

  let g:vimtex_view_method = 'zathura'
" }}}
" }}} END: IDE plugins
" non-language filetypes {{{
" Plugin: csv.vim {{{
  Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" }}}
" Plugin: vim-toml {{{
  Plug 'cespare/vim-toml'
" }}}
" }}} END: non-language filetypes
" Distraction-free writing {{{
" Plugin: limelight {{{
  Plug 'junegunn/limelight.vim'

  nmap <Leader>l :Limelight!!<CR>
  " nmap <Leader>l <Plug>(Limelight)
  " xmap <Leader>l <Plug>(Limelight)

  let g:limelight_conceal_ctermfg = 'darkgray'
  " let g:limelight_default_coefficient = 0.5
" }}}
" Plugin: Goyo {{{
  Plug 'junegunn/goyo.vim'

  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
  map <silent> <F3> :Goyo<CR>
" }}}
" }}}

call plug#end()  " }}} End Plug configs and plugins

filetype plugin indent on  " set filetype back on
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

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
""" }}}
""" Visual settings {{{
" solarized color scheme
set background=dark
colorscheme solarized

set number
set relativenumber

" Set conceal to hide stuff under the hood
set conceallevel=2

" Hide the mouse pointer while typing
set mousehide

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

" Let ViM change the terminal title
set title
"}}}
""" Key ReMappings                                                           {{{
" <leader>c to clear search highlighting
map <silent> <leader>c :let @/=""<CR>

" Window commands with ,
map , <C-w>
"}}}
""" Functional stuff {{{
" Remove trailing white spaces with <F5>
nnoremap <F5> :keepp<Bar>:%s/\s\+$//e<Bar>:keepj<Bar><CR>
autocmd BufWRitePre * :call <SID>StripTrailingWhiteSpaces()

" Tabstops are 2 spaces by default
" (different specs are defined as ftplugins or with .editorconfig)
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

" Backslashes suck chipmunk balls
set shellslash

if has("unix")
    set shell=bash
elseif has("win32")
    set shell=cmd.exe
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

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Keep folds as-is when editing (INSERT mode) and changing buffer views (Win)
autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual

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
