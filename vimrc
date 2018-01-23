set encoding=utf-8
scriptencoding utf-8

if has('win32') || has('win64')
  let g:vimproc#download_windows_dll = 1
endif

""" MacVimのデフォルト設定を明記する
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" do incremental searching
set incsearch
" do incremental searching
if has('mouse')
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

" 全画面表示
set lines=1000
set columns=999

" 行番号表示
set number

" 現在行をハイライト
set cursorline

" 不可視文字を表示　
set list
set listchars=tab:>_,eol:↲,extends:»,precedes:«

" 一時ファイルのディレクトリをまとめる
let s:baseDir = expand('<sfile>:p:h')
execute 'set directory=' . s:baseDir . '/swap'
execute 'set backupdir=' . s:baseDir . '/backup'
execute 'set undodir=' . s:baseDir . '/undo'

" インデントの各種デフォルト設定
set autoindent       " 改行前に前行のインデントを計測
set smartindent      " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set cindent          " Cプログラムファイルの自動インデントを始める
set smarttab         " 新しい行を作った時に高度な自動インデントを行う
set expandtab        " タブ入力を複数の空白に置き換える
set tabstop=2        " タブを含むファイルを開いた際、何文字の空白に変換するか
set shiftwidth=2     " 自動インデントで入る空白数
set softtabstop=2    " キーボードからはいるタブ数

" ハイライトを消すキーバインドを追加する
nmap <Esc><Esc> :nohl<CR>

" 矩形選択時、行末以降にも移動できるようにする
set virtualedit+=block

" クリップボードへのコピーを行えるようにする
set clipboard+=unnamed

" インサートモード時のカーソル移動を追加
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-l> <Up>
inoremap <C-k> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>

" ノーマルモード時、空行を挿入するだけのキーを追加
nnoremap <C-j> o<ESC>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath+=' . s:baseDir . '/bundles/repos/github.com/Shougo/dein.vim'

" Required:
if dein#load_state(s:baseDir . '/bundles')
  call dein#begin(s:baseDir . '/bundles')

  " Let dein manage dein
  " Required:
  call dein#add(s:baseDir . '/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  """ 追加
  call dein#add('joshdick/onedark.vim')                      " Colorscheme
  call dein#add('tomasr/molokai')                            " Colorscheme
  call dein#add('jacoborus/tender.vim')                      " Colorscheme
  call dein#add('chriskempson/vim-tomorrow-theme')           " Colorscheme

  call dein#add('vim-airline/vim-airline')                   " Statusbar
  " call dein#add('itchyny/lightline.vim')                     " Statusbar
  call dein#add('scrooloose/nerdtree')                       " File Explorer
  call dein#add('tpope/vim-fugitive')                        " Git Plugin
  call dein#add('thinca/vim-quickrun')                       " Run Command Interface
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})    " 非同期実行インターフェース
  call dein#add('easymotion/vim-easymotion')                 " Search easily
  call dein#add('tpope/vim-commentary')                      " Toggle Comment
  call dein#add('tpope/vim-surround')                        " Text Object for Pairs
  call dein#add('cohama/lexima.vim')                         " Auto Close Pair
  call dein#add('scrooloose/syntastic')                      " Syntax Check
  call dein#add('mbbill/undotree')                           " Undo Tree
  """ 追加ここまで

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"End dein Scripts-------------------------

" カラーテーマ
" colorscheme onedark
colorscheme Tomorrow-Night-Eighties
" colorscheme molokai
" colorscheme tender

" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
" highlight CursorLine gui=underline guifg=NONE guibg=NONE

" lightline
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'component': {
      \   'lineinfo': '⭡ %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
function! LightlineReadonly()
  return &readonly ? '⭤' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

" airline
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

" 余計な情報を読まないようにする
if has('gui_macvim') || has('win32') || has('win64')
  let g:macvim_skip_colorscheme=1
  let g:no_gvimrc_example=1
endif

function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction
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

if has('gui_macvim') || has('win32') || has('win64')
  let s:sessionFilePath = s:baseDir . '/vimsession.vim'
  " セッションの保存
  set sessionoptions+=resize sessionoptions+=localoptions
  augroup save_session
    autocmd!
    autocmd VimLeavePre * NERDTreeClose
    autocmd VimLeave * if g:my_restore_session | execute 'mks! ' . s:sessionFilePath | endif
  augroup END

  " セッションの復元
  augroup load_session
    autocmd!
    autocmd VimEnter * nested if s:initRestoreSession() && filereadable(s:sessionFilePath) | execute 'source ' . s:sessionFilePath | endif
    autocmd VimEnter * NERDTree
  augroup END
endif

" 行末の空白文字の自動削除
augroup remove_trailing_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

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
noremap <C-w>m :MyToggleWindowSize<CR>
noremap <C-w><C-m> :MyToggleWindowSize<CR>

" QuickRunの各種設定
if has('win32') || has('win64')
  nnoremap <C-\> :QuickRun<CR>
else
  nnoremap <C-_> :QuickRun<CR>
endif
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
  \ 'runner' : 'vimproc',
  \ 'runner/vimproc/updatetime': 60,
  \ }
" let g:quickrun_config._ = {
"       \ 'runner'    : 'system',
"       \ 'runner/vimproc/updatetime' : 60,
"       \ 'outputter' : 'error',
"       \ 'outputter/error/success' : 'buffer',
"       \ 'outputter/error/error'   : 'quickfix',
"       \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"       \ 'outputter/buffer/close_on_empty' : 1,
"       \ }

" easymotion
let g:EasyMotion_smartcase = 1
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
map <Space> <Plug>(easymotion-s2)
nmap <C-w><Space> <Plug>(easymotion-overwin-f2)
nmap <C-w><C-@> <Plug>(easymotion-overwin-f2)

