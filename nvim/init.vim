" General {{{
  " Backups {{{
    set nobackup                                 " no backups
    set nowb                                     " don't write backup files
    set noswapfile                               " don't use swapfile
    " attempt to use undodir directory
    try
        set undodir=~/.config/nvim/temp/undodir
        set undofile
    catch
    endtry
  " }}}
  " Colors {{{
    syntax enable                                " enable syntax highlighting
    set hlsearch                                 " highlight search matches
    colorscheme tomorrow-night-eighties          " Tomorrow Night Eighties colorscheme
    set background=dark                          " use dark background
    set cursorline                               " highlight current line
  " }}}
  " Folds {{{
    set foldenable                               " enable folding
    set foldlevelstart=0                         " open 2 folds by default
    set foldmethod=marker                        " fold based on default marker `{{{,}}}`
  " }}}
  " Interface {{{
    set lazyredraw                               " only redraw updated portions of the screen
    set showcmd                                  " show inprogress command
    set number                                   " show line numbers
    set cmdheight=1                              " command line height
    set hidden                                   " allow modified buffers to be sent to background
    set showmatch                                " highlight matching brackets
    set noerrorbells                             " don't sound the bell
    set t_vb=
    set novisualbell                             " don't show the bell
    set foldcolumn=1                             " column size to show folds
    set laststatus=2                             " always show statusline
    set noshowmode                               " don't show mode in last line
    set linebreak                                " break long lines
    set textwidth=500
    set wrap                                     " wrap long lines
    set mouse=                                   " no mouse
    set modeline                                 " allow modeline on last line of file
    let g:netrw_liststyle=3                      " default netrw listing
    set scrolloff=7                              " number of lines above/below cursor

    " allows cursor change in tmux mode
    if exists('$TMUX')
      let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI= "\<Esc>]50;CursorShape=1\x7"
      let &t_EI="\<Esc>]50;CursorShape=0\x7"
    endif
  " }}}
  " Misc {{{
    set history=100                              " command history length
    set autoread                                 " read file contents into buffer when modified outside of vim
    set fileformats=unix,dos,mac                 " default to uniz line endings
  " }}}
  " Search {{{
    set incsearch                                " show results while entering search
  " }}}
  " Spaces and Tabs {{{
    set backspace=indent,eol,start               " backspace should work like normal
    set whichwrap+=<,>,h,l                       " allow cursor to wrap to previous/next line
    set autoindent                               " copy indentation from previous line on new line
    set expandtab                                " expand tabs to spaces
    set smarttab                                 " controls how <TAB> works
    set shiftwidth=2                             " how many columns text is indented with reindent operations
    set tabstop=2                                " visual spaces per tab
    set softtabstop=2                            " number of spaces in tab when editing
    autocmd BufWritePre * :call StripTrailingWhitespace() " trim trailing whitespace before buffer write
  " }}}
" }}}
" Plugins {{{
  " Autoload Plug {{{
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
  " }}}
  " Settings {{{
    let g:plug_shallow = 0
  " }}}
  " Plugins {{{
    call plug#begin('~/.config/nvim/plugged')
    " Language {{{
      Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
      Plug 'oscarh/vimerl', { 'for': 'erlang' }
      Plug 'tpope/vim-markdown', { 'for': 'markdown' }
      Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
      Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
      Plug 'rust-lang/rust.vim', { 'for': 'rust' }
      Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
      Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }
      Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
      Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
      Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
      Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
    " }}}
    " Interface {{{
      Plug 'vim-scripts/bufexplorer.zip'
      Plug 'ctrlpvim/ctrlp.vim'
      Plug 'myusuf3/numbers.vim'
      Plug 'altercation/vim-colors-solarized'
      Plug 'itchyny/lightline.vim'
      Plug 'edkolev/tmuxline.vim'
      Plug 'ap/vim-buftabline'
    " }}}
    " Utility {{{
      Plug 'benmills/vimux'
      Plug 'tpope/vim-fugitive'
      Plug 'terryma/vim-multiple-cursors'
      Plug 'tpope/vim-commentary'
      Plug 'benmills/vimux'
      Plug 'benekastah/neomake'
      Plug 'Shougo/deoplete.nvim'
      Plug 'ervandew/supertab'
      Plug 'janko-m/vim-test'
    " }}}
    call plug#end()
  " }}}
" }}}
" Plugins Settings {{{
  " bufExplorer plugin {{{
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    let g:bufExplorerFindActive=1
    let g:bufExplorerSortBy='name'
  " }}}
  " CTRL-P {{{
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_map='<c-f>'
    let g:ctrlp_max_height=20
    let g:ctrlp_custom_ignore={
      \ 'dir': 'node_modules\|^\.DS_Store\|^\.(hg|svn|git)\|(_build|deps|vendor)\',
      \ 'file': '',
      \ 'link': '',
      \ }
  " }}}
  " deoplete {{{
    let g:deoplete#enable_at_startup=1
  " }}}
  " lightline {{{
    let g:lightline={
          \ 'colorscheme': 'wombat',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'fugitive', 'filename' ],
          \             [ 'ctrlpmark' ] ],
          \   'right': [ [ 'syntastic', 'lineinfo' ],
          \              [ 'percent' ],
          \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
          \ },
          \ 'component_function': {
          \   'fugitive': 'LightLineFugitive',
          \   'filename': 'LightLineFilename',
          \   'fileformat': 'LightLineFileformat',
          \   'filetype': 'LightLineFiletype',
          \   'fileencoding': 'LightLineFileencoding',
          \   'mode': 'LightLineMode',
          \   'ctrlpmark': 'CtrlPMark',
          \ },
          \ 'component_expand': {
          \   'syntastic': 'SyntasticStatuslineFlag',
          \ },
          \ 'component_type': { 'syntastic': 'error', }
          \ }
    let g:ctrlp_status_func={
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }
  " }}}
  " neomake {{{
    autocmd! BufWritePost,BufEnter * Neomake
  " }}}
  " tmuxline {{{
    let g:tmuxline_powerline_separators=0
    let g:tmuxline_preset='powerline'
    let g:tmuxline_theme='lightline'
  " }}}
  " vimux {{{
    let g:VimuxOrientation="h"
    let g:VimuxHeight="40"
    let g:slime_target="tmux"
    let g:slime_paste_file=tempname()
    let g:slime_no_mappings=1
  " }}}
  " vim-test {{{
    let g:test#strategy = "neovim"
  " }}}
" }}}
" Languages {{{
  " Markdown {{{
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  " }}}
" }}}
