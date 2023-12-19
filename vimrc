" <Leader> to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Start vim-plug configs and plugins {{{
let path=$HOME. '/.vim/plugs/'

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(path)

" Usability enhancements {{{
" Plugin: vim-unimpaired  {{{
  Plug 'tpope/vim-unimpaired'
" }}}
" Plugin: vim-dispatch - Asynchronous commands! {{{
  Plug 'tpope/vim-dispatch'
  let g:dispatch_compilers = {
    \ 'rust': 'vargo'
  \}
" }}}
" Plugin: Toggle quick/location lists {{{
  Plug 'Valloric/ListToggle'

  let g:lt_location_list_toggle_map = '<leader>l'
  let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}
" Plugin: Window movements {{{
  Plug 'andymass/vim-tradewinds'
" }}}
" Plugin: Register peekaboo {{{
  Plug 'junegunn/vim-peekaboo'
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
" Plugin: netrw w/ vinegar {{{
  Plug 'tpope/vim-vinegar'
" }}}
" Plugin: vim-snipe (replace easymotion) {{{
  Plug 'yangmillstheory/vim-snipe'

  let g:snipe_highlight_gui_color      = '#ff0000'
  let g:snipe_highlight_cterm256_color = 'blue'
  let g:snipe_highlight_cterm_color    = 'red'

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
" }}}
" Plugin: CtrlP-style fuzzy file/directory search matching {{{
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Tell FZF to use RG - so we can skip .gitignore files even if not using
  " :GFiles search
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

  nnoremap <C-p> :Files<Cr>
  nnoremap <C-b> :Buffers<Cr>
" }}}
" Plugin: Deep search with ack.vim {{{
  Plug 'mileszs/ack.vim'

  " Use rg, if it exists
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
  " Alternatively use ag, if it exists
  elseif executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
  endif

  " Search in background via vim-dispatch
  let g:ack_use_dispatch = 1

  " Any empty ack search will search for the work the cursor is on
  let g:ack_use_cword_for_empty_search = 1

  " nnoremap <Leader>/ :Ack!<Space>
  nnoremap <Leader>/ :Rg<Space>
" }}}
" }}} END: File/text navigation
" Visual enhancements {{{
" Plugin: Smart search highlighting {{{
  Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1
" }}}
" Plugin: color schemes {{{
  Plug 'lifepillar/vim-solarized8'
  Plug 'cocopon/iceberg.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/seoul256.vim'
" }}}
" Plugin: Dim inactive windows {{{
  Plug 'blueyed/vim-diminactive'

  let g:diminactive_use_syntax = 0  " disable syntax hl for inactive windows
  let g:diminactive_enable_focus = 1
" }}}
" Plugin: Vim-tmux focus events fix {{{
  " TODO(jongbin): Using Ctrl to show mouse location in Gnome will mess-up
  " Ctrl key bindings -- Ctrl-down will be captured as losing focus from vim!
  Plug 'tmux-plugins/vim-tmux-focus-events'
" }}}
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
      \ 't'  : 'T',
      \ }

  " set tabs with Airline
  " set terminal colors to 256 for solarized theme
  if has("termguicolors")
    set termguicolors
  endif

  " Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1

  let g:airline#extensions#virtualenv#enabled = 1

  " Show just the filename
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

  let g:airline#extensions#tabline#formatter = 'default'
" }}}
" }}} END: Visual enhancements
" Version Control (git) {{{
" Plugin: Fugitive {{{
  Plug 'tpope/vim-fugitive'

  nnoremap <silent> gs :Git<CR>
  " nnoremap <silent> gk :Git push<CR>
  nnoremap <silent> gj :Git pull<CR>
  nnoremap <silent> gd :Git diff<CR>
  nnoremap <silent> gb :Git blame<CR>
  " NOTE(jongbin): Only use diffput --- less confusing
  nnoremap <silent> dp :diffput<CR>
" }}}
" Plugin: Link to github {{{
  Plug 'ruanyl/vim-gh-line'

  " Default key mapping for a blob view: <leader>gh
  " Default key mapping for a blame view: <leader>gb
  " Default key mapping for repo view: <leader>go

  " let g:gh_line_map_default = 0
  let g:gh_line_blame_map_default = 0
  " let g:gh_line_map = '<leader>gh'
  " let g:gh_line_blame_map = '<leader>gb'
" }}}
" Plugin: signify (visualize diffs in the gutter) {{{
  Plug 'mhinz/vim-signify'

  let g:signify_line_highlight = 0
  let g:signify_vcs_list = [ 'git' ]
  let g:signify_sign_change = '~'
  let g:signify_sign_changedelete = '\'

  " let g:signify_cursorhold_insert     = 0
  " let g:signify_cursorhold_normal     = 0
  " let g:signify_update_on_bufenter    = 0
  " let g:signify_update_on_focusgained = 0
" }}}
" }}} END: VCS (git)
" IDE plugins {{{
" basic IDE capabilities {{{
" Plugin: Keyword highlighting {{{
  Plug 'RRethy/vim-illuminate'
  let g:Illuminate_ftHighlightGroups = {
        \ 'vim': ['vimVar', 'vimString', 'vimLineComment', 'vimFuncName',
        \         'vimFunction', 'vimUserFunc', 'vimFunc']
        \ }

  let g:Illuminate_ftblacklist = [
        \ 'nerdtree',
        \ 'gitcommit'
        \ ]
" }}}
" Plugin: Tags {{{
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'liuchengxu/vista.vim'

  map <silent><F5> :Vista!!<CR>

  " Don't be so aggresive about generating tags; I'll tell you when I need em
  let g:gutentags_generate_on_missing=0
  let g:gutentags_generate_on_new=0
  let g:gutentags_cache_dir=$HOME. '/.tags/'
" }}}
" Plugin: Editorconfig {{{
" see editorconfig.org for documentation
  Plug 'editorconfig/editorconfig-vim'

  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}
" Plugin: Auto Pairs (Pair parentheses) {{{
  Plug 'jiangmiao/auto-pairs'

  let g:AutoPairsFlyMode = 0
" }}}
" Plugin: Snippets (ultisnips) {{{
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  let g:UltiSnipsEditSplit = "context"
  let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
  let g:UltiSnipsSnippetDirectories=["ultisnips"]
  " let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]

  let g:ultisnips_python_style = "google"

  " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
  " (via http://stackoverflow.com/a/22253548/1626737)
  let g:UltiSnipsExpandOrJumpTrigger = '<C-j>'
  " let g:UltiSnipsExpandTrigger       = '<C-j>'
  " let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" }}}
" Plugin: skeletons {{{
  Plug 'pgilad/vim-skeletons'

  let skeletons#autoRegister = 1
" }}}
" Plugin: REPL environment {{{
  " send commands to a tmux pane
  Plug 'jpalardy/vim-slime'

  let g:slime_target = "tmux"
  let g:slime_paste_file = '/tmp/.' . $USER . '_slime_paste'
  if len($TMUX) > 0
    let g:slime_default_config = {
          \ "socket_name": split($TMUX, ",")[0],
          \ "target_pane": ":.1"
          \ }
  endif

  " let g:slime_python_ipython = 1
" }}}
" Plugin: Comment management {{{
  " Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-commentary'

  " let g:NERDSpaceDelims = 1
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

  let g:ale_set_loclist = 1
  let g:ale_set_quickfix = 0
  let g:ale_open_list = 0

  let g:ale_linters = {
  \  'markdown': [
  \    'marksman',
  \  ],
  \  'python': [
  \    'jedils',
  \    'ruff',
  \  ],
  \  'scala': [
  \    'scalastyle',
  \    'scalafix',
  \  ],
  \  'sql': [
  \    'sqlfluff',
  \  ],
  \}

  let g:ale_fixers = {
  \  'python': [
  \    'ruff',
  \  ],
  \  'scala': [
  \    'scalafmt',
  \  ],
  \  'sql': [
  \    'sqlfluff',
  \  ],
  \}

  " Let shellcheck follow external sources (SC1091)
  let g:ale_sh_shellcheck_options = '-x'

  " Ignore
  "   SC2002: Useless cat
  let g:ale_sh_shellcheck_exclusions = 'SC2002'

  " Enabled globally; ftplugin should disable at buffer-level if using YCM
  let g:ale_completion_enabled = 1
  " let g:ale_set_balloons = 1
  " let g:ale_hover_to_floating_preview = 1

  " set omnifunc=ale#completion#OmniFunc
" }}}
" Plugin: Completion engine {{{
  Plug 'ervandew/supertab'
  Plug 'Valloric/YouCompleteMe', {
    \ 'do': 'python3 install.py --clang-completer --gocode-completer --rust-completer --java-completer --ts-completer'
    \}

  let g:ycm_auto_start_csharp_server = 0
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_filetype_specific_completion_to_disable = {
      \ 'fugitive': 1,
      \ 'gitcommit': 1,
      \ 'markdown': 1,
      \ 'peekaboo': 1,
      \}
  " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
  " (via http://stackoverflow.com/a/22253548/1626737)
  let g:SuperTabDefaultCompletionType    = '<C-n>'
  let g:SuperTabCrMapping                = 0
  let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']"

" }}}
" }}} END: basic IDE capabilities
" Plugin: Jinja2 {{{
  Plug 'Glench/Vim-Jinja2-Syntax'
" }}}
" Plugin: Python {{{
  Plug 'jongbinjung/SimpylFold', { 'for': 'python' }
  Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'cjrh/vim-conda', { 'for': 'python' }
  Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
  Plug 'psf/black', { 'tag': 'stable' }

  let g:black_quiet = 1

  let g:virtualenv_auto_activate = 1
  let g:SimpylFold_docstring_preview = 1
" }}}
" Plugin: R {{{
  Plug 'jalvesaq/R-Vim-runtime'
  Plug 'jalvesaq/Nvim-R'

  let R_applescript = 0
  let R_rconsole_width = 100
  let R_tmpdir=$HOME . "/tmp"
  let R_nvimpager = "horizontal"


  " Load tmux script for Nvim-R
  let R_in_buffer = 0
  let R_source = $HOME . '/.vim/plugs/Nvim-R/R/tmux_split.vim'

  " Packages to complete/highlighting out-of-box
  " (Otherwise, R env must be loaded)
  let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,dplyr,ggplot2'

  let r_syntax_folding = 1

  " Open or reload html after knit
  let R_openhtml = 1

  " an underscore will be replaced with the assign operator only if it is
  " preceded by a space and followed by a non-word character.
  let R_assign = 3
" }}}
" Plugin: julia {{{
  Plug 'JuliaLang/julia-vim'
" }}}
" Plugin: go {{{
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
" Plugin: scala {{{
  Plug 'andreypopp/ensime', { 'for': 'scala' }
  " Plug 'derekwyatt/vim-scala'
  Plug 'jongbinjung/vim-scala'

  " Typecheck after write
  autocmd BufWritePost *.scala silent :EnTypeCheck
" }}}
" Plugin: vimlatex {{{
  Plug 'lervag/vimtex'

  " let g:vimtex_view_method = 'zathura'
  let g:vimtex_view_method = 'mupdf'
  let g:vimtex_quickfix_latexlog = {
        \ 'overfull' : 0,
        \ 'underfull' : 0,
        \}
  let g:tex_flavor = 'latex'
" }}}
" Plugin: rust {{{
  Plug 'rust-lang/rust.vim'
" }}}
" }}} END: IDE plugins
" markup/non-language filetypes {{{
" Plugin: csv.vim {{{
  Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" }}}
" Plugin: vim-toml {{{
  Plug 'cespare/vim-toml'
" }}}
" Plugin: markdown {{{
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'

  " Use default folding because vim-markdown is broken
  let g:vim_markdown_folding_disabled = 1
  let g:markdown_folding = 1

  let g:vim_markdown_folding_level = 6
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_toml_frontmatter = 1
  " let g:vim_markdown_folding_style_pythonic = 1
" }}}
" }}} END: markup/non-language filetypes
" Vanity/misc. {{{
" Plugin: limelight {{{
  Plug 'junegunn/limelight.vim'

  " Map to <leader>f(ocus)
  nmap <silent> <Leader>f :Limelight!!<CR>

  let g:limelight_conceal_ctermfg = 'darkgray'
" }}}
" Plugin: Goyo {{{
  Plug 'junegunn/goyo.vim'

  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
  map <silent> <F3> :Goyo<CR>
" }}}
" Plugin: Jira in vim (vira) {{{
  " Plug 'n0v1c3/vira', { 'do': './install.sh' }
" }}}
" }}}

call plug#end()
" }}}
" Language/font settings (default to English) {{{
language C

" set encoding/font options
set fencs=utf-8,euc-kr
set encoding=utf-8

" Input mehtod settings
" set noimd

" set spelling to ignore CJK languages
set spelllang=en_us,cjk
" }}}
" Global key ReMappings                                                    {{{
" <leader>c to clear search highlighting
" map <silent> <leader>c :let @/=""<CR>

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Window commands with ,
map , <C-w>

" o in visual mode triggers 'o'rdering (sort)
vmap o :sort<CR>
" }}}
" Custom functions {{{
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
""" }}}
" Autocmds {{{
" Remove trailing whitespaces before BufWrite
autocmd BufWritePre * :call <SID>StripTrailingWhiteSpaces()

" Any files that have sql in the extention is considered sql (e.g., sql.gotmpl)
autocmd BufRead,BufNewFile *.sql.* set filetype=sql
autocmd BufRead,BufNewFile *.sf.sql set filetype=snowflake.sql

" Keep folds as-is when editing (INSERT mode) and changing buffer views (Win)
" autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
" autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual
" }}}
" Visual settings {{{
" solarized | nord | iceberg
set background=dark
" colorscheme solarized8
" let g:airline_theme='solarized'
colorscheme seoul256
let g:airline_theme='seoul256'

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

" Let ViM change the terminal title
set title
" }}}
" Functional stuff {{{
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

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set ignorecase
set smartcase

" Backslashes suck chipmunk balls
set shellslash

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
" set debug=msg

" Timeout between multikey map/macros
set timeoutlen=500

" Keep some stuff in the history
set history=100

" Set the syntax foldmethod options
let g:vimsyn_folding='afPt'

" These commands open folds (basically everything but horizontal movement)
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
" set key=

" Make the command-line completion better
set wildmenu

" Make it easier to complete buffers, open files, etc...
set wildignorecase

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80
set colorcolumn=81

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Automatically read a file that has changed on disk
set autoread

" Set the update to 250ms for signs and whatnot
set updatetime=250

" Remote yank
" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
if executable('yank')
  function! Yank(text) abort
      let escape = system('yank', a:text)
      if v:shell_error
        echoerr escape
      else
        call writefile([escape], '/dev/tty', 'b')
      endif
  endfunction
  noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>

  " automatically run yank(1) whenever yanking in Vim
  " (this snippet was contributed by Larry Sanderson)
  function! CopyYank() abort
    call Yank(join(v:event.regcontents, "\n"))
  endfunction
  autocmd TextYankPost * call CopyYank()
endif
" }}}
" vim: set ts=2 sw=2 tw=80 et :
