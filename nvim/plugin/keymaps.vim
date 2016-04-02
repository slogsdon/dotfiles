" Settings {{{
  set timeoutlen=1500
  let mapleader=" "
  let g:mapleader=" "
" }}}
" Buffers {{{
  " buffer delete
  nmap <leader>bd    :bd<cr>
  " buffer list
  nmap <leader>bl    :BufExplorerHorizontalSplit<cr>
  " buffer next
  nmap <leader>bn    :bnext<cr>
  " buffer previous
  nmap <leader>bp    :bprev<cr>
" }}}
" Comments {{{
  " comment line
  nmap <leader>cl    gcc
  " comment paragraph
  nmap <leader>cp    gcap
" }}}
" Files {{{
  " file finder
  nmap <leader>ff    :CtrlP<cr>
  " file tree
  nmap <leader>ft    :Explore<cr>
  " file save
  nmap <leader>fs    :w<cr>
  " file edit config
  nmap <leader>fed   :e $MYVIMRC<cr>
  " file edit reload config
  nmap <leader>feR   :w<cr>:source $MYVIMRC<cr>
" }}}
" Git {{{
  " git status
  nmap <leader>gs    :Gstatus<cr>
  " git commit
  nmap <leader>gc    :Gcommit<cr>
  " git diff (file)
  nmap <leader>gd    :Gdiff<cr>
  " git pull
  nmap <leader>gp    :Gpull<cr>
  " git push
  nmap <leader>gP    :Gpush<cr>p
  " git fetch
  nmap <leader>gf    :Gfetch<cr>
  " git log
  nmap <leader>gl    :Glog<cr>
" }}}
" Movement {{{
  " Treat long lines as break lines (useful when moving around in them)
  nmap j gj
  nmap k gk

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
  nmap <leader>tp    :setlocal paste!<cr>
" }}}
" Windows {{{
  " window (focus) down
  nmap <leader>wj    <C-W>j
  " window (focus) up
  nmap <leader>wk    <C-W>k
  " window (focus) left
  nmap <leader>wh    <C-W>h
  " window (focus) right
  nmap <leader>wl    <C-W>l
  " window quit
  nmap <leader>wq    :q<cr>
  " window split horizontal
  nmap <leader>wsh   :split<cr>
  " window split vertical
  nmap <leader>wsv   :vsplit<cr>
  " focus last window
  nmap <leader><tab> :b#<cr>
  " Tmux {{{
    " window - tmux send (selection)
    nmap <leader>wts   :call VimuxSendText(<SID>get_visual_selection())<cr>:call VimuxSendKeys("Enter")<cr>
    " window - tmux open
    nmap <leader>wto   :call VimuxOpenRunner()<cr>
    " window - tmux run (command)
    nmap <leader>wtr   :VimuxPromptCommand<cr>
    " window - tmux last (command)
    nmap <leader>wtl   :VimuxRunLastCommand<cr>
    " window - tmux inspect
    nmap <leader>wti   :VimuxInspectRunner<cr>
    " window - tmux quit
    nmap <leader>wtq   :VimuxCloseRunner<cr>
    " window - tmux exit
    nmap <leader>wtx   :VimuxInterruptRunner<cr>
    " window - tmux zoom
    nmap <leader>wtz   :call VimuxZoomRunner()<cr>
  " }}}
" }}}
" Test {{{
  " mode test all
  nmap <leader>mta   :TestSuite<cr>
  " mode test (nearest) test
  nmap <leader>mtt   :TestNearest<cr>
  " mod test file
  nmap <leader>mtf   :TestFile<cr>
  " mode test last
  nmap <leader>mtl   :TestLast<cr>
  " mode test visit (last test file)
  nmap <leader>mtv   :TestVisit<cr>
" }}}
