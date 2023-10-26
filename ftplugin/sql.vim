let maplocalleader="'"

setlocal autoindent
setlocal commentstring=--\ %s
setlocal expandtab
setlocal fileformat=unix
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal textwidth=79
setlocal nowrap

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>sp <Plug>SlimeParagraphSend
