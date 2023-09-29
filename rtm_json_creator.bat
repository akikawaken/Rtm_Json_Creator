@echo off
rem (c) 2022 - 2023 akikawa9616
title Rtm_Json_Creator.bat
set user=
set version=0.9.4.4(public)
set tsw=NONE
del %temp%\.Rtm_Json_Creator_json.tscf
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:welcome
echo rtm json createorへようこそ!
echo 行動を選択してください
:selectwelcome
echo  ----------------------------------------
echo   行動の番号         行動の内容          
echo  ----------------------------------------
echo      1        列車のjsonを作成します。     
echo      2              終了させます。       
echo      3        看板のjsonを作成します。 
echo      4        スペシャルサンクスと作者  
echo      5   機能あり設置物のjsonを作成します。 
echo      6         NPCのjsonを作成します。 
echo      7          旗のjsonを作成します。
echo      8        sounds.jsonを作成します。
echo      9      ディレクトリを構成します。
echo     10  指定されたディレクトリをzip化します。(べーたばんです)
echo    cmd         cmd.exeをコールします。
echo setpath 指定したディレクトリにパスを通します。
echo  ----------------------------------------
set /p start=行動の数字を入力してください...
set back=selectwelcome
echo;
if %start% == 1 goto 1
if %start% == 2 goto 2
if %start% == 3 goto 3
if %start% == 4 goto 4
if %start% == 5 goto 5
if %start% == 6 goto 6
if %start% == 7 goto 7
if %start% == 8 goto 8
if %start% == 9 goto 9
if %start% == 10 goto zip
if %start% == 999 goto soundcreate
if %start% == setpath set /p setpath=Enter path here : 
if %start% == setpath pushd %setpath%
if %start% == cmd echo exit /b を使用してRtmJsonCreatorに戻ることができます。
if %start% == cmd call cmd.exe
echo エラー:不明な番号です。
goto selectwelcome
:1
 cls
 set tsw=t
 echo 列車のjsonを作成します。
 echo これはJSONが自動保存されます。 jsonは%cd%\ModelTrain_%%trainname%%.jsonにできるはずです。
 echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
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
   echo %mat% の %mattexture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mata=
   echo %mat% の %mattexture% のオプションは %mata% に設定されました。
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 12
:12
 rem bogiemodel setting start
 echo modelfileを決めてください。
 echo ボギーの3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFileb=
 echo modelFileは %modelFileb% に設定されました。
 echo "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelfileb%", >> ModelTrain_%trainname%.json
 echo     "textures": [>> ModelTrain_%trainname%.json
 echo ------------------
 set count=1
:bogiematcountsetting
 set /p matcount=ボギーモデルの材質数を入力してください。
 echo 材質数は %matcount% に設定してください。
:bogiematcheck
 if %matcount% equ %count% ( goto bogiematlast ) ELSE ( goto bogiematsetting )
:bogiematsetting
 set /a count=%count%+1
 echo ------------------
 echo ボギーの3Dモデルの材質,%count%つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p bogie1=
 echo 材質,%count%つめの名前は %bogie1% に設定されました。
 echo ------------------
 echo %bogie1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
 echo オプションは次で設定します。
 set /p bogie1texture=
 echo %bogie1% のテクスチャパスは %bogie1texture% に設定されました。
 echo ------------------
 echo                   ["%bogie1%", "%bogie1texture%",""], >> ModelTrain_%trainname%.json
 goto bogiematcheck
 :bogiematlast
 echo ------------------
 echo ボギーの3Dモデルの材質,%count%つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p bogie1=
 echo 材質,%count%つめの名前は %bogie1% に設定されました。
 echo ------------------
 echo %bogie1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
 echo オプションは次で設定します。
 set /p bogie1texture=
 echo %bogie1% のテクスチャパスは %bogie1texture% に設定されました。
 echo ------------------
 echo                   ["%bogie1%", "%bogie1texture%",""] >> ModelTrain_%trainname%.json
 echo                 ] >> ModelTrain_%trainname%.json
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
 echo playerposの1つめを決めてください。 使用可能:int値のすべての数字
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
 echo playerposの2つめを決めてください。 使用可能:int値のすべての数字
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
 rem %ESC%[41m is set text color to red, %ESC%[0m is set text color to white(default)
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
 if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": %sound_DoorClose%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_Stopを決めてください。
 echo あと39個でjsonが表示されます。
 set /p sound_Stop=
 echo sound_Stopは %sound_Stop% に設定されました。
 if not "%sound_Stop%" == "" echo  "sound_Stop": %sound_Stop%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_S_Aを決めてください。
 echo あと38個でjsonが表示されます。
 set /p sound_S_A=
 echo sound_S_Aは %sound_S_A% に設定されました。
 if not "%sound_S_A%" == "" echo  "sound_S_A": %sound_S_A%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_Decelerationを決めてください。
 echo あと37個でjsonが表示されます。
 set /p sound_Deceleration=
 echo sound_Decelerationは %sound_Deceleration% に設定されました。
 if not "%Deceleration%" == "" echo  "sound_Deceration": %sound_Deceleration%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_D_Sを決めてください。
 echo あと36個でjsonが表示されます。
 set /p sound_D_S=
 echo sound_D_Sは %sound_D_S% に設定されました。
 if not "%sound_D_S%" == "" echo  "sound_D_S": %sound_D_S%, >> ModelTrain_%trainname%.json
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
 if not "%defaultData%" == "" echo  "defaultData": %defaultData%, >> ModelTrain_%trainname%.json
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
 if not "%serverScriptPath%" == "" echo  "serverScriptPath": %serverScriptPath%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo guiScriptPathを決めてください。
 echo あと21個でjsonが表示されます。
 set /p guiScriptPath=
 echo guiScriptPathは %guiScriptPath% に設定されました。
 if not "%guiScriptPath%" == "" echo  "guiScriptPath": %guiScriptPath%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo guiTextureを決めてください。
 echo あと20個でjsonが表示されます。
 set /p guiTexture=
 echo guiTextureは %guiTexture% に設定されました。
 if not "%guiTexture%" == "" echo  "guitexture": %guiTexture%, >> ModelTrain_%trainname%.json
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
 if not "%soundScriptPath%" == "" echo  "soundScriptPath": %soundScriptPath%, >> ModelTrain_%trainname%.json
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
 echo jsonが完成しました!
 echo;
 echo -- filename: ModelTrain_%trainname%.json --
 echo;
 set back=train_json
 for /f "delims=" %%a in (ModelTrain_%trainname%.json) do (
  echo %%a
 )
:2
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
  exit
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
 echo     3         jsonを保存します。(beta)  
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
 echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
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

:4
 echo 作者:akikawa9616
 echo ----
 echo スペシャルサンクス(敬称略)
 echo  jsonのデータ値の提供
 echo   -- .zip
 echo   -- はちこうとっかい
 echo  デバッグ
 echo   -- akikawa9616
 echo   -- ちとがわ ^| https://www.youtube.com/@Yonkatsu12
 echo thank you !
 echo;
 echo このプログラムはMITライセンスで公開されています。
 echo;
 echo -----------------------------
 echo Copyright (c) 2022-2023 akikawa9616
 echo;
 echo Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 echo;
 echo The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 echo;
 echo THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 echo -----------------------------
 echo version: %version%
 pause
 cls
 goto selectwelcome
:5
 cls
 set tsw=w
 echo 機能あり設置物のどれを作成しますか?
 echo 何も入力しない場合は強制終了します。
 echo 使用可能:遮断機,転轍機,改札機,券売機,照明,車止め,ATC,列車検出器,照明
 echo ----------
 echo if u cant type japanese,pls type english machineType:
 echo Gate,Point,Turnstile,Vendor,Light,BumpingPost,Antenna_Send,Antenna_Receive
 echo (hint: "Antenna_Send"="Automatic Train Control","Antenna_Receive"="Train detector")
 set /p machineType=
 if %machineType% == "遮断機" set machineType=Gate
 if %machineType% == "転轍機" set machineType=Point
 if %machineType% == "改札機" set machineType=Turnstile
 if %machineType% == "券売機" set machineType=Vendor
 if %machineType% == "照明" set machineType=Light
 if %machineType% == "車止め" set machineType=BumpingPost
 if %machineType% == "ATC" set machineType=Antenna_Send
 if %machineType% == "列車検出器" set machineType=Antenna_Receive
 if %machineType% == "Train detector" set machineType=Antenna_Receive
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
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> %temp%\.Rtm_Json_Creator_json.tscf 
 :switcher
 echo buttontextureを決めてください。
 set /p button=
 echo buttonTextureは %button% に設定されました。
 echo --------------------
 echo sound_onactivateを決めてください。
 set /p sound_onactivate=
 echo sound_onactivateは %sound_onactivate% に設定されました。
 echo --------------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo --------------------
 echo doCullingを決めてください。
 set /p doCulling=
 echo doCullingは %doCulling% に設定されました。
 echo --------------------
 echo accuracyを決めてください。
 set /p accuracy=
 echo accuracyは %accuracy% に設定されました。
 echo --------------------
 echo tagsを決めてください。
 echo 複数指定する場合は","を使用してください。(例:akikawa,point,original)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo --------------------
 echo おめでとうございます!
 echo 完成しました!
 echo ------------
 goto switcher_json
:switcher_json
 set back=switcher_json
 echo -----ファイル名:ModelMachine_%name%.json-----
 echo {
 echo   "name": "%name%",
 echo   "model": {
 echo     "modelFile": "%modelFile%",
 echo     "textures":[
 for /f "delims=?" %%a in (%temp%\.Rtm_Json_Creator_json.tscf) do (
  echo %%a
 )
 echo     ]
 echo     },
 echo   "buttonTexture": "%button%",
 echo   "machineType": "%machinetype%",
 echo   "sound_OnActivate": "%sound_onactivate%",
 echo   "smoothing": %smoothing%,
 echo   "doCulling": %doCulling%,
 echo   "accuracy": "%accuracy%",
 echo   "tags": "%tags%"
 echo }
 echo ----------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     2              終了させます。       
 echo     3         jsonを保存します。(beta)  
 echo ----------------------------------------
 set /p user=
 if %user% == 2 goto 2
 if %user% == 3 goto saveswitcherjson
 echo エラー:不明な番号
 goto switcher_json

:saveswitcherjson
 echo jsonを保存します。 jsonは%cd%\ModelMachine_%name%.jsonにできるはずです。
 echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
 pause
 echo { > ModelMachine_%name%.json
 echo   "name": "%name%", >> ModelMachine_%name%.json
 echo   "model": { >> ModelMachine_%name%.json
 echo     "modelFile": "%modelFile%", >> ModelMachine_%name%.json
 echo     "textures":[ >> ModelMachine_%name%.json
 for /f "delims=?" %%a in (%temp%\.Rtm_Json_Creator_json.tscf) do (
  echo    %%a >> ModelMachine_%name%.json
 )
 echo     ]  >> ModelMachine_%name%.json
 echo     },  >> ModelMachine_%name%.json
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 echo   "machineType": "%machinetype%", >> ModelMachine_%name%.json
 echo   "sound_OnActivate": "%sound_onactivate%", >> ModelMachine_%name%.json
 echo   "smoothing": %smoothing%, >> ModelMachine_%name%.json
 echo   "doCulling": %doCulling%, >> ModelMachine_%name%.json
 echo   "accuracy": "%accuracy%", >> ModelMachine_%name%.json
 echo   "tags": "%tags%" >> ModelMachine_%name%.json
 echo } >> ModelMachine_%name%.json
  if exist ModelMachine_%name%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイル名:"ModelMachine_%name%.json"
  echo;
 ) ELSE (
  set error=53N
  goto ERROR
 )
 goto %back%
:6
 cls
 set tsw=n
 echo NPCのjsonを作成します。
 echo もし、途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo nameを決めてください。
 echo これはNPCの名前になります。競合しないような名前を設定してください。
 set /p name=
 echo nameは %name% に設定されました。
 echo -------------
 set nomodel=1
 set /p nomodel=モデルを設定せずにjsonを作成する場合はy,設定する場合は何かのキーを押してください。
 set mat=0
 if %nomodel% == y goto npc
 echo -------------
 echo modelfileを決めてください。
 set /p modelFile=
 echo modelfileは %modelFile% に設定されました。
 echo -------------
 echo %modelFile% の材質数を設定してください。
 set /p mat=
 echo 材質数は %mat% に設定されました。
 echo -------------
 echo 3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 echo ------------------
 if %mat% geq 2 goto nmat2
 goto npc
 :nmat2
   echo 3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat2=
   echo 材質,2つめの名前は %mat2% に設定されました。
   echo ------------------
   echo %mat2% のテクスチャへのパスを記述してください。
   set /p mat2texture=
   echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
   echo ------------------
 if %mat% geq 3 goto nmat3
 goto npc
 :nmat3
   echo 3Dモデルの材質,3つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat3=
   echo 材質,3つめの名前は %mat3% に設定されました。
   echo ------------------
   echo %mat3% のテクスチャへのパスを記述してください。
   set /p mat3texture=
   echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
   echo ------------------
 if %mat% geq 4 goto nmat4
 goto npc
 :nmat4
   echo 3Dモデルの材質,4つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat4=
   echo 材質,4つめの名前は %mat4% に設定されました。
   echo ------------------
   echo %mat4% のテクスチャへのパスを記述してください。
   set /p mat4texture=
   echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
 if %mat% geq 5 goto nmat5
 goto npc
 :nmat5
   echo 3Dモデルの材質,5つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat5=
   echo 材質,5つめの名前は %mat5% に設定されました。
   echo ------------------
   echo %mat5% のテクスチャへのパスを記述してください。 
   set /p mat5texture=
   echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
   echo ------------------
 if %mat% geq 6 goto nmat6
 goto npc
 :nmat6
   echo 3Dモデルの材質,6つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat6=
   echo 材質,6つめの名前は %mat6% に設定されました。
   echo ------------------
   echo %mat6% のテクスチャへのパスを記述してください。 
   set /p mat6texture=
   echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
   echo ------------------
 if %mat% geq 7 goto nmat7
 goto npc
 :nmat7
   echo 3Dモデルの材質,7つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat7=
   echo 材質,7つめの名前は %mat7% に設定されました。
   echo ------------------
   echo %mat7% のテクスチャへのパスを記述してください。 
   set /p mat7texture=
   echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
   echo ------------------
 if %mat% geq 8 goto nmat8
 goto npc
 :nmat8
   echo 3Dモデルの材質,8つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat8=
   echo 材質,8つめの名前は %mat8% に設定されました。
   echo ------------------
   echo %mat8% のテクスチャへのパスを記述してください。 
   set /p mat8texture=
   echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
   echo ------------------
 if %mat% geq 9 goto nmat9
 goto npc
 :nmat9
   echo 3Dモデルの材質,9つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat9=
   echo 材質,9つめの名前は %mat9% に設定されました。
   echo ------------------
   echo %mat9% のテクスチャへのパスを記述してください。 
   set /p mat9texture=
   echo %mat9% のテクスチャパスは %mat9texture% に設定されました。
   echo ------------------
 if %mat% geq 10 goto nmat10
 goto npc
 :nmat10
   echo 3Dモデルの材質,10つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat10=
   echo 材質,10つめの名前は %mat10% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。 
   set /p mat10texture=
   echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
   echo ------------------
 if %mat% geq 11 goto nmat11
 goto npc

:npc
 echo -------------
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
 echo --------------------
 echo jsonが完成しました!
 goto npcjson
:npcjson
 set back=npcjson
 echo ------ファイル名:ModelNPC_%name%.json-------
 echo {
 echo   "name": %name%,
 if %mat% geq 1 echo   "model": {
 if %mat% geq 1 echo     "modelFile": "%modelFile%",
 if %mat% == 1 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"]] },
  if %mat% == 2 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"]] },
  if %mat% == 3 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"]] },
  if %mat% == 4 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"]] },
  if %mat% == 5 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"]] },
  if %mat% == 6 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"]] },
  if %mat% == 7 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"]] },
  if %mat% == 8 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"]] },
  if %mat% == 9 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"]] },
  if %mat% == 10 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"]] },
  if %mat% == 11 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"]] },
  if %mat% == 12 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"]] },
  if %mat% == 13 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"]] },
  if %mat% == 14 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"]] },
  if %mat% == 15 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"]] },
  if %mat% == 16 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"]] },
  if %mat% == 17 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"]] },
  if %mat% == 18 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"]] },
  if %mat% == 19 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"]] },
  if %mat% == 20 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"],["%mat20%", "%mat20texture%", "%mat20a%"]] },
 echo   "role": %role%,
 echo   "doCulling": %doCulling%,
 echo   "smoothing": %smoothing%
 echo }
 echo ------------------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3         jsonを保存します。(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto npcedit
 if %user% == 2 goto 2
 if %user% == 3 goto savenpcjson
 echo エラー:不明な番号
 goto %back%

:savenpcjson
 echo jsonを保存します。 jsonは%cd%\ModelNPC_%name%.jsonにできるはずです。
 echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
 pause
 echo { > ModelNPC_%name%.json
 echo   "name": %name%, >> ModelNPC_%name%.json
 echo   "model": { >> ModelNPC_%name%.json
 echo     "modelFile": "%modelFile%", >> ModelNPC_%name%.json
 if %mat% == 1 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 2 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 3 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 4 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 5 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 6 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 7 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 8 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 9 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 10 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 11 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 12 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 13 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 14 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 15 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 16 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 17 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 18 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 19 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"]] }, >> ModelNPC_%name%.json
  if %mat% == 20 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"],["%mat20%", "%mat20texture%", "%mat20a%"]] }, >> ModelNPC_%name%.json
 echo   "role": %role%, >> ModelNPC_%name%.json
 echo   "doCulling": %doCulling%, >> ModelNPC_%name%.json
 echo   "smoothing": %smoothing% >> ModelNPC_%name%.json
 echo }  >> ModelNPC_%name%.json
  if exist ModelNPC_%name%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイルパス:"%cd%\ModelNPC_%name%.json"
  echo;
 ) ELSE (
  set error=63N
  goto ERROR
 )
 goto %back%

:npcedit
 echo どの部分を編集しますか?
 echo 次のどれかの名前を入力してください
 echo name,modelfile,role,doCulling,smoothing
 echo 材質関係を変更する場合は有効な数字を入力してください。
 echo;
 echo --有効な数字--
 if %mat% geq 1 echo %mat1% を編集する場合は 1 を押してください。
 if %mat% geq 2 echo %mat2% を編集する場合は 2 を押してください。
 if %mat% geq 3 echo %mat3% を編集する場合は 3 を押してください。
 if %mat% geq 4 echo %mat4% を編集する場合は 4 を押してください。
 if %mat% geq 5 echo %mat5% を編集する場合は 5 を押してください。
 if %mat% geq 6 echo %mat6% を編集する場合は 6 を押してください。
 if %mat% geq 7 echo %mat7% を編集する場合は 7 を押してください。
 if %mat% geq 8 echo %mat8% を編集する場合は 8 を押してください。
 if %mat% geq 9 echo %mat9% を編集する場合は 9 を押してください。
 if %mat% geq 10 echo %mat10% を編集する場合は 10 を押してください。
 set /p user=
 if %user% == name goto npcedit_name
 if %user% == modelfile goto npcedit_model
 if %user% == role goto npcedit_role
 if %user% == smoothing goto npcedit_smoo
 if %user% == doCulling goto npcedit_call
 if %user% == 1 goto npcedit_mat_1
 if %user% == 2 goto npcedit_mat_2
 if %user% == 3 goto npcedit_mat_3
 if %user% == 4 goto npcedit_mat_4
 if %user% == 5 goto npcedit_mat_5
 if %user% == 6 goto npcedit_mat_6
 if %user% == 7 goto npcedit_mat_7
 if %user% == 8 goto npcedit_mat_8
 if %user% == 9 goto npcedit_mat_9
 if %user% == 10 goto npcedit_mat_10

 :npcedit_name
 echo -------------
 echo nameを決めてください。
 set /p name=
 echo nameは %name% に設定されました。
 goto %back%
 :npcedit_role
 echo -------------
 echo roleを決めてください。
 set /p role=
 echo nameは %role% に設定されました。
 goto %back%
 :npcedit_model
 echo -------------
 echo modelfileを決めてください。
 set /p modelfile=
 echo modelfileは %modelfile% に設定されました。
 goto %back%
 :npcedit_smoo
 echo -------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 goto %back%
 :npcedit_call
 echo -------------
 echo docullingを決めてください。
 set /p doculling=
 echo docullingは %doculling% に設定されました。
 goto %back%

 :npcedit_mat_1
 echo -------------
 echo 3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 goto %back%

 :npcedit_mat_2
 echo -------------
 echo 3Dモデルの材質,2つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat2=
 echo 材質,2つめの名前は %mat2% に設定されました。
 echo ------------------
 echo %mat2% のテクスチャへのパスを記述してください。
 set /p mat2texture=
 echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
 goto %back%

 :npcedit_mat_3
 echo -------------
 echo 3Dモデルの材質,3つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat3=
 echo 材質,3つめの名前は %mat3% に設定されました。
 echo ------------------
 echo %mat3% のテクスチャへのパスを記述してください。
 set /p mat3texture=
 echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
 goto %back%

 :npcedit_mat_4
 echo -------------
 echo 3Dモデルの材質,4つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat4=
 echo 材質,4つめの名前は %mat4% に設定されました。
 echo ------------------
 echo %mat4% のテクスチャへのパスを記述してください。
 set /p mat4texture=
 echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
 goto %back%

 :npcedit_mat_5
 echo -------------
 echo 3Dモデルの材質,5つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat5=
 echo 材質,5つめの名前は %mat5% に設定されました。
 echo ------------------
 echo %mat5% のテクスチャへのパスを記述してください。
 set /p mat5texture=
 echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
 goto %back%

 :npcedit_mat_6
 echo -------------
 echo 3Dモデルの材質,6つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat6=
 echo 材質,6つめの名前は %mat6% に設定されました。
 echo ------------------
 echo %mat6% のテクスチャへのパスを記述してください。
 set /p mat6texture=
 echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
 goto %back%

 :npcedit_mat_7
 echo -------------
 echo 3Dモデルの材質,7つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat7=
 echo 材質,7つめの名前は %mat7% に設定されました。
 echo ------------------
 echo %mat7% のテクスチャへのパスを記述してください。
 set /p mat7texture=
 echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
 goto %back%

 :npcedit_mat_8
 echo -------------
 echo 3Dモデルの材質,8つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat28=
 echo 材質,8つめの名前は %mat8% に設定されました。
 echo ------------------
 echo %mat8% のテクスチャへのパスを記述してください。
 set /p mat8texture=
 echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
 goto %back%

 :npcedit_mat_9
 echo -------------
 echo 3Dモデルの材質,9つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat9=
 echo 材質,9つめの名前は %mat9% に設定されました。
 echo ------------------
 echo %mat2% のテクスチャへのパスを記述してください。
 set /p mat2texture=
 echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
 goto %back%
 
 :npcedit_mat_10
 echo -------------
 echo 3Dモデルの材質,10つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat10=
 echo 材質,10つめの名前は %mat10% に設定されました。
 echo ------------------
 echo %mat10% のテクスチャへのパスを記述してください。
 set /p mat10texture=
 echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
 goto %back%

:7
 cls
 set tsw=f
 echo 旗のjsonを作成します。
 echo もし途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo textureを決めてください。
 echo "textures/flag/flag_[texturename].png" のように設定してください。
 set /p texture=
 echo textureは %texture% に設定されました。
 echo ------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 単位は"メートル"です。
 set /p height=
 echo heightは %height% に設定されました。
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
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
 echo     3           jsonを保存します。(beta)  
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
 echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
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

:8
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
  echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
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
  echo ダブルクリック起動の場合はbatchファイルがある場所にjsonファイルが作成されます。
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
  echo    ]
  echo   },
  set soundpath=%soundpath:/=\%
  echo --------------------
  set soundpath=%soundpath:\=.%
  echo { > sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo    ] >> sounds.json
  echo   }, >> sounds.json
  echo --------------------

  :soundsjson_pathset
  set /p soundpath=サウンドのパスを設定してください。(例えば、c:\addon\assets\my_sound\train\chime1.oggを指定する場合は"train\chime1.ogg"と入力してください。),今回の入力で終わりにする場合は"\\\"を使用してください。
  if %soundpath% == \\\ goto end_sounds_json
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(今回追加分)-----
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  echo    ]
  echo   },
  set soundpath=%soundpath:/=\%
  echo --------------------
  set soundpath=%soundpath:\=.%
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo    ] >> sounds.json
  echo   }, >> sounds.json
  echo --------------------
  goto soundsjson_pathset

  :end_sounds_json
  echo これが最後のものとしてセットされました。
  set /p soundpath=サウンドのパスを設定してください。(例えば、c:\addon\assets\my_sound\train\chime1.oggを指定する場合は"train\chime1.ogg"と入力してください。)
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(今回追加分)-----
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  echo    ]
  echo   }
  echo }
  set soundpath=%soundpath:/=\%
  echo --------------------
  set soundpath=%soundpath:\=.%
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo    ] >> sounds.json
  echo   } >> sounds.json
  echo } >> sounds.json
  echo sounds.jsonの記述を終了します。
  echo ファイルパス:"%cd%\sounds.json"
  pause
  goto 2

:9
 echo RTMのディレクトリ構成を作成します。
 echo どこにディレクトリを作成しますか?(記述されたパス下に"RTM"フォルダができます。)
 echo;
 echo 注意: すでに指定されたディレクトリにRTMフォルダがあると多分バグります。
 echo;
 set /p directry=
 pushd c:\
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
:zip
 echo;
 echo この機能はベータ版です。
 echo 動作保証外です。
 echo;
 echo ディレクトリをzip化します。
 echo どのディレクトリをzip化しますか? assetsフォルダのパスを入力してください。(c:\rtm\assetsをzipしたい場合はc:\rtmと入力。)
 echo ヒント: 隠しファイルはzip化されません
 set /p directry=
 md %temp%\.rtm
 Powershell Compress-Archive -Path %directry%\* -DestinationPath %temp%\.rtm\rtm_addon%random%
 explorer.exe %temp%\.rtm
 echo Done.
 pause
 exit
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
 set aa=%random%
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
 goto welcome
rem ERROR CODE
 rem 33N 
  rem 看板のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 13N
  rem 列車のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 53N
  rem 機能あり設置物のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 63N
  rem NPCのjsonを保存した後にそのファイルが見つかりませんでした。
 rem 73N
  rem 旗のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 8N
  rem sounds.jsonを保存した後にそのファイルが見つかりませんでした。
 rem 0-00
  rem 故意的に発生させたエラー。
:ERROR
  echo 申し訳ありません。どこかでエラーが発生しました。
  echo 可能であれば、作者に失敗した際の詳細情報を送信してください。
  echo 今後の改良に情報を使用させていただきます。
  echo (第三者への送信や、情報の公開は一切しません。)
  echo;
  echo --詳細情報--
  ver
  echo cmdext:%cmdextversion%
  echo path:%cd%
  echo TSW:%tsw%
  echo error-code:%error%
  pause