このバッチファイルはRTMのアドオン製作にて一番躓きやすいjsonのコーディングを簡単にするべく作られたものです。 
# 動作環境

**必ずCドライブで利用してください**

10,11のWindowsならほぼ確で動く。

動作確認済み:
- win10home(21H2,22H2)
- win11home(22H2,23H2)

# ダウンロード場所
GitHubダウンロード: [ダウンロードしたいバージョンのassets内、一番上をクリックしてください。](https://github.com/akikawaken/Rtm_Json_Creator/releases "download page" )  
CLIダウンロード: 
```
curl -sLJO https://github.com/akikawaken/Rtm_Json_Creator/releases/download/update/RtmJsonCreator.bat & call RtmJsonCreator.bat
```

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

# GUI版頑張って作ってます
[![どんなもんか見てみる](https://raw.githubusercontent.com/akikawaken/images/main/RJC/nyan.png)](https://akikawaken.github.io/RJC/Json/)
*画像はイメージです。  
*画像をクリックすると作成Json選択ページに飛びます。

# 対応可否
**バージョン:1.4.1.1 , 2024-06-26時点.**
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
## 対応していません
- 機構

# LICENSE 
**0.9.3.5より先のバージョンのみMITです。**
- - -
Copyright (c) 2022-2024 akikawa9616

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# 五時
誤字は許してください

# 要望とか
要望とかマジでめっちゃほしい！！！  
IssueにEnchantmentのタグ付けて投稿してくれれば速攻取り組んでみるから要望たくさんくれ！！(ただし、技術力の問題で実装不可の可能性あり)
