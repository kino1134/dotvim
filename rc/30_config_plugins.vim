"""""
" 各種プラグインの設定を行う
"""""



""" colorscheme {{{
colorscheme Tomorrow-Night-Eighties
" colorscheme onedark
" colorscheme molokai
" colorscheme tender

" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
" highlight CursorLine gui=underline guifg=NONE guibg=NONE
" }}}

""" airline {{{
let g:airline_theme='onedark'
" powerlineを使う上で、以下のようなフォント合成が必要になる
" 最新のものだと、ambiwidth=doubleで余白が空いてしまう
" git clone https://github.com/Lokaltog/vim-powerline.git
" fontforge -lang=py -script fontpatcher/fontpatcher ~/Library/Fonts/Ricty*.ttf
" fontforge -lang=py -script fontpatcher/fontpatcher /System/Library/Fonts/Menlo.ttc
"let g:airline_powerline_fonts = 1
if has('gui_macvim')
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  " GUI版で全角文字を使うと、guifontwideの設定が効かなくなる
  if has('gui_running')
    let g:airline_symbols.linenr = "\u3013"
    let g:airline_symbols.maxlinenr = '⭡'
  else
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = '㏑' " '⭡'
  endif
endif
" }}}

""" Easymotion {{{
let g:EasyMotion_smartcase = 1
" }}}

""" gitgutter {{{
set updatetime=100
" }}}

" vim: foldmethod=marker
