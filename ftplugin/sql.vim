let maplocalleader="'"

setlocal autoindent
setlocal commentstring=--\ %s
setlocal expandtab
setlocal fileformat=unix
setlocal nowrap
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=120

" if !exists("b:ale_sql_sqlfluff_options")
" let b:ale_sql_sqlfluff_options="--exclude-rules layout.indent,layout.cte_bracket,layout.select_targets"
"       \. " --templater jinja"
"       " \. " --max_line_length 120"
" endif


let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>sp <Plug>SlimeParagraphSend

nnoremap <buffer> <LocalLeader>f :Start sqlfmt %<CR>
