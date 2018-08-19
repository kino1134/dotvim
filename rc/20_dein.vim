"""""
" 各種プラグインのインストールを行う
"""""

""" セットアップ {{{
" 互換性チェック
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

  if v:version < 800
    call dein#add('Shougo/dein.vim', { 'rev': '1.5' })
  else
    call dein#add('Shougo/dein.vim')
  endif

  """ Visual
  call dein#add('joshdick/onedark.vim')
  call dein#add('tomasr/molokai')
  call dein#add('jacoborus/tender.vim')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('vim-airline/vim-airline')

  """ Global
  call dein#add('easymotion/vim-easymotion')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('mbbill/undotree')

  """ Interface
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  """ Text Object
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-indent')
  call dein#add('nelstrom/vim-textobj-rubyblock', { 'on_ft': 'ruby' }) " A custom text object for selecting ruby blocks

  """ Program Language
  call dein#add('tpope/vim-commentary')
  call dein#add('cohama/lexima.vim')
  call dein#add('tpope/vim-markdown')

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
