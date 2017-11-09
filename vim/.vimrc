" Plugins {{{
   " Autoload Plug {{{
     if empty(glob('~/.config/nvim/autoload/plug.vim'))
       silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       autocmd VimEnter * PlugInstall | source $MYVIMRC
     endif
   " }}}
   call plug#begin('~/.config/nvim/plugged')
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
   " CtrlP {{{
     Plug 'ctrlpvim/ctrlp.vim'
     let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|deps\|packages'
   " }}}
   " GitGutter {{{
     Plug 'airblade/vim-gitgutter'
   " }}}
   " Leader Guide {{{
     Plug 'hecal3/vim-leader-guide'
   " }}}
   " Obsession {{{
     Plug 'tpope/vim-obsession'
   " }}}
   " OmniComplete {{{
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
     " Plug 'roxma/nvim-completion-manager'
     Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
     " Plug 'roxma/LanguageServer-php-neovim',  { 'do': 'composer install && composer run-script parse-stubs' }
     " Plug 'mhartington/nvim-typescript', {
     "       \ 'for': ['typescript'],
     "       \ 'do': ':UpdateRemotePlugins',
     "       \ }
     " Plug 'carlitux/deoplete-ternjs', {
     "       \ 'for': ['javascript', 'javascript.jsx'],
     "       \ 'do': 'npm install -g tern',
     "       \ }

     let g:deoplete#enable_at_startup = 1
     let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
     let g:deoplete#omni#functions.javascript = [
           \ 'tern#Complete',
           \ 'jspc#omni',
           \ ]
     let g:deoplete#sources = get(g:, 'deoplete#sources', {})
     let g:deoplete#sources['vue.javascript.jsx'] = ['file', 'ternjs']
     let g:tern#command = ['tern']
     let g:tern#arguments = ['--persistent']
     let g:tern#filetypes = [
           \ 'jsx',
           \ 'javascript.jsx',
           \ 'vue',
           \ ]

     set completeopt-=preview
     inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
         inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
     let g:LanguageClient_autoStart = 1
   " }}}
   " Syntax Checking {{{
     Plug 'w0rp/ale'

     let g:ale_open_list = 1
   " }}}
   " Themes {{{
     "Plug 'w0ng/vim-hybrid'
     Plug 'morhetz/gruvbox'
     "Plug 'trevordmiller/nova-vim'
     "Plug 'rakr/vim-one'
     "Plug 'joshdick/onedark.vim'
     "Plug 'colepeters/spacemacs-theme.vim'
   " }}}
   " BEAM {{{
     " Plug 'elixir-lang/vim-elixir', { 'for': ['elixir'] }
     " Plug 'slashmili/alchemist.vim', { 'for': ['elixir'] }
     		" Plug 'lfe-support/vim-lfe', { 'for': ['lfe'] }
     " Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['erlang'] }
     " Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': ['erlang'] }
   " }}}
   " JavaScript {{{
     Plug 'mxw/vim-jsx'
     Plug 'pangloss/vim-javascript'
     Plug 'elzr/vim-json'

     let g:javascript_plugin_jsdoc = 1
     let g:javascript_plugin_flow = 1
     let g:jsx_ext_required = 0 " Allow JSX in normal JS files
     let g:ale_linters = get(g:, 'ale_linters', {})
     let g:ale_linters.javascript = ['flow', 'xo']
   " }}}
   " Markdown {{{
     " Plug 'tpope/vim-markdown'
   " }}}
   " .NET {{{
     " Plug 'OrangeT/vim-csharp', { 'for': ['csharp'] }
     " Plug 'tpope/vim-dispatch', { 'for': ['csharp'] }
     " Plug 'omnisharp/omnisharp-vim', {
     "       \ 'for': ['csharp'],
     "       \ 'do': 'cd server/ && xbuild && cd ../omnisharp-roslyn && ./build.sh',
     "       \ }
     " Plug 'Robzz/deoplete-omnisharp', { 'for': ['csharp'] }
     " Plug 'fsharp/vim-fsharp', {
     "       \ 'for': ['fsharp'],
     "       \ 'do':  'make fsautocomplete',
     "       \ }

     let g:OmniSharp_server_type = 'roslyn'
   " }}}
   " PHP {{{
     Plug 'StanAngeloff/php.vim', { 'for': ['php'] }

     let g:ale_php_phpcs_standard = 'PSR2'

     " function! PhpSyntaxOverride()
     "   hi! def link phpDocTags  phpDefine
     "   hi! def link phpDocParam phpType
     " endfunction

     " augroup phpSyntaxOverride
     "   autocmd!
     "   autocmd FileType php call PhpSyntaxOverride()
     " augroup END
   " }}}
   " Racket {{{
     Plug 'wlangstroth/vim-racket'
     autocmd filetype racket setlocal lispwords+=public-method,override-method,private-method,syntax-case,syntax-rules
   " }}}
   " Rust {{{
     Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
     " Plug 'racer-rust/vim-racer', { 'for': ['rust'] }

     let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
     let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'nightly', 'rls']
     let g:racer_experimental_completer = 1
   " }}}
   " TypeScript {{{
     " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
     " Plug 'Quramy/tsuquyomi'
     " Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'typescript'] }
     " Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
     " Plug 'ianks/vim-tsx'

     let g:typescript_indent_disable = 1

     autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
   " }}}
   " Swift {{{
     Plug 'keith/swift.vim'
   " }}}
   " Purescript {{{
     Plug 'raichoo/purescript-vim'
     Plug 'FrigoEU/psc-ide-vim'
   " }}}
   " Go {{{
     Plug 'fatih/vim-go'
   " }}}
   " Idris {{{
     Plug 'idris-hackers/idris-vim'
   " }}}
   " Crystal {{{
     Plug 'rhysd/vim-crystal'
   " }}}
   " Alpaca {{{
     Plug 'lepoetemaudit/alpaca_vim'
   " }}}
   " Erlang {{{
     Plug 'vim-erlang/vim-erlang-runtime'
   " }}}
   " Elixir {{{
     Plug 'elixir-lang/vim-elixir'
   " }}}
   " Elm {{{
     Plug 'ElmCast/elm-vim'
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
   if (has('termguicolors'))
     set termguicolors
   endif
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
   set statusline+=Lint\:\ %{ALEGetStatusLine()}
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
