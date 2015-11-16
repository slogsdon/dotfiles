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

" Extras
map <leader>xp :setlocal paste!<cr>

" Buffers
map <leader>bd :bd<cr>
map <leader>bo :BufExplorer<cr>

" Files
map <leader>fp :CtrlP<cr>
map <leader>ft :Explore<cr>
map <leader>fs :w<cr>

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
map <leader>gp :Gpull<cr>
map <leader>gf :Gfetch<cr>
map <leader>gl :Glog<cr>

" tmux
map <leader>ts :call VimuxSendText(<SID>get_visual_selection())<cr>:call VimuxSendKeys("Enter")<cr>
map <leader>to :call VimuxOpenRunner()<cr>
map <leader>tr :VimuxPromptCommand<cr>
map <leader>tl :VimuxRunLastCommand<cr>
map <leader>ti :VimuxInspectRunner<cr>
map <leader>tq :VimuxCloseRunner<cr>
map <leader>tx :VimuxInterruptRunner<cr>
map <leader>tz :call VimuxZoomRunner()<cr>

" Windows
map <leader>wj <C-W>j
map <leader>wk <C-W>k
map <leader>wh <C-W>h
map <leader>wl <C-W>l
map <leader>wq :q<cr>

fun! s:get_visual_selection()
  let l=getline("'<")
  let [line1,col1] = getpos("'<")[1:2]
  let [line2,col2] = getpos("'>")[1:2]
  return l[col1 - 1: col2 - 1]
endfun
