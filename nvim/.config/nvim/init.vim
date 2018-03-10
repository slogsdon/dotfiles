" dein {{{
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

  if dein#load_state(expand('~/.config/nvim/dein'))
    call dein#begin(expand('~/.config/nvim/dein'))

    " Let dein manage dein
    call dein#add(expand('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'))

    " BEAM {{{
      call dein#add('slashmili/alchemist.vim', {
        \ 'on_ft': ['elixir'],
        \ })
    " }}}
    " .NET {{{
      call dein#add('fsharp/vim-fsharp', {
        \ 'build': 'make git',
        \ 'on_ft': ['fsharp'],
        \ })
      call dein#add('callmekohei/deoplete-fsharp', {
        \ 'depends': ['deoplete.nvim'],
        \ 'build': 'bash install.bash',
        \ 'on_ft': ['fsharp'],
        \ })
    " }}}
    " Javascript {{{
      call dein#add('othree/jspc.vim', {
        \ 'on_ft': ['javascript', 'jsx', 'javascript.jsx'],
        \ })
      call dein#add('MaxMEllon/vim-jsx-pretty', {
        \ 'on_ft': ['javascript', 'jsx', 'javascript.jsx', 'typescript', 'tsx', 'typescript.tsx'],
        \ })
      call dein#add('heavenshell/vim-jsdoc', {
        \ 'on_ft': ['javascript', 'jsx', 'javascript.jsx'],
        \ })
      call dein#add('moll/vim-node', {
        \ 'on_ft': ['javascript', 'jsx', 'javascript.jsx'],
        \ })
    " }}}
    " PHP {{{
      call dein#add('padawan-php/deoplete-padawan', {
        \ 'depends': ['deoplete.nvim'],
        \ 'build': 'composer install',
        \ 'on_ft': ['php'],
        \ })
    " }}}
    " Python {{{
      call dein#add('python-mode/python-mode', {
        \ 'on_ft': ['python'],
        \ })
      call dein#add('davidhalter/jedi-vim', {
        \ 'on_ft': ['python'],
        \ })
    " }}}
    " OCaml {{{
      call dein#add('reasonml-editor/vim-reason-plus', {
        \ 'on_ft': ['ocaml', 'reason'],
        \ })
    " }}}
    " Rust {{{
      call dein#add('racer-rust/vim-racer')
    " }}}
    " TypeScript {{{
      " call dein#add('Shougo/vimproc.vim', {
      "   \ 'build' : 'make',
      "   \ })
      " call dein#add('Quramy/tsuquyomi', {
      "   \ 'on_ft': ['typescript'],
      "   \ })
      if has('nvim')
        call dein#add('mhartington/nvim-typescript', {
          \ 'on_ft': ['typescript'],
          \ })
      endif
    " }}}
    " Miscellaneous {{{
      call dein#add('liuchengxu/space-vim-dark')
      call dein#add('w0rp/ale')
      call dein#add('/usr/local/opt/fzf')
      call dein#add('junegunn/fzf.vim')
      call dein#add('Shougo/deoplete.nvim')
      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif
      call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })
      call dein#add('hecal3/vim-leader-guide')
      call dein#add('sheerun/vim-polyglot')
    " }}}

    call dein#end()
    call dein#save_state()
  endif

  filetype plugin indent on
  syntax enable

  if dein#check_install()
    call dein#install()
    call dein#remote_plugins()
  endif

  command! DeinUpdate if dein#check_update() | call dein#update() | endif
  command! DeinClean call map(dein#check_clean(), "delete(v:val, 'rf')") | call dein#recache_runtimepath()
" }}}
" Interface {{{
  " allow buffers to hide without saving {{{
    set hidden
  " }}}
  " line numbers {{{
    set number
    set relativenumber
  " }}}
  " folding {{{
    set foldmethod=marker
  " }}}
  " tab with spaces and default sizing {{{
    set expandtab
    set tabstop=2
    set shiftwidth=2
  " }}}
  " colors {{{
    set hlsearch
    set cursorline
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set t_Co=256
    " if has("nvim")
      if has("termguicolors")
        set termguicolors
      endif
      set background=dark
      colorscheme space-vim-dark
    " endif
  " }}}
  " statusline {{{
    set statusline=%t       "tail of the filename
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%h      "help file flag
    set statusline+=%m      "modified flag
    set statusline+=%r      "read only flag
    set statusline+=%y      "filetype
    set statusline+=%=      "left/right separator
    set statusline+=[%{LinterStatus()}]
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
  " }}}
" }}}
" Plugins {{{
  " ale {{{
    let g:ale_open_list = 1
  " }}}
  " deoplete {{{
    let g:deoplete#enable_at_startup = 1
    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    " close scratch when autocomplete is closed
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " tabcomplete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  " }}}
  " fzf {{{
    " set here to hide VCS ignore files but show outside of vim
    let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
    let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \ }
  " }}}
  " languageclient {{{
    let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ }
    let g:LanguageClient_diagnosticsEnable = 0
  " }}}
  " polyglot {{{
    let g:polyglot_disabled = ['fsharp']
  " }}}
  " vim-jsx-pretty {{{
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
  " }}}
" }}}
