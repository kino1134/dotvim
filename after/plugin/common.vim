" コメント行で改行時、自動コメントアウトを無効化する
augroup auto_comment_off
  autocmd!
  autocmd FileType * setlocal formatoptions-=r
  autocmd FileType * setlocal formatoptions-=o
augroup END
