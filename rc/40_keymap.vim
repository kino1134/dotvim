"""""
" vim標準機能を呼び出すキーマッピングを追加する
"""""



""" ハイライトを消すキーバインドを追加する
nmap <Esc><Esc> :nohl<CR>
""" カーソル行以外を折りたたむキーバインドを追加
nmap z<Space> zMzv
""" ノーマルモード時、空行を挿入するだけのキーを追加
nnoremap <C-j> o<ESC>

""" 一時的なウィンドウ最大/最小化を行う
noremap <C-w>m :MyToggleWindowSize<CR>
noremap <C-w><C-m> :MyToggleWindowSize<CR>

""" インサートモード時のカーソル移動を追加
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-l> <Up>
inoremap <C-k> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>
""" インサートモード時のDelete、Undo、Redoを追加
inoremap <C-d> <Del>
inoremap <C-z> <C-o>u
inoremap <C-y> <C-o><C-r>

""" コマンドラインのカーソル移動を変更
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-k> <Down>
cnoremap <C-l> <Up>
execute 'set cedit=\<C-z>'

""" sをカスタムキーマップとして利用する
" 元のsを空けるためにssで代用する
" nnoremap <silent> ss s


""" Ctrl-sをカスタムキーマップとして利用する
" ただし、端末の横取りを防ぐ設定が必要
" stty stop undef; stty start undef
" nnoremap <silent> <C-s>s :<C-u>update<CR>



" 一時的なウィンドウ最大/最小化を行う
function! s:myToggleWindowMaximize()
  if exists('g:myWindowResetCmd')
    execute g:myWindowResetCmd
    unlet! g:myWindowResetCmd
  else
    let g:myWindowResetCmd = winrestcmd()
    execute "normal! \<C-w>_\<C-w>|"
  endif
endfunction
command! MyToggleWindowSize :call s:myToggleWindowMaximize()
