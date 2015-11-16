" statusline
set statusline =%#identifier#
set statusline+=[%t] " tail of filename
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''} " display a warning if fileformat isnt unix
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''} " display a warning if file encoding isnt utf-8
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%y "filetype

set statusline+=%#identifier#
set statusline+=%r "read only flag
set statusline+=%*

set statusline+=%#identifier#
set statusline+=%m " modified flag
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set laststatus=2
