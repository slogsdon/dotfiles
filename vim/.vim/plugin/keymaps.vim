" Settings {{{
  set timeoutlen=1500
  let mapleader=" "
  let g:mapleader=" "
  let g:lmap = {}
" }}}
" Buffers {{{
  let g:lmap.b = { 'name': 'Buffer' }
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
  let g:lmap.c = { 'name': 'Comment' }
  " comment line
  map <leader>cl    gcc<esc>
  " comment paragraph
  map <leader>cp    gcap<esc>
" }}}
" Errors {{{
  let g:lmap.m = { 'name': 'Major Mode' }
  nmap <leader>el    :call ToggleErrors()<cr>
  nmap <leader>en    :lnext<cr>
  nmap <leader>ep    :lprevious<cr>
" }}}
" Files {{{
  let g:lmap.f = { 'name': 'File' }
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
  let g:lmap.t = { 'name': 'Toggle' }
  " toggle paste
  nmap <leader>tp    :setlocal paste!<cr>
  nmap <leader>tb    :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
" }}}
" Windows {{{
  let g:lmap.w = { 'name': 'Window' }
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
" }}}
  let g:lmap.m = { 'name': 'Major Mode' }
  let g:lmap.m.t = { 'name': 'Test' }
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
" Leader Guide {{{
  call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
  nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
  vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
" }}}
