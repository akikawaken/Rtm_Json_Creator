このバッチファイルはRTMのアドオン製作にて一番躓きやすいjsonのコーディングを簡単にするべく作られたものです。 
# 動作環境
**windowsならとりあえず動作すると思います**

動作確認済み:
- win10home(21H2,22H2)
- win11home(22H2)

# ダウンロード場所
[ダウンロードはこの文字列をクリックしてassets内の一番上(rtm-json-creator-[バージョン].batと書かれたファイル)を押してください。](https://github.com/akikawaken/creator/releases/tag/v1.0.1 "download page" )

# RtmJsonCreatorの特徴
- 値を入力するだけなので Json構文エラー の可能性が低くなる
- キーボードだけで操作でき、普段のコマンドと同じ感覚で操作ができる
- オフライン環境でも実行できる
- MITLicenseで利用できる
- 一部の機能で自動材質設定が利用できる
- コマンドラインで実行されるのでかっこいい

# 使い方
バッチファイルをダブルクリックで起動し、自分のしたい行動を選択し、対話型CLIに従ってJSONの内容を入力し、jsonを作成します
## もしかしたら
不明なファイル/危険なファイルとして起動がブロックされることがあります。 その場合、詳細から続行するをクリックして起動してください。  
もし、このバッチファイルが危険に見えるのならば、githubでコードを覗いてみてください。 あなたがバッチを理解できるのならば、危険ではないことがわかるはずです。  
追記: EXE版は実行したら解凍するだけです。 別にRtmJsonCreatorを起動するわけじゃありません。  

# jsonの作成がブラウザ上で体験できます!
[![json作成を体験する](https://cdn.discordapp.com/attachments/1075375393764278332/1156172370839617556/image.png)](https://akikawaken.github.io/)
*画像はイメージです。  
*画像をクリックするとjson作成の体験ができるページに飛びます。
*列車と看板のみ対応しています。

# 対応可否
**バージョン:1.0.1 , 2023-12-25時点.**
## 対応しています
- 列車 (一部の項目は利用できません)
- 看板
- 機能あり/なし設置物 (一部の項目は利用できません)
- NPC (一部の項目は利用できません)
- 旗
- 信号機 (一部の項目は利用できません)
- レール
- コンテナ
- 火器
- コネクター
- sounds.json
- pack.json
- 自動車
- 航空機
- 船舶
- リフト
- ワイヤー

# LICENSE 
**0.9.3.5より先のバージョンのみMITです。**
- - -
Copyright (c) 2022-2023 akikawa9616

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# 五時
誤字は許してください
