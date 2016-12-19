"let g:haskellmode_completion_ghc = 0
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
let g:neomake_haskell_enabled_checkers = ['ghcmod', 'hlint']
let g:neomake_haskell_ghc_mod_args = '-g-Wall'
let g:ghcmod_use_basedir = getcwd()
let g:necoghc_enable_detailed_browse = 1
let g:haskell_tabular = 1
let g:haskellmode_completion_ghc = 0
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.haskell = ['.']

setlocal omnifunc=necoghc#omnifunc
setlocal commentstring=--\ %s
setlocal formatprg=""
autocmd BufWritePre *.hs silent %!hindent --style gibiansky
