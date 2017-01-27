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
" autocmd BufWritePre *.hs silent %!hindent --style gibiansky

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Process management:
nnoremap <Leader>mio :InteroOpen<CR>
nnoremap <Leader>mik :InteroKill<CR>
nnoremap <Leader>mic :InteroHide<CR>
nnoremap <Leader>mil :InteroLoadCurrentModule<CR>

" REPL commands
nnoremap <Leader>mie :InteroEval<CR>
nnoremap <Leader>mit :InteroGenericType<CR>
nnoremap <Leader>miT :InteroType<CR>
nnoremap <Leader>mii :InteroInfo<CR>
nnoremap <Leader>miI :InteroTypeInsert<CR>

" Go to definition:
nnoremap <Leader>mid :InteroGoToDef<CR>

" Highlight uses of identifier:
nnoremap <Leader>miu :InteroUses<CR>

" Reload the file in Intero after saving
autocmd! BufWritePost *.hs InteroReload
