" Settings {{{
  set timeoutlen=1500
  let mapleader=" "
  let g:mapleader=" "
" }}}
" Buffers {{{
  " buffer delete
  map <leader>bd    :bd<cr>
  " buffer list
  map <leader>bl    :BufExplorerHorizontalSplit<cr>
  " buffer next
  map <leader>bn    :bnext<cr>
  " buffer previous
  map <leader>bp    :bprev<cr>
" }}}
" Comments {{{
  " comment line
  map <leader>cl    gcc
  " comment paragraph
  map <leader>cp    gcap
" }}}
" Files {{{
  " file finder
  map <leader>ff    :CtrlP<cr>
  " file tree
  map <leader>ft    :Explore<cr>
  " file save
  map <leader>fs    :w<cr>
  " file edit config
  map <leader>fed   :e $MYVIMRC<cr>
  " file edit reload config
  map <leader>feR   :w<cr>:source $MYVIMRC<cr>
" }}}
" Git {{{
  " git status
  map <leader>gs    :Gstatus<cr>
  " git commit
  map <leader>gc    :Gcommit<cr>
  " git diff (file)
  map <leader>gd    :Gdiff<cr>
  " git pull
  map <leader>gp    :Gpull<cr>
  " git fetch
  map <leader>gf    :Gfetch<cr>
  " git log
  map <leader>gl    :Glog<cr>
" }}}
" Movement {{{
  " Treat long lines as break lines (useful when moving around in them)
  map j gj
  map k gk

  " insert mode -> normal mode
  " (just kidding)
  inoremap jk <esc>

  " stop using arrow keys!
  inoremap  <Up>     <NOP>
  inoremap  <Down>   <NOP>
  inoremap  <Left>   <NOP>
  inoremap  <Right>  <NOP>
  noremap   <Up>     <NOP>
  noremap   <Down>   <NOP>
  noremap   <Left>   <NOP>
  noremap   <Right>  <NOP>
" }}}
" Toggles {{{
  " toggle paste
  map <leader>tp    :setlocal paste!<cr>
" }}}
" Windows {{{
  " window (focus) down
  map <leader>wj    <C-W>j
  " window (focus) up
  map <leader>wk    <C-W>k
  " window (focus) left
  map <leader>wh    <C-W>h
  " window (focus) right
  map <leader>wl    <C-W>l
  " window quit
  map <leader>wq    :q<cr>
  " window split horizontal
  map <leader>wsh   :split<cr>
  " window split vertical
  map <leader>wsv   :vsplit<cr>
  " focus last window
  map <leader><tab> :b#<cr>
  " Tmux {{{
    " window - tmux send (selection)
    map <leader>wts   :call VimuxSendText(<SID>get_visual_selection())<cr>:call VimuxSendKeys("Enter")<cr>
    " window - tmux open
    map <leader>wto   :call VimuxOpenRunner()<cr>
    " window - tmux run (command)
    map <leader>wtr   :VimuxPromptCommand<cr>
    " window - tmux last (command)
    map <leader>wtl   :VimuxRunLastCommand<cr>
    " window - tmux inspect
    map <leader>wti   :VimuxInspectRunner<cr>
    " window - tmux quit
    map <leader>wtq   :VimuxCloseRunner<cr>
    " window - tmux exit
    map <leader>wtx   :VimuxInterruptRunner<cr>
    " window - tmux zoom
    map <leader>wtz   :call VimuxZoomRunner()<cr>
  " }}}
" }}}
