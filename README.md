## dein.vimの入れ方（Windows）
1. Git Bashから以下コマンドを実行
```
git clone https://github.com/Shougo/dein.vim "$HOME/vimfiles/bundles/repos/github.com/Shougo/dein.vim"
```
1. vimを立ち上げて、以下コマンドを実行
```
:call dein#install()
```

## TODO
Windowsでvimprocをインストールする際、dllを手作業でコピーしている。
`g:vimproc#download_windows_dll` を設定しているが、上手く利いていない模様。

