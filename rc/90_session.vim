"""""
" 前回使用時の状態を再現する
" vimrcの変更が反映されないので、もうちょっと改良が必要かも
"""""



""" 状態を保存するファイルを設定
let g:sessionFileDir  = MyVimrcDir() . '/sessions/'
let s:gui = has('gui_running') ? '_g' : ''
let s:sessionFileName = substitute(pathshorten($VIMRUNTIME), '[/:\\]', '_', 'g') . s:gui . '.vim'
let s:sessionFilePath = g:sessionFileDir . s:sessionFileName

""" セッションの保存
set sessionoptions+=resize sessionoptions+=localoptions
augroup save_session
  autocmd!
  autocmd VimLeavePre * NERDTreeClose
  autocmd VimLeave * if g:my_restore_session | execute 'mks! ' . s:sessionFilePath | endif
augroup END

""" セッションの復元
augroup load_session
  autocmd!
  autocmd VimEnter * nested if s:initRestoreSession() && filereadable(s:sessionFilePath) | execute 'source ' . s:sessionFilePath | endif
  autocmd VimEnter * NERDTree | execute "normal! \<C-w>w"
augroup END



" カレントバッファのバイトサイズを取得する
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction

" 起動引数で初期バッファが指定されているか判断する
function! s:initRestoreSession()
  if !exists('g:my_restore_session')
    " 引数がない、かつ初期バッファが空である
    if @% == '' && s:GetBufByte() == 0
      let g:my_restore_session = 1
    else
      let g:my_restore_session = 0
    endif
  endif
  return g:my_restore_session
endfunction
