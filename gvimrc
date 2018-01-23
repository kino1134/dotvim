" 全画面表示
set lines=1000
set columns=999

" カラーテーマ
if has('win32') || has('win64')
  colorscheme onedark
endif

" フォント設定 (変更確認：スクリプト
if has('gui_macvim')
  set linespace=2
  set guifont=Menlo\ Regular:h14
  set guifontwide=ヒラギノ丸ゴ\ ProN\ W4
  " set guifontwide=ヒラギノ明朝\ ProN\ W3
  "set guifontwide=Menlo\ Regular\ for\ Powerline
  "set guifontwide=Ricty\ Regular\ for\ Powerline
elseif has('win32') || has('win64')
  set guifont=Consolas:h11:cANSI:qDRAFT
  set guifontwide=MeiryoKe_Gothic
endif

