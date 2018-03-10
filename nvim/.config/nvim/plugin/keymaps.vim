" Settings {{{
  set timeoutlen=1500
  let mapleader=" "
  let g:mapleader=" "
  let g:lmap = {}
" }}}
" Buffers {{{
  let g:lmap.b = { 'name': '+buffer' }
  " buffer delete
  nmap <leader>bd    :bd<cr>
  let g:lmap.b.d = ['bd', 'delete']
  " buffer list
  nmap <leader>bl    :Buffers<cr>
  let g:lmap.b.l = ['Buffers', 'list']
  " buffer next
  nmap <leader>bn    :bnext<cr>
  let g:lmap.b.n = ['bnext', 'next']
  " buffer previous
  nmap <leader>bp    :bprev<cr>
  let g:lmap.b.p = ['bprev', 'previous']
  " focus last buffer
  nmap <leader><tab> :b#<cr>
  "let g:lmap['<tab>'] = ['b#', 'previous buffer']
" }}}
" Files {{{
  let g:lmap.f = { 'name': '+file' }
  " file finder
  nmap <leader>ff    :Files<cr>
  let g:lmap.f.f = ['Files', 'find']
  " file tree
  nmap <leader>ft    :Explore<cr>
  let g:lmap.f.t = ['Explore', 'tree']
  " file save
  nmap <leader>fs    :w<cr>
  let g:lmap.f.s = ['w', 'save']
  " file edit config
  let g:lmap.f.e = { 'name': '+editor' }
  nmap <leader>fed   :e ~/.vimrc<cr>
  let g:lmap.f.e.d = ['e ~/.vimrc', 'edit config']
  " file edit reload config
  nmap <leader>feR   :w<cr>:source ~/.vimrc<cr>
  let g:lmap.f.e.R = ['w<cr>:source ~/.vimrc', 'save and source config']
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
" Windows {{{
  let g:lmap.w = { 'name': '+window' }
  " window (focus) down
  nmap <leader>wj    <C-W>j
  let g:lmap.w.j = ['<C-W>j', 'focus down']
  " window (focus) up
  nmap <leader>wk    <C-W>k
  let g:lmap.w.k = ['<C-W>k', 'focus up']
  " window (focus) left
  nmap <leader>wh    <C-W>h
  let g:lmap.w.h = ['<C-W>h', 'focus left']
  " window (focus) right
  nmap <leader>wl    <C-W>l
  let g:lmap.w.l = ['<C-W>l', 'focus right']
  " window quit
  nmap <leader>wq    :q<cr>
  let g:lmap.w.q = ['q', 'quit']
  " window split horizontal
  let g:lmap.w.s = { 'name': '+split' }
  nmap <leader>wsh   :split<cr>
  let g:lmap.w.s.h = ['split', 'focus right']
  " window split vertical
  nmap <leader>wsv   :vsplit<cr>
  let g:lmap.w.s.v = ['vsplit', 'focus right']
" }}}
nmap <Leader>m= :call LanguageClient_textDocument_formatting()<cr>
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
call leaderGuide#register_prefix_descriptions(" ", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ' '<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ' '<CR>
