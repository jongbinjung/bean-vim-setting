let maplocalleader="'"

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

" Hard-wrap lines in markdown files
setlocal colorcolumn=140
setlocal formatoptions+=t1
setlocal textwidth=140

let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>pp <Plug>SlimeParagraphSend<Down>
nmap <buffer> <LocalLeader>p <Plug>SlimeMotionSend

let b:ale_set_balloons = 1
let b:ale_hover_to_floating_preview = 1

nnoremap <buffer> K <Plug>(ale_hover)
nnoremap <buffer> <LocalLeader>gd <Plug>(ale_go_to_definition)
nnoremap <buffer> <LocalLeader>gr :ALEFindReferences -quickfix<CR>
nnoremap <buffer> <LocalLeader>rr :ALERename<CR>
nnoremap <buffer> <LocalLeader>ca :ALECodeAction<CR>

" inoremap <buffer> [[ [[]]<left><left><Plug>(ale_complete)
" set omnifunc=ale#completion#OmniFunc
" Use omnicomplete first
let b:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
