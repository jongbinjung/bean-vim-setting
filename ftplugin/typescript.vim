let maplocalleader="'"

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=120
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

nnoremap <buffer> K :YcmCompleter GetDoc<CR>
nnoremap <buffer> <LocalLeader>gt :YcmCompleter GoTo<CR>
nnoremap <buffer> <LocalLeader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <LocalLeader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <LocalLeader>rr :YcmCompleter RefactorRename
