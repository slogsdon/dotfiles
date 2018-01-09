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
" ale linter status {{{
  function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
      \   '%dW %dE',
      \   all_non_errors,
      \   all_errors
      \)
  endfunction
" }}}
