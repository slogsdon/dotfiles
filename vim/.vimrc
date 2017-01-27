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
    " Completion {{{
      " Plug 'Valloric/YouCompleteMe', {
      "   \ 'do': './install.py --all',
      "   \}
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      let g:deoplete#enable_at_startup = 1
      " Plug 'Shougo/neocomplete.vim'
      " " Use neocomplete.
      " let g:neocomplete#enable_at_startup = 1
      " " Use smartcase.
      " let g:neocomplete#enable_smart_case = 1
      " " Set minimum syntax keyword length.
      " let g:neocomplete#sources#syntax#min_keyword_length = 3
      " " Define keyword.
      " if !exists('g:neocomplete#keyword_patterns')
      "   let g:neocomplete#keyword_patterns = {}
      " endif
      " let g:neocomplete#keyword_patterns['default'] = '\h\w*'
      " " Enable heavy omni completion.
      " if !exists('g:neocomplete#sources#omni#input_patterns')
      "   let g:neocomplete#sources#omni#input_patterns = {}
      " endif
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
    " Neomake {{{
      Plug 'scrooloose/syntastic'
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0
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
      if has("gui_running")
        imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
      else " no gui
        if has("unix")
          inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
        endif
      endif
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

    " Bash {{{
      Plug 'vim-scripts/bash-support.vim'
    " }}}
    " Crystal {{{
      Plug 'rhysd/vim-crystal'
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
      let g:syntastic_fsharp_checkers = ['syntax']
    " }}}
    " Haskell {{{
      Plug 'neovimhaskell/haskell-vim'
      Plug 'eagletmt/neco-ghc'
      Plug 'eagletmt/ghcmod-vim'
      Plug 'parsonsmatt/intero-neovim'
      let g:necoghc_enable_detailed_browse = 1
    " }}}
    " LFE {{{
      Plug 'lfe-support/vim-lfe'
    " }}}
    " OCaml {{{
      Plug 'rgrinberg/vim-ocaml'

      " " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
      " let s:opam_share_dir = system("opam config var share")
      " let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

      " let s:opam_configuration = {}

      " function! OpamConfOcpIndent()
      "   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
      " endfunction
      " let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

      " function! OpamConfOcpIndex()
      "   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
      " endfunction
      " let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

      " function! OpamConfMerlin()
      "   let l:dir = s:opam_share_dir . "/merlin/vim"
      "   execute "set rtp+=" . l:dir
      " endfunction
      " let s:opam_configuration['merlin'] = function('OpamConfMerlin')

      " let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
      " let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
      " let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
      " for tool in s:opam_packages
      "   " Respect package order (merlin should be after ocp-index)
      "   if count(s:opam_available_tools, tool) > 0
      "     call s:opam_configuration[tool]()
      "   endif
      " endfor
      " " ## end of OPAM user-setup addition for vim / base ## keep this line
      " " ## added by OPAM user-setup for vim / ocp-indent ## 91ca5483aee87df4abb2081c3e774cf9 ## you can edit, but keep this line
      " if count(s:opam_available_tools,"ocp-indent") == 0
      "   source "/Users/shane.logsdon/.opam/system/share/vim/syntax/ocp-indent.vim"
      " endif
      " " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

      let g:syntastic_ocaml_checkers = ['merlin']
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
      " let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
      let g:phpcomplete_parse_docblock_comments = 1
      let g:neomake_php_phpcs_args_standard = 'PSR2'
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
    " Reason {{{
      " Plug 'reasonml/vim-reason-loader'
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
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set t_ut=                                    " force opaque background
    let g:gruvbox_contrast_light = "soft"
    colorscheme gruvbox
    if (has('termguicolors'))
      set termguicolors
    endif
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
    set statusline+=%{SyntasticStatuslineFlag()}
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
