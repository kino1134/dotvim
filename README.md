## dein.vimの入れ方（Windows）
1. Git Bashから以下コマンドを実行
   ```
   git clone https://github.com/Shougo/dein.vim "$HOME/vimfiles/bundles/repos/github.com/Shougo/dein.vim"
   ```
1. vimを立ち上げて、以下コマンドを実行
   ```
   :call dein#install()
   ```

## フォントの整備方法(Windows)
1. 等幅フォントを用意する  
   http://www.geocities.jp/meir000/meiryoKe/
1. Consolasとのフォントリンクを設定する  
   https://qiita.com/s_of_p/items/b7ab2e4a9e484ceb9ee7
   1. レジストリエディタを開いて、以下のキーを表示  
      HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink  
   1. レジストリキーを追加  
      キー：Consolas  
      値：meiryoKe_602r1.ttc,MeiryoKe_Console

## TODO
* Windowsでvimprocをインストールする際、dllを手作業でコピーしている。  
  `g:vimproc#download_windows_dll` を設定しているが、上手く利いていない模様。
* Foldの設定(FoldColumn, FoldMethod..)
* 補完候補の表示(NeoCompleteとか)
* QuickRunのリアルタイム出力
  http://d.hatena.ne.jp/osyo-manga/20131112/1384255703
