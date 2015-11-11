set mouse= " no mouse
set autoread " Set to auto read when a file is changed from the outside
let mapleader = " "
let g:mapleader = " "
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set ruler " Always show current position
set number " Show current line number in NORMAL and absolute line numbers in INSERT.
set cmdheight=1 " Height of the command bar

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1 " Add a bit extra margin to the left
syntax enable " Enable syntax highlighting
set background=dark
colorscheme tomorrow-night-eighties
set encoding=utf8 " set utf8 as standard encoding
set ffs=unix,dos,mac " Use unix as the standard file type

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" stop using arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Trim trailing whitespace on buffer write
func! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunc
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

" Turn persistent undo on
try
    set undodir=~/.config/vim/temp/undodir
    set undofile
catch
endtry
