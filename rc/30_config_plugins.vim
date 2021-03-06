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

""" lightline {{{
" let g:lightline = {
"       \ 'colorscheme': 'Tomorrow_Night_Eighties',
"       \ 'component': {
"       \   'lineinfo': '⭡ %3l:%-2v',
"       \ },
"       \ 'component_function': {
"       \   'readonly': 'LightlineReadonly',
"       \   'fugitive': 'LightlineFugitive'
"       \ },
"       \ 'separator': { 'left': '⮀', 'right': '⮂' },
"       \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"       \ }
" function! LightlineReadonly()
"   return &readonly ? '⭤' : ''
" endfunction
" function! LightlineFugitive()
"   if exists('*fugitive#head')
"     let branch = fugitive#head()
"     return branch !=# '' ? '⭠ '.branch : ''
"   endif
"   return ''
" endfunction
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

""" quirckrun {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
if !MyIsCygwin()
  let g:quickrun_config._ = {
        \ 'runner': 'vimproc',
        \ 'runner/vimproc/updatetime': 60,
        \ 'outputter/buffer/into': 1,
        \ }
endif
" let g:quickrun_config._ = {
"       \ 'outputter' : 'error',
"       \ 'outputter/error/success' : 'buffer',
"       \ 'outputter/error/error'   : 'quickfix',
"       \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"       \ 'outputter/buffer/close_on_empty' : 1,
"       \ }
" }}}

""" Easymotion {{{
let g:EasyMotion_smartcase = 1
" }}}

""" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" yarn global add eslint-cli
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug = 3
" }}}

""" gitgutter {{{
set updatetime=100
" }}}

""" vim-vue {{{
augroup vimVue
  autocmd!
  autocmd FileType vue syntax sync fromstart
  autocmd FileType vue nmap <silent> <buffer> <Space>vv :<C-u>set ft=vue<CR>
  autocmd FileType vue nmap <silent> <buffer> <Space>vs :<C-u>set ft=javascript<CR>
  autocmd FileType vue nmap <silent> <buffer> <Space>vt :<C-u>set ft=typescript<CR>
  autocmd FileType vue nmap <silent> <buffer> <Space>vc :<C-u>set ft=scss<CR>
augroup END
" }}}

""" context_filetype.vim {{{
if dein#tap('context_filetype.vim')
  call context_filetype#version()
endif
" }}}

""" vim-go {{{
let g:go_version_warning = 0
" }}}

""" previm {{{
" only Mac
let g:previm_open_cmd = 'open -a Google\ Chrome'
" }}}

""" vim-rooter {{{
let g:rooter_patterns = ['package.json', '.git', 'git/']
" }}}

" vim: foldmethod=marker
