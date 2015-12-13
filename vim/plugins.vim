set nocompatible          " be iMproved, required
filetype off              " required

" set the runtime path to include Plug and initialize
let g:plug_shallow = 0
call plug#begin('~/.vim/bundle/')

" Language Plugins
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'oscarh/vimerl', { 'for': 'erlang' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'lambdatoast/elm.vim'

" Language Support Plugins
Plug 'spf13/PIV', { 'for': 'php' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" Interface Plugins
Plug 'vim-scripts/bufexplorer.zip'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'

" Utility Plugins
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'

" All of your plugins must be added before the following
call plug#end()         " required
