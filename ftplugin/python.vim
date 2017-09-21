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

" Code formatting shortcuts
nnoremap <LocalLeader>= :0,$!yapf --style google<CR>
nnoremap <LocalLeader>i :!isort %<CR><CR>

" More convenient VTR options and mappings for python
vnoremap <Space> :VtrSendLinesToRunner<cr>
nnoremap <Space> :VtrSendLinesToRunner<cr><Down>
