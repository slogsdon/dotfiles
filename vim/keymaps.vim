" Settings
map <leader>sp :setlocal paste!<cr>

" Buffers
map <leader>bd :bd<cr>
map <leader>be :BufExplorer<cr>

" Files
map <leader>fp :CtrlP<cr>
map <leader>ft :NERDTreeToggle<cr>
map <leader>fw :w<cr>

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiff<cr>
map <leader>gp :Gpull<cr>
map <leader>gf :Gfetch<cr>
map <leader>gl :Glog<cr>

" slime
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeParagraphSend

" Windows
map <leader>wj <C-W>j
map <leader>wk <C-W>k
map <leader>wh <C-W>h
map <leader>wl <C-W>l
map <leader>wq :q<cr>
