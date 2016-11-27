" Plugins {{{
    " Autoload Plug {{{
      if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
      endif
    " }}}
    call plug#begin('~/.vim/plugged')
    " Better Whitespace {{{
      Plug 'ntpeters/vim-better-whitespace'
    " }}}
    " Buffer Explorer {{{
      Plug 'vim-scripts/bufexplorer.zip'
      let g:bufExplorerDefaultHelp=0
      let g:bufExplorerShowRelativePath=1
      let g:bufExplorerFindActive=1
      let g:bufExplorerSortBy='name'
    " }}}
    " Buffer Tabline {{{
      Plug 'ap/vim-buftabline'
    " }}}
    " Commentary {{{
      Plug 'tpope/vim-commentary'
    " }}}
    " YouCompleteMe {{{
      Plug 'Valloric/YouCompleteMe', {
        \ 'do': './install.py --all',
        \}
    " }}}
    " CtrlP {{{
      Plug 'ctrlpvim/ctrlp.vim'
    " }}}
    " GitGutter {{{
      Plug 'airblade/vim-gitgutter'
    " }}}
    " Indent Guide {{{
      Plug 'nathanaelkane/vim-indent-guides'
      let g:indent_guide_start_level = 2
    " }}}
    " Leader Guide {{{
      Plug 'hecal3/vim-leader-guide'
    " }}}
    " Obsession {{{
      Plug 'tpope/vim-obsession'
    " }}}
    " Rainbow Parentheses {{{
      Plug 'kien/rainbow_parentheses.vim'
      au VimEnter * RainbowParenthesesToggle
      au Syntax * RainbowParenthesesLoadRound
      au Syntax * RainbowParenthesesLoadSquare
      au Syntax * RainbowParenthesesLoadBraces
    " }}}
    " Supertab {{{
      Plug 'ervandew/supertab'
      let g:SuperTabDefaultCompletionType = "<c-n>"
      let g:SuperTabContextDefaultCompletionType = "<c-n>"
    " }}}
    " NeoMake {{{
      Plug 'neomake/neomake'
      autocmd! BufWritePost * Neomake
    " }}}
    " Themes {{{
      Plug 'w0ng/vim-hybrid'
      Plug 'morhetz/gruvbox'
    " }}}
    " VDebug {{{
      Plug 'joonty/vdebug'
    " }}}
    " Vim Test {{{
      Plug 'janko-m/vim-test'
    " }}}

    " CSharp {{{
      Plug 'OrangeT/vim-csharp'
      Plug 'OmniSharp/omnisharp-vim', {
        \'do': 'cd server/ && xbuild && cd ../omnisharp-roslyn && ./build.sh'
        \}
      let g:OmniSharp_server_type = 'roslyn'
    " }}}
    " Elixir {{{
      Plug 'elixir-lang/vim-elixir'
      Plug 'slashmili/alchemist.vim'
    " }}}
    " Erlang {{{
      Plug 'vim-erlang/vim-erlang-runtime'
    " }}}
    " FSharp {{{
      Plug 'fsharp/vim-fsharp', {
        \ 'for': 'fsharp',
        \ 'do':  'make fsautocomplete',
        \}
    " }}}
    " Haskell {{{
      Plug 'eagletmt/neco-ghc'
      Plug 'eagletmt/ghcmod-vim'
      let g:haskellmode_completion_ghc = 0
      autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
      let g:ycm_semantic_triggers = {'haskell' : ['.']}
    " }}}
    " PHP {{{
      Plug 'stanangeloff/php.vim'
      Plug 'shawncplus/phpcomplete.vim'
      function! PhpSyntaxOverride()
        hi! def link phpDocTags  phpDefine
        hi! def link phpDocParam phpType
      endfunction

      augroup phpSyntaxOverride
        autocmd!
        autocmd FileType php call PhpSyntaxOverride()
      augroup END
    " }}}
    " Python {{{
      " pip install flake8
      Plug 'klen/python-mode'
      Plug 'davidhalter/jedi-vim'
      let g:pymode_lint                  = 0
      let g:syntastic_python_flake8_args = '--ignore="F403,F405"'
    " }}}
    " Racket {{{
      Plug 'wlangstroth/vim-racket'
      Plug 'micahelliott/vrod'
      let g:syntastic_enable_racket_racket_checker = 1
      if has("autocmd")
        au BufReadPost *.rkt,*.rktl set filetype=racket
        au filetype racket setlocal lisp
        au filetype racket setlocal autoindent
        au filetype racket setlocal lispwords+=public-method,override-method,private-method,syntax-case,syntax-rules
      endif
    " }}}
    " Ruby {{{
      " gem install rubocop
      Plug 'vim-ruby/vim-ruby'
      Plug 'rubycomplete.vim'
      let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
      let g:syntastic_ruby_exec              = '$HOME/.rbenv/shims/ruby'
      let g:syntastic_ruby_rubocop_exec      = '$HOME/.rbenv/shims/rubocop'
    " }}}
    " Rust {{{
      Plug 'rust-lang/rust.vim'
      Plug 'racer-rust/vim-racer'
      let g:rustfmt_autosave = 1
    " }}}
    " Swift {{{
      Plug 'keith/swift.vim'
      let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
    " }}}
    " TypeScript {{{
      Plug 'Shougo/vimproc.vim', {'do' : 'make'}
      Plug 'Quramy/tsuquyomi'
      Plug 'leafgarland/typescript-vim'
      let g:tsuquyomi_disable_quickfix = 1
      let g:syntastic_typescript_checkers = ['tsuquyomi']
    " }}}
    call plug#end()
  " }}}
  " Backups {{{
    set nobackup                                 " no backups
    set nowb                                     " don't write backup files
    set noswapfile                               " don't use swapfile
    " attempt to use undodir directory
    try
        set undodir=~/.vim/temp/undodir
        set undofile
    catch
    endtry
  " }}}
  " Colors {{{
    syntax enable                                " enable syntax highlighting
    set hlsearch                                 " highlight search matches
    set background=dark                          " use dark background
    set cursorline                               " highlight current line
    " colorscheme hybrid
    " if (has('termguicolors'))
    "   set termguicolors
    " endif
    colorscheme gruvbox
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
    set relativenumber
    set cmdheight=1                              " command line height
    set hidden                                   " allow modified buffers to be sent to background
    set showmatch                                " highlight matching brackets
    set noerrorbells                             " don't sound the bell
    set t_vb=
    set novisualbell                             " don't show the bell
    set foldcolumn=1                             " column size to show folds
    set laststatus=2                             " always show statusline
    set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
    set statusline+=%#warningmsg#
    set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
    set statusline+=%*
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
    set fileformats=unix,dos,mac                 " default to unix line endings
    set spell                                    " default to spell checking everything
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
    autocmd BufWritePre * call StripTrailingWhitespace()
  " }}}
