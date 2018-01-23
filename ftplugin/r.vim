let maplocalleader="'"

" Auto expand ">>" snippet to pipe operator
inoremap <silent><buffer> >> >><C-R>=UltiSnips#Anon('%>%', '>>')<cr>

" Action shortcuts
nmap <silent> <LocalLeader>rk :call RAction("levels")<CR>
nmap <silent> <LocalLeader>rh :call RAction("head")<CR>
nmap <silent> <LocalLeader>rz :call RAction("tail")<CR>

vmap <silent> <LocalLeader>rh :call RAction("head", "v")<CR>
vmap <silent> <LocalLeader>rz :call RAction("tail", "v")<CR>
