set tabstop=4
set shiftwidth=4
set softtabstop=4

let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

augroup auto_go_build
  autocmd!
  autocmd BufWritePost * :GoBuild
augroup END
