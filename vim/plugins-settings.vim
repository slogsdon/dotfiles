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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_no_mappings = 1

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

autocmd FileType javascript setlocal commentstring=//\ %s

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" PHP
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2 -n --report=csv"

autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType php setlocal commentstring=//\ %s

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal commentstring=#\ %s

" Elixir
let g:syntastic_enable_elixir_checker = 1

autocmd FileType elixir setlocal shiftwidth=2 tabstop=2
autocmd FileType elixir setlocal commentstring=#\ %s

" Haskell
let g:haskellmode_completion_ghc = 0
let g:hdevtools_options = '-g-isrc -g-Wall'
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setlocal commentstring=--\ %s
