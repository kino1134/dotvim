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
  call dein#add('joshdick/onedark.vim')                      " Colorscheme
  call dein#add('tomasr/molokai')                            " Colorscheme
  call dein#add('jacoborus/tender.vim')                      " Colorscheme
  call dein#add('chriskempson/vim-tomorrow-theme')           " Colorscheme
  call dein#add('vim-airline/vim-airline')                   " Statusbar
  " call dein#add('itchyny/lightline.vim')                     " Statusbar

  """ Global
  if !MyIsCygwin()
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})    " 非同期実行インターフェース
  endif
  call dein#add('Shougo/context_filetype.vim')               " Switch Context filetype
  call dein#add('easymotion/vim-easymotion')                 " Search easily
  call dein#add('junegunn/vim-easy-align')                   " align
  call dein#add('mbbill/undotree')                           " Undo Tree
  " call dein#add('vim-jp/vimdoc-ja')                          " 日本語ヘルプを追加
  " call dein#add('kino1134/vim-quickrun')                     " Run Command Interface
  call dein#add('thinca/vim-quickrun')                     " Run Command Interface
  call dein#add('airblade/vim-rooter')                     " Changes Vim working directory to project root

  """ Interface
  call dein#add('scrooloose/nerdtree')                       " File Explorer
  call dein#add('tpope/vim-fugitive')                        " Git Plugin
  call dein#add('airblade/vim-gitgutter')                    " shows a git diff in the gutter
  call dein#add('previm/previm')                             " preview Markdown

  """ Text Object
  call dein#add('tpope/vim-surround')                        " Text Object for Pairs
  call dein#add('kana/vim-textobj-user')                     " Create your own text objects
  call dein#add('kana/vim-textobj-indent')                   " Text objects for indented blocks of lines
  call dein#add('nelstrom/vim-textobj-rubyblock', { 'on_ft': 'ruby' }) " A custom text object for selecting ruby blocks

  """ Program Language
  call dein#add('scrooloose/syntastic')                      " Syntax Check
  " call dein#add('tyru/caw.vim', { 'depends': ['context_filetype.vim'] }) " vim comment plugin
  call dein#add('tpope/vim-commentary')                      " Toggle Comment
  call dein#add('cohama/lexima.vim')                         " Auto Close Pair
  call dein#add('machakann/vim-Verdin')                      " omni completion function for Vim script
  call dein#add('pangloss/vim-javascript')                   " Javascript improved syntax highlighting andindentation.
  call dein#add('posva/vim-vue')                             " Syntax Highlight for Vue.js
  call dein#add('mattn/emmet-vim')                           " emmet
  call dein#add('fatih/vim-go')                              " Go Lang
  call dein#add('tpope/vim-markdown')                        " Markdown
  call dein#add('MaxMEllon/vim-jsx-pretty')                  " syntax highlight JSX

  " call dein#disable('caw.vim')


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
