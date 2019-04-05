let maplocalleader="'"

let g:vimtex_fold_enabled = 1
" Set spellcheck for vim
setlocal spell spelllang=en_us
" add keyword and abstract to the end of Tex_FoldedEnvironments
" let g:Tex_FoldedEnvironments = ",keyword,abstract"

" Hard-wrap lines in TeX files
set formatoptions=t1

" don't pair `
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" map <LocalLeader>tt to texcount
map <LocalLeader>wc :!texcount %<CR>

" auto pairs in tex env.
if exists('g:AutoPairs')
  let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'"}
end

" Enable YCM
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]

setlocal textwidth=120
setlocal colorcolumn=120
