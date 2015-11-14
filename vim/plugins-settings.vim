" bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

" CTRL-P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|_build\|deps\'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_no_mappings = 1

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" PHP
autocmd FileType php setlocal shiftwidth=4 tabstop=4

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2 -n --report=csv"

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" Elixir
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2

let g:syntastic_enable_elixir_checker = 1

" Haskell
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:hscoptions = ''
