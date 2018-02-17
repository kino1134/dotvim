"""""
" MacVim-Kaoriyaのデフォルト設定を明記する
" 可搬性のため、とりあえず入れている
"""""



""" Windows向けにvimprocのDLLダウンロード指定を追加
" ただし、効いているかどうか不明
if has('win32') || has('win64')
  let g:vimproc#download_windows_dll = 1
endif

""" Windows向けに文字コード設定を追加
set encoding=utf-8
scriptencoding utf-8

""" MacVimのデフォルト設定を明記する
set ignorecase                  " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase                   " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set wildmenu                    " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set formatoptions+=mM           " テキスト挿入中の自動折り返しを日本語に対応させる
set showcmd                     " コマンドをステータス行に表示
set title                       " タイトルを表示
set incsearch                   " do incremental searching
set backspace=indent,eol,start  " バックスペースでインデントや改行を削除できるようにする
if has('mouse')                 " マウスクリックを有効にする
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on
  augroup vimrcExample
    autocmd!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
else
  set autoindent
endif

