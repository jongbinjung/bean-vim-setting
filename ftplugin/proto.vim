setlocal foldmethod=indent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=79

" Requires protilint, see: https://github.com/yoheimuta/protolint
let b:ale_fixers = {'proto': ['protolint', 'remove_trailing_lines']}
let b:ale_fix_on_save = 1
