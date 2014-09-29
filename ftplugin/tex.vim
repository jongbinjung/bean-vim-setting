" add keyword and abstract to the end of Tex_FoldedEnvironments
let g:Tex_FoldedEnvironments = "verbatim,comment,eq,gather,align,figure,table,thebibliography,keyword,abstract,titlepage,front"

let g:Tex_FoldedMisc = "<<<"
" let g:Tex_FoldedCommands = "newcommand,"

let g:Tex_MultipleCompileFormats = "pdf, aux"
" Hard-wrap lines in TeX files
set formatoptions=t1

" map \tt to texcount
map <Leader>tt :!texcount %<CR>
