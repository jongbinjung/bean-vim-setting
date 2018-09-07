let maplocalleader="'"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <LocalLeader>g :YcmCompleter GoTo<CR>

" Cargo shortcuts
nnoremap <LocalLeader>t :Dispatch cargo test<CR>
nnoremap <LocalLeader>b :Dispatch cargo build<CR>
nnoremap <LocalLeader>r :Dispatch cargo run<CR>
nnoremap <LocalLeader>c :Dispatch cargo check<CR>

" Code formatting shortcuts
nnoremap <LocalLeader>= :Cargo fmt<CR>
