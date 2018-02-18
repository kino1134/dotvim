"""""
" vim標準機能を使った設定を行う
"""""



" vimrcのあるディレクトリを取得する
function! MyVimrcDir()
  return fnamemodify($MYVIMRC, ':p:h')
endfunction

" 余計な情報を読まないようにする
let g:macvim_skip_colorscheme=1
let g:no_gvimrc_example=1

" matchitプラグインを有効化する
source $VIMRUNTIME/macros/matchit.vim

" 全画面表示
set lines=1000
set columns=999

" 不可視文字を表示
set list
set listchars=tab:>_,eol:↲,extends:»,precedes:«

set number              " 行番号表示
set cursorline          " 現在行をハイライト
set virtualedit+=block  " 矩形選択時、行末以降にも移動できるようにする
set clipboard+=unnamed  " クリップボードへのコピーを行えるようにする

""" インデントの各種デフォルト設定
set autoindent       " 改行前に前行のインデントを計測
set smartindent      " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set cindent          " Cプログラムファイルの自動インデントを始める
set smarttab         " 新しい行を作った時に高度な自動インデントを行う
set expandtab        " タブ入力を複数の空白に置き換える
set tabstop=2        " タブを含むファイルを開いた際、何文字の空白に変換するか
set shiftwidth=2     " 自動インデントで入る空白数
set softtabstop=2    " キーボードからはいるタブ数

""" 折りたたみ時のレイアウト設定
set foldcolumn=1          " 折りたたみ状況を表示する
set foldtext=MyFoldtext() " 折りたたみ時の表示内容を変更する

""" 一時ファイルのディレクトリをまとめる
let s:baseDir = MyVimrcDir()
execute 'set directory=' . s:baseDir . '/swap'
execute 'set backupdir=' . s:baseDir . '/backup'
execute 'set undodir=' . s:baseDir . '/undo'



""" 行末の空白文字の自動削除(Markdown以外)
function! s:removeTrailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  :%s/\s\+$//ge
endfunction
augroup remove_trailing_whitespace
  autocmd!
  autocmd BufWritePre * :call s:removeTrailingWhitespace()
augroup END

""" 折りたたみ時のテキスト内容を組み立てる
function! MyFoldtext()
  let temp_start_str = getline(v:foldstart)
  let indent_count = strdisplaywidth(matchstr(temp_start_str, '\v^\s+'))
  let start_str = substitute(temp_start_str, '\v^\s+', repeat(' ', indent_count), '')
  let end_str   = substitute(getline(v:foldend), '\v^\s+', '', '')[0 : 9] " 行末は10文字で切り捨てる
  let fold_str  = start_str . " … " . end_str

  let line_count = 1 + v:foldend - v:foldstart
  let end_line = line('$')
  let status_str = printf('【Lv.%2d, %d行, %.1f%%】', v:foldlevel, line_count, (line_count*1.0)/end_line*100)

  let w = winwidth(0) - &foldcolumn - (&number ? &numberwidth : 0) " ウィンドウの幅を取得する
  let f_s = strdisplaywidth(fold_str)
  let s_s = strdisplaywidth(status_str)
  let space = w - f_s - (s_s > 30 ? s_s : 30)

  return fold_str . repeat('-', space) . status_str
endfunction
