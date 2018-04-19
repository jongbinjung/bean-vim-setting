let maplocalleader="'"

" Load tmux script for Nvim-R
" let R_source = '~/.vim/plugs/Nvim-R/R/tmux_split.vim'

" Auto expand ">>" snippet to pipe operator
inoremap <silent><buffer> >> >><C-R>=UltiSnips#Anon('%>%', '>>')<cr>

" Use omnicomplete first
let b:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" Action shortcuts
nmap <silent> <LocalLeader>rk :call RAction("levels")<CR>
nmap <silent> <LocalLeader>rh :call RAction("head")<CR>
nmap <silent> <LocalLeader>rz :call RAction("tail")<CR>

vmap <silent> <LocalLeader>rh :call RAction("head", "v")<CR>
vmap <silent> <LocalLeader>rz :call RAction("tail", "v")<CR>
