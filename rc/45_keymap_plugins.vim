"""""
" プラグイン関係のキーマッピングを追加する
""""


" lexima
" Endwise RuleをCtrl-jでも使えるようにする
imap <C-j> <CR>

" QuickRun
if has('win32') || has('win64')
  nnoremap <C-\> :QuickRun<CR>
else
  " GUI版では[-]キーになる
  nnoremap <C-_> :QuickRun<CR>
endif

" Easymotion
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
map <Space> <Plug>(easymotion-s2)
nmap <C-w><Space> <Plug>(easymotion-overwin-f2)
nmap <C-w><C-@> <Plug>(easymotion-overwin-f2)
