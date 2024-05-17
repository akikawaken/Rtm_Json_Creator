@echo off
set from=%cd%
:startrjc
rem (c) 2022 - 2024 akikawa9616
title RtmJsonCreator.bat
set version=1.3.3.6
set releaseversion=5
rem 人生Tips: version変数は普通にバージョンを表すが、releaseversion変数はv1.1を1としたリリースのバージョン。
rem CLIアップデートはリリースバージョンが上がった時のみ実行可能.
pushd %temp%\.RJC\json
set user=
set notlatest=false
set tsw=NONE
set setpath=%cd%
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo;
for /f %%a in ('curl https://akikawaken.github.io/RJC/VC/down.txt') do (
  if %%a == true goto down
)
if EXIST %temp%\.RJC\osc.tscf ( set oscmode=1 ) ELSE ( set oscmode=0 )
if EXIST %temp%\.RJC\osc.tscf goto oscwelcome
for /f "delims=@" %%a in ('curl https://akikawaken.github.io/RJC/VC/version.txt') do ( 
set latestver=%%a
)
if not exist %temp%\rjcupdate.tscf ( goto welcome ) 
if exist %temp%\rjcversion.tscf ( for /f %%a in ( %temp%\rjcupdate.tscf ) do ( call %%a ) )
if %latestver% == %releaseversion% goto welcome
for /f %%a in ( %temp%\rjcupdate.tscf ) do ( call %%a\RtmJsonCreator.bat )
:welcome
if %releaseversion% == %latestver% ( echo; ) ELSE ( set notlatest=true )
:oscwelcome
del %temp%\.Rtm_Json_Creator_json.tscf
del %temp%\.ams1.tscf
del %temp%\.ams2.tscf
if not exist %temp%\.RJC\rjc.tscf goto firstsetting
cls
echo Rtm_Json_Creatorへようこそ!
echo 行動を選択してください

:selectwelcome
goto syoki

if exist %temp%\.RJC\setting\osc.tscf goto syoki
more %temp%\.RJC\setting\welcome.tscf
if %notlatest% == true ( echo  update        RtmJsonCreatorを最新版にアップデートします。 )
echo  ----------------------------------------
echo 現在のディレクトリ: %setpath%
echo  ----------------------------------------
set /p start=行動の数字を入力してください...
set back=selectwelcome
echo;
for /f 

:syoki
more %temp%\.RJC\setting\welcome.tscf
if %notlatest% == true ( echo  update        RtmJsonCreatorを最新版にアップデートします。 )
echo  ----------------------------------------
echo 現在のディレクトリ: %setpath%
echo  ----------------------------------------
set /p start=行動の数字を入力してください...
set back=selectwelcome
echo;
if %start% == 1 goto train
if %start% == 2 pushd %from% & call cmd.exe & exit
if %start% == 3 goto sign
if %start% == 4 call :specialthanks
if %start% == 5 goto machine
if %start% == 6 goto npc
if %start% == 7 goto flag
if %start% == 8 goto sound
if %start% == 9 goto dir
if %start% == 11 goto pack
if %start% == 12 goto signal
if %start% == 13 goto rail
if %start% == 14 goto contami
if %start% == 15 goto gun
if %start% == 16 goto connector
if %start% == 17 goto wire
if %start% == 18 goto car
if %start% == setpath call :setpath
if %start% == setting goto setting
if %start% == explorer start explorer.exe %setpath%
if %start% == License goto License
if %start% == update goto update
rem 以下の機能は将来、削除されるか変更となる可能性があります。
if %start% == 999 goto soundcreate
if %start% == cmd echo exit /b を使用してRtmJsonCreatorに戻ることができます。 & pushd %from% & call cmd.exe & popd
if %start% == deljson goto deljson
if %start% == ams goto useams
rem 試験的機能の終焉
echo エラー:不明な番号です。
goto selectwelcome
:train
 cls
 set tsw=t
 echo 列車のjsonを作成します。
 echo これはJSONが自動保存されます。 jsonは %cd%\ModelTrain_%%trainname%%.json にできるはずです。
 echo -----------------
 rem TrainName setting start
 echo trainNameを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)
 echo ノート:競合を避けるために、[作者名]_1のような形にするのがおすすめです。(もちろん[]は外してください)
 set /p trainname=
 echo trainnameは %trainname% に設定されました。
 echo { > ModelTrain_%trainname%.json
 echo    "trainName": "%trainname%", >> ModelTrain_%trainname%.json
 rem TrainName setting end
 echo -----------------
 rem Traintype setting start
 echo traintypeを決めてください。 使用可能:EC,DC,CC,TC
 echo EC=電車
 echo DC=気動車
 echo CC=貨車
 echo TC=タンク車
 set /p traintype=
 echo traintypeは %traintype% に設定されました。 
 echo    "trainType": "%traintype%", >> ModelTrain_%trainname%.json
 rem Traintype setting end
 echo ------------------
 rem tags setting start
 echo tagsを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)と","
 echo 複数指定する場合は","で区切って入力してください。(例:tag1,tag2,tag3)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo    "tags":"%tags%", >> ModelTrain_%trainname%.json
 rem tags setting end
 echo ------------------
 rem trainmodel setting start
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelTrain_Temp.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_old
 if %modelfile:~-3% == obj goto mat_old
 if %modelfile:~-4% == ngto goto mat_old
 if %modelfile:~-4% == ngtz goto mat_old
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo    "trainModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "!filename:~0,-4!", >> ModelTrain_%trainname%.json
 endlocal
 set return=bogi
 set filename=ModelTrain_%trainname%.json
 goto ams
 :mat_old
 echo modelFileを決めてください。
 echo 列車の3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFile=
 echo modelFileは %modelFile% に設定されました。
 echo "trainModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 echo          "textures":[>> ModelTrain_%trainname%.json
 echo ------------------
 set count=0
 :matcountsetting
 set /p matcount=列車モデルの材質数を入力してください
 echo 材質数は %matcount% に設定されました。
 :matcheck
 if %matcount% == 1 goto matlast
 if %matcount% equ %count% ( goto matlast ) ELSE ( goto matsetting )
 :matsetting
 set /a count=%count%+1
  echo ------------------
   echo 列車の3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train
   echo %mat% の %mattexture% にオプションをつけますか?
   echo "オプションなし" の場合は 0 を、 "AlphaBlend" の場合は 1 を、 "Light" は 2 を、 "AlphaBlend,Light" は 3 を押してください。
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% の %mattexture% のオプションは (なし) に設定されました。
   if %ERRORLEVEL% == 1 echo ------------------
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""], >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto matcheck
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
   goto matcheck
  :osc-mat-train
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
  goto matcheck
 :matlast
   echo 列車の3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train-last
   echo %mat% の %mattexture% にオプションをつけますか?
   echo "オプションなし" の場合は 0 を、 "AlphaBlend" の場合は 1 を、 "Light" は 2 を、 "AlphaBlend,Light" は 3 を押してください。
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% の %mattexture% のオプションは (なし) に設定されました。
   if %ERRORLEVEL% == 1 echo ------------------
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo                     ] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo               }, >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto bogi
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto bogi
  :osc-mat-train-last
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto bogi

:bogi
 rem bogiemodel setting start
 echo;
 echo ボギーモデルファイルのパスを入力してください。
 echo これは変数を使用せず、"C:\rtm\assets\minecraft\models\bogie.mqo"の形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_oldb
 if %modelfile:~-3% == obj goto mat_oldb
 if %modelfile:~-4% == ngto goto mat_oldb
 if %modelfile:~-4% == ngtz goto mat_oldb
 rem format end
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo  "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "!filename:~0,-4!", >> ModelTrain_%trainname%.json
 endlocal
 set return=1222
 goto ams
 :mat_oldb
 echo modelFileを決めてください。
 echo 列車の3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFile=
 echo modelFileは %modelFile% に設定されました。
 echo "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 echo          "textures":[ >> ModelTrain_%trainname%.json
 echo ------------------
 set count=0
 :matcountsetting
 set /p matcount=列車モデルの材質数を入力してください
 echo 材質数は %matcount% に設定されました。
 :matchecks
 if %matcount% == 1 goto matlasts
 if %matcount% equ %count% ( goto matlasts ) ELSE ( goto matsettings )
 :matsettings
 set /a count=%count%+1
   echo ------------------
   echo ボギーの3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train
   echo %mat% の %mattexture% にオプションをつけますか?
   echo "オプションなし" の場合は 0 を、 "AlphaBlend" の場合は 1 を、 "Light" は 2 を、 "AlphaBlend,Light" は 3 を押してください。
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% の %mattexture% のオプションは (なし) に設定されました。
   if %ERRORLEVEL% == 1 echo ------------------
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""], >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto matchecks
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
   goto matchecks
  :osc-mat-bogie
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
 goto matchecks
 :matlasts
   echo 列車の3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train-last
   echo %mat% の %mattexture% にオプションをつけますか?
   echo "オプションなし" の場合は 0 を、 "AlphaBlend" の場合は 1 を、 "Light" は 2 を、 "AlphaBlend,Light" は 3 を押してください。
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% の %mattexture% のオプションは (なし) に設定されました。
   if %ERRORLEVEL% == 1 echo ------------------
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo                     ] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo               }, >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto 1222
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 1222
  :osc-mat-bogie-last
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 1222
:1222
 rem buttontexture setting start
  echo buttontextureを決めてください。
  echo 車輌選択画面のボタンのテクスチャへのパスを記述してください。(普通であれば、 textures/train/button_train.png などになります。)
  set /p button=
  echo ボタンテクスチャへのパスは %button% に設定されました。
  echo  "buttonTexture": "%button%", >> ModelTrain_%trainname%.json
  rem buttontexture setting end
  echo ------------------
  rem playerpos setting start
  echo playerposの1つめを決めてください。
  echo ヒント:運転席の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
  echo これは運転席の位置(ボギーを右クリックし、運転状態になったときに固定される座標)を設定します。
  echo 車輌の中心からの位置で、単位は"メートル"です。
  echo まずは x です。
  set /p playerPosx=
  echo 次に y です。 現在の座標: [ x=%playerPosx% , y=未設定 , z=未設定 ]
  set /p playerPosy=
  echo 次に z です。 現在の座標: [ x=%playerPosx% , y=%playerPosy% , z=未設定 ]
  set /p playerPosz=
  echo ------------------
  echo playerposの2つめを決めてください。
  echo 1つめの座標: [ x=%playerPosx% , y=%playerPosy% , z=%playerPosz% ]
  echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
  echo まずは x です。
  set /p playerPos2x=
  echo 次に y です。 現在の座標: [ x=%playerPos2x% , y=未設定 , z=未設定 ]
  set /p playerPos2y=
  echo 次に z です。 現在の座標: [ x=%playerPos2x% , y=%playerPos2y% , z=未設定 ]
  set /p playerPos2z=
  echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]], >> ModelTrain_%trainname%.json
  rem playerpos setting end
  echo ------------------
  rem bogiepos setting start
  echo bogiePosの1つめを決めてください。
  echo ヒント:台車の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
  echo これは台車の位置を設定します。
  echo 車輌の中心からの位置で、単位は"メートル"です。
  echo まずは x です。
  set /p bogieposx=
  echo 次に y です。 現在の座標: [ x=%bogieposx% , y=未設定 , z=未設定 ]
  set /p bogieposy=
  echo 次に z です。 現在の座標: [ x=%bogieposx% , y=%bogieposy% , z=未設定 ]
  set /p bogieposz=
  echo ------------------
  echo bogieposの2つめを決めてください。 使用可能:int値のすべての数字
  echo 1つめの座標: [ x=%bogieposx% , y=%bogieposy% , z=%bogieposz% ]
  echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
  echo まずは x です。
  set /p bogiepos2x=
  echo 次に y です。 現在の座標: [ x=%bogiepos2x% , y=未設定 , z=未設定 ]
  set /p bogiepos2y=
  echo 次に z です。 現在の座標: [ x=%bogiepos2x% , y=%bogiepos2y% , z=未設定 ]
  set /p bogiepos2z=
  echo  "bogiePos": [[%bogieposx%, %bogieposy%, %bogieposz%], [%bogiepos2x%, %bogiepos2y%, %bogiepos2z%]], >> ModelTrain_%trainname%.json
  rem bogiepos setting end
  echo ------------------
  rem traindistance setting start
  echo trainDistanceを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo これは車両の長さの2分の1にするといいでしょう。
  set /p trainDistance=
  echo trainDistanceは %trainDistance% に設定されました。
  echo  "trainDistance": %trainDistance%,  >> ModelTrain_%trainname%.json
  rem traindistance setting end
  echo ------------------
  rem accuracy setting start
  echo accuracyを決めてください。 使用可能:LOW,MEDIUM
  echo 大文字で入力してください。
  set /p accuracy=
  echo accuracyは %accuracy% に設定されました。
  rem accuracy setting end
  echo ------------------
 rem option
  echo この先はすべてオプションです。必要ない場合はjsonが表示されるまでの個数を見ながら長押ししてください。
  echo  %ESC%[41mjsonが完成したとき、enterを押していると作成したjsonが消滅します。%ESC%[0m
  pause
  rem option
  echo ------------------
  echo accelerateionを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo  -- N km/h/s の場合 N x 0.0006944 の値を書く
  echo あと48個でjsonが表示されます。
  set /p accelerateion=
  echo accelerateionは %accelerateion% に設定されました。
  if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%, >> ModelTrain_%trainname%.json
  echo ------------------
  echo maxSpeedの1つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo 0.1につき13km/h(たぶん)
  echo あと47個でjsonが表示されます。
  set /p maxSpeed1=
  echo maxSpeedの1つめは %maxSpeed1% に設定されました。
  echo ------------------
  echo maxSpeedの2つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo 0.1につき13km/h(たぶん)
  echo 現在の設定: 1:%maxSpeed1%
  echo あと46個でjsonが表示されます。
  set /p maxSpeed2=
  echo maxSpeedの2つめは %maxSpeed2% に設定されました。
  echo ------------------
  echo maxSpeedの3つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo 0.1につき13km/h(たぶん)
  echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2%
  echo あと45個でjsonが表示されます。
  set /p maxSpeed3=
  echo maxSpeedの3つめは %maxSpeed3% に設定されました。
  echo ------------------
  echo maxSpeedの4つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo 0.1につき13km/h(たぶん)
  echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
  echo あと44個でjsonが表示されます。
  set /p maxSpeed4=
  echo maxSpeedの4つめは %maxSpeed4% に設定されました。
  echo ------------------
  echo maxSpeedの5つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
  echo 0.1につき13km/h(たぶん)
  echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
  echo あと43個でjsonが表示されます。
  set /p maxSpeed5=
  echo maxSpeedの5つめは %maxSpeed5% に設定されました。
  if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%], >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_Hornを決めてください。
  echo あと42個でjsonが表示されます。
  set /p sound_horn=
  echo sound_hornは %sound_horn% に設定されました。
  if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_DoorOpenを決めてください。
  echo あと41個でjsonが表示されます。
  set /p sound_DoorOpen=
  echo sound_DoorOpenは %sound_DoorOpen% に設定されました。
  if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_DoorCloseを決めてください。
  echo あと40個でjsonが表示されます。
  set /p sound_DoorClose=
  echo sound_DoorCloseは %sound_DoorClose% に設定されました。
  if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": "%sound_DoorClose%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_Stopを決めてください。
  echo あと39個でjsonが表示されます。
  set /p sound_Stop=
  echo sound_Stopは %sound_Stop% に設定されました。
  if not "%sound_Stop%" == "" echo  "sound_Stop": "%sound_Stop%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_S_Aを決めてください。
  echo あと38個でjsonが表示されます。
  set /p sound_S_A=
  echo sound_S_Aは %sound_S_A% に設定されました。
  if not "%sound_S_A%" == "" echo  "sound_S_A": "%sound_S_A%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_Decelerationを決めてください。
  echo あと37個でjsonが表示されます。
  set /p sound_Deceleration=
  echo sound_Decelerationは %sound_Deceleration% に設定されました。
  if not "%Deceleration%" == "" echo  "sound_Deceration": "%sound_Deceleration%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo sound_D_Sを決めてください。
  echo あと36個でjsonが表示されます。
  set /p sound_D_S=
  echo sound_D_Sは %sound_D_S% に設定されました。
  if not "%sound_D_S%" == "" echo  "sound_D_S": "%sound_D_S%", >> ModelTrain_%trainname%.json
  echo ------------------
  echo rollingを決めてください。 使用可能:0.0~10.0
  echo あと35個でjsonが表示されます。
  set /p rolling=
  echo rollingは %rolling% に設定されました。
  if not "%rolling%" == "" echo  "rolling": %rolling%, >> ModelTrain_%trainname%.json
  echo ------------------
  echo mutejointsoundを決めてください。 使用可能:false,true
  set /p mutejointsound=
  echo mutejointsoundは %mutejointsound% に設定されました。
  if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo rollSpeedCoefficientを決めてください。
  echo あと34個でjsonが表示されます。
  set /p rollSpeedCoefficient=
  echo rollSpeedCoefficientは %rollSpeedCoefficient% に設定されました。
  if not "%rollSpeedCoefficient%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo rollCoefficientを決めてください。
  echo あと33個でjsonが表示されます。
  set /p rollCoefficient=
  echo rollCoefficientは %rollCoefficient% に設定されました。
  if not "%rollCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo rollVariationCoefficientを決めてください。
  echo あと32個でjsonが表示されます。
  set /p rollVariationCoefficient=
  echo rollVariationCoefficientは %rollVariationCoefficient% に設定されました。
  if not "%rollVariationCoefficient%" == "" echo  "rollVariationCoefficient": %rollVariationCoefficient%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo rollWidthCoefficientを決めてください。
  echo あと31個でjsonが表示されます。
  set /p rollWidthCoefficient=
  echo rollWidthCoefficientは %rollWidthCoefficient% に設定されました。
  if not "%rollWidthCoefficient%" == "" echo  "rollWidthCoefficient": %rollWidthCoefficient%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo useCustomColorを決めてください。
  echo あと30個でjsonが表示されます。
  set /p useCustomColor=
  echo useCustomColorは %useCustomColor% に設定されました。
  if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo defaultDataを決めてください。
  echo あと29個でjsonが表示されます。
  set /p defaultData=
  echo defaultDataは %defaultData% に設定されました。
  if not "%defaultData%" == "" echo  "defaultData": "%defaultData%", >> ModelTrain_%trainname%.json
  echo -------------------
  echo scaleを決めてください。
  echo ngtoモデルの場合は設定した方がよいでしょう
  echo あと28個でjsonが表示されます。
  set /p scale=
  echo scaleは %scale% に設定されました。
  if not "%scale%" == "" echo  "scale": %scale%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo offsetの1つめを決めてください。
  echo あと27個でjsonが表示されます。
  set /p offset=
  echo offsetの1つめは %offset% に設定されました。
  echo -------------------
  echo offsetの2つめを決めてください。 (offsetの1つめは %offset% です)
  echo あと26個でjsonが表示されます。
  set /p offset2=
  echo offsetの2つめは %offset2% に設定されました。
  echo -------------------
  echo offsetの3つめを決めてください。 (offset1:%offset% , offset2:%offset2%)
  echo あと25個でjsonが表示されます。
  set /p offset3=
  echo offsetの3つめは %offset3% に設定されました。
  if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%], >> ModelTrain_%trainname%.json
  echo -------------------
  echo smoothingを決めてください。 使用可能:false/true
  echo あと24個でjsonが表示されます。
  set /p smoothing=
  echo smoothingは %smoothing% に設定されました。
  if not "%smoothing%" == "" echo  "smoothing": %smoothing%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo doCullingを決めてください。 使用可能:false/true
  echo あと23個でjsonが表示されます。
  set /p doCulling=
  echo doCullingは %doCulling% に設定されました。
  if not "%doCulling%" == "" echo  "doCulling": %doCulling%, >> ModelTrain_%trainname%.json
  echo -------------------
  echo serverScriptPathを決めてください。
  echo あと22個でjsonが表示されます。
  set /p serverScriptPath=
  echo serverScriptPathは %serverScriptPath% に設定されました。
  if not "%serverScriptPath%" == "" echo  "serverScriptPath": "%serverScriptPath%", >> ModelTrain_%trainname%.json
  echo -------------------
  echo guiScriptPathを決めてください。
  echo あと21個でjsonが表示されます。
  set /p guiScriptPath=
  echo guiScriptPathは %guiScriptPath% に設定されました。
  if not "%guiScriptPath%" == "" echo  "guiScriptPath": "%guiScriptPath%", >> ModelTrain_%trainname%.json
  echo -------------------
  echo guiTextureを決めてください。
  echo あと20個でjsonが表示されます。
  set /p guiTexture=
  echo guiTextureは %guiTexture% に設定されました。
  if not "%guiTexture%" == "" echo  "guitexture": "%guiTexture%", >> ModelTrain_%trainname%.json
  echo -------------------
  echo renderAABBの1つめを決めてください。
  echo あと19個でjsonが表示されます。
  set /p renderAABB1=
  echo renderAABBの1つめは %renderAABB1% です。
  echo -------------------
  echo renderAABBの2つめを決めてください。
  echo あと18個でjsonが表示されます。
  set /p renderAABB2=
  echo renderAABBの2つめは %renderAABB2% です。
  echo -------------------
  echo renderAABBの3つめを決めてください。
  echo あと17個でjsonが表示されます。
  set /p renderAABB3=
  echo renderAABBの3つめは %renderAABB3% です。
  echo -------------------
  echo renderAABBの4つめを決めてください。
  echo あと16個でjsonが表示されます。
  set /p renderAABB4=
  echo renderAABBの4つめは %renderAABB4% です。
  echo -------------------
  echo renderAABBの5つめを決めてください。
  echo あと15個でjsonが表示されます。
  set /p renderAABB5=
  echo renderAABBの5つめは %renderAABB5% です。
  echo -------------------
  echo renderAABBの6つめを決めてください。
  echo あと14個でjsonが表示されます。
  set /p renderAABB6=
  echo renderAABBの6つめは %renderAABB6% です。
  if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ], >> ModelTrain_%trainname%.json
  echo --------------------
  echo sizeの1つめを決めてください。
  echo あと13個でjsonが表示されます。
  set /p size1=
  echo sizeの1つめは %size1% に設定されました。
  echo --------------------
  echo sizeの2つめを決めてください。
  echo あと12個でjsonが表示されます。
  set /p size2=
  echo sizeの2つめは %size2% に設定されました。
  if not "%size1%" == "" echo  "size": [%size1% , %size2%], >> ModelTrain_%trainname%.json
  echo --------------------
  echo soundScriptPathを決めてください。
  echo あと11個でjsonが表示されます。
  set /p soundScriptPath=
  echo soundScriptPathは %soundScriptPath% に設定されました。
  if not "%soundScriptPath%" == "" echo  "soundScriptPath": "%soundScriptPath%", >> ModelTrain_%trainname%.json
  echo --------------------
  echo smokeの出るx座標を決めてください。
  echo あと10個でjsonが表示されます。
  set /p smoke1=
  echo smokeは %smoke1% に設定されました。
  echo --------------------
  echo smokeの出るy座標を決めてください。
  echo あと9個でjsonが表示されます。
  set /p smoke2=
  echo smokeは %smoke2% に設定されました。
  echo --------------------
  echo smokeの出るz座標を決めてください。
  echo あと8個でjsonが表示されます。
  set /p smoke3=
  echo smokeは %smoke3% に設定されました。
  echo --------------------
  echo smokeのパーティクルを決めてください。
  echo あと7個でjsonが表示されます。
  set /p smoke4=
  echo smokeは %smoke4% に設定されました。
  echo --------------------
  echo smokeを決めてください。
  echo あと6個でjsonが表示されます。
  set /p smoke5=
  echo smokeは %smoke5% に設定されました。
  echo --------------------
  echo smokeを決めてください。
  echo あと5個でjsonが表示されます。
  set /p smoke6=
  echo smokeは %smoke6% に設定されました。
  if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]], >> ModelTrain_%trainname%.json
  echo --------------------
  echo notDisplayCabを決めてください。
  echo あと4個でjsonが表示されます。
  set /p notDisplayCab=
  echo notDisplayCabは %notDisplayCab% に設定されました。
  if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%, >> ModelTrain_%trainname%.json
  echo --------------------
  echo wheelRotationSpeedを決めてください。
  echo あと3個でjsonが表示されます。
  set /p wheelRotationSpeed=
  echo wheelRotationSpeedは %wheelRotationSpeed% に設定されました。
  if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%, >> ModelTrain_%trainname%.json
  echo --------------------
  echo sound_BrakeReleaseを決めてください。
  echo あと2個でjsonが表示されます。
  set /p sound_BrakeRelease=
  echo sound_BrakeReleaseは %sound_BrakeRelease% に設定されました。
  if not "%sound_BrakeRelease%" == "" echo  "sound_BrakeRelease": "%sound_BrakeRelease%", >> ModelTrain_%trainname%.json
  echo --------------------
  echo sound_BrakeRelease2を決めてください。
  echo あと1個でjsonが表示されます。
  set /p sound_BrakeRelease2=
  echo sound_BrakeRelease2は %sound_BrakeRelease2% に設定されました。
  if not "%sound_BrakeRelease2%" == "" echo  "sound_BrakeRelease2": "%sound_BrakeRelease2%", >> ModelTrain_%trainname%.json
  echo --------------------
  echo isSingleTrainを決めてください。
  echo あと0個でjsonが表示されます。
  set /p isSingleTrain=
  echo isSingleTrainは %isSingleTrain% に設定されました。
  if not "%isSingleTrain%" == "" echo  "isSingleTrain": %isSingleTrain%, >> ModelTrain_%trainname%.json
  echo --------------------
  echo "accuracy": "%accuracy%" >> ModelTrain_%trainname%.json
  echo } >> ModelTrain_%trainname%.json
  goto train_json
 :train_json
 echo jsonを作成しています..
 timeout /t 3 /NOBREAK >nul
 echo ファイルパス: %setpath%\ModelTrain_%trainname%.json
 echo;
 echo -- filename: ModelTrain_%trainname%.json --
 echo;
 set back=train_json
 for /f "delims=" %%a in (ModelTrain_%trainname%.json) do (
  echo %%a
 )
:sign
 echo -------------------
 echo 続行すると内容が消えます。
 echo 続行してもよろしいですか?
 set user=
 set /p user=(y / n)
 if %user% == y goto 21
 if %user% == n goto %back%
 echo 選択なし:%back%
 goto %back%
 :21
  goto welcome
:3
 cls
 set tsw=S
 echo 看板のjsonを作成します。
 echo もし途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo textureを決めてください。(先に保存しておいた看板のpngファイル名を拡張子なしで入力してください。)
 echo ノート:競合を避けるために、[作者名]_1のような形にするのがおすすめです。(もちろん[]は外してください)
 set /p texture=
 echo textureは %texture% に設定されました。
 echo -------------
 echo backTextureを決めてください。 使用可能:0,1,2 
 echo  0=裏表が同じテクスチャになります。
 echo  1=画像の右半分が裏のテクスチャになります。
 echo  2=裏が側面の色と同じ色になります。
 set /p backTexture=
 echo backTextureは %backTexture% に設定されました。
 echo -------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 単位は"メートル"です。
 echo これは看板の高さになります。
 set /p height=
 echo heightは %height% に設定されました。
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
 echo 単位は"メートル"です。
 echo これは看板の横の長さになります。
 set /p width=
 echo widthは %width% に設定されました。
 echo -------------
 echo depthを決めてください。 使用可能:整数と小数第三位まで(例:0.375)
 echo 単位は"メートル"です。
 echo これは看板の奥行になります。
 set /p depth=
 echo depthは %depth% に設定されました。
 echo -------------
 echo frameを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p frame=
 echo frameは %frame% に設定されました。
 echo -------------
 echo animationCycleを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p animationCycle=
 echo animationCycleは %animationCycle% に設定されました。
 echo -------------
 echo colorを決めてください。 使用可能:6桁の整数
 echo  -- 16 進数カラーコードを 10 進数に変換した値
 echo わからないならば0にしましょう。
 set /p color=
 echo colorは %color% に設定されました。
 echo -------------
 echo lightValueを決めてください。 使用可能:-16~15
 echo これは看板の発光の度合いを設定します。
 echo -16 ランダムに点滅する
 echo -15~-1 RS信号が入っている時、発光する(数字は発光の強さ)
 echo 0 発光しない
 echo 1~15 常に発光する(数字は発光の強さ)
 set /p lightValue=
 echo lightValueは %lightValue% に設定されました。
 echo -------------
 echo jsonが完成しました!
 goto signjson
:signjson
 set back=signjson
 echo ------ファイル名:SignBoard_%texture%.json-------
 echo {
 echo   "texture": "%texture%",
 echo   "backTexture": %backTexture%,
 echo   "height": %height%,
 echo   "width": %width%,
 echo   "depth": %depth%,
 echo   "frame": %frame%,
 echo   "animationCycle": %animationCycle%,
 echo   "color" : %color%,
 echo   "lightValue": %lightValue%
 echo }
 echo ------------------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3         jsonを保存します。  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto signedit
 if %user% == 2 goto 2
 if %user% == 3 goto savesignjson
 echo エラー:不明な番号
 goto signjson

:savesignjson
 echo jsonを保存します。 jsonは%cd%\SignBoard_%texture%.jsonにできるはずです。
 pause
 echo { > SignBoard_%texture%.json
 echo   "texture": "%texture%", >> SignBoard_%texture%.json
 echo   "backTexture": %backTexture%, >> SignBoard_%texture%.json
 echo   "height": %height%, >> SignBoard_%texture%.json
 echo   "width": %width%, >> SignBoard_%texture%.json
 echo   "depth": %depth%, >> SignBoard_%texture%.json
 echo   "frame": %frame%, >> SignBoard_%texture%.json
 echo   "animationCycle": %animationCycle%, >> SignBoard_%texture%.json
 echo   "color" : %color%, >> SignBoard_%texture%.json
 echo   "lightValue": %lightValue% >> SignBoard_%texture%.json
 echo } >> SignBoard_%texture%.json
 if exist SignBoard_%texture%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイル名:"SignBoard_%texture%.json"
  echo;
 ) ELSE (
  set error=33N
  goto ERROR
 )
 goto %back%

:signedit
 echo どの部分を編集しますか?
 echo jsonのデータ値の名前を入力してください。(上のjsonからデータ値をコピペしてください。小文字大文字の違いでエラーになってしまいます。)
 set edit=1
 set user=
 set /p user=
 if %user% == texture goto signedit_t
 if %user% == backTexture goto signedit_b
 if %user% == height goto signedit_h
 if %user% == width goto signedit_w
 if %user% == depth goto signedit_d
 if %user% == frame goto signedit_f
 if %user% == animationCycle goto signedit_a
 if %user% == color goto signedit_c
 if %user% == lightValue goto signedit_l
 echo エラー:不明な名前
 goto signedit
 :signedit_t
 echo -------------
 echo textureを決めてください。(先に保存しておいた看板のpngファイル名を拡張子なしで入力してください。)
 set /p texture=
 echo textureは %texture% に設定されました。
 goto signjson
 :signedit_b
 echo -------------
 echo backTextureを決めてください。 使用可能:0,1,2 
 echo  0=裏表が同じテクスチャになります。
 echo  1=画像の右半分が裏のテクスチャになります。
 echo  2=裏が側面の色と同じ色になります。
 set /p backTexture=
 echo backTextureは %backTexture% に設定されました。
 goto signjson
 :signedit_h
 echo -------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 単位は"メートル"です。
 echo これは看板の高さになります。
 set /p height=
 echo heightは %height% に設定されました。
 goto signjson
 :signedit_w
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
 echo 単位は"メートル"です。
 echo これは看板の横の長さになります。
 set /p width=
 echo widthは %width% に設定されました。
 goto signjson
 :signedit_d
 echo -------------
 echo depthを決めてください。 使用可能:整数と小数第三位まで(例:0.375)
 echo 単位は"メートル"です。
 echo これは看板の奥行になります。
 set /p depth=
 echo depthは %depth% に設定されました。
 goto signjson
 :signedit_f
 echo -------------
 echo frameを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p frame=
 echo frameは %frame% に設定されました。
 goto signjson
 :signedit_a
 echo -------------
 echo animationCycleを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p animationCycle=
 echo animationCycleは %animationCycle% に設定されました。
 goto signjson
 :signedit_c
 echo -------------
 echo colorを決めてください。 使用可能:6桁の整数
 echo  -- 16 進数カラーコードを 10 進数に変換した値
 echo わからないならば0にしましょう。
 set /p color=
 echo colorは %color% に設定されました。
 goto signjson
 :signedit_l
 echo -------------
 echo lightValueを決めてください。 使用可能:-16~15
 echo これは看板の発光の度合いを設定します。
 echo -16 ランダムに点滅する
 echo -15~-1 RS信号が入っている時、発光する(数字は発光の強さ)
 echo 0 発行しない
 echo 1~15 常に発光する(数字は発光の強さ)
 set /p lightValue=
 echo lightValueは %lightValue% に設定されました。
 goto signjson
:machine
 cls
 set tsw=w
 echo 機能あり/なし設置物のどれを作成しますか?
 echo 何も入力しない場合は強制終了します。
 echo 使用可能(機能あり):遮断機,転轍機,改札機,券売機,照明R,車止め,ATC,列車検出器,照明
 echo 使用可能(機能なし):照明,階段,足場,架線柱,パイプ,植物
 echo "照明R"と"照明"の違いはRS入力が可能かどうかです。 基本的には"照明"を選択することをお勧めします。
 echo ----------
 echo if u cant type japanese,pls type english machineType:
 echo Gate,Point,Turnstile,Vendor,Light,BumpingPost,Antenna_Send,Antenna_Receive
 echo Lamp,Stair,Scaffold,Pole,Pipe,Plant
 echo (hint: "Antenna_Send"="Automatic Train Control","Antenna_Receive"="Train detector")
 set /p machineType=
 if %machineType% == "遮断機" set machineType=Gate
 if %machineType% == "転轍機" set machineType=Point
 if %machineType% == "改札機" set machineType=Turnstile
 if %machineType% == "券売機" set machineType=Vendor
 if %machineType% == "照明R" set machineType=Light
 if %machineType% == "車止め" set machineType=BumpingPost
 if %machineType% == "ATC" set machineType=Antenna_Send
 if %machineType% == "列車検出器" set machineType=Antenna_Receive
 if %machineType% == "Train detector" set machineType=Antenna_Receive

 if %machineType% == "照明" set machineType=Lamp
 if %machineType% == "階段" set machineType=Stair
 if %machineType% == "足場" set machineType=Scaffold
 if %machineType% == "架線柱" set machineType=Pole
 if %machineType% == "パイプ" set machineType=Pipe
 if %machineType% == "植物" set machineType=Plant
 
 if %machineType% == "Gate" set type=machineType
 if %machineType% == "Point" set type=machineType
 if %machineType% == "Turnstile" set type=machineType
 if %machineType% == "Vendor" set type=machineType
 if %machineType% == "Light" set type=machineType
 if %machineType% == "BumpingPost" set type=machineType
 if %machineType% == "Antenna_Send" set type=machineType
 if %machineType% == "Antenna_Receive" set type=machineType
 if %machineType% == "Antenna_Receive" set type=machineType

 if %machineType% == "Lamp" set type=ornamentType
 if %machineType% == "Stair" set type=ornamentType
 if %machineType% == "Scaffold" set type=ornamentType
 if %machineType% == "Pole" set type=ornamentType
 if %machineType% == "Pipe" set type=ornamentType
 if %machineType% == "Plant" set type=ornamentType
 goto 5-1

 :5-1
 echo 機能あり設置物のjsonを作成します。
 echo もし、途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo nameを決めてください。
 echo これは機能あり設置物の名前になります。競合しないような名前を設定してください。
 set /p name=
 echo nameは %name% に設定されました。
 echo -------------
 echo { >> ModelMachine_%name%.json
 echo   "name": "%name%", >> ModelMachine_%name%.json
 echo   "model": { >> ModelMachine_%name%.json
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelMachine_%name%.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_old5
 if %modelfile:~-3% == obj goto mat_old5
 if %modelfile:~-4% == ngto goto mat_old5
 if %modelfile:~-4% == ngtz goto mat_old5
 rem format end
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> ModelMachine_%name%.json
 endlocal
 set return=switcher
 set filename=ModelMachine_%name%.json
 goto ams
 :mat_old5
 echo modelfileを決めてください。
 set /p modelFile=
 echo modelfileは %modelFile% に設定されました。
 echo -------------
 :cantthat
 echo %modelFile% の材質数を設定してください。
 set /p matc=
 echo 材質数は %matc% に設定されました。
 echo -------------
 set count=1
 del %temp%\.Rtm_Json_Creator_json.tscf
 echo     "modelFile": "%modelFile%", >> ModelMachine_%name%.json
 echo     "textures":[ >> ModelMachine_%name%.json
 :madamada
  if %matc% == %count% goto saigo
   echo ------------------
   echo 機能あり設置物の3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> %temp%\.Rtm_Json_Creator_json.tscf 
 set /a count=%count% + 1
   goto madamada
   :saigo
   echo ------------------
   echo 機能あり設置物の3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"]]}, >> %temp%\.Rtm_Json_Creator_json.tscf 
 :switcher
 echo buttontextureを決めてください。
 set /p button=
 echo buttonTextureは %button% に設定されました。
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 if %type% == machineType echo --------------------
 if %type% == machineType echo sound_onactivateを決めてください。
 if %type% == machineType set /p sound_onactivate=
 if %type% == machineType echo sound_onactivateは %sound_onactivate% に設定されました。
 if %type% == machineType echo   "sound_OnActivate": "%sound_onactivate%", >> ModelMachine_%name%.json
 echo --------------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo --------------------
 echo doCullingを決めてください。
 set /p doCulling=
 echo doCullingは %doCulling% に設定されました。
 echo --------------------
 echo tagsを決めてください。
 echo 複数指定する場合は","を使用してください。(例:akikawa,point,original)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 echo   "smoothing": %smoothing%, >> ModelMachine_%name%.json
 echo   "doCulling": %doCulling%, >> ModelMachine_%name%.json
 echo   "tags": "%tags%", >> ModelMachine_%name%.json
 echo   "%type%": "%machinetype%" >> ModelMachine_%name%.json
 echo } >> ModelMachine_%name%.json
 echo --------------------
 echo おめでとうございます!
 echo 完成しました!
 echo ------------
 goto switcher_json
:switcher_json
 set back=switcher_json
 echo -----Path:%setpath%\ModelMachine_%name%.json-----
 for /f "delims=" %%a in (ModelMachine_%name%.json) do (
  echo %%a
 )
 goto 2
:npc
 cls
 set tsw=n
 echo NPCのjsonを作成します。
 echo もし、途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo nameを決めてください。
 echo これはNPCの名前になります。競合しないような名前を設定してください。
 set /p name=
 echo nameは %name% に設定されました。
 echo { > ModelNPC_%name%.json
 echo   "name": "%name%", >> ModelNPC_%name%.json
 echo   "model": { >> ModelNPC_%name%.json
 echo;
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelNPC_%name%.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_old6
 if %modelfile:~-3% == obj goto mat_old6
 if %modelfile:~-4% == ngto goto mat_old6
 if %modelfile:~-4% == ngtz goto mat_old6
 rem format end
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> ModelNPC_%name%
 endlocal
 set return=npc_b
 set filename=ModelNPC_%name%
 goto ams
 :mat_old6
 echo -------------
 echo modelfileを決めてください。
 set /p modelFile=
 echo modelfileは %modelFile% に設定されました。
 echo -------------
 echo %modelFile% の材質数を設定してください。
 set /p matc=
 echo 材質数は %matc% に設定されました。
 echo -------------
 set count=1
 del %temp%\.Rtm_Json_Creator_json.tscf
 echo     "modelFile": "%modelFile%", >> ModelNPC_%name%
 echo     "textures":[ >> ModelNPC_%name%
 :checkcountnpc
 if %count% == %matc% goto lastnpcmat
    echo ------------------
   echo NPCの3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> %temp%\.Rtm_Json_Creator_json.tscf 
 set /a count=%count% + 1
   goto checkcountnpc
   :lastnpcmat
   echo ------------------
   echo NPCの3Dモデルの材質,%count%つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat=
   echo 材質,%count%つめの名前は %mat% に設定されました。
   echo ------------------
   echo %mat% のテクスチャへのパスを記述してください。
   echo オプションは次で設定します。
   set /p mattexture=
   echo %mat% のテクスチャパスは %mattexture% に設定されました。
   echo ------------------
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> %temp%\.Rtm_Json_Creator_json.tscf 
 :npc_b
 echo roleを決めてください。
 echo attendant,guard,mannequin,passengerのどれかが使用できます。
 set /p role=
 echo roleは %role% に設定されました。
 echo --------------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo --------------------
 echo doCullingを決めてください。
 set /p doCulling=
 echo doCullingは %doCulling% に設定されました。
 echo   "role": "%role%", >> ModelNPC_%name%.json
 echo   "doCulling": %doCulling%, >> ModelNPC_%name%.json
 echo   "smoothing": %smoothing% >> ModelNPC_%name%.json
 echo }  >> ModelNPC_%name%.json
 echo --------------------
 echo jsonが完成しました!
 goto npcjson
:npcjson
 set back=npcjson
 echo -----Path:%setpath%\ModelNPC_%name%.json-----
 for /f "delims=" %%a in (ModelNPC_%name%) do (
  echo %%a
 )
 goto 2
:flag
 cls
 set tsw=f
 echo 旗のjsonを作成します。
 echo もし途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo textureを決めてください。
 echo textures/flag/flag_[texturename].png のように設定してください。
 set /p texture=
 echo textureは %texture% に設定されました。
 echo ------------
 echo heightを決めてください。
 echo 単位は"メートル"です。
 set /p height=
 echo heightは %height% に設定されました。
 echo -------------
 echo widthを決めてください。
 echo 単位は"メートル"です。
 set /p width=
 echo widthは %width% に設定されました。
 echo -------------
 echo resolutionVを決めてください。
 set /p resolutionV=
 echo resolutionVは %resolutionV% に設定されました。
 echo --------------
 echo resolutionUを決めてください。
 set /p resolutionU=
 echo resolutionUは %resolutionU% に設定されました。
 echo --------------
 echo poleLengthを決めてください。
 echo 2.0だと2mになります。(たぶん)
 set /p poleLength=
 echo poleLengthは %poleLength% に設定されました。
 echo --------------
 echo jsonが完成しました!
 goto flagjson
:flagjson
 set back=flagjson
 echo ------ファイル名:Flag_%texture:~19,-4%.json-------
 echo {
 echo   "texture": "%texture%",
 echo   "height": %height%,
 echo   "width": %width%,
 echo   "resolutionV": %resolutionV%,
 echo   "resolutionU": %resolutionU%,
 echo   "poleLength" : %poleLength%
 echo }
 echo ------------------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3           jsonを保存します。  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto flagedit
 if %user% == 2 goto 2
 if %user% == 3 goto saveflagjson
 echo エラー:不明な番号
 goto %back%
:saveflagjson
 echo jsonを保存します。 jsonは%cd%\ModelNPC_%texture:~19%.jsonにできるはずです。
 pause
 echo { > Flag_%texture:~19%.json
 echo   "texture": "%texture%", >> Flag_%texture:~19%.json
 echo   "height": %height%, >> Flag_%texture:~19%.json
 echo   "width": %width%, >> Flag_%texture:~19%.json
 echo   "resolutionV": %resolutionV%, >> Flag_%texture:~19%.json
 echo   "resolutionU": %resolutionU%, >> Flag_%texture:~19%.json
 echo   "poleLenght" : %poleLength% >> Flag_%texture:~19%.json
 echo } >> Flag_%texture:~19%.json
   if exist Flag_%texture:~19%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイルパス:"%cd%\Flag_%texture:~19%.json"
  echo;
 ) ELSE (
  set error=73N
  goto ERROR
 )
 goto %back%

:flagedit
 echo jsonを編集します。
 echo 編集しないところはそのままenterしてください。
 echo -------------
 echo textureを決めてください。 現在: %texture%
 echo "textures/flag/flag_[texturename].png" のように設定してください。
 set /p texture=
 echo textureは %texture% に設定されました。
 echo ------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 現在:%height%
 set /p height=
 echo heightは %height% に設定されました。
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
 echo 現在: %width%
 set /p width=
 echo widthは %width% に設定されました。
 echo -------------
 echo resolutionVを決めてください。 現在: %resolutionV%
 set /p resolutionV=
 echo resolutionVは %resolutionV% に設定されました。
 echo --------------
 echo resolutionUを決めてください。 現在: %resolutionU%
 set /p resolutionU=
 echo resolutionUは %resolutionU% に設定されました。
 echo --------------
 echo poleLengthを決めてください。 現在: %poleLength%
 echo 2.0だと2mになります。(たぶん)
 set /p poleLength=
 echo poleLengthは %poleLength% に設定されました。
 echo --------------
 goto %back%

:sound
 cls
 set tsw=sounds
 echo sounds.jsonを作成します。
 echo --------
 setlocal enabledelayedexpansion
 echo 2つ以上サウンドを追加しますか?
 echo その場合、"jsonファイルの保存"が必須です。
 set /p nextkonanshint=(y / n)
 if %nextkonanshint% == y goto sound_two
 if %nextkonanshint% == n goto sound
 :sound
  echo --------
  set /p soundpath=サウンドのパスを設定してください。(例えば、c:\addon\assets\my_sound\train\chime1.oggを指定する場合は"train\chime1.ogg"と入力してください。)
  setlocal enabledelayedexpansion
  rem for /f "delims=\ tokens=1" %%s in ("!soundpath!") do set path1=%%s
  rem echo path1 has set to %path1%
  rem for /f "delims=\ tokens=2" %%o in ("!soundpath!") do set path2=%%o
  rem echo path2 has set to %path2%
  set soundpath=%soundpath:\=.%
  set back=sound_json
  :sound_json
  echo -----sounds.json-----
  echo {
  rem  echo "%path1%.%path2:~0,-4%": {
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  rem  echo   "%path1%/%path2:~0,-4%"
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  echo    ]
  echo   }
  echo }
  echo --------------------
  echo sounds.jsonが完成しました!
  echo 保存しますか?
  set /p user=(y / n)
  if %user% == n goto 2
  if %user% == y goto savesounds
  :savesounds
  echo jsonを保存します。 jsonは%cd%\sounds.jsonにできるはずです。
  set soundpath=%soundpath:/=.%
  pause
  echo { > sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo    ] >> sounds.json
  echo   } >> sounds.json
  echo } >> sounds.json
  if exist sounds.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイルパス:"%cd%\sounds.json"
  echo;
 ) ELSE (
  set error=8N
  goto ERROR
 )
 set soundpath=%soundpath:/=.%
 goto %back%

 :sound_two
  echo 注意:
  echo jsonを自動保存します。 jsonは%cd%\sounds.jsonにできるはずです。
  echo --------
  set /p soundpath=サウンドのパスを設定してください。(例えば、c:\addon\assets\my_sound\train\chime1.oggを指定する場合は"train\chime1.ogg"と入力してください。)
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(今回追加分)-----
  echo { 
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  set soundpath=%soundpath:/=\%
  echo --------------------
  set soundpath=%soundpath:\=.%
  echo { > sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo --------------------

  :soundsjson_pathset
  set /p soundpath=サウンドのパスを設定してください。(例えば、c:\addon\assets\my_sound\train\chime1.oggを指定する場合は"train\chime1.ogg"と入力してください。),終了する場合は"\\\"を使用してください。
  if %soundpath% == \\\ goto end_sounds_json
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(今回追加分)-----
  echo    ]
  echo   },
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  set soundpath=%soundpath:/=\%
  echo --------------------
  set soundpath=%soundpath:\=.%
  echo    ] >> sounds.json
  echo   }, >> sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo --------------------
  goto soundsjson_pathset

  :end_sounds_json
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(今回追加分)-----
  echo    ]
  echo   }
  echo }
  echo --------------------
  echo    ] >> sounds.json
  echo   } >> sounds.json
  echo } >> sounds.json
  echo sounds.jsonの記述を終了します。
  echo ファイルパス:"%cd%\sounds.json"
  pause
  goto 2

:dir
 echo RTMのディレクトリ構成を作成します。
 echo どこにディレクトリを作成しますか?(記述されたパス下に"RTM"フォルダができます。)
 echo;
 echo 注意: すでに指定されたディレクトリにRTMフォルダがあると多分バグります。
 echo;
 set /p directry=
 pushd %directry%
 md RTM\assets\minecraft\models\json
 md RTM\assets\minecraft\scripts
 md RTM\assets\minecraft\textures\container
 md RTM\assets\minecraft\textures\machine
 md RTM\assets\minecraft\textures\rail
 md RTM\assets\minecraft\textures\rrs
 md RTM\assets\minecraft\textures\signal
 md RTM\assets\minecraft\textures\signboard
 md RTM\assets\minecraft\textures\train
 md RTM\assets\minecraft\textures\npc
 md RTM\mods\RTM\train
 pushd %directry%\RTM
 tree
 echo どう? できた?
 pause
 cls
 goto welcome
:pack
 echo pack.jsonを作成します。
 echo 現在のディレクトリ: %cd% .
 set /p change=変更しますか?(y/n)
 if %change% == y call :setpath
 echo;
 echo アドオン名(モデルパック名)を決めてください:
 set /p modelpackname=
 echo アドオン名は%modelpackname%に設定されました。
 echo;
 echo ホームページのURLを決めてください( 必須ではありません. 必要ない場合は空白のままエンターしてください。 )
 set homepageurl=Null
 set /p homepageurl=
 echo ホームページのURLは %homepageurl% に設定されました。
 echo;
 echo "アップデート確認用テキストの URL"を決めてください。
 set /p url=
 echo "アップデート確認用テキストの URL"は %url% に設定されました。
 echo;
 echo バージョンを決めてください
 set /p vers=
 echo バージョンは %vers% に設定されました。
 echo;
 echo Done!
 echo {
 echo   "name":"%modelpackname%",
 if not %homepageurl% == Null echo   "homepage":"%homepageurl%",
 echo   "updateURL":"%url%",
 echo   "version":"%vers%"
 echo }
 echo;
 echo ファイルを保存しますか?
 set /p confirm=y/n:
 if %confirm% == n goto 2
 echo { >>pack.json
 echo   "name":"%modelpackname%", >>pack.json
 if not %homepageurl% == Null echo   "homepage":"%homepageurl%", >>pack.json
 echo   "updateURL":"%url%", >>pack.json
 echo   "version":"%vers%" >>pack.json
 echo } >>pack.json
 echo;
 pause
 goto 2
:signal
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo 信号のjsonを作成します。
 echo;
 echo signalNameを決めてください。
 set /p signalname=
 echo signalNameは %signalname% に設定されました。
 echo { >>%tempfile%
 echo  "signalName": "%signalname%", >>%tempfile%
 echo;
 echo signalModelを決めてください。
 set /p signalModel=
 echo signalModelは %signalModel% に設定されました。
 echo  "signalModel": "%signalModel%", >>%tempfile%
 echo;
 echo signalTextureを決めてください。
 set /p signalTexture=
 echo signalTextureは %signalTexture% に設定されました。
 echo  "signalTexture": "%signalTexture%", >>%tempfile%
 echo;
 echo lightTextureを決めてください。
 set /p lightTexture=
 echo lightTextureは %lightTexture% に設定されました。
 echo  "lightTexture": "%lightTexture%", >>%tempfile%
 echo;
 echo buttonTextureを決めてください。
 set /p buttonTexture=
 echo buttonTextureは %buttonTexture% に設定されました。
 echo  "buttonTexture": "%buttonTexture%", >>%tempfile%
 echo  "modelPartsFixture": { >>%tempfile%
 echo;
 echo modelPartsFixtureにおけるobjectsを決めてください。
 echo これはパーツ(固定具)に使用するオブジェクトの名前です。
 echo 複数設定する場合は%ESC%[7m"pole", "pole2", "pole3"%ESC%[0mの形式で指定してください。 文字列を使用する場合は%ESC%[7m"%ESC%[0mで囲う必要があります。
 set /p objects_fixture=
 echo   "objects": [%objects_fixture%], >>%tempfile%
 echo;
 echo modelPartsFixtureにおけるposを決めてください。
 echo これは回転の中心位置の設定です。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos_fixture=
 echo   "pos": [%pos_fixture%] >>%tempfile%
 echo  }, >>%tempfile%
 echo  "modelPartsBody": { >>%tempfile%
 echo;
 echo modelPartsBodyにおけるobjectsを決めてください。
 echo これはパーツ(本体)に使用するオブジェクトの名前です。
 echo 複数設定する場合は%ESC%[7m"doby", "light1", "light2", "light3"%ESC%[0mの形式で指定してください。 文字列を使用する場合は%ESC%[7m"%ESC%[0mで囲う必要があります。
 set /p objects_body=
 echo   "objects": [%objects_body%], >>%tempfile%
 echo;
 echo modelPartsBodyにおけるposを決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos_body=
 echo   "pos": [%pos_body%] >>%tempfile%
 echo  }, >>%tempfile%
 echo  "lights": [ >>%tempfile%
 echo;
 set firstlight=1
 :lightsetting
 echo ライトの設定を決めてください。
 echo 設定を終えた場合はそのままenterしてください。
 echo -----------------------------------------------------------
 echo ^|項目^|                        説明                        ^|
 echo ^|  S ^|どの信号が入力された時点灯するか(信号レベルは1~1024)^|
 echo ^|  I ^|点滅間隔(0~1200 tick)                               ^|
 echo ^|  P ^|使用するオブジェクト名(「,」で区切る)               ^|
 echo -----------------------------------------------------------
 echo;
 echo 以下の形式で入力してください。: S([S項目の数値]) I([I項目の数値]) P(P項目の文字列)
 echo e. g. S(1) I(0) P(LightYellow1, LightBlue4)
 echo;
 set light=Null
 set /p light=
 if %light% == Null goto rotate
 if %firstlight% == 1 goto firstlight
 echo   "%light%", >>%tempfile%
 goto lightsetting
 :firstlight
 set lastlight=%light%
 set firstlight=0
 goto lightsetting
 :rotate
 echo   "%lastlight%" >>%tempfile%
 echo  ], >>%tempfile%
 echo rotateBodyを決めてください。
 set /p rotateBody=(true/false) :
 echo  "rotateBody": %rotateBody% >>%tempfile%
 echo } >> %tempfile%
 goto signal_json
 :signal_json
 echo jsonが完成しました!
 echo;
 echo -- filename: ModelSignal_%signalname%.json --
 echo;
 set back=signal_json_json
 for /f "delims=@" %%a in (%tempfile%) do (
  echo %%a
 )
 echo ----------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     2              終了させます。       
 echo     3         jsonを保存します。  
 echo ----------------------------------------
 set /p user=
 if %user% == 2 goto 2
 if %user% == 3 goto savesignaljson
 echo エラー:不明な番号
 goto signal_json
 :savesignaljson
  echo F | xcopy %tempfile% %setpath%\ModelSignal_%signalname%.json /S /V /C /F /-Y
 goto signal_json
:rail
 echo レールのjsonを作成します。
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo レールは2種類の記述方法があります。 どちらを使用しますか?
 echo 1: 基本の設定方法 2: 簡易的な設定方法(材質数制限:1)
 echo 数字の後に"pre"を付けることでプレビューが可能です。
 set railjson=Null
 set /p railjson=
 if %railjson% == 1 goto railjson1
 if %railjson% == 2 goto railjson2
 if %railjson% == 1pre goto railjson1pre
 if %railjson% == 2pre goto railjson2pre
 goto welcome
:railjson1
  echo;
  echo レール名を決めてください。
  set /p railname=
  echo railName: %railname%
  echo { >>%tempfile%
  echo  "railName": "%railname%", >>%tempfile%
  echo  "model": { >>%tempfile%
  echo;
  echo レールモデルファイルのパスを入力してください。
  echo これは変数を使用せず、"C:\rtm\assets\minecraft\models\bogie.mqo"の形式で入力してください。
  echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
  set /p modelFile=
  rem check format
  if %modelfile:~-4% == mqoz goto mat_oldsignal
  if %modelfile:~-3% == obj goto mat_oldsignal
  if %modelfile:~-4% == ngto goto mat_oldsignal
  if %modelfile:~-4% == ngtz goto mat_oldsignal
  rem format end
  setlocal enabledelayedexpansion
  for %%a in ("%modelFile%") do set "filename=%%~nxa"
  echo     "modelFile": "!filename:~0,-4!", >> %tempfile%
  endlocal
  set return=gouryu
  set filename=%tempfile%
  goto ams
  :mat_oldsignal
  set /p modelfile=
  echo   "modelFile": "%modelfile%", >>%tempfile%
  echo modelFile: %modelfile%
  echo;
  echo レールの材質数を決めてください。
  set /p mat=
  echo 材質数は %mat% です。
  echo   "textures": [ >>%tempfile%
  :matfirst
   echo 材質の名前を入力してください。
   set /p matname=
   echo 材質名は %matname% です。
   echo;
   echo 材質のテクスチャパスを入力してください。
   echo 注意: %ESC%[41m\%ESC%[0m(バックスラッシュ)ではなく%ESC%[41m/%ESC%[0m(スラッシュ)を使用してください。
   set /p texturepath=
   echo テクスチャパスは %texturepath% です。
   set matcount=1
  :matcounter
  if %mat% == %matcount% goto railbutton
   set /a matcount= %matcount% + 1
   echo %matcount% つめの材質名を入力してください。
   set /p matname1=
   echo 材質名は %matname1% です。
   echo;
   echo %matname1% のテクスチャパスを入力してください。
   set /p texturep=
   echo テクスチャパスは %texturep% です。
   echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
   goto matcounter
  :railbutton
  echo   ["%matname%", "%texturepath%", ""]], >>%tempfile%
  echo rendererPathを設定する場合は以下に入力してください。
  echo 指定しない場合はscripts/RenderRailStandard.jsにしてください。
  set rendererPath=Null
  set /p rendererPath=
  if %rendererPath% == Null echo   "rendererPath": "scripts/RenderRailStandard.js" >>%tempfile%
  if not %rendererPath% == Null echo   "rendererPath": "%rendererPath%" >>%tempfile%
  echo  }, >>%tempfile%
  :gouryu
  echo;
  echo ボタンテクスチャのパスを設定してください。
  set /p button=
  echo  "buttonTexture": "%button%", >>%tempfile%
  echo;
  echo ballastWidthを決めてください。
  echo 1以上の奇数かつ整数の値を入力してください。 これは道床ブロックの幅です。
  set /p ballast=
  echo  "ballastWidth": %ballast%, >>%tempfile%
  echo;
  echo allowCrossingを決めてください。
  echo これはMobが通り抜けられるようにするかの設定です。
  set /p crossing=(true/false): 
  echo  "allowCrossing": %crossing%, >>%tempfile%
  echo;
  echo 道床ブロックを決めてください。
  echo e. g. gravel
  set /p blockname=
  echo  "defaultBallast": [{ >>%tempfile%
  echo   "blockName": "%blockname%", >>%tempfile%
  echo;
  echo %blockname% のメタデータを設定してください。
  echo 通常は0を入力してください。
  set /p meta=
  echo   "blockMetadata": %meta%, >>%tempfile%
  echo;
  echo 道床の高さを決めてください。
  echo 1で1mになります。
  set /p height=
  echo   "height": %height% >>%tempfile%
  echo  }], >>%tempfile%
  echo  "polygonType": 3 >>%tempfile%
  echo } >>%tempfile%
:rail_json
  set back=rail_json
  echo jsonが完成しました!
  echo -- filename: ModelRail_%railname%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo ----------------------------------------
  echo 行動を選択してください
  echo ----------------------------------------
  echo  行動の番号         行動の内容          
  echo ----------------------------------------
  echo     2              終了させます。       
  echo     3         jsonを保存します。  
  echo ----------------------------------------
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto saverailjson
  echo エラー:不明な番号
  goto rail_json
  :saverailjson
  echo F | xcopy %tempfile% %setpath%\ModelRail_%railname%.json /V /C /F /-Y
  goto rail_json
:railjson2
  echo;
  echo レール名を決めてください。
  set /p railname=
  echo railName: %railname%
  echo { >>%tempfile%
  echo  "railName": "%railname%", >>%tempfile%
  echo;
  echo レールのモデルを決めてください。(ファイル名)
  set /p modelfile=
  echo  "railModel": "%modelfile%", >>%tempfile%
  echo modelFile: %modelfile%
  echo;
  echo レールのテクスチャパスを決めてください。
  set /p railTexture=
  echo  "railTexture": "%railTexture%", >>%tempfile%
  echo;
  goto gouryu
:contami
 echo コンテナのjsonを作成します。
 echo;
 echo コンテナの名前を決めてください。
 set /p name=
 echo コンテナ名: %name%
 echo;
 echo モデルを指定してください。
 set /p model=
 echo モデル名: %model%
 echo;
 echo テクスチャパスを指定してください。
 set /p texture=
 echo テクスチャパス: %texture%
 echo;
 echo ボタンテクスチャのパスを設定してください。
 set /p buttontexture=
 echo ボタンテクスチャパス: %buttontexture%
 echo;
 echo コンテナの幅を決めてください。
 echo これはモデルに適用されるわけではなく、当たり判定の計算用として扱われます。
 set /p width=
 echo 幅: %width%
 echo;
 echo コンテナの高さを決めてください。
 echo これはモデルに適用されるわけではなく、当たり判定の計算用として扱われます。
 set /p height=
 echo 高さ: %height%
 echo;
 echo コンテナの長さを決めてください。
 echo これはモデルに適用されるわけではなく、貨車に載せた時の位置調整用として扱われます。
 set /p length=
 echo 長さ: %length%
 echo;
 :container_json
 set back=container_json
 echo -- filename: ModelContainer_%name%.json --
 echo {
 echo  "containerName": "%name%",
 echo  "containerModel": "%model%",
 echo  "containerTexture": "%texture%",
 echo  "containerWidth": %width%,
 echo  "containerHeight": %height%,
 echo  "containerLength": %length%,
 echo  "buttonTexture": "%buttontexture%"
 echo }
 echo ----------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     2              終了させます。       
 echo     3         jsonを保存します。  
 echo ----------------------------------------
 set /p user=
 if %user% == 2 goto 2
 if %user% == 3 goto savecontami
 echo エラー:不明な番号
 goto %back%
 :savecontami
 echo { >>%setpath%\ModelContainer_%name%.json
 echo  "containerName": "%name%", >>%setpath%\ModelContainer_%name%.json
 echo  "containerModel": "%model%", >>%setpath%\ModelContainer_%name%.json
 echo  "containerTexture": "%texture%", >>%setpath%\ModelContainer_%name%.json
 echo  "containerWidth": %width%, >>%setpath%\ModelContainer_%name%.json
 echo  "containerHeight": %height%, >>%setpath%\ModelContainer_%name%.json
 echo  "containerLength": %length%, >>%setpath%\ModelContainer_%name%.json
 echo  "buttonTexture": "%buttontexture%" >>%setpath%\ModelContainer_%name%.json
 echo } >>%setpath%\ModelContainer_%name%.json
 echo;
 echo ファイルの保存が完了しました。
 echo ファイルパス:"%setpath%\ModelContainer_%name%.json"
 echo;
 goto %back%
:gun
 echo 火器のjsonを作成します。
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo { >>%tempfile%
 echo 火器の名前を決めてください。
 set /p name=
 echo 名前: %name%
 echo  "firearmName": "%name%", >>%tempfile%
 echo;
 echo モデルファイル名を入力してください。
 set /p model=
 echo モデル: %model%
 echo  "firearmModel": "%model%", >>%tempfile%
 echo;
 echo テクスチャパスを入力してください
 set /p texture=
 echo テクスチャ: %texture%
 echo  "firearmTexture": "%texture%", >>%tempfile%
 echo;
 echo ボタンテクスチャのパスを入力してください。
 set /p button=
 echo ボタン: %button%
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo;
 echo パーツ(回転なし)のオブジェクト名を決めてください。
 echo 複数のオブジェクト名を指定する場合は%ESC%[7mobject1", "object2%ESC%[0mの形式で指定してください。
 set /p object=
 echo;
 echo オブジェクトのposを決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos=
 echo  "modelPartsN": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo パーツ(Y軸回転)のオブジェクト名を決めてください。
 echo 複数のオブジェクト名を指定する場合は%ESC%[7mobject1", "object2%ESC%[0mの形式で指定してください。
 set /p object=
 echo;
 echo オブジェクトのposを決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos=
 echo  "modelPartsY": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo パーツ(X軸回転)のオブジェクト名を決めてください。
 echo 複数のオブジェクト名を指定する場合は%ESC%[7mobject1", "object2%ESC%[0mの形式で指定してください。
 set /p object=
 echo;
 echo オブジェクトのposを決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos=
 echo  "modelPartsX": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo パーツ(バレル)のオブジェクト名を決めてください。
 echo 複数のオブジェクト名を指定する場合は%ESC%[7mobject1", "object2%ESC%[0mの形式で指定してください。
 set /p object=
 echo;
 echo オブジェクトのposを決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p pos=
 echo  "modelPartsBarrel": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo 砲口の位置を決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p muzzle=
 echo 砲口: %muzzle%
 echo  "muzzlePos": [%muzzle%], >>%tempfile%
 echo;
 echo 砲手の位置を決めてください。
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0mの形式で指定してください。
 set /p player=
 echo 砲手: %player%
 echo  "playerPos": [%player%], >>%tempfile%
 echo;
 echo 旋回角度の最大,最小値を決めてください。
 echo %ESC%[7m180.0, -180.0%ESC%[0mの形式で指定してください。
 set /p yaw=
 echo 旋回角度: %yaw%
 echo  "yaw": [%yaw%], >>%tempfile%
 echo;
 echo 仰俯角の最大,最小値を決めてください。
 echo %ESC%[7m180.0, -180.0%ESC%[0mの形式で指定してください。
 set /p pitch=
 echo 仰俯角: %pitch%
 echo  "pitch": [%pitch%], >>%tempfile%
 echo;
 echo Y軸回転の速度を決めてください。
 set /p speedy=
 echo 速度: %speedy%
 echo  "rotationSpeedY": %speedy%, >>%tempfile%
 echo;
 echo X軸回転の速度を決めてください。
 set /p speedtwitter=
 echo 速度: %speedtwitter%
 echo  "rotationSpeedX": %speedtwitter%, >>%tempfile%
 echo;
 echo リコイルの大きさを決めてください。
 set /p recoil=
 echo リコイル: %recoil%
 echo  "recoil": %recoil%, >>%tempfile%
 echo;
 echo 一人称の時にモデルを描画しないかどうかを決めてください。
 set /p fpv=(true/false): 
 echo  "fpvMode": %fpv% >>%tempfile%
 echo } >>%tempfile%
 :gun_json
  set back=gun_json
  echo jsonが完成しました!
  echo -- filename: ModelFirearm_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo ----------------------------------------
  echo 行動を選択してください
  echo ----------------------------------------
  echo  行動の番号         行動の内容          
  echo ----------------------------------------
  echo     2              終了させます。       
  echo     3         jsonを保存します。  
  echo ----------------------------------------
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savegunjson
  echo エラー:不明な番号
  goto rail_json
  :savegunjson
  echo F | xcopy %tempfile% %setpath%\ModelFirearm_%name%.json /V /C /F /-Y
  goto %back%
 
:connector
 echo コネクターのjsonを作成します。
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo コネクター名を決めてください。
 set /p name=
 echo Name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%", >>%tempfile%
 echo  "model": { >>%tempfile%
 echo;
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelTrain_Temp.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_oldco
 if %modelfile:~-3% == obj goto mat_oldco
 if %modelfile:~-4% == ngto goto mat_oldco
 if %modelfile:~-4% == ngtz goto mat_oldco
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> %tempfile%
 endlocal
 set return=csgo
 set filename=%tempfile%
 goto ams
 :mat_oldco
 echo コネクターのモデルを決めてください。(ファイル名)
 set /p modelfile=
 echo   "modelFile": "%modelfile%", >>%tempfile%
 echo modelFile: %modelfile%
 echo;
 echo コネクターの材質数を決めてください。
 set /p mat=
 echo 材質数は %mat% です。
 echo   "textures": [ >>%tempfile%
 echo 材質の名前を入力してください。
 set /p matname=
 echo 材質名は %matname% です。
 echo;
 echo 材質のテクスチャパスを入力してください。
 echo 注意: %ESC%[41m\%ESC%[0m(バックスラッシュ)ではなく%ESC%[41m/%ESC%[0m(スラッシュ)を使用してください。
 set /p texturepath=
 echo テクスチャパスは %texturepath% です。
 set matcount=1
 :cocounter
  if %mat% == %matcount% goto cobutton
 set /a matcount= %matcount% + 1
 echo %matcount% つめの材質名を入力してください。
 set /p matname1=
 echo 材質名は %matname1% です。
 echo;
 echo %matname1% のテクスチャパスを入力してください。
 set /p texturep=
 echo テクスチャパスは %texturep% です。
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto cocounter
 :cobutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 :csgo
 echo;
 echo ボタンテクスチャのパスを設定してください。
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo ボタン: %button%
 echo;
 echo connectorTypeを決めてください。
 echo Relay,Input,Outputの中から選んでください。
 echo タイプは以下の通りです: Relay:"中継コネクタ",Input:"入力コネクタ",Output:"出力コネクタ"
 set /p type=(Relay/Input/Output): 
 echo  "connectorType":"%type%", >>%tempfile%
 echo コネクタ: %connector%
 echo;
 echo wirePosを決めてください。
 echo これはワイヤ接続時の接続位置です。(ブロック中心が%ESC%[41m0.0,0.0,0.0%ESC%[0mになります。)
 echo %ESC%[41m0.0, 0.0, 0.0%ESC%[0mの形式で入力してください。 それぞれx,y,zの順です。
 set /p pos=
 echo pos: %pos%
 echo  "wirePos": [%pos%], >>%tempfile%
 echo;
 echo smoothingを決めてください。
 set /p smooz=(true/false): 
 echo smoothing: %smooz%
 echo  "smoothing": %smooz%, >>%tempfile%
 echo;
 echo doCullingを決めてください。
 set /p doCulling=(true/false): 
 echo doCulling: %doCulling%
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo;
 echo accuracyを決めてください。
 set /p accuracy=(LOW,MEDIUM): 
 echo accuracy: %accuracy%
 echo  "accuracy": %accuracy%, >>%tempfile%
 echo;
 echo tagsを決めてください。
 set /p tag=
 echo tag: %tag%
 echo  "tags": "%tag%" >>%tempfile%
 echo } >>%tempfile%
 :co_json
  set back=co_json
  echo jsonが完成しました!
  echo -- filename: ModelConnector_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo ----------------------------------------
  echo 行動を選択してください
  echo ----------------------------------------
  echo  行動の番号         行動の内容          
  echo ----------------------------------------
  echo     2              終了させます。       
  echo     3         jsonを保存します。  
  echo ----------------------------------------
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savecojson
  echo エラー:不明な番号
  goto %back%
  :savecojson
  echo F | xcopy %tempfile% %setpath%\ModelConnector_%name%.json /V /C /F /-Y
  goto %back%
:wire
 echo;
 echo ワイヤーのjsonを作成します。
 echo;
 set back=wire_json
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo nameを決めてください。
 set /p name=
 echo name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%" >>%tempfile%
 echo;
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelTrain_Temp.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_oldwire
 if %modelfile:~-3% == obj goto mat_oldwire
 if %modelfile:~-4% == ngto goto mat_oldwire
 if %modelfile:~-4% == ngtz goto mat_oldwire
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> %tempfile%
 endlocal
 set return=wifi
 set filename=%tempfile%
 goto ams
 :mat_oldwire
 echo ワイヤーのモデルを決めてください。(ファイル名)
 set /p modelfile=
 echo  "model": { >>%tempfile%
 echo   "modelFile": "%modelfile%" >>%tempfile%
 echo model: %modelfile%
 echo;
 echo %modelfile%の材質数を設定してください。
 set /p mat=
 echo 材質数は %mat% です。
 echo;
 echo   "textures": [ >>%tempfile%
 echo 1 つめの材質名を入力してください。
 set /p matname=
 echo 材質名は %matname% です。
 echo;
 echo 材質のテクスチャパスを入力してください。
 echo 注意: %ESC%[41m\%ESC%[0m(バックスラッシュ)ではなく%ESC%[41m/%ESC%[0m(スラッシュ)を使用してください。
 set /p texturepath=
 echo テクスチャパスは %texturepath% です。
 set matcount=1
 :wicounter
  if %mat% == %matcount% goto wibutton
 set /a matcount= %matcount% + 1
 echo %matcount% つめの材質名を入力してください。
 set /p matname1=
 echo 材質名は %matname1% です。
 echo;
 echo %matname1% のテクスチャパスを入力してください。
 set /p texturep=
 echo テクスチャパスは %texturep% です。
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto wicounter
 :wibutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 echo;
 :wifi
 echo ボタンテクスチャのパスを設定してください。
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo ボタン: %button%
 echo;
 echo deflectionCoefficientを決めてください。
 echo これはカテナリー曲線の係数に関する設定です。
 set /p deflection=
 echo deflectionCoefficient: %deflection%
 echo  "deflectionCoefficient": %deflection%, >>%tempfile%
 echo;
 echo lengthCoefficientを決めてください。
 echo これはカテナリー曲線の係数に関する設定です。
 set /p length=
 echo lengthCoefficient: %length%
 echo  "lengthCoefficient": %length%, >>%tempfile%
 echo;
 echo sectionLengthを決めてください。
 echo これは曲線の1分割の長さに関する設定です。
 set /p section=
 echo sectionLength: %section%
 echo  "sectionLength": %section%, >>%tempfile%
 echo;
 echo useCustomColorを決めてください。
 set useCustomColor=true
 set /p useCustomColor=
 echo useCustomColorは %useCustomColor% に設定されました。
 echo  "useCustomColor": %useCustomColor%, >>%tempfile%
 echo;
 echo doCullingを決めてください。
 set doCulling=true
 set /p doCulling=
 echo doCullingは%doCulling%に設定されました。
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo;
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは%smoothing%に設定されました。
 echo  "smoothing": %smoothing%, >>%tempfile%
 echo } >%tempfile%
 echo;
 :wire_json
 echo jsonが完成しました!
  echo -- filename: ModelWire_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo ----------------------------------------
  echo 行動を選択してください
  echo ----------------------------------------
  echo  行動の番号         行動の内容          
  echo ----------------------------------------
  echo     2              終了させます。       
  echo     3         jsonを保存します。  
  echo ----------------------------------------
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savewijson
  echo エラー:不明な番号
  goto %back%
  :savewijson
  echo F | xcopy %tempfile% %setpath%\ModelWire_%name%.json /V /C /F /-Y
  goto %back%
 

:car
 echo;
 echo 乗り物のjsonを作成します。
 echo;
 set back=car_json
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo nameを決めてください。
 set /p name=
 echo name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%", >>%tempfile%
 echo  "model": { >>%tempfile%
 echo;
 echo モデルファイルのパスを入力してください。
 echo これは変数を使用せず、C:\rtm\assets\minecraft\models\ModelTrain_Temp.mqoの形式で入力してください。
 echo %ESC%[7m必ず / (スラッシュ)ではなく \ (バックスラッシュ)を使用してください。%ESC%[0m
 echo 自動読み込み機能が嫌いな場合はmqozまたはobj,ngto,ngtzと入力してください。
 set /p modelFile=
 rem check format
 if %modelfile:~-4% == mqoz goto mat_oldcar
 if %modelfile:~-3% == obj goto mat_oldcar
 if %modelfile:~-4% == ngto goto mat_oldcar
 if %modelfile:~-4% == ngtz goto mat_oldcar
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> %tempfile%
 endlocal
 set return=cartype
 set filename=%tempfile%
 goto ams
 :mat_oldcar
 echo 乗り物のモデルを決めてください。(ファイル名)
 set /p modelfile=
 echo   "modelFile": "%modelfile%", >>%tempfile%
 echo model: %modelfile%
 echo;
 echo %modelfile%の材質数を設定してください。
 set /p mat=
 echo 材質数は %mat% です。
 echo;
 echo   "textures": [ >>%tempfile%
 echo 1 つめの材質名を入力してください。
 set /p matname=
 echo 材質名は %matname% です。
 echo;
 echo 材質のテクスチャパスを入力してください。
 echo 注意: %ESC%[41m\%ESC%[0m(バックスラッシュ)ではなく%ESC%[41m/%ESC%[0m(スラッシュ)を使用してください。
 set /p texturepath=
 echo テクスチャパスは %texturepath% です。
 set matcount=1
 :cacounter
  if %mat% == %matcount% goto cabutton
 set /a matcount= %matcount% + 1
 echo %matcount% つめの材質名を入力してください。
 set /p matname1=
 echo 材質名は %matname1% です。
 echo;
 echo %matname1% のテクスチャパスを入力してください。
 set /p texturep=
 echo テクスチャパスは %texturep% です。
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto cacounter
 :cabutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 echo;
 :cartype
 echo 乗り物のタイプを設定してください。
 echo 使用可能: Car,Ship,Plane,Lift
 echo それぞれ自動車,船舶,航空機,リフトです。
 set /p Type=
 echo  "vehicleType": "%Type%", >>%tempfile%
 echo タイプ: %Type%
 if %Type% == Lift goto Lift
 echo;
 echo 滑りやすさ,地面を設定してください。
 echo デフォルトは 0.9 です。
 set friction1=null
 set /p friction1=
 echo;
 echo 滑りやすさ,空中を設定してください。
 echo デフォルトは 0.9 です。
 set /p friction2=
 echo;
 echo  "friction": [%friction1%, %friction2%], >>%tempfile%
 echo 加速度,地面を設定してください。
 set /p acceleration1=
 echo;
 echo 加速度,空中を設定してください。
 set /p acceleration2=
 echo  "acceleration": [%acceleration1%, %acceleration2%], >>%tempfile%
 echo;
 echo 最大速度,地面を設定してください。
 set /p maxSpeed1=
 echo;
 echo 最大速度,空中を設定してください。
 set /p maxSpeed2=
 echo  "maxSpeed": [%maxSpeed1%, %maxSpeed2%], >>%tempfile%
 echo;
 echo 最大Yaw,地面を設定してください。
 set /p yaw1=
 echo;
 echo 最大Yaw,空中を設定してください。
 set /p yaw2=
 echo  "maxYaw": [%yaw1%, %yaw2%], >>%tempfile%
 echo;
 echo Yaw係数,地面を設定してください。
 set /p yaw1k=
 echo;
 echo Yaw係数,空中を設定してください。
 set /p yaw2k=
 echo  "yawCoefficient": [%yaw1k%, %yaw2k%], >>%tempfile%
 echo;
 echo pitch係数,地面を設定してください。
 set /p pitch1=
 echo;
 echo pitch係数,空中を設定してください。
 set /p pitch2=
 echo  "pitchCoefficient": [%pitch1%, %pitch2%], >>%tempfile%
 echo;
 echo roll係数,地面を設定してください。
 set /p roll1k=
 echo;
 echo roll係数,空中を設定してください。
 set /p roll2k=
 echo  "rollCoefficient": [%roll1k%, %roll2k%], >>%tempfile%
 echo;
 echo 停車中に旋回できるかどうかを設定してください。
 set /p stop=(true/false) : 
 echo  "changeYawOnStopping": %stop% >>%tempfile%
 echo } >>%tempfile%
 goto car_json

 :Lift
 echo;
 echo ボタンテクスチャのパスを設定してください。
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo ボタン: %button%
 echo;
 echo sizeの1つめを決めてください。
 set /p size1=
 echo sizeの1つめは %size1% に設定されました。
 echo;
 echo sizeの2つめを決めてください。
 set /p size2=
 echo sizeの2つめは %size2% に設定されました。
 echo  "size": [%size1% , %size2%], >>%tempfile%
 echo;
 echo playerPosを決めてください。
 echo 0.0, 0.48, 0.0 の形式で入力してください。
 set /p playerPos=
 echo  "playerPos": [[%playerPos%]], >>%tempfile%
 echo;
 echo vibrationを決めてください。
 echo 0.0, 0.0 の形式で入力してください。
 set /p vibration=
 echo  "vibration":[%vibration%], >>%tempfile%
 echo;
 echo gripPosを決めてください。
 echo これはリフトとワイヤーの接点をx,y,zのメートル単位で指定してください。
 echo 0.0, 3.5, 0.0 の形式で入力してください。
 echo ヒント: RTMにプリインストールされているリフトは 0.0, 3.5, 0.0 です。
 set /p gripPos=
 echo  "gripPos": [%gripPos%], >>%tempfile%
 echo;
 echo useCustomColorを決めてください。
 set /p useCustomColor=(true/false): 
 echo  "useCustomColor": %useCustomColor% >>%tempfile%
 echo;
 echo smoothingを決めてください。
 set /p smooz=(true/false) : 
 echo  "smoothing": %smooz%, >>%tempfile%
 echo;
 echo doCullingを決めてください。
 set /p doCulling=(true/false) : 
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo  "changeYawOnStopping": false, >>%tempfile%
 echo;
 echo accuracyを決めてください。
 set /p accuracy=(LOW/MIDIUM): 
 echo  "accuracy": "%accuracy%", >>%tempfile%
 echo;
 echo collisionPartsを決めてください。
 echo "seat1" の形式で入力してください。 複数指定の場合は "seat1", "seat2", "seat3" の形式で入力してください。
 set /p collisionParts=
 echo  "collisionParts": [%collisionParts%], >>%tempfile%
 echo;
 echo tagsを決めてください。
 echo 複数指定する場合は,で区切って入力してください。
 set /p tags=
 echo  "tags": "%tags%" >>%tempfile%
 echo } >>%tempfile%
 echo;
 :car_json
  echo jsonが完成しました!
  echo -- filename: ModelVehicle_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo ----------------------------------------
  echo 行動を選択してください
  echo ----------------------------------------
  echo  行動の番号         行動の内容          
  echo ----------------------------------------
  echo     2              終了させます。       
  echo     3         jsonを保存します。  
  echo ----------------------------------------
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 echo F | xcopy %tempfile% %setpath%\ModelVehicle_%name%.json /V /C /F /-Y
  goto car_json
 
:soundcreate
 echo このサウンドクリエイト機能はsounds.jsonの作成テストに使用するためのものです。
 echo sound.logファイルを削除する必要がありますか? (必要ない場合は今すでにあるものに+で作成されます,例えば、99行のファイルが既に存在していて5行追加したい場合は必要なしを選択することで99行にプラスで5行を書き加えることができます。)
 set /p confirm=(y / n)
 if %confirm% == y del /F sound.log
 if %confirm% == n goto next
 :next
 echo 何行必要ですか?
 echo 空白や0、はちゃめちゃに大きい数を指定してしまい、止めたいときは"CTRL + C"をすることでバッチファイルを強制終了してください。
 echo じゃないとバッチファイルが動き続ける限り無限にsounds.logのファイルサイズが大きくなります(1秒に1KBペースで増えます)
 set /p stopcount=
 :loo
 set /a count=%count% + 1
 set aa=%random%%random%
 echo sound\%aa%.ogg>> sound.log
 echo sound\%aa%.ogg
 echo %count%
 echo;
 if %count% == %stopcount% goto stop
 goto loo
 :stop
 echo done!
 echo schedule: %stopcount%
 echo work total: %count%
 if not %stopcount% == %count% echo stopcountとcountの数が違うことを検知しました。 もし上のカウンターが同じ数ならこれは間違っています。 その場合は無視してください。
 echo;
 pause
 exit
:setpath
 set /p setpath=Enter path here :
 pushd %setpath%
 echo Done.
 exit /b
:railjson1pre
 echo プレビューが表示されます:
 pause
 echo { 
 echo   "railName": "keburukacon", 
 echo   "model": { 
 echo       "modelFile": "ModelRail_keburukacon.mqo", 
 echo       "textures": [["mat", "textures/rail/ke-buruka.png", ""]], 
 echo       "rendererPath": "scripts/RenderRailStandard.js" 
 echo   }, 
 echo   "buttonTexture": "textures/rail/button_ke-burukacon.png", 
 echo   "polygonType": 4, 
 echo   "ballastWidth": 3, 
 echo   "allowCrossing": true, 
 echo   "defaultBallast": [{ 
 echo     "blockName": "air", 
 echo     "blockMetadata": 0, 
 echo     "height": 0.0625 
 echo   }] 
 echo } 
 goto rail
:railjson2pre
 echo プレビューが表示されます:
 pause
 echo {
 echo   "railName": "keburukacon",
 echo   "railModel": "ModelRail_keburukacon.mqo",
 echo   "railTexture": "textures/rail/ke-buruka.png",
 echo 	"buttonTexture": "textures/rail/button_ke-burukacon.png",
 echo 	"polygonType": 4,
 echo 	"defaultBallast": [{
 echo 		"blockName": "air",
 echo 		"blockMetadata": 0,
 echo 		"height": 0.0625
 echo 	}],
 echo 	"allowCrossing": true
 echo }
 goto rail
:firstsetting
 set isnotconfirm=false
 echo 初期設定を行っています...
 pushd %temp%
 echo Create dir: %temp%\.RJC\json
 md .RJC\json
 echo Create dir: %temp%\.RJC\setting
 md .RJC\setting
 pushd %temp%\.RJC
 echo Create file: %temp%\.RJC\rjc.tscf
 echo;>rjc.tscf
 :loadwelcome
 if exist %temp%\.RJC\setting\welcome.tscf del %temp%\.RJC\setting\welcome.tscf
 pushd %temp%\.RJC\setting
 echo Create file: %temp%\.RJC\setting\welcome.tscf
 echo  ---------------------------------------->>%temp%\.RJC\setting\welcome.tscf
 echo   行動の番号         行動の内容          >>%temp%\.RJC\setting\welcome.tscf
 echo  ---------------------------------------->>%temp%\.RJC\setting\welcome.tscf
 echo       1         列車のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       2         RtmJsonCreatorを終了します。>>%temp%\.RJC\setting\welcome.tscf
 echo       3         看板のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       4         スペシャルサンクスと作者>>%temp%\.RJC\setting\welcome.tscf
 echo       5         機能あり/なし設置物のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       6         NPCのjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       7         旗のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       8         sounds.jsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo       9         ディレクトリを構成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      11         pack.jsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      12         信号機のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      13         レールのjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      14         コンテナのjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      15         火器のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      16         コネクターのjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      17         ワイヤーのjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo      18         乗り物(自動車,航空機,船舶,リフト)のjsonを作成します。>>%temp%\.RJC\setting\welcome.tscf
 echo setting         設定画面を開きます。>>%temp%\.RJC\setting\welcome.tscf
 echo     cmd         cmd.exeをコールします。>>%temp%\.RJC\setting\welcome.tscf
 echo setpath         指定したディレクトリにパスを通します。>>%temp%\.RJC\setting\welcome.tscf
 if %isnotconfirm% == true echo Done. & goto setting
 set ERRORLEVEL=0
 echo do "where choice" command
 where choice
 if %ERRORLEVEL% == 0 echo CHOICE COMMAND FOUND.
 if %ERRORLEVEL% == 1 echo CHOICE COMMAND NOT FOUND. Create file: %temp%\.RJC\OSC.tscf
 if %ERRORLEVEL% == 1 echo OSC=TRUE>>%temp%\.RJC\OSC.tscf
 set ERRORLEVEL=0
 echo do "where curl" command
 where curl
 if %ERRORLEVEL% == 0 echo CURL COMMAND FOUND.
 if %ERRORLEVEL% == 1 echo CURL COMMAND NOT FOUND. Create file: %temp%\.RJC\OSC.tscf
 if %ERRORLEVEL% == 1 echo OSC=TRUE>>%temp%\.RJC\OSC.tscf
 echo;
 echo Done.
 timeout /t 3 >nul
 goto startrjc
:deljson
 del /Q %temp%\.RJC\json\*
 echo Done.
 goto selectwelcome
:License
 echo;
 echo -----------------------------
 echo Copyright (c) 2022-2024 akikawa9616
 echo;
 echo Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 echo;
 echo The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 echo;
 echo THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 echo -----------------------------
 pause
 goto selectwelcome
:update
 pushd %temp%
 del delete.bat
 del %temp%\rjcversion.tscf
 curl -sLJO https://akikawaken.github.io/RJC/VC/delete.bat
 start delete.bat
 exit
:useams
 echo これは自動材質設定機能のテストです。
 echo 材質数,材質名,材質テクスチャパスを出力します。
 echo こっちはエラーハンドリングをちゃんと作ってないので以下の点に注意してください
 echo - ダブルクォーテーション無し
 echo - パス/ファイル名に空白なし
 set /p modelFile=(ここにmqo形式のモデルファイルフルパスを入力:) 
 setlocal enabledelayedexpansion
 for %%a in (%modelFile%) do set "filename=%%~nxa"
 endlocal
 echo modelFilePathは %modelFile% に設定されました。
 echo ------------------
 if not exist %modelFile% goto cantload_notfound
 for /f "delims=" %%a in ('findstr /B /R /N /C:TrialNoise* %modelFile%) do ( goto cantload_Noise )
 for /f "delims=" %%a in ('findstr /B /R /N /C:Material* %modelFile%') do set mat=%%a
 for /f "delims=:" %%a in ('echo %mat%') do set lnnum=%%a
 echo;
 echo 材質設定の行: %lnnum%
 echo;
 for /f "delims=" %%a in ('findstr /B /R /C:Material* %modelFile%') do set mat=%%a
 set mat=%mat:~9%
 set mat=%mat:~0,-2%
 echo 材質数を取得: %mat%
 echo;
 setlocal enabledelayedexpansion
 set /a "count=0"
 for /f "delims=" %%a in (%modelFile%) do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )
 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1:~1!
 echo 材質名を取得: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo テクスチャ名を取得: !texture!
 echo 材質名: !matname! , !matname!のテクスチャ: !texture!
 endlocal
 set matcount=1
 echo;
 :matroops
 if %mat% == %matcount% goto end
 set /a matcount=%matcount% + 1
 set /a lnnum=%lnnum% + 1
 set count=0
 setlocal enabledelayedexpansion
 set /a "count=0"
 for /f "delims=" %%a in (%modelFile%) do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )

 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1:~1!
 echo 材質名を取得: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo テクスチャ名を取得: !texture!
 echo name: !matname! ,texturename: !texture!
 echo;
 endlocal
 goto matroops
 :end
 pause
 goto welcome
:ams
 if '^%modelFile:~-1%^%modelFile:~0,1%' == '^"^"' ( set modelFile=%modelFile:~1,-1% ) 
 echo modelFilePathは %modelFile% に設定されました。
 echo          "textures":[ >> %filename%
 echo ------------------
 echo このモデルのテクスチャフォルダパスを入力してください。
 echo これは変数を使用せず、 textures/train の形式で入力してください。
 echo %ESC%[7m必ず \ (バックスラッシュ)ではなく / (スラッシュ)を使用してください。%ESC%[0m
 set /p texturedir=
 echo dir: %texturedir%
 echo ------------------
 echo 描画スクリプト(rendererPath)を利用する場合は相対パス scripts/ファイル名.js を入力。
 echo 利用しない場合は何も入力せずにEnter.
 set rendererPath=null
 set /p rendererPath=
 echo rendererPath: %rendererPath%
 echo ------------------
 if not exist %modelfile% goto cantload_notfound
 del %temp%\.ams1.tscf
 del %temp%\.ams2.tscf
 for /f "delims=" %%a in ('findstr /B /R /N /C:"Format Compress"* %modelFile%') do ( goto cantload_UnSupportedFormat )
 for /f "delims=" %%a in ('findstr /B /R /N /C:"Format Text Ver 1.0" %modelFile%') do ( goto torimaoke )
 for /f "delims=" %%a in ('findstr /B /R /N /C:"Format Text Ver 1.1" %modelFile%') do ( goto torimaoke )
 for /f "delims=" %%a in ('findstr /B /R /N /C:"Format Text Ver 1.2" %modelFile%') do ( goto torimaoke )
 goto cantload_UnknownFormatOrVer
 :torimaoke
 for /f "delims=" %%a in ('findstr /B /R /N /C:TrialNoise* %modelFile%') do ( goto cantload_Noise )
 for /f "delims=" %%a in ('findstr /B /R /N /C:Material* %modelFile%') do set mat=%%a
 for /f "delims=:" %%a in ('echo %mat%') do set lnnum=%%a
 echo 材質設定の行: %lnnum%
 for /f "delims=" %%a in ('findstr /B /R /C:Material* %modelFile%') do set mat=%%a
 set mat=%mat:~9%
 set mat=%mat:~0,-2%
 echo 材質数を取得: %mat%
 setlocal enabledelayedexpansion
 set /a "count=0"
 for /f "delims=" %%a in (%modelFile%) do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )
 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1!
 echo 材質名を取得: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo テクスチャ名を取得: !texture!
 set hoge=!texture:~1,2!
 if !hoge! == :\ goto PathError
 echo !line! | findstr /C:"tex(" >nul
 if !errorlevel! == 1 call :AddDummyTexture
 echo name: !matname! , texturedir: !texturedir! , texturename: !texture!
 echo オプション: 1 : AlphaBlend , 2 : Light , 3 : AlphaBlend,Light , 4 : AlphaBlend,Light,OneTex
 set option=null
 set /p option=オプションを設定,上記の数字を入力。オプション不要の場合は何も入力せずEnter: 
 if !option! == 1 set option=AlphaBlend
 if !option! == 2 set option=Light
 if !option! == 3 set option=AlphaBlend,Light
 if !option! == 4 set option=AlphaBlend,Light,OneTex
 if not !option! == null if not %rendererPath% == null echo       [!matname!, "%texturedir%/!texture!", "!option!"]],"rendererPath": %rendererPath% } >>%temp%\.ams2.tscf  
 if !option! == null if not %rendererPath% == null echo       [!matname!, "%texturedir%/!texture!", ""]],"rendererPath": %rendererPath% } >>%temp%\.ams2.tscf  
 if not !option! == null if not %rendererPath% == null echo       [!matname!, "%texturedir%/!texture!", "!option!"]],"rendererPath": %rendererPath% },  & goto renda
 if !option! == null if not %rendererPath% == null echo       [!matname!, "%texturedir%/!texture!", ""]],"rendererPath": %rendererPath% },  & goto renda
 if not !option! == null echo       [!matname!, "%texturedir%/!texture!", "!option!"]]} >>%temp%\.ams2.tscf
 if !option! == null echo       [!matname!, "%texturedir%/!texture!", ""]]} >>%temp%\.ams2.tscf
 if not !option! == null echo       [!matname!, "%texturedir%/!texture!", "!option!"]]} 
 if !option! == null echo       [!matname!, "%texturedir%/!texture!", ""]]}
 :renda
 endlocal
 set matcount=1
 :matroop
 echo;
 if %mat% == %matcount% for /f "delims=@" %%a in (%temp%\.ams1.tscf) do ( echo %%a >>%filename% )
 if %mat% == %matcount% for /f "delims=@" %%a in (%temp%\.ams2.tscf) do ( echo %%a >>%filename% )
 if %mat% == %matcount% del %temp%\.ams1.tscf
 if %mat% == %matcount% del %temp%\.ams2.tscf
 if %mat% == %matcount% goto %return%
 set /a matcount=%matcount% + 1
 set /a lnnum=%lnnum% + 1
 set count=0
 setlocal enabledelayedexpansion
 set /a "count=0"
 for /f "delims=" %%a in (%modelFile%) do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )

 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1!
 echo 材質名を取得: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo テクスチャ名を取得: !texture!
 set hoge=!texture:~1,2!
 if !hoge! == :\ goto PathError
 echo !line! | findstr /C:"tex(" >nul
 if !errorlevel! == 1 call :AddDummyTexture
 echo name: !matname! , texturedir: !texturedir! , texturename: !texture!
 echo オプション: 1 : AlphaBlend , 2 : Light , 3 : AlphaBlend,Light , 4 : AlphaBlend,Light,OneTex
 set option=null
 set /p option=オプションを設定,上記の数字を入力。オプション不要の場合は何も入力せずEnter: 
 if !option! == 1 set option=AlphaBlend
 if !option! == 2 set option=Light
 if !option! == 3 set option=AlphaBlend,Light
 if !option! == 4 set option=AlphaBlend,Light,OneTex
 if not !option! == null echo       [!matname!, "%texturedir%/!texture!", "!option!"], >>%temp%\.ams1.tscf
 if !option! == null echo       [!matname!, "%texturedir%/!texture!", ""], >>%temp%\.ams1.tscf
 if not !option! == null echo       [!matname!, "%texturedir%/!texture!", "!option!"], 
 if !option! == null echo       [!matname!, "%texturedir%/!texture!", ""], 
 endlocal
 goto matroop

:setting
 timeout /t 3 >nul
 cls
 set count=0
 rem ln limit:30 
 echo;
 echo 設定画面
 echo;
 echo    1  スペシャルサンクス
 echo    2  RtmAddonディレクトリを構成
 echo    3  アップデート/ダウングレード
 rem echo    4  行動選択画面の並び替え
 echo    5  コマンドライン呼び出し
 echo    6  削除/アンインストール
 echo    7  自動材質設定の初期版を利用する
 echo    8  explorer.exeをコールします。
 echo    9  互換モードを切り替える
 echo   10  パスを通す
 rem echo   11  
 rem echo   12  
 rem echo   13  
 rem echo   14  
 rem echo   15  
 rem echo   16  
 rem echo   17  
 rem echo   18  
 rem echo   19  
 rem echo   20  
 rem echo   21  
 rem echo   22  
 rem echo   23  
 rem echo   24  
 echo rexit RtmJsonCreatorを終了します。
 echo  exit 設定を終了します。 
 echo;
 set count=0
 set /p settinginput=
 if %settinginput% == 1 call :specialthanks
 if %settinginput% == 2 goto dir
 if %settinginput% == 3 goto supdate
 if %settinginput% == 4 goto changewelcome
 if %settinginput% == 5 call cmd.exe
 if %settinginput% == 6 goto deletes
 if %settinginput% == 7 goto useams
 if %settinginput% == 8 start explorer.exe %setpath%
 if %settinginput% == 9 goto turnosc
 if %settinginput% == 10 call :setpath
 if %settinginput% == rexit pushd %from% & call cmd.exe & exit
 if %settinginput% == exit goto startrjc
 echo エラー:不明な番号です。
 goto selectwelcome

 :supdate
  if not %oscmode% == 0 goto setting
  echo 1 強制的に最新版へアップデートする
  echo 2 強制的に特定のバージョンへ移行させる
  set /p settinginput=
  if %settinginput% == 1 goto update
  if %settinginput% == 2 goto HyperUpdate
  goto setting
 :HyperUpdate
  pushd %temp%\.RJC
  curl https://akikawaken.github.io/RJC/VC/DownloadList.tscf
  popd
  echo;
  set /p downloadversion=バージョン名を入力(e.g. 0.1): 
  if %downloadversion:~0,1% == 0 echo 選択されたバージョンにはアップデート機能が搭載されていません。 現バージョンに戻すには%temp%\.RJC配下と%temp%\rjcupdate.tscf,%temp%\rjcversion.tscfの削除が必要になります。
  if %downloadversion% == 1.0.1.2 echo 選択されたバージョンにはアップデート機能が搭載されていません。 現バージョンに戻すには%temp%\.RJC配下と%temp%\rjcupdate.tscf,%temp%\rjcversion.tscfの削除が必要になります。
  if %downloadversion% == 1.2 echo 選択されたバージョンには設定画面が搭載されていません。 現バージョンに戻すには一旦最新版に上げてから落とす必要があります。
  echo %downloadversion% へ バージョンを変更します。
  set /p settinginput=(Y/N): 
  if not %settinginput% == y goto setting
  pushd %temp%
  curl -sLJO https://akikawaken.github.io/RJC/VC/Old/%downloadversion%_delete.bat
  start %temp%\%downloadversion%_delete.bat
  exit

 :changewelcome
  echo;
  echo 初期設定またはほかのファイルからロードしますか?
  echo;
  echo 1 自分で作る
  echo 2 初期設定を利用する
  echo 3 ロードする
  echo;
  set /p settinginput=
  if %settinginput% == 1 goto createoriginalwelcomescreen
  if %settinginput% == 2 goto loadwelcome
  if %settinginput% == 3 goto loadfromotherfile
  goto setting
 
  :loadfromotherfile
  echo ロードするファイルへのフルパスを指定してください。
  echo;
  echo 注意: この機能は v%version% の行動選択画面の形式に沿っていないファイルも読み込むことができます。
  echo;
  set /p loadfile=(Path/Cancel): 
  if %loadfile% == Cancel goto setting
  if not exist %loadfile% goto setting
  del %temp%\.RJC\setting\welcome.tscf
  type %loadfile% >> %temp%\.RJC\setting\welcome.tscf
 
  :createoriginalwelcomescreen
  del %temp%\.RJC\setting\welcome.tscf
  set /a count=%count% + 1
  echo 明示的にする項目を選んでください。
  echo これは %count% 行目に表示されます。
  echo;
  echo --Json--
  echo    1  列車
  echo    2  看板
  echo    3  設置物
  echo    4  信号機
  echo    5  レール
  echo    6  コンテナ
  echo    7  コネクタ
  echo    8  ワイヤ
  echo    9  旗
  echo   10  火器
  echo   11  乗り物
  echo   12  NPC
  echo   13  sounds.json
  echo   14  pack.json
  echo --Other--
  echo   15  設定画面
  echo   16  スペシャルサンクス
  echo   17  ディレクトリ構成
  echo   18  cmd
  echo   19  SetPath
  echo   20  RtmJsonCreatorを終了
  echo --WelcomeScreenSystem--
  echo exit  明示的にする項目の設定を終了する
  set displayln=0
  set /p displayln=
  if %displayln% == 1 set display%count%=train
  if %displayln% == 2 set display%count%=sign
  if %displayln% == 3 set display%count%=machine
  if %displayln% == 4 set display%count%=signal
  if %displayln% == 5 set display%count%=rail
  if %displayln% == 6 set display%count%=container
  if %displayln% == 7 set display%count%=connector
  if %displayln% == 8 set display%count%=wire
  if %displayln% == 9 set display%count%=flag
  if %displayln% == 10 set display%count%=gun
  if %displayln% == 11 set display%count%=car
  if %displayln% == 12 set display%count%=npc
  if %displayln% == 13 set display%count%=sounds
  if %displayln% == 14 set display%count%=pack
  if %displayln% == 15 set display%count%=setting
  if %displayln% == 16 set display%count%=specialthanks
  if %displayln% == 17 set display%count%=dir
  if %displayln% == 18 set display%count%=cmd
  if %displayln% == 19 set display%count%=setpath
  if %displayln% == 20 set display%count%=exit
  if %displayln% == 1 goto welcome_train
  if %displayln% == 2 goto welcome_sign
  if %displayln% == 3 goto welcome_machine
  if %displayln% == 4 goto welcome_signal
  if %displayln% == 5 goto welcome_rail
  if %displayln% == 6 goto welcome_container
  if %displayln% == 7 goto welcome_connector
  if %displayln% == 8 goto welcome_wire
  if %displayln% == 9 goto welcome_flag
  if %displayln% == 10 goto welcome_gun
  if %displayln% == 11 goto welcome_car
  if %displayln% == 12 goto welcome_npc
  if %displayln% == 13 goto welcome_sounds
  if %displayln% == 14 goto welcome_pack
  if %displayln% == 15 goto welcome_setting
  if %displayln% == 16 goto welcome_specialthanks
  if %displayln% == 17 goto welcome_dir
  if %displayln% == 18 goto welcome_cmd
  if %displayln% == 19 goto welcome_setpath
  if %displayln% == 20 goto welcome_exit
  :welcome_train
  :welcome_sign
  :welcome_machine
  :welcome_signal
  :welcome_rail
  :welcome_container
  :welcome_connector
  :welcome_wire
  :welcome_flag
  :welcome_gun
  :welcome_car
  :welcome_npc
  :welcome_sounds
  :welcome_pack
  :welcome_setting
  :welcome_specialthanks
  :welcome_dir
  :welcome_cmd
  :welcome_setpath
  :welcome_exit

 :deletes
  set deltscf=false
  set savejson=false
  set canceluninst=false
  set startuninst=false
  set echomode=false
  echo  1 作成したJsonを削除する(全て削除します!)
  echo  2 RtmJsonCreatorをアンインストールする
  set /p settinginput=
  if %settinginput% == 1 goto deljson
  if %settinginput% == 2 goto uninstall
  goto setting
  :uninstall
  echo RtmJsonCreatorをアンインストールします。
  echo;
  echo 詳細を選択してください。
  echo;
  echo  1 RtmJsonCreatorを削除(必須) , true
  rem echo  2 ".tscf"拡張子のファイルを全て削除する(RJCとは無関係のtscfファイルも削除します!) , %deltscf%
  echo  3 作成したJsonファイルを避難させる , %savejson%
  echo  4 echoをonにする , %echomode%
  echo  5 やっぱりアンインストールやめる , %canceluninst%
  echo  6 アンインストールをさっさと始めろ , %startuninst%
  set /p uninstoption=
  if %uninstoption% == 2 set deltscf=true
  if %uninstoption% == 3 set savejson=true
  if %uninstoption% == 4 set echomode=true
  if %uninstoption% == 5 goto setting
  if %uninstoption% == 6 goto startuninst
  goto uninstall

  :startuninst
  echo **オプション確認**
  echo これは最後の確認です!
  echo;
  echo RtmJsonCreatorを削除: True,
  rem echo ".tscf"拡張子のファイルを全て削除する: %deltscf%,
  echo 作成したJsonファイルを避難させる: %savejson%,
  echo echoをonにする: %echomode%,
  echo アンインストールをさっさと始めろ: True.
  echo;
  set /p confirm=(Y/N): 
  if not %confirm% == y goto setting
  if %echomode% == true echo on
  pushd %temp%
  if %savejson% == true md %temp%\rjcjson\ & copy %temp%\.RJC\json\* %temp%\rjcjson\ & echo Jsonファイルは%temp%\rjcjsonに保存されました。
  echo rd /S /Q %temp%\.RJC\>>%temp%\deleterjc.bat
  echo del /Q %temp%\.Rtm_Json_Creator.tscf>>%temp%\deleterjc.bat
  echo del /Q %temp%\.ams1.tscf>>%temp%\deleterjc.bat
  echo del /Q %temp%\.ams2.tscf>>%temp%\deleterjc.bat
  echo del /Q %temp%\rjcupdate.tscf>>%temp%\deleterjc.bat
  echo del /Q %temp%\rjcversion.tscf>>%temp%\deleterjc.bat
  echo pushd c:\>>%temp%\deleterjc.bat
  echo for /f %%%%a in ('dir /s /b rtm_json_creator*') do ( del /Q %%%%a )>>%temp%\deleterjc.bat
  echo for /f %%%%a in ('dir /s /b RtmJsonCreator*') do ( del /Q %%%%a )>>%temp%\deleterjc.bat
  echo for /f %%%%a in ('dir /s /b Rtm-Json-Creator*') do ( del /Q %%%%a )>>%temp%\deleterjc.bat
  echo for /f %%%%a in ('dir /s /b rtm-json-v0.8.bat') do ( del /Q %%%%a )>>%temp%\deleterjc.bat
  echo for /f %%%%a in ('dir /s /b sign_json_v0.1.bat') do ( del /Q %%%%a )>>%temp%\deleterjc.bat
  echo echo uninstall complete.>>%temp%\deleterjc.bat
  echo pause>>%temp%\deleterjc.bat
  echo del /Q %temp%\deleterjc.bat>>%temp%\deleterjc.bat
  timeout /t 3
  start %temp%\deleterjc.bat
  exit

 :turnosc
  if %oscmode% == 1 del %temp%\.RJC\osc.tscf
  if %oscmode% == 0 echo OSC=TRUE>>%temp%\.RJC\osc.tscf
  goto startrjc

:specialthanks
 echo 作者:akikawa9616 ^| https://github.com/akikawaken/Rtm_Json_Creator
 echo ----
 echo スペシャルサンクス(敬称略)
 echo  jsonのデータの提供
 echo   -- .zip
 echo   -- はちこうとっかい ^| https://twitter.com/Hachiko_Server
 echo  デバッグ
 echo   -- akikawa9616
 echo   -- ちとがわ ^| https://www.youtube.com/@Yonkatsu12
 echo;
 echo  一部機能発案者
 echo   -- K.kirikoto ^| https://twitter.com/mikawa8002
 echo;
 echo  参考文献
 echo   -- RTMモデルパック作成マニュアル_2.4.8_1.pdf ^| 著 ngt5479 ^| 2019/06/25
 echo;
 echo このプログラムはMITライセンスで公開されています。
 echo MIT License全文は行動選択画面で"License"を入力してください。
 echo;
 echo version: %version% / releaseversion: %releaseversion% / OSC: %oscmode%
 pause
 cls
 exit /b
rem AutomaticMaterialSettingErrors
 rem ERROR
  :cantload_UnSupportedFormat
   echo;
   echo [ERROR] サポートされていないMQO形式が読み込まれました。: Compress
   echo [ERROR] %modelFile%に対する読み込みは強制的に停止されました。
   echo 続行すると終了します。
   pause
   pushd %from% & call cmd.exe & exit
  :cantload_UnknownFormatOrVer
   echo;
   echo [ERROR] 形式またはバージョンが認識できませんでした。
   echo [ERROR] %modelFile%に対する読み込みは強制的に停止されました。
   echo 続行すると終了します。
   pause
   pushd %from% & call cmd.exe & exit
  :cantload_Noise
   echo;
   echo [ERROR] TrialNoiseチャンクが検出されました。
   echo [ERROR] %modelFile%に対する読み込みは強制的に停止されました。
   echo 続行すると終了します。
   pause
   pushd %from% & call cmd.exe & exit
  :cantload_notfound
   echo;
   echo [ERROR] %modelfile%が見つかりませんでした。
   echo 続行すると終了します。
   pause
   pushd %from% & call cmd.exe & exit
  :PathError
   echo;
   echo %ESC%[41m------------------------------------%ESC%[0m
   echo %ESC%[41mパス文字列の構文が間違っている可能性があります!%ESC%[0m
   echo;
   echo %ESC%[41mモデルファイルの材質名: !matname! を !texture! の形式ではなく、テクスチャのファイル名のみを材質テクスチャに設定するようにしてください。%ESC%[0m
   echo %ESC%[41m一応、このままでもRTMは動作しますが、RtmJsonCreatorは対応していないため、この先のJsonを作成することはできません。%ESC%[0m
   echo %ESC%[41mまた、このテクスチャパスには%USERPROFILE%配下へのパスが含まれている可能性があり、アドオンを配布する時は本名バレに注意してください。%ESC%[0m
   echo %ESC%[41m------------------------------------%ESC%[0m
   echo;
   pause
   pushd %from% & call cmd.exe & exit
 rem WARN
  :AddDummyTexture
   set texturedir=textures/train
   set texture=tp.png
   echo [WARN] テクスチャが設定されていない材質を検出しました。
   echo [WARN] RTM内に同梱されている透明なテクスチャを代わりに適用します。
   exit /b
   