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
set directory=~/.vim/swap
set backupdir=~/.vim/backup

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/inoue/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/inoue/.vim/bundles')
  call dein#begin('/Users/inoue/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/inoue/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  """ 追加
  call dein#add('joshdick/onedark.vim')
  call dein#add('tomasr/molokai')
  call dein#add('jacoborus/tender.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
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

" airline
" git clone https://github.com/Lokaltog/vim-powerline.git
" fontforge -lang=py -script fontpatcher/fontpatcher ~/Library/Fonts/Ricty*.ttf
" fontforge -lang=py -script fontpatcher/fontpatcher /System/Library/Fonts/Menlo.ttc
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" カラーテーマ
colorscheme onedark
let g:airline_theme='onedark'
" colorscheme molokai
" let macvim_skip_colorscheme=1
" colorscheme tender

" 余計な情報を読まないようにする
if has('gui_macvim')
  let g:macvim_skip_colorscheme=1
  let g:no_gvimrc_example=1
endif

" セッションの保存
set sessionoptions+=resize
augroup save_session
  autocmd!
  autocmd VimLeavePre * NERDTreeClose 
  autocmd VimLeave * mks! ~/.vim/vimsession.vim
augroup END

" セッションの復元
augroup load_session
  autocmd!
  autocmd VimEnter * source ~/.vim/vimsession.vim 
  autocmd VimEnter * NERDTree 
  autocmd VimEnter * AirlineRefresh
augroup END

