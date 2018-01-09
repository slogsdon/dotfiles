setlocal shiftwidth=4 tabstop=4
setlocal commentstring=//\ %s

hi! def link phpDocTags  phpDefine
hi! def link phpDocParam phpType

let g:ale_php_phpcs_standard = 'PSR2'
