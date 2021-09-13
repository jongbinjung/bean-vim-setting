let maplocalleader="'"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
" Hard-wrap lines in markdown files
setlocal formatoptions+=t1
setlocal textwidth=160
setlocal colorcolumn=160
setlocal expandtab

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
nmap <buffer> <LocalLeader>p <Plug>SlimeMotionSend
