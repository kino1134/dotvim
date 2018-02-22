"""""
" 各種プラグインのインストールを行う
"""""


" 互換性チェック {{{
if &compatible
  set nocompatible
endif

""" インストールディレクトリの取得
let s:baseDir = MyVimrcDir() . '/bundles'
let s:deinDir = s:baseDir . '/repos/github.com/Shougo/dein.vim'

""" dein.vimの自動インストール
if !isdirectory(s:deinDir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:deinDir))
endif

""" 読込パスの追加
execute 'set runtimepath+=' . s:deinDir
" }}}

""" プラグインの追加
if dein#load_state(s:baseDir)
  call dein#begin(s:baseDir)

  call dein#add('Shougo/dein.vim')

  call dein#add('joshdick/onedark.vim')                      " Colorscheme
  call dein#add('tomasr/molokai')                            " Colorscheme
  call dein#add('jacoborus/tender.vim')                      " Colorscheme
  call dein#add('chriskempson/vim-tomorrow-theme')           " Colorscheme

  call dein#add('vim-airline/vim-airline')                   " Statusbar
  " call dein#add('itchyny/lightline.vim')                     " Statusbar
  call dein#add('scrooloose/nerdtree')                       " File Explorer
  call dein#add('tpope/vim-fugitive')                        " Git Plugin
  call dein#add('kino1134/vim-quickrun')                     " Run Command Interface
  if !MyIsCygwin()
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})    " 非同期実行インターフェース
  endif
  call dein#add('easymotion/vim-easymotion')                 " Search easily
  call dein#add('tpope/vim-commentary')                      " Toggle Comment
  call dein#add('tpope/vim-surround')                        " Text Object for Pairs
  call dein#add('cohama/lexima.vim')                         " Auto Close Pair
  call dein#add('scrooloose/syntastic')                      " Syntax Check
  call dein#add('mbbill/undotree')                           " Undo Tree
  call dein#add('machakann/vim-Verdin')                      " omni completion function for Vim script
  call dein#add('kana/vim-textobj-user')                     " Create your own text objects
  call dein#add('kana/vim-textobj-indent')                   " Text objects for indented blocks of lines
  call dein#add('nelstrom/vim-textobj-rubyblock')            " A custom text object for selecting ruby blocks
  " call dein#add('vim-jp/vimdoc-ja')                          " 日本語ヘルプを追加
  call dein#add('airblade/vim-gitgutter')                    " shows a git diff in the gutter

  """ 追加終了
  call dein#end()
  call dein#save_state()
endif

""" Required: {{{
filetype plugin indent on
syntax enable

""" プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif
" }}}

" vim: foldmethod=marker
