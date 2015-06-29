" add keyword and abstract to the end of Tex_FoldedEnvironments
let g:Tex_FoldedEnvironments = ",front"

let g:Tex_FoldedMisc = "<<<"
" let g:Tex_FoldedCommands = "newcommand,"

let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf, aux"

" Hard-wrap lines in TeX files
set formatoptions=t1

" don't pair `
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" map \tt to texcount
map <Leader>tt :!texcount %<CR>
