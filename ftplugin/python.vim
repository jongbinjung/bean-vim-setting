let maplocalleader="'"

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

let python_highlight_all=1

nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <LocalLeader>g :YcmCompleter GoTo<CR>
nnoremap <LocalLeader>i :!isort %<CR><CR>

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
nmap <buffer> <LocalLeader>p <Plug>SlimeMotionSend
