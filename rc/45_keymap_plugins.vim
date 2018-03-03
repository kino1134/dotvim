"""""
" プラグイン関係のキーマッピングを追加する
""""


""" lexima
" Endwise RuleをCtrl-jでも使えるようにする
imap <C-j> <CR>

""" QuickRun
if has('win32') || has('win64')
  nnoremap <C-\> :QuickRun<CR>
else
  " GUI版では[-]キーになる
  nnoremap <C-_> :QuickRun<CR>
endif

""" Easymotion
" 行内検索を置き換える
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
" 表示中文言から検索
map <Space><Space> <Plug>(easymotion-s2)
" ウィンドウを越えた検索を実施
nmap <C-w><Space> <Plug>(easymotion-overwin-f2)
nmap <C-w><C-@> <Plug>(easymotion-overwin-f2)

""" NERDTree
nnoremap <silent> <Space>nn :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Space>nf :<C-u>NERDTreeFind<CR>

" メモ：<C-W><C-Z>でプレビュー画面は閉じられる

""" fugitive
nmap <silent> <Space>gs :<C-u>Gstatus<CR>

""" gitgutter
nmap <silent> <Space>gd <Plug>GitGutterPreviewHunk
