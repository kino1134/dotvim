## dein.vimの入れ方（Windows）
1. Git Bashから以下コマンドを実行
```
git clone https://github.com/Shougo/dein.vim "$HOME/vimfiles/bundles/repos/github.com/Shougo/dein.vim"
```
2. vimを立ち上げて、以下コマンドを実行
```
:call dein#install()
```

## TODO
* Windowsでvimprocをインストールする際、dllを手作業でコピーしている。  
  `g:vimproc#download_windows_dll` を設定しているが、上手く利いていない模様。
* Foldの設定(FoldColumn, FoldMethod..)
* 補完候補の表示(NeoCompleteとか)
* QuickRunのリアルタイム出力
  http://d.hatena.ne.jp/osyo-manga/20131112/1384255703
