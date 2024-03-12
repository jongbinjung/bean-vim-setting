let maplocalleader="'"

" Attempt to set virtualenv directory to $WORKON_HOME, assume current directory contains virtualenv
if isdirectory($WORKON_HOME)
  let g:virtualenv_directory = $WORKON_HOME
else
  let g:virtualenv_directory = '.'
  if isdirectory('venv')
    let g:virtualenv_name = 'venv'
  endif
  if isdirectory('.venv')
    let g:virtualenv_name = '.venv'
  endif
endif

" Indentation
setlocal autoindent
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

" Line length
setlocal colorcolumn=120
setlocal textwidth=119

setlocal fileformat=unix

" Let formatter take care of wrapping; don't disturb my typing!
setlocal formatoptions-=t

let b:ale_python_ruff_format_change_directory=1
let b:ale_fix_on_save=1
let python_highlight_all=1

" Turn off ALE completion, because I'm more used to YCM, and too old to relearn
let b:ale_completion_enabled = 0

nnoremap <buffer> <LocalLeader>f :ALEFix<CR>
nnoremap <buffer> <LocalLeader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <LocalLeader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <LocalLeader>gt :YcmCompleter GoTo<CR>
nnoremap <buffer> <LocalLeader>i :!isort %<CR><CR>
nnoremap <buffer> <LocalLeader>ref :YcmCompleter RefactorExtractFunction<SPACE>
nnoremap <buffer> <LocalLeader>rev :YcmCompleter RefactorExtractVariable<SPACE>
nnoremap <buffer> <LocalLeader>ri :YcmCompleter RefactorInline<CR>
nnoremap <buffer> <LocalLeader>rr :YcmCompleter RefactorRename<SPACE>
nnoremap <buffer> K :YcmCompleter GetDoc<CR>

" Run current file with pytest, in new async process
nnoremap <buffer> <LocalLeader>t :Spawn! python -m pytest %<CR>

nmap <LocalLeader><ESC> <plug>(YCMHover)

let g:slime_no_mappings = 1
let b:slime_bracketed_paste = 1

xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend
nmap <buffer> <LocalLeader>p <Plug>SlimeMotionSend
