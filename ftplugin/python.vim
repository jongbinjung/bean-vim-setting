let maplocalleader="'"

" Attempt to set virtualenv directory to $WORKON_HOME, assume current directory contains virtualenv
if isdirectory($WORKON_HOME)
  let g:virtualenv_directory = $WORKON_HOME
else
  let g:virtualenv_directory = '.'
  if isdirectory('venv')
    let g:virtualenv_name = 'venv'
  endif
endif

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

let python_highlight_all=1

nnoremap <buffer> K :YcmCompleter GetDoc<CR>
nnoremap <buffer> <LocalLeader>gt :YcmCompleter GoTo<CR>
nnoremap <buffer> <LocalLeader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <LocalLeader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <LocalLeader>rr :YcmCompleter RefactorRename
nnoremap <buffer> <LocalLeader>i :!isort %<CR><CR>

let g:slime_no_mappings = 1
let b:slime_bracketed_paste = 1

xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
nmap <buffer> <LocalLeader>p <Plug>SlimeMotionSend
