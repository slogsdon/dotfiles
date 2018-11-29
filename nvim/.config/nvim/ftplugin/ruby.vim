setlocal shiftwidth=2 tabstop=2
setlocal commentstring=#\ %s

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = get(g:, 'ale_linters')
let g:ale_linters['ruby'] = ['rubocop', 'ruby']
