let maplocalleader="'"

setlocal foldmethod=indent

" Hard-wrap lines in markdown files
setlocal formatoptions=croqlj

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
