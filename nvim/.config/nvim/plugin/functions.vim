" Trim whitespace from buffer {{{
  func! StripTrailingWhitespace()
      let l=line(".")
      let c=col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfunc
" }}}
" Gets text in buffer from visual selection {{{
  fun! s:get_visual_selection()
    let l=getline("'<")
    let [line1,col1]=getpos("'<")[1:2]
    let [line2,col2]=getpos("'>")[1:2]
    return l[col1 - 1: col2 - 1]
  endfun
" }}}
" Lightline functions {{{
  " Is buffer modified?
  function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  " is buffer readonly?
  function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
  endfunction

  " cleanup buffer name from plugins
  function! LightLineFilename()
    let fname=expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
          \ fname == '__Tagbar__' ? g:lightline.fname :
          \ fname =~ '__Gundo\|NERD_tree' ? '' :
          \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
          \ &ft == 'unite' ? unite#get_status_string() :
          \ &ft == 'vimshell' ? vimshell#get_status_string() :
          \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
          \ ('' != fname ? fname : '[No Name]') .
          \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction

  " get current git branch
  function! LightLineFugitive()
    try
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
        let mark=''  " edit here for cool mark
        let _=fugitive#head()
        return strlen(_) ? mark._ : ''
      endif
    catch
    endtry
    return ''
  endfunction

  " get current file format
  function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  " get current file type
  function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  " get current file encoding
  function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  " get current mode
  function! LightLineMode()
    let fname=expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
          \ fname == 'ControlP' ? 'CtrlP' :
          \ fname == '__Gundo__' ? 'Gundo' :
          \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
          \ fname =~ 'NERD_tree' ? 'NERDTree' :
          \ &ft == 'unite' ? 'Unite' :
          \ &ft == 'vimfiler' ? 'VimFiler' :
          \ &ft == 'vimshell' ? 'VimShell' :
          \ winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  " CtrlP lightline {{{
    function! CtrlPMark()
      if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
              \ , g:lightline.ctrlp_next], 0)
      else
        return ''
      endif
    endfunction

    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
      let g:lightline.ctrlp_regex=a:regex
      let g:lightline.ctrlp_prev=a:prev
      let g:lightline.ctrlp_item=a:item
      let g:lightline.ctrlp_next=a:next
      return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFunc_2(str)
      return lightline#statusline(0)
    endfunction
  " }}}
" }}}
