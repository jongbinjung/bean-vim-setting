let maplocalleader="'"

let b:ale_java_javac_sourcepath = 'java'

nnoremap <buffer> <LocalLeader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <LocalLeader>gD :YcmCompleter GoToDeclaration<CR>
nnoremap <buffer> <LocalLeader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <LocalLeader>gt :YcmCompleter GoTo<CR>
