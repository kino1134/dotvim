"""""
" 各種プラグインのインストールを行う
"""""



if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let s:baseDir = MyVimrcDir()
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
  call dein#add('kino1134/vim-quickrun')                     " Run Command Interface
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})    " 非同期実行インターフェース
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
