let maplocalleader="'"

set foldmethod=indent

nnoremap <buffer> K :YcmCompleter GetDoc<CR>
nnoremap <buffer> <LocalLeader>gt :YcmCompleter GoTo<CR>
nnoremap <buffer> <LocalLeader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <LocalLeader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <LocalLeader>rr :YcmCompleter RefactorRename
