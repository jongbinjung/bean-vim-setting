let maplocalleader="'"

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

" let $BROWSER = 'chrome %s'

nnoremap <buffer> <silent> <LocalLeader>t :EnType<CR>
xnoremap <buffer> <silent> <LocalLeader>t :EnType selection<CR>
nnoremap <buffer> <silent> <LocalLeader>T :EnTypeCheck<CR>

nnoremap <buffer> <silent> K  :EnDocBrowse<CR>
nnoremap <buffer> <silent> <LocalLeader>g :EnDeclarationSplit<CR>

" nnoremap <buffer> <silent> <C-]>  :EnDeclaration<CR>
" nnoremap <buffer> <silent> <C-w>] :EnDeclarationSplit<CR>
" nnoremap <buffer> <silent> <C-w><C-]> :EnDeclarationSplit<CR>
" nnoremap <buffer> <silent> <C-v>] :EnDeclarationSplit v<CR>

" nnoremap <buffer> <silent> <LocalLeader>i :EnInspectType<CR>
nnoremap <buffer> <silent> <LocalLeader>i :EnOrganizeImports<CR>
nnoremap <buffer> <silent> <LocalLeader>I :EnSuggestImport<CR>
nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>
nnoremap <buffer> <silent> <LocalLeader>u :EnUsages<CR>

" TODO(jongbin): set to search token under cursor?
nnoremap <buffer> <LocalLeader>/ :EnSearch

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
