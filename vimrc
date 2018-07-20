" Non-essential plugs/settings have been commented out. Uncomment as necesary.

" Always use ViM (not Vi)
set nocompatible " be iMproved

" <Leader> to ,
let mapleader=";"

" Start vim-plug configs and plugins
" This determines where to install all the plugs
let path=$HOME. '/.vim/plugs/'

" Force use of python3 --- which makes some plugins faster (YCM!!!)
if has('python3')
  silent! python3 1
endif

call plug#begin(path)  " Plugin declarations start here ------------------- {{{
" Plugins that enhance usability, making life easier/faster --------------- {{{
" Plug 'tpope/vim-unimpaired'
" => Implements pair-wise operations with [ and ]

" Plug 'tpope/vim-dispatch'
" => Makes use of asynchronous jobs since Vim 8+
" (e.g., git push in the background)

" Plug 'fszymanski/ListToggle.vim'
" => Simple mapping to toggle Quickfix/Location lists (instead of having
" => separate mappings to open/close them); example mapping below:
"
" let g:listtoggle_no_maps = 1
" nmap <Leader>q <Plug>ListToggleQuickfixListToggle
" nmap <Leader>l <Plug>ListToggleLocationListToggle
" let g:listtoggle_no_focus = 1

" Plug 'tpope/vim-surround'
" => Quick access to surrounding things (e.g., quotes, parens)
" => default mappings are:
"    cs: change surround
"    ds: delete surround
"    yss: create surround (whole line)
"    ysiw: create surround (text object)

" Plug 'tpope/vim-repeat'
" => Allows for repeating plugin commands via . (e.g., vim-surround)

" Plug 'jiangmiao/auto-pairs'
" => For dealing with automatic pairing of brackets. Can be annoying if not
" => set-up properly ...

" Plug 'scrooloose/nerdcommenter'
" => For quickly (un)commenting lines
" let g:NERDSpaceDelims = 1
" }}} -------------------------------------------------------------------------
" Visual enhancements/pseudo-GUI plugins that are useful sometimes -------- {{{
Plug 'altercation/vim-colors-solarized'
" => Solarized colorscheme

" Plug 'mhinz/vim-signify'
" => visualize which lines have been added/deleted/modified in the gutter
"
" let g:signify_line_highlight = 0
" let g:signify_vcs_list = [ 'git' ]
" let g:signify_sign_change = '~'
" let g:signify_sign_changedelete = '\'

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeMirrorToggle' }
" Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeMirrorToggle' }
" => Popular/pretty file navigation (the second helps work with tabs)
"
" map <C-n> :NERDTreeMirrorToggle<CR>
" let g:NERDTreeDirArrows=1
" let g:nerdtree_tabs_open_on_gui_startup = 0

" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-airline/vim-airline'
" => Highly configurable fancy statusbar
" => Below are some settings that I've come up with, but reading the docs is
" => higly recommended!
"
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep=''
" let g:airline_right_alt_sep = ''
"
" let g:airline#extensions#quickfix#quickfix_text = 'Q'
" let g:airline#extensions#quickfix#location_text = 'L'
"
" let g:airline_mode_map = {
"     \ '__' : '-',
"     \ 'n'  : 'N',
"     \ 'i'  : 'I',
"     \ 'R'  : 'R',
"     \ 'c'  : 'C',
"     \ 'v'  : 'V',
"     \ 'V'  : 'V',
"     \ '' : 'V',
"     \ 's'  : 'S',
"     \ 'S'  : 'S',
"     \ '' : 'S',
"     \ 't'  : 'T',
"     \ }
"
" " set tabs with Airline
" let g:airline_theme='solarized'
" " set terminal colors to 256 for solarized theme
" set t_Co=256
"
" " Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>a <Plug>AirlineSelectPrevTab
" nmap <leader>s <Plug>AirlineSelectNextTab
" }}} -------------------------------------------------------------------------
" Plugins for fast file navigation/search --------------------------------- {{{
Plug 'kien/ctrlp.vim'
" => Let's you quickly open files by fuzzy search after hitting Ctrl + p
" => For faster, parallel search, instal SilverSearcher (ag) and uncomment the
" => following configuration (highly recommended)

let g:ctrlp_show_hidden = 1

" Use silver_searcher (https://github.com/ggreer/the_silver_searcher)
" let g:ctrlp_user_command = 'ag %s --nocolor --nogroup --hidden
  " \ --ignore .git
  " \ --ignore .svn
  " \ --ignore .hg
  " \ --ignore .DS_Store
  " \ --ignore "*.rds"
  " \ --ignore "*.png"
  " \ --ignore "*.jpg"
  " \ --ignore "*.pdf"
  " \ --ignore "**/*.pyc"
  " \ --ignore review
  " \ -g ""'

" Plug 'mileszs/ack.vim'
" => Useful for quickly searching files (codebase)
"
" Uncomment the following to use SilverSearcher (ag) instead of ack
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --smart-case'
" endif
"
" Search in background via vim-dispatch
" let g:ack_use_dispatch = 1
"
" Example mapping for quick access
" nnoremap <Leader>/ :Ack!<Space>

" Plug 'vim-scripts/TaskList.vim'
" => Create a list of TODO/FIXME by greping buffers, with the following mapping
" map <leader>td <Plug>TaskList
" }}} -------------------------------------------------------------------------
" Workflow-integration tools (git/style/snippets/templates etc.) ---------- {{{
Plug 'tpope/vim-fugitive'
" => Git integration; see example mappings below

nnoremap <silent> gs :Gstatus<CR>
nnoremap <silent> gk :Gpush<CR>
nnoremap <silent> gj :Gpull<CR>
nnoremap <silent> gd :Gdiff<CR>
nnoremap <silent> gb :Gblame<CR>
" NOTE(jongbin): Only use diffput --- less confusing
nnoremap <silent> dp :diffput<CR>

" Plug 'editorconfig/editorconfig-vim'
" => Implements the .editorconfig file standard in vim
" => see editorconfig.org for details and documentation
"
" let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" => Awesome snippet tool that supports programmable snippets! ... but only
" => useful if you're into using snippets and such ...
"
" let g:UltiSnipsEditSplit = "context"
" let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" => YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" => (via http://stackoverflow.com/a/22253548/1626737)
" let g:UltiSnipsExpandTrigger       = '<C-j>'
" let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Plug 'pgilad/vim-skeletons'
" => Let's you define filetype-specific templates (skeletons), ultisnips-style
"
" let skeletons#autoRegister = 1
" }}} -------------------------------------------------------------------------
" Auto-completing with YouCompleteMe -------------------------------------- {{{
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --gocode-completer' }
Plug 'ervandew/supertab'
" => Auto-complete. supertab helps trigger YCM with <Tab> key

let g:ycm_auto_start_csharp_server = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {
      \ 'gitcommit': 1,
      \ 'markdown': 1,
      \ 'sh': 1
      \}

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']"
" }}} -------------------------------------------------------------------------
" Asynchronous syntax checking with ALEls --------------------------------- {{{
Plug 'w0rp/ale'
" => General asyncronous syntax checker. Requires optional third-party tools
" => (e.g., pylint, flake, scalastyle) to work

" Mappint to (ale_fix), which runs dedicated fixers on the current buffer
" map <F8> <Plug>(ale_fix)

" My custom visual styles for ALE
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥']
" let g:ale_sign_error = '!!'
" let g:ale_sign_warning = '>>'

" Settings to (1) collect syntax issues in location list (instead of quickfix),
" and (2) keep the list hidden, until I decide to manually open/browse it
" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 0
" let g:ale_open_list = 0

" ALE settings for python and scala. Each of the tools need to be installed to
" work! (e.g., $ pip3 install pylint)
" let g:ale_linters = {
" \  'python': [
" \    'pylint',
" \    'flake8',
" \  ],
" \  'scala': [
" \    'scalastyle',
" \  ],
" \}

" Fixers to auto format (see mapping above); also requires third-party tools
" let g:ale_fixers = {
" \  'python': [
" \    'yapf',
" \  ],
" \  'scala': [
" \    'scalafmt',
" \  ],
" \}
" }}} -------------------------------------------------------------------------
" Sending lines in a vim buffer to some other terminal -------------------- {{{
" Plug 'jongbinjung/vim-slime'
" => For sending lines in a vim buffer to a terminal. General settings are here,
" => but then filetype specific settings/key mappings are defined under
" => ftplugin/

" Note that I use tmux, but there are other options (see :h slime)
" let g:slime_target = "tmux"
" let g:slime_paste_file = '/tmp/.' . $USER . '_slime_paste'
" if len($TMUX) > 0
  " let g:slime_default_config = {
        " \ "socket_name": split($TMUX, ",")[0],
        " \ "target_pane": ":.1"
        " \ }
" endif
"
" let g:slime_python_ipython = 1
" }}} -------------------------------------------------------------------------
" Python-specific plugings ------------------------------------------------ {{{
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv'
" => python specific plugs to deal with indents/folds/virtualenvs

" Show preview for docstrings when folded
let g:SimpylFold_docstring_preview=1
" }}} -------------------------------------------------------------------------
" Plugins for other languages/filetypes ----------------------------------- {{{
" (see respective docs for detailed configuration of each)
" Plug 'jalvesaq/R-Vim-runtime'
" Plug 'jalvesaq/Nvim-R'
" Plug 'JuliaLang/julia-vim'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'jongbinjung/stan.vim'
" Plug 'ensime/ensime-vim', { 'for': 'scala' }
" Plug 'jongbinjung/vim-scala'
" Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
" Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" Plug 'cespare/vim-toml'
" Plug 'gabrielelana/vim-markdown', { 'for': ['markdown', 'rmd'] }
" }}} -------------------------------------------------------------------------
call plug#end()  " }}} Pluging declarations end here --------------------------
" Custom vim functions ---------------------------------------------------- {{{
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
" }}} -------------------------------------------------------------------------
" Some general vim settings ----------------------------------------------- {{{
set encoding=utf-8

" set spelling to ignore CJK languages
set spelllang=en_us,cjk
" }}} -------------------------------------------------------------------------
" Some possibly-desirable, but preference-dependent settings -------------- {{{
" Remove trailing whitespaces before BufWrite (i.e., when saving a file)
autocmd BufWritePre * :call <SID>StripTrailingWhiteSpaces()
" }}} -------------------------------------------------------------------------
" Visual settings --------------------------------------------------------- {{{
" solarized color scheme
set background=dark
colorscheme solarized

" Show the current line number, and relative numbers on all other lines
" This makes it easier to jump directly to visible lines
set number
set relativenumber

" Set conceal to hide stuff under the hood
set conceallevel=2

" Hide the mouse pointer while typing
set mousehide

" Highlight the current line
set cursorline

" Make command line one line high
set ch=1

" Set visual bell instead of actual 'beep'
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make vim to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Let ViM change the terminal title
set title

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$
" }}} -------------------------------------------------------------------------
" Functional stuff -------------------------------------------------------- {{{
" Set the shell vim uses (can set to zsh here)
if has("unix")
    set shell=bash
elseif has("win32")
    set shell=cmd.exe
endif

" Tabstops are 2 spaces by default
" (different specs are defined via ftplugins, modline, or with .editorconfig)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" set the search scan to wrap lines
set wrapscan

" Backslashes suck chipmunk balls
set shellslash

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Timeout between multikey map/macros
" (I usually set this to 500, but it might be easier in the begining to give
" yourself some more time ... )
set timeoutlen=1000

" Keep some stuff in the history
set history=100

" Set the syntax foldmethod options
" (see :h g:vimsyn_folding for details)
let g:vimsyn_folding='afPt'

" These commands open folds (basically everything but horizontal movement)
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make command-line completion better by allowing wildmenu and ignoring case
set wildmenu
set wildignorecase

" Same as default except that I remove the 'u' option
" (see :h 'complete')
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
" This can be set differently for different languages in ftplugin/
set textwidth=80
set colorcolumn=81

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match search
set incsearch

" Automatically (re-)read files that changed on disk
set autoread

" Set the update to 250ms for signs and whatnot
set updatetime=250
" }}} -------------------------------------------------------------------------
" vim: set ts=2 sw=2 tw=80 et :
