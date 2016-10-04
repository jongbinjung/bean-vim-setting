let maplocalleader="'"
let g:vimtex_fold_enabled = 1
" Set spellcheck for vim
setlocal spell spelllang=en_us
" add keyword and abstract to the end of Tex_FoldedEnvironments
" let g:Tex_FoldedEnvironments = ",keyword,abstract"

let g:Tex_FoldedMisc = "<<<"
" let g:Tex_FoldedCommands = "newcommand,"

let g:Tex_DefaultTargetFormat="pdf"
"let g:Tex_BibtexFlavor = 'biber'
let g:Tex_MultipleCompileFormats="pdf, dvi"

"if has('unix')
    "" Never Forget, To set the default viewer:: Very Important
    "let g:Tex_ViewRule_pdf = 'zathura'

    "" Trying to add same for pdfs, hoping that package SynTex is installed
    ""let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode $*'
     "let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

    "" Get the correct servername, which should be the filename of the tex file,
    "" without the extension.
    "" Using the filename, without the extension, not in uppercase though, but
    "" that's okay for a servername, it automatically get uppercased
    "let theuniqueserv = expand("%:r")

    "" Working!!!, when we run vim appropriately
    "let g:Tex_ViewRuleComplete_pdf = 'zathura $*.pdf &'
    ""let g:Tex_ViewRuleComplete_pdf = 'zathura -x "vim --servername '.theuniqueserv.' --remote +\%{line} \%{input}" $*.pdf &'

    "function! Synctex()
        "let execstr = 'silent! !zathura --synctex-forward '.line('.').':1:"'.expand('%').'" "'.expand("%:p:r").'".pdf'
        "execute execstr
    "endfunction
    "map <localleader>lf :call Synctex()<cr>
"end
" Hard-wrap lines in TeX files
set formatoptions=t1

" don't pair `
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" map \tt to texcount
map <LocalLeader>wc :!texcount %<CR>

" auto pairs in tex env.
if exists('g:AutoPairs')
  let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'"}
end
