" Set the appropriate runtimepath
set runtimepath=~/Dropbox/vim,$VIMRUNTIME
"------------------------------------------------------------------------------
" Pathogen for Bundling Plugins
"------------------------------------------------------------------------------
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"------------------------------------------------------------------------------
" Language settings default to English (for some other disturbing systems)
"------------------------------------------------------------------------------
set langmenu=en_US.UTF-8    " sets the language of the menu
language C

"------------------------------------------------------------------------------
" Global Settings
"------------------------------------------------------------------------------

" ReMappings
"   the EndOfLine command
map - $
vmap - $

" map command :cls
" used to clear the search highlighting
command C let @/=""

" show line numbers
set nu

" Colorscheme to mustang !!!
colorscheme mustang

"   Map TagList Toggle
map P :TlistToggle<CR>

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
endif

" set encoding/font options
set fencs=utf-8,euc-kr
set encoding=utf-8

" (don't forget to install BeanCode from ~/Drobbox/Dev)
set gfn=BeanCode:h10:cDEFAULT

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

" Spell check ... need to be file-type specific, and support Korean ?
" :setlocal spell spelllang=en_us

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

if has("unix")
    set shell=bash
else
    set shell=cmd.exe
    " set shell=ksh.exe
endif

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Set the status line the way i like it
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]\ [%{strlen(&fenc)?&fenc:'none'}]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

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

" Setting this below makes it so that error messages don't disappear after one second on startup.
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

" Set the textwidth to be 80 chars
set textwidth=80

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

"------------------------------------------------------------------------------
" Vim-Latex Options
"------------------------------------------------------------------------------
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set iskeyword+=:

" Settings for minibufexpl
"   Move windows with C-{hjkl}
let g:miniBufExplMapWindowNavVim = 1
"   C-Tab C-S-Tab for Switching Buffers within the Selected window
let g:miniBufExplMapCTabSwitchBufs = 1

" Python (Omni Complete, etc)
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
map <unique> <Leader>rp :!python %<CR>
