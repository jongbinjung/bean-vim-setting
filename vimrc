set nocompatible " be iMproved
filetype off " required! 

if has("unix")
    let path=$HOME. '/.vim/bundle/'
elseif has("win32")
    let path=$HOME . '_vim/bundle/'
    let &runtimepath=&runtimepath . ',' . $HOME . '_vim'
endif

" Set the appropriate runtimepath
let rtp_path=path . 'Vundle.vim'
let &runtimepath=&runtimepath . ',' . rtp_path

""" Vundle settings {{{

call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin: Fugitive {{{
Plugin 'tpope/vim-fugitive'
" }}}

" Plugin: Airline (for fancy status bar) {{{
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
"}}}

" Plugin: syntastic (syntax checker) {{{
Plugin 'scrooloose/syntastic'
"}}}

" Plugin: vim-gitgutter (visualize git diffs in the gutter) {{{
Plugin 'airblade/vim-gitgutter'
"}}}

" Plugin: minibufexpl (tabbed buffer explorer) {{{
Plugin 'techlivezheng/vim-plugin-minibufexpl'
" Settings for minibufexpl
"   Move windows with C-{hjkl}
let g:miniBufExplMapWindowNavVim = 1
"   C-Tab C-S-Tab for Switching Buffers within the Selected window
let g:miniBufExplMapCTabSwitchBufs = 1

"}}}

" Plugin: NERDtree {{{{
Plugin 'scrooloose/nerdtree'
"}}}

" Plugin: CtrlP (fuzzy file/directory search matching) {{{
Plugin 'kien/ctrlp.vim'
"}}}

" Plugin: solarized (color scheme) {{{
Plugin 'altercation/vim-colors-solarized'
"}}}

" Plugin: vim-flake8 (Python PEP8 syntax checker) {{{
Plugin 'nvie/vim-flake8'
" }}}

" Plugin: vimlatex {{{
" Plugin 'vimlatex'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
" }}}

call vundle#end()            " required
filetype plugin indent on    " required
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

""" Language/font settings (default to English) {{{

set langmenu=en_US.UTF-8    " sets the language of the menu
language C

" set encoding/font options
set fencs=utf-8,euc-kr
set encoding=utf-8

" (don't forget to install fonts from ~/Drobbox/src/fonts)
" set gfn=BeanCode:h10:cDEFAULT
if has("unix")
    set gfn=Inconsolata-dz\ for\ Powerline:h10
elseif has("win32")
    set gfn=Inconsolata-dz_for_Powerline:h10:cDEFAULT
endif

"}}}

""" Gui settings {{{

" solarized color scheme
set background=dark
colorscheme solarized

" show line numbers
set nu

" Make command line one line high
set ch=1

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acmg

" set vim window size for when gui is running
if has("gui_running")
    set lines=40 columns=90
endif

"}}}

""" Key ReMappings {{{

"   the EndOfLine command
map - $
vmap - $

" map command :C to clear search highlighting
command C let @/=""

"   Map Omni Completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"   Window split switching
map , <C-w>

"   Mapping the Apple (Command Key) to Ctrl for Mac
if has("mac")
    map <D-d> <C-d>
    map <D-u> <C-u>
    map <D-j> <C-j>
    map! <D-j> <C-j>
endif

"}}}

""" Functional stuff {{{

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
" one second on startup.
" set debug=msg

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

" Set the foldmethod to auto fold 
set foldmethod=marker

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Folds for xml
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

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
" set wildignorecase

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars, but don't wrap
set textwidth=80
set colorcolumn=80
" set winminwidth=79

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
 set nobackup
" set nowritebackup
 
" ...But when I do make backups, make sure that they don't get in the way :D

if has("unix")
    set backupdir=~/.vim/tmp,.
    set directory=~/.vim/tmp,.
elseif has("win32")
    set backupdir=~/_vim/tmp,.
    set directory=~/_vim/tmp,.
endif
" }}}

""" Vim-Latex Options {{{
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" set iskeyword+=:
"
" OPTIONAL: Make Vim open the compiled pdf (if it exists) when opening a 
" tex filetype
if has("gui_macvim")
    autocmd FileType tex :exe "!open -a Skim " . shellescape(expand("%:r")) . ".pdf"<CR>
endif

" Python (Omni Complete, etc)
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
map <unique> <Leader>rp :!python %<CR>
" }}}
