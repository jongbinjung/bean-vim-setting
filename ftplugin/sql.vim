let maplocalleader="'"

setlocal autoindent
setlocal commentstring=--\ %s
setlocal expandtab
setlocal fileformat=unix
setlocal nowrap
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

setlocal foldmethod=indent

" Line length
setlocal colorcolumn=120
setlocal textwidth=120

" Auto-detect sqlfluff dialect from filename.
" e.g. foo.sf.sql -> snowflake, foo.presto.sql -> presto
let s:sql_dialect_aliases = {
      \ 'sf': 'snowflake',
      \ 'pg': 'postgres',
      \ 'bq': 'bigquery',
      \ 'spark': 'sparksql',
      \ }

if fnamemodify(expand('%:t'), ':e') ==# 'sql'
  let s:middle_ext = fnamemodify(expand('%:t'), ':r:e')
  if !empty(s:middle_ext)
    let s:sql_dialect = get(s:sql_dialect_aliases, s:middle_ext, s:middle_ext)
    if !exists("b:ale_sql_sqlfluff_options")
      let b:ale_sql_sqlfluff_options = ""
    endif
    let b:ale_sql_sqlfluff_options .= " --dialect " . s:sql_dialect
  endif
endif


let g:slime_no_mappings = 1
xmap <buffer> <Space> <Plug>SlimeRegionSend
nmap <buffer> <Space> <Plug>SlimeLineSend<Down>
nmap <buffer> <LocalLeader>sp <Plug>SlimeParagraphSend

nnoremap <buffer> <LocalLeader>f :Start sqlfmt %<CR>
