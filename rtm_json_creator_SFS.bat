@echo off
rem (c) 2022 - 2024 akikawa9616
title Rtm_Json_Creator.bat
set version=1.1-SmallFileSize(SFS)
set releaseversion=1
if not exist %temp%\.RJC\rjc.tscf goto firstsetting
pushd %temp%\.RJC\json
set user=
set notlatest=false
set tsw=NONE
set setpath=%cd%
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
if EXIST %temp%\.RJC\osc.tscf goto welcome
for /f "delims=@" %%a in ('curl https://akikawaken.github.io/RJC/VC/version.txt') do ( 
set latestver=%%a
)
if not exist %temp%\rjcupdate.tscf ( goto welcome ) 
if %latestver% == %releaseversion% goto welcome
for /f %%a in ( %temp%\rjcupdate.tscf ) do ( call %%a\RtmJsonCreator.bat )
:welcome
if %releaseversion% == %latestver% ( echo; ) ELSE ( set notlatest=true )
del %temp%\.Rtm_Json_Creator_json.tscf
del %temp%\.ams1.tscf
del %temp%\.ams2.tscf
cls
echo Rtm_Json_Creator�ւ悤����!
echo �s����I�����Ă�������
:selectwelcome
pushd %temp%\.RJC\welcome
echo;
echo   �s���̔ԍ�         �s���̓��e          
echo;
echo       1         ��Ԃ�json���쐬���܂��B
echo       2         �I�������܂��B
echo       3         �Ŕ�json���쐬���܂��B
echo       4         �X�y�V�����T���N�X�ƍ��
echo       5         �@�\����/�Ȃ��ݒu����json���쐬���܂��B
echo       6         NPC��json���쐬���܂��B
echo       7         ����json���쐬���܂��B
echo       8         sounds.json���쐬���܂��B
echo       9         �f�B���N�g�����\�����܂��B
echo      11         pack.json���쐬���܂��B
echo      12         �M���@��json���쐬���܂��B
echo      13         ���[����json���쐬���܂��B
echo      14         �R���e�i��json���쐬���܂��B
echo      15         �Ί��json���쐬���܂��B
echo      16         �R�l�N�^�[��json���쐬���܂��B
echo      17         ���C���[��json���쐬���܂��B
echo      18         ��蕨(������,�q��@,�D��,���t�g)��json���쐬���܂��B
echo setpath       �w�肵���f�B���N�g���Ƀp�X��ʂ��܂��B
if %notlatest% == true ( echo  update        RtmJsonCreator���ŐV�łɃA�b�v�f�[�g���܂��B )
echo;
echo ���݂̃f�B���N�g��: %setpath%
echo;
set /p start=�s���̐�������͂��Ă�������...
set back=selectwelcome
pushd %setpath%
echo;
if %start% == 1 goto 1
if %start% == 2 exit /b
if %start% == 3 goto 3
if %start% == 4 goto 4
if %start% == 5 goto 5
if %start% == 6 goto 6
if %start% == 7 goto 7
if %start% == 8 goto 8
if %start% == 9 goto 9
if %start% == 11 goto pack
if %start% == 12 goto signal
if %start% == 13 goto rail
if %start% == 14 goto contami
if %start% == 15 goto gun
if %start% == 16 goto connector
if %start% == 17 goto wire
if %start% == 18 goto car
if %start% == setpath call :setpath
if %start% == License goto License
if %start% == update goto update
echo �G���[:�s���Ȕԍ��ł��B
goto selectwelcome
:1
 cls
 set tsw=t
 echo ��Ԃ�json���쐬���܂��B
 echo �����JSON�������ۑ�����܂��B json�� %cd%\ModelTrain_%%trainname%%.json �ɂł���͂��ł��B
 echo;
 echo trainName�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p trainname=
 echo trainname�� %trainname% �ɐݒ肳��܂����B
 echo { > ModelTrain_%trainname%.json
 echo    "trainName": "%trainname%", >> ModelTrain_%trainname%.json
 echo;
 echo traintype�����߂Ă��������B �g�p�\:EC,DC,CC,TC
 echo EC=�d��
 echo DC=�C����
 echo CC=�ݎ�
 echo TC=�^���N��
 set /p traintype=
 echo traintype�� %traintype% �ɐݒ肳��܂����B 
 echo    "trainType": "%traintype%", >> ModelTrain_%trainname%.json
 echo;
 echo tags�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)��","
 echo �����w�肷��ꍇ��","�ŋ�؂��ē��͂��Ă��������B(��:tag1,tag2,tag3)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo    "tags":"%tags%", >> ModelTrain_%trainname%.json
 echo;
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelTrain_Temp.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
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
 echo modelFile�����߂Ă��������B
 echo ��Ԃ�3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFile=
 echo modelFile�� %modelFile% �ɐݒ肳��܂����B
 echo "trainModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 echo          "textures":[>> ModelTrain_%trainname%.json
 echo;
 set count=0
 :matcountsetting
 set /p matcount=��ԃ��f���̍ގ�������͂��Ă�������
 echo �ގ����� %matcount% �ɐݒ肳��܂����B
 :matcheck
 if %matcount% == 1 goto matlast
 if %matcount% equ %count% ( goto matlast ) ELSE ( goto matsetting )
 :matsetting
 set /a count=%count%+1
  echo;
   echo ��Ԃ�3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���?
   echo "�I�v�V�����Ȃ�" �̏ꍇ�� 0 ���A "AlphaBlend" �̏ꍇ�� 1 ���A "Light" �� 2 ���A "AlphaBlend,Light" �� 3 �������Ă��������B
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% �� %mattexture% �̃I�v�V������ (�Ȃ�) �ɐݒ肳��܂����B
   if %ERRORLEVEL% == 1 echo;
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""], >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto matcheck
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
   goto matcheck
  :osc-mat-train
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
  goto matcheck
 :matlast
   echo ��Ԃ�3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train-last
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���?
   echo "�I�v�V�����Ȃ�" �̏ꍇ�� 0 ���A "AlphaBlend" �̏ꍇ�� 1 ���A "Light" �� 2 ���A "AlphaBlend,Light" �� 3 �������Ă��������B
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% �� %mattexture% �̃I�v�V������ (�Ȃ�) �ɐݒ肳��܂����B
   if %ERRORLEVEL% == 1 echo;
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo                     ] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo               }, >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto bogi
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto bogi
  :osc-mat-train-last
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto bogi

:bogi
 echo;
 echo �{�M�[���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����A"C:\rtm\assets\minecraft\models\bogie.mqo"�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 set /p modelFile=
 if %modelfile:~-4% == mqoz goto mat_oldb
 if %modelfile:~-3% == obj goto mat_oldb
 if %modelfile:~-4% == ngto goto mat_oldb
 if %modelfile:~-4% == ngtz goto mat_oldb
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo  "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "!filename:~0,-4!", >> ModelTrain_%trainname%.json
 endlocal
 set return=1222
 goto ams
 :mat_oldb
 echo modelFile�����߂Ă��������B
 echo ��Ԃ�3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFile=
 echo modelFile�� %modelFile% �ɐݒ肳��܂����B
 echo "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 echo          "textures":[ >> ModelTrain_%trainname%.json
 echo;
 set count=0
 :matcountsetting
 set /p matcount=��ԃ��f���̍ގ�������͂��Ă�������
 echo �ގ����� %matcount% �ɐݒ肳��܂����B
 :matchecks
 if %matcount% == 1 goto matlasts
 if %matcount% equ %count% ( goto matlasts ) ELSE ( goto matsettings )
 :matsettings
 set /a count=%count%+1
   echo;
   echo �{�M�[��3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���?
   echo "�I�v�V�����Ȃ�" �̏ꍇ�� 0 ���A "AlphaBlend" �̏ꍇ�� 1 ���A "Light" �� 2 ���A "AlphaBlend,Light" �� 3 �������Ă��������B
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% �� %mattexture% �̃I�v�V������ (�Ȃ�) �ɐݒ肳��܂����B
   if %ERRORLEVEL% == 1 echo;
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""], >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto matchecks
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
   goto matchecks
  :osc-mat-bogie
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
 goto matchecks
 :matlasts
   echo ��Ԃ�3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   if EXIST %temp%\.RJC\osc.tscf goto osc-mat-train-last
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���?
   echo "�I�v�V�����Ȃ�" �̏ꍇ�� 0 ���A "AlphaBlend" �̏ꍇ�� 1 ���A "Light" �� 2 ���A "AlphaBlend,Light" �� 3 �������Ă��������B
   CHOICE /c 0123
   if %ERRORLEVEL% == 1 echo %mat% �� %mattexture% �̃I�v�V������ (�Ȃ�) �ɐݒ肳��܂����B
   if %ERRORLEVEL% == 1 echo;
   if %ERRORLEVEL% == 1 echo                      ["%mat%", "%mattexture%", ""] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo                     ] >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 echo               }, >> ModelTrain_%trainname%.json
   if %ERRORLEVEL% == 1 goto 1222
   if %ERRORLEVEL% == 2 set mata=AlphaBlend
   if %ERRORLEVEL% == 3 set mata=Light
   if %ERRORLEVEL% == 4 set mata=AlphaBlend,Light
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 1222
  :osc-mat-bogie-last
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 1222
:1222
  echo buttontexture�����߂Ă��������B
  echo ���q�I����ʂ̃{�^���̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/button_train.png �ȂǂɂȂ�܂��B)
  set /p button=
  echo �{�^���e�N�X�`���ւ̃p�X�� %button% �ɐݒ肳��܂����B
  echo  "buttonTexture": "%button%", >> ModelTrain_%trainname%.json
  echo;
  echo playerpos��1�߂����߂Ă��������B
  echo �q���g:�^�]�Ȃ̈ʒu�͎��ۂɓǂݍ��܂��Ă�������ɂ��񂾂񗝑z�ɋ߂Â���̂���ԗǂ����@�ł��B
  echo ����͉^�]�Ȃ̈ʒu(�{�M�[���E�N���b�N���A�^�]��ԂɂȂ����Ƃ��ɌŒ肳�����W)��ݒ肵�܂��B
  echo ���q�̒��S����̈ʒu�ŁA�P�ʂ�"���[�g��"�ł��B
  echo �܂��� x �ł��B
  set /p playerPosx=
  echo ���� y �ł��B ���݂̍��W: [ x=%playerPosx% , y=���ݒ� , z=���ݒ� ]
  set /p playerPosy=
  echo ���� z �ł��B ���݂̍��W: [ x=%playerPosx% , y=%playerPosy% , z=���ݒ� ]
  set /p playerPosz=
  echo;
  echo playerpos��2�߂����߂Ă��������B
  echo 1�߂̍��W: [ x=%playerPosx% , y=%playerPosy% , z=%playerPosz% ]
  echo 2�߂͑�̂̏ꍇ�Ax��z�����̐����𔽓]?(�Ⴆ��x��1�Ȃ��-1�ɂ���Ȃ�)�����邱�ƂŊ������܂��B ���������ł����삵�܂��B
  echo �܂��� x �ł��B
  set /p playerPos2x=
  echo ���� y �ł��B ���݂̍��W: [ x=%playerPos2x% , y=���ݒ� , z=���ݒ� ]
  set /p playerPos2y=
  echo ���� z �ł��B ���݂̍��W: [ x=%playerPos2x% , y=%playerPos2y% , z=���ݒ� ]
  set /p playerPos2z=
  echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]], >> ModelTrain_%trainname%.json
  echo;
  echo bogiePos��1�߂����߂Ă��������B
  echo �q���g:��Ԃ̈ʒu�͎��ۂɓǂݍ��܂��Ă�������ɂ��񂾂񗝑z�ɋ߂Â���̂���ԗǂ����@�ł��B
  echo ����͑�Ԃ̈ʒu��ݒ肵�܂��B
  echo ���q�̒��S����̈ʒu�ŁA�P�ʂ�"���[�g��"�ł��B
  echo �܂��� x �ł��B
  set /p bogieposx=
  echo ���� y �ł��B ���݂̍��W: [ x=%bogieposx% , y=���ݒ� , z=���ݒ� ]
  set /p bogieposy=
  echo ���� z �ł��B ���݂̍��W: [ x=%bogieposx% , y=%bogieposy% , z=���ݒ� ]
  set /p bogieposz=
  echo;
  echo bogiepos��2�߂����߂Ă��������B �g�p�\:int�l�̂��ׂĂ̐���
  echo 1�߂̍��W: [ x=%bogieposx% , y=%bogieposy% , z=%bogieposz% ]
  echo 2�߂͑�̂̏ꍇ�Ax��z�����̐����𔽓]?(�Ⴆ��x��1�Ȃ��-1�ɂ���Ȃ�)�����邱�ƂŊ������܂��B ���������ł����삵�܂��B
  echo �܂��� x �ł��B
  set /p bogiepos2x=
  echo ���� y �ł��B ���݂̍��W: [ x=%bogiepos2x% , y=���ݒ� , z=���ݒ� ]
  set /p bogiepos2y=
  echo ���� z �ł��B ���݂̍��W: [ x=%bogiepos2x% , y=%bogiepos2y% , z=���ݒ� ]
  set /p bogiepos2z=
  echo  "bogiePos": [[%bogieposx%, %bogieposy%, %bogieposz%], [%bogiepos2x%, %bogiepos2y%, %bogiepos2z%]], >> ModelTrain_%trainname%.json
  echo;
  echo trainDistance�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo ����͎ԗ��̒�����2����1�ɂ���Ƃ����ł��傤�B
  set /p trainDistance=
  echo trainDistance�� %trainDistance% �ɐݒ肳��܂����B
  echo  "trainDistance": %trainDistance%,  >> ModelTrain_%trainname%.json
  echo;
  echo accuracy�����߂Ă��������B �g�p�\:LOW,MEDIUM
  echo �啶���œ��͂��Ă��������B
  set /p accuracy=
  echo accuracy�� %accuracy% �ɐݒ肳��܂����B
  echo;
  echo ���̐�͂��ׂăI�v�V�����ł��B�K�v�Ȃ��ꍇ��json���\�������܂ł̌������Ȃ��璷�������Ă��������B
  echo  %ESC%[41mjson�����������Ƃ��Aenter�������Ă���ƍ쐬����json�����ł��܂��B%ESC%[0m
  pause
  echo;
  echo accelerateion�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo  -- N km/h/s �̏ꍇ N x 0.0006944 �̒l������
  echo ����48��json���\������܂��B
  set /p accelerateion=
  echo accelerateion�� %accelerateion% �ɐݒ肳��܂����B
  if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%, >> ModelTrain_%trainname%.json
  echo;
  echo maxSpeed��1�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo 0.1�ɂ�13km/h(���Ԃ�)
  echo ����47��json���\������܂��B
  set /p maxSpeed1=
  echo maxSpeed��1�߂� %maxSpeed1% �ɐݒ肳��܂����B
  echo;
  echo maxSpeed��2�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo 0.1�ɂ�13km/h(���Ԃ�)
  echo ���݂̐ݒ�: 1:%maxSpeed1%
  echo ����46��json���\������܂��B
  set /p maxSpeed2=
  echo maxSpeed��2�߂� %maxSpeed2% �ɐݒ肳��܂����B
  echo;
  echo maxSpeed��3�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo 0.1�ɂ�13km/h(���Ԃ�)
  echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2%
  echo ����45��json���\������܂��B
  set /p maxSpeed3=
  echo maxSpeed��3�߂� %maxSpeed3% �ɐݒ肳��܂����B
  echo;
  echo maxSpeed��4�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo 0.1�ɂ�13km/h(���Ԃ�)
  echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
  echo ����44��json���\������܂��B
  set /p maxSpeed4=
  echo maxSpeed��4�߂� %maxSpeed4% �ɐݒ肳��܂����B
  echo;
  echo maxSpeed��5�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
  echo 0.1�ɂ�13km/h(���Ԃ�)
  echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
  echo ����43��json���\������܂��B
  set /p maxSpeed5=
  echo maxSpeed��5�߂� %maxSpeed5% �ɐݒ肳��܂����B
  if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%], >> ModelTrain_%trainname%.json
  echo;
  echo sound_Horn�����߂Ă��������B
  echo ����42��json���\������܂��B
  set /p sound_horn=
  echo sound_horn�� %sound_horn% �ɐݒ肳��܂����B
  if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_DoorOpen�����߂Ă��������B
  echo ����41��json���\������܂��B
  set /p sound_DoorOpen=
  echo sound_DoorOpen�� %sound_DoorOpen% �ɐݒ肳��܂����B
  if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_DoorClose�����߂Ă��������B
  echo ����40��json���\������܂��B
  set /p sound_DoorClose=
  echo sound_DoorClose�� %sound_DoorClose% �ɐݒ肳��܂����B
  if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": "%sound_DoorClose%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_Stop�����߂Ă��������B
  echo ����39��json���\������܂��B
  set /p sound_Stop=
  echo sound_Stop�� %sound_Stop% �ɐݒ肳��܂����B
  if not "%sound_Stop%" == "" echo  "sound_Stop": "%sound_Stop%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_S_A�����߂Ă��������B
  echo ����38��json���\������܂��B
  set /p sound_S_A=
  echo sound_S_A�� %sound_S_A% �ɐݒ肳��܂����B
  if not "%sound_S_A%" == "" echo  "sound_S_A": "%sound_S_A%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_Deceleration�����߂Ă��������B
  echo ����37��json���\������܂��B
  set /p sound_Deceleration=
  echo sound_Deceleration�� %sound_Deceleration% �ɐݒ肳��܂����B
  if not "%Deceleration%" == "" echo  "sound_Deceration": "%sound_Deceleration%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_D_S�����߂Ă��������B
  echo ����36��json���\������܂��B
  set /p sound_D_S=
  echo sound_D_S�� %sound_D_S% �ɐݒ肳��܂����B
  if not "%sound_D_S%" == "" echo  "sound_D_S": "%sound_D_S%", >> ModelTrain_%trainname%.json
  echo;
  echo rolling�����߂Ă��������B �g�p�\:0.0~10.0
  echo ����35��json���\������܂��B
  set /p rolling=
  echo rolling�� %rolling% �ɐݒ肳��܂����B
  if not "%rolling%" == "" echo  "rolling": %rolling%, >> ModelTrain_%trainname%.json
  echo;
  echo mutejointsound�����߂Ă��������B �g�p�\:false,true
  set /p mutejointsound=
  echo mutejointsound�� %mutejointsound% �ɐݒ肳��܂����B
  if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%, >> ModelTrain_%trainname%.json
  echo;
  echo rollSpeedCoefficient�����߂Ă��������B
  echo ����34��json���\������܂��B
  set /p rollSpeedCoefficient=
  echo rollSpeedCoefficient�� %rollSpeedCoefficient% �ɐݒ肳��܂����B
  if not "%rollSpeedCoefficient%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%, >> ModelTrain_%trainname%.json
  echo;
  echo rollCoefficient�����߂Ă��������B
  echo ����33��json���\������܂��B
  set /p rollCoefficient=
  echo rollCoefficient�� %rollCoefficient% �ɐݒ肳��܂����B
  if not "%rollCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%, >> ModelTrain_%trainname%.json
  echo;
  echo rollVariationCoefficient�����߂Ă��������B
  echo ����32��json���\������܂��B
  set /p rollVariationCoefficient=
  echo rollVariationCoefficient�� %rollVariationCoefficient% �ɐݒ肳��܂����B
  if not "%rollVariationCoefficient%" == "" echo  "rollVariationCoefficient": %rollVariationCoefficient%, >> ModelTrain_%trainname%.json
  echo;
  echo rollWidthCoefficient�����߂Ă��������B
  echo ����31��json���\������܂��B
  set /p rollWidthCoefficient=
  echo rollWidthCoefficient�� %rollWidthCoefficient% �ɐݒ肳��܂����B
  if not "%rollWidthCoefficient%" == "" echo  "rollWidthCoefficient": %rollWidthCoefficient%, >> ModelTrain_%trainname%.json
  echo;
  echo useCustomColor�����߂Ă��������B
  echo ����30��json���\������܂��B
  set /p useCustomColor=
  echo useCustomColor�� %useCustomColor% �ɐݒ肳��܂����B
  if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%, >> ModelTrain_%trainname%.json
  echo;
  echo defaultData�����߂Ă��������B
  echo ����29��json���\������܂��B
  set /p defaultData=
  echo defaultData�� %defaultData% �ɐݒ肳��܂����B
  if not "%defaultData%" == "" echo  "defaultData": "%defaultData%", >> ModelTrain_%trainname%.json
  echo;
  echo scale�����߂Ă��������B
  echo ngto���f���̏ꍇ�͐ݒ肵�������悢�ł��傤
  echo ����28��json���\������܂��B
  set /p scale=
  echo scale�� %scale% �ɐݒ肳��܂����B
  if not "%scale%" == "" echo  "scale": %scale%, >> ModelTrain_%trainname%.json
  echo;
  echo offset��1�߂����߂Ă��������B
  echo ����27��json���\������܂��B
  set /p offset=
  echo offset��1�߂� %offset% �ɐݒ肳��܂����B
  echo;
  echo offset��2�߂����߂Ă��������B (offset��1�߂� %offset% �ł�)
  echo ����26��json���\������܂��B
  set /p offset2=
  echo offset��2�߂� %offset2% �ɐݒ肳��܂����B
  echo;
  echo offset��3�߂����߂Ă��������B (offset1:%offset% , offset2:%offset2%)
  echo ����25��json���\������܂��B
  set /p offset3=
  echo offset��3�߂� %offset3% �ɐݒ肳��܂����B
  if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%], >> ModelTrain_%trainname%.json
  echo;
  echo smoothing�����߂Ă��������B �g�p�\:false/true
  echo ����24��json���\������܂��B
  set /p smoothing=
  echo smoothing�� %smoothing% �ɐݒ肳��܂����B
  if not "%smoothing%" == "" echo  "smoothing": %smoothing%, >> ModelTrain_%trainname%.json
  echo;
  echo doCulling�����߂Ă��������B �g�p�\:false/true
  echo ����23��json���\������܂��B
  set /p doCulling=
  echo doCulling�� %doCulling% �ɐݒ肳��܂����B
  if not "%doCulling%" == "" echo  "doCulling": %doCulling%, >> ModelTrain_%trainname%.json
  echo;
  echo serverScriptPath�����߂Ă��������B
  echo ����22��json���\������܂��B
  set /p serverScriptPath=
  echo serverScriptPath�� %serverScriptPath% �ɐݒ肳��܂����B
  if not "%serverScriptPath%" == "" echo  "serverScriptPath": "%serverScriptPath%", >> ModelTrain_%trainname%.json
  echo;
  echo guiScriptPath�����߂Ă��������B
  echo ����21��json���\������܂��B
  set /p guiScriptPath=
  echo guiScriptPath�� %guiScriptPath% �ɐݒ肳��܂����B
  if not "%guiScriptPath%" == "" echo  "guiScriptPath": "%guiScriptPath%", >> ModelTrain_%trainname%.json
  echo;
  echo guiTexture�����߂Ă��������B
  echo ����20��json���\������܂��B
  set /p guiTexture=
  echo guiTexture�� %guiTexture% �ɐݒ肳��܂����B
  if not "%guiTexture%" == "" echo  "guitexture": "%guiTexture%", >> ModelTrain_%trainname%.json
  echo;
  echo renderAABB��1�߂����߂Ă��������B
  echo ����19��json���\������܂��B
  set /p renderAABB1=
  echo renderAABB��1�߂� %renderAABB1% �ł��B
  echo;
  echo renderAABB��2�߂����߂Ă��������B
  echo ����18��json���\������܂��B
  set /p renderAABB2=
  echo renderAABB��2�߂� %renderAABB2% �ł��B
  echo;
  echo renderAABB��3�߂����߂Ă��������B
  echo ����17��json���\������܂��B
  set /p renderAABB3=
  echo renderAABB��3�߂� %renderAABB3% �ł��B
  echo;
  echo renderAABB��4�߂����߂Ă��������B
  echo ����16��json���\������܂��B
  set /p renderAABB4=
  echo renderAABB��4�߂� %renderAABB4% �ł��B
  echo;
  echo renderAABB��5�߂����߂Ă��������B
  echo ����15��json���\������܂��B
  set /p renderAABB5=
  echo renderAABB��5�߂� %renderAABB5% �ł��B
  echo;
  echo renderAABB��6�߂����߂Ă��������B
  echo ����14��json���\������܂��B
  set /p renderAABB6=
  echo renderAABB��6�߂� %renderAABB6% �ł��B
  if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ], >> ModelTrain_%trainname%.json
  echo;
  echo size��1�߂����߂Ă��������B
  echo ����13��json���\������܂��B
  set /p size1=
  echo size��1�߂� %size1% �ɐݒ肳��܂����B
  echo;
  echo size��2�߂����߂Ă��������B
  echo ����12��json���\������܂��B
  set /p size2=
  echo size��2�߂� %size2% �ɐݒ肳��܂����B
  if not "%size1%" == "" echo  "size": [%size1% , %size2%], >> ModelTrain_%trainname%.json
  echo;
  echo soundScriptPath�����߂Ă��������B
  echo ����11��json���\������܂��B
  set /p soundScriptPath=
  echo soundScriptPath�� %soundScriptPath% �ɐݒ肳��܂����B
  if not "%soundScriptPath%" == "" echo  "soundScriptPath": "%soundScriptPath%", >> ModelTrain_%trainname%.json
  echo;
  echo smoke�̏o��x���W�����߂Ă��������B
  echo ����10��json���\������܂��B
  set /p smoke1=
  echo smoke�� %smoke1% �ɐݒ肳��܂����B
  echo;
  echo smoke�̏o��y���W�����߂Ă��������B
  echo ����9��json���\������܂��B
  set /p smoke2=
  echo smoke�� %smoke2% �ɐݒ肳��܂����B
  echo;
  echo smoke�̏o��z���W�����߂Ă��������B
  echo ����8��json���\������܂��B
  set /p smoke3=
  echo smoke�� %smoke3% �ɐݒ肳��܂����B
  echo;
  echo smoke�̃p�[�e�B�N�������߂Ă��������B
  echo ����7��json���\������܂��B
  set /p smoke4=
  echo smoke�� %smoke4% �ɐݒ肳��܂����B
  echo;
  echo smoke�����߂Ă��������B
  echo ����6��json���\������܂��B
  set /p smoke5=
  echo smoke�� %smoke5% �ɐݒ肳��܂����B
  echo;
  echo smoke�����߂Ă��������B
  echo ����5��json���\������܂��B
  set /p smoke6=
  echo smoke�� %smoke6% �ɐݒ肳��܂����B
  if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]], >> ModelTrain_%trainname%.json
  echo;
  echo notDisplayCab�����߂Ă��������B
  echo ����4��json���\������܂��B
  set /p notDisplayCab=
  echo notDisplayCab�� %notDisplayCab% �ɐݒ肳��܂����B
  if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%, >> ModelTrain_%trainname%.json
  echo;
  echo wheelRotationSpeed�����߂Ă��������B
  echo ����3��json���\������܂��B
  set /p wheelRotationSpeed=
  echo wheelRotationSpeed�� %wheelRotationSpeed% �ɐݒ肳��܂����B
  if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%, >> ModelTrain_%trainname%.json
  echo;
  echo sound_BrakeRelease�����߂Ă��������B
  echo ����2��json���\������܂��B
  set /p sound_BrakeRelease=
  echo sound_BrakeRelease�� %sound_BrakeRelease% �ɐݒ肳��܂����B
  if not "%sound_BrakeRelease%" == "" echo  "sound_BrakeRelease": "%sound_BrakeRelease%", >> ModelTrain_%trainname%.json
  echo;
  echo sound_BrakeRelease2�����߂Ă��������B
  echo ����1��json���\������܂��B
  set /p sound_BrakeRelease2=
  echo sound_BrakeRelease2�� %sound_BrakeRelease2% �ɐݒ肳��܂����B
  if not "%sound_BrakeRelease2%" == "" echo  "sound_BrakeRelease2": "%sound_BrakeRelease2%", >> ModelTrain_%trainname%.json
  echo;
  echo isSingleTrain�����߂Ă��������B
  echo ����0��json���\������܂��B
  set /p isSingleTrain=
  echo isSingleTrain�� %isSingleTrain% �ɐݒ肳��܂����B
  if not "%isSingleTrain%" == "" echo  "isSingleTrain": %isSingleTrain%, >> ModelTrain_%trainname%.json
  echo;
  echo "accuracy": "%accuracy%" >> ModelTrain_%trainname%.json
  echo } >> ModelTrain_%trainname%.json
  goto train_json
 :train_json
 echo json���쐬���Ă��܂�..
 timeout /t 3 /NOBREAK >nul
 echo �t�@�C���p�X: %setpath%\ModelTrain_%trainname%.json
 echo;
 echo; filename: ModelTrain_%trainname%.json --
 echo;
 set back=train_json
 for /f "delims=" %%a in (ModelTrain_%trainname%.json) do (
  echo %%a
 )
:2
 echo;
 echo ���s����Ɠ��e�������܂��B
 echo ���s���Ă���낵���ł���?
 set user=
 set /p user=(y / n)
 if %user% == y goto 21
 if %user% == n goto %back%
 echo �I���Ȃ�:%back%
 goto %back%
 :21
  goto welcome
:3
 cls
 set tsw=S
 echo �Ŕ�json���쐬���܂��B
 echo �����r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo;
 echo texture�����߂Ă��������B(��ɕۑ����Ă������Ŕ�png�t�@�C�������g���q�Ȃ��œ��͂��Ă��������B)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo;
 echo backTexture�����߂Ă��������B �g�p�\:0,1,2 
 echo  0=���\�������e�N�X�`���ɂȂ�܂��B
 echo  1=�摜�̉E���������̃e�N�X�`���ɂȂ�܂��B
 echo  2=�������ʂ̐F�Ɠ����F�ɂȂ�܂��B
 set /p backTexture=
 echo backTexture�� %backTexture% �ɐݒ肳��܂����B
 echo;
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̍����ɂȂ�܂��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo;
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��̒����ɂȂ�܂��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo;
 echo depth�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.375)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��s�ɂȂ�܂��B
 set /p depth=
 echo depth�� %depth% �ɐݒ肳��܂����B
 echo;
 echo frame�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p frame=
 echo frame�� %frame% �ɐݒ肳��܂����B
 echo;
 echo animationCycle�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p animationCycle=
 echo animationCycle�� %animationCycle% �ɐݒ肳��܂����B
 echo;
 echo color�����߂Ă��������B �g�p�\:6���̐���
 echo  -- 16 �i���J���[�R�[�h�� 10 �i���ɕϊ������l
 echo �킩��Ȃ��Ȃ��0�ɂ��܂��傤�B
 set /p color=
 echo color�� %color% �ɐݒ肳��܂����B
 echo;
 echo lightValue�����߂Ă��������B �g�p�\:-16~15
 echo ����͊Ŕ̔����̓x������ݒ肵�܂��B
 echo;16 �����_���ɓ_�ł���
 echo;15~-1 RS�M���������Ă��鎞�A��������(�����͔����̋���)
 echo 0 �������Ȃ�
 echo 1~15 ��ɔ�������(�����͔����̋���)
 set /p lightValue=
 echo lightValue�� %lightValue% �ɐݒ肳��܂����B
 echo;
 echo json���������܂���!
 goto signjson
:signjson
 set back=signjson
 echo;�t�@�C����:SignBoard_%texture%.json-------
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
 echo;
 echo �s����I�����Ă�������
 echo;
 echo  �s���̔ԍ�         �s���̓��e          
 echo;
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B  
 echo;
 set user=
 set /p user=
 if %user% == 1 goto signedit
 if %user% == 2 goto 2
 if %user% == 3 goto savesignjson
 echo �G���[:�s���Ȕԍ�
 goto signjson

:savesignjson
 echo json��ۑ����܂��B json��%cd%\SignBoard_%texture%.json�ɂł���͂��ł��B
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
  echo �t�@�C���̕ۑ����������܂����B
  echo �t�@�C����:"SignBoard_%texture%.json"
  echo;
 ) ELSE (
  set error=33N
  goto ERROR
 )
 goto %back%

:4
 echo ���:akikawa9616 ^| https://github.com/akikawaken/Rtm_Json_Creator
 echo;
 echo �X�y�V�����T���N�X(�h�̗�)
 echo  json�̃f�[�^�̒�
 echo   -- .zip
 echo   -- �͂������Ƃ����� ^| https://twitter.com/Hachiko_Server
 echo  �f�o�b�O
 echo   -- akikawa9616
 echo   -- ���Ƃ��� ^| https://www.youtube.com/@Yonkatsu12
 echo;
 echo  �ꕔ�@�\���Ď�
 echo   -- K.kirikoto ^| https://twitter.com/mikawa8002
 echo;
 echo  �Q�l����
 echo   -- RTM���f���p�b�N�쐬�}�j���A��_2.4.8_1.pdf ^| �� ngt5479 ^| 2019/06/25
 echo;
 echo ���̃v���O������MIT���C�Z���X�Ō��J����Ă��܂��B
 echo MIT License�S���͍s���I����ʂ�"License"����͂��Ă��������B
 echo;
 echo version: %version% / releaseversion: %releaseversion%
 pause
 cls
 goto selectwelcome
:5
 cls
 set tsw=w
 echo �@�\����/�Ȃ��ݒu���̂ǂ���쐬���܂���?
 echo �������͂��Ȃ��ꍇ�͋����I�����܂��B
 echo �g�p�\(�@�\����):�Ւf�@,�]�Q�@,���D�@,�����@,�Ɩ�R,�Ԏ~��,ATC,��Ԍ��o��,�Ɩ�
 echo �g�p�\(�@�\�Ȃ�):�Ɩ�,�K�i,����,�ː���,�p�C�v,�A��
 echo "�Ɩ�R"��"�Ɩ�"�̈Ⴂ��RS���͂��\���ǂ����ł��B ��{�I�ɂ�"�Ɩ�"��I�����邱�Ƃ������߂��܂��B
 echo;
 echo if u cant type japanese,pls type english machineType:
 echo Gate,Point,Turnstile,Vendor,Light,BumpingPost,Antenna_Send,Antenna_Receive
 echo Lamp,Stair,Scaffold,Pole,Pipe,Plant
 echo (hint: "Antenna_Send"="Automatic Train Control","Antenna_Receive"="Train detector")
 set /p machineType=
 if %machineType% == "�Ւf�@" set machineType=Gate
 if %machineType% == "�]�Q�@" set machineType=Point
 if %machineType% == "���D�@" set machineType=Turnstile
 if %machineType% == "�����@" set machineType=Vendor
 if %machineType% == "�Ɩ�R" set machineType=Light
 if %machineType% == "�Ԏ~��" set machineType=BumpingPost
 if %machineType% == "ATC" set machineType=Antenna_Send
 if %machineType% == "��Ԍ��o��" set machineType=Antenna_Receive
 if %machineType% == "Train detector" set machineType=Antenna_Receive

 if %machineType% == "�Ɩ�" set machineType=Lamp
 if %machineType% == "�K�i" set machineType=Stair
 if %machineType% == "����" set machineType=Scaffold
 if %machineType% == "�ː���" set machineType=Pole
 if %machineType% == "�p�C�v" set machineType=Pipe
 if %machineType% == "�A��" set machineType=Plant
 
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
 echo �@�\����ݒu����json���쐬���܂��B
 echo �����A�r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo;
 echo name�����߂Ă��������B
 echo ����͋@�\����ݒu���̖��O�ɂȂ�܂��B�������Ȃ��悤�Ȗ��O��ݒ肵�Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 echo;
 echo { >> ModelMachine_%name%.json
 echo   "name": "%name%", >> ModelMachine_%name%.json
 echo   "model": { >> ModelMachine_%name%.json
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelMachine_%name%.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
 if %modelfile:~-4% == mqoz goto mat_old5
 if %modelfile:~-3% == obj goto mat_old5
 if %modelfile:~-4% == ngto goto mat_old5
 if %modelfile:~-4% == ngtz goto mat_old5
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> ModelMachine_%name%.json
 endlocal
 set return=switcher
 set filename=ModelMachine_%name%.json
 goto ams
 :mat_old5
 echo modelfile�����߂Ă��������B
 set /p modelFile=
 echo modelfile�� %modelFile% �ɐݒ肳��܂����B
 echo;
 :cantthat
 echo %modelFile% �̍ގ�����ݒ肵�Ă��������B
 set /p matc=
 echo �ގ����� %matc% �ɐݒ肳��܂����B
 echo;
 set count=1
 del %temp%\.Rtm_Json_Creator_json.tscf
 echo     "modelFile": "%modelFile%", >> ModelMachine_%name%.json
 echo     "textures":[ >> ModelMachine_%name%.json
 :madamada
  if %matc% == %count% goto saigo
   echo;
   echo �@�\����ݒu����3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> %temp%\.Rtm_Json_Creator_json.tscf 
 set /a count=%count% + 1
   goto madamada
   :saigo
   echo;
   echo �@�\����ݒu����3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"]]}, >> %temp%\.Rtm_Json_Creator_json.tscf 
 :switcher
 echo buttontexture�����߂Ă��������B
 set /p button=
 echo buttonTexture�� %button% �ɐݒ肳��܂����B
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 if %type% == machineType echo;
 if %type% == machineType echo sound_onactivate�����߂Ă��������B
 if %type% == machineType set /p sound_onactivate=
 if %type% == machineType echo sound_onactivate�� %sound_onactivate% �ɐݒ肳��܂����B
 if %type% == machineType echo   "sound_OnActivate": "%sound_onactivate%", >> ModelMachine_%name%.json
 echo;
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo;
 echo doCulling�����߂Ă��������B
 set /p doCulling=
 echo doCulling�� %doCulling% �ɐݒ肳��܂����B
 echo;
 echo tags�����߂Ă��������B
 echo �����w�肷��ꍇ��","���g�p���Ă��������B(��:akikawa,point,original)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 echo   "smoothing": %smoothing%, >> ModelMachine_%name%.json
 echo   "doCulling": %doCulling%, >> ModelMachine_%name%.json
 echo   "tags": "%tags%", >> ModelMachine_%name%.json
 echo   "%type%": "%machinetype%" >> ModelMachine_%name%.json
 echo } >> ModelMachine_%name%.json
 echo;
 echo ���߂łƂ��������܂�!
 echo �������܂���!
 echo;
 goto switcher_json
:switcher_json
 set back=switcher_json
 echo;Path:%setpath%\ModelMachine_%name%.json-----
 for /f "delims=" %%a in (ModelMachine_%name%.json) do (
  echo %%a
 )
 goto 2
:6
 cls
 set tsw=n
 echo NPC��json���쐬���܂��B
 echo �����A�r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo;
 echo name�����߂Ă��������B
 echo �����NPC�̖��O�ɂȂ�܂��B�������Ȃ��悤�Ȗ��O��ݒ肵�Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 echo { > ModelNPC_%name%.json
 echo   "name": "%name%", >> ModelNPC_%name%.json
 echo   "model": { >> ModelNPC_%name%.json
 echo;
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelNPC_%name%.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
 if %modelfile:~-4% == mqoz goto mat_old6
 if %modelfile:~-3% == obj goto mat_old6
 if %modelfile:~-4% == ngto goto mat_old6
 if %modelfile:~-4% == ngtz goto mat_old6
 setlocal enabledelayedexpansion
 for %%a in ("%modelFile%") do set "filename=%%~nxa"
 echo     "modelFile": "!filename:~0,-4!", >> ModelNPC_%name%
 endlocal
 set return=npc
 set filename=ModelNPC_%name%
 goto ams
 :mat_old6
 echo;
 echo modelfile�����߂Ă��������B
 set /p modelFile=
 echo modelfile�� %modelFile% �ɐݒ肳��܂����B
 echo;
 echo %modelFile% �̍ގ�����ݒ肵�Ă��������B
 set /p matc=
 echo �ގ����� %matc% �ɐݒ肳��܂����B
 echo;
 set count=1
 del %temp%\.Rtm_Json_Creator_json.tscf
 echo     "modelFile": "%modelFile%", >> ModelNPC_%name%
 echo     "textures":[ >> ModelNPC_%name%
 :checkcountnpc
 if %count% == %matc% goto lastnpcmat
    echo;
   echo NPC��3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> %temp%\.Rtm_Json_Creator_json.tscf 
 set /a count=%count% + 1
   goto checkcountnpc
   :lastnpcmat
   echo;
   echo NPC��3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo;
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo;
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo;
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> %temp%\.Rtm_Json_Creator_json.tscf 
:npc
 echo;
 echo role�����߂Ă��������B
 echo attendant,guard,mannequin,passenger�̂ǂꂩ���g�p�ł��܂��B
 set /p role=
 echo role�� %role% �ɐݒ肳��܂����B
 echo;
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo;
 echo doCulling�����߂Ă��������B
 set /p doCulling=
 echo doCulling�� %doCulling% �ɐݒ肳��܂����B
 echo   "role": "%role%", >> ModelNPC_%name%.json
 echo   "doCulling": %doCulling%, >> ModelNPC_%name%.json
 echo   "smoothing": %smoothing% >> ModelNPC_%name%.json
 echo }  >> ModelNPC_%name%.json
 echo;
 echo json���������܂���!
 goto npcjson
:npcjson
 set back=npcjson
 echo;Path:%setpath%\ModelNPC_%name%.json-----
 for /f "delims=" %%a in (ModelNPC_%name%) do (
  echo %%a
 )
 goto 2
:7
 cls
 set tsw=f
 echo ����json���쐬���܂��B
 echo �����r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo;
 echo texture�����߂Ă��������B
 echo textures/flag/flag_[texturename].png �̂悤�ɐݒ肵�Ă��������B
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo;
 echo height�����߂Ă��������B
 echo �P�ʂ�"���[�g��"�ł��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo;
 echo width�����߂Ă��������B
 echo �P�ʂ�"���[�g��"�ł��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo;
 echo resolutionV�����߂Ă��������B
 set /p resolutionV=
 echo resolutionV�� %resolutionV% �ɐݒ肳��܂����B
 echo;
 echo resolutionU�����߂Ă��������B
 set /p resolutionU=
 echo resolutionU�� %resolutionU% �ɐݒ肳��܂����B
 echo;
 echo poleLength�����߂Ă��������B
 echo 2.0����2m�ɂȂ�܂��B(���Ԃ�)
 set /p poleLength=
 echo poleLength�� %poleLength% �ɐݒ肳��܂����B
 echo;
 echo json���������܂���!
 goto flagjson
:flagjson
 set back=flagjson
 echo;�t�@�C����:Flag_%texture:~19,-4%.json-------
 echo {
 echo   "texture": "%texture%",
 echo   "height": %height%,
 echo   "width": %width%,
 echo   "resolutionV": %resolutionV%,
 echo   "resolutionU": %resolutionU%,
 echo   "poleLength" : %poleLength%
 echo }
 echo;
 echo �s����I�����Ă�������
 echo;
 echo  �s���̔ԍ�         �s���̓��e          
 echo;
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3           json��ۑ����܂��B  
 echo;
 set user=
 set /p user=
 if %user% == 1 goto flagedit
 if %user% == 2 goto 2
 if %user% == 3 goto saveflagjson
 echo �G���[:�s���Ȕԍ�
 goto %back%
:saveflagjson
 echo json��ۑ����܂��B json��%cd%\ModelNPC_%texture:~19%.json�ɂł���͂��ł��B
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
  echo �t�@�C���̕ۑ����������܂����B
  echo �t�@�C���p�X:"%cd%\Flag_%texture:~19%.json"
  echo;
 ) ELSE (
  set error=73N
  goto ERROR
 )
 goto %back%

:flagedit
 echo json��ҏW���܂��B
 echo �ҏW���Ȃ��Ƃ���͂��̂܂�enter���Ă��������B
 echo;
 echo texture�����߂Ă��������B ����: %texture%
 echo "textures/flag/flag_[texturename].png" �̂悤�ɐݒ肵�Ă��������B
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo;
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo ����:%height%
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo;
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo ����: %width%
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo;
 echo resolutionV�����߂Ă��������B ����: %resolutionV%
 set /p resolutionV=
 echo resolutionV�� %resolutionV% �ɐݒ肳��܂����B
 echo;
 echo resolutionU�����߂Ă��������B ����: %resolutionU%
 set /p resolutionU=
 echo resolutionU�� %resolutionU% �ɐݒ肳��܂����B
 echo;
 echo poleLength�����߂Ă��������B ����: %poleLength%
 echo 2.0����2m�ɂȂ�܂��B(���Ԃ�)
 set /p poleLength=
 echo poleLength�� %poleLength% �ɐݒ肳��܂����B
 echo;
 goto %back%

:8
 cls
 set tsw=sounds
 echo sounds.json���쐬���܂��B
 echo;
 setlocal enabledelayedexpansion
 echo 2�ȏ�T�E���h��ǉ����܂���?
 echo ���̏ꍇ�A"json�t�@�C���̕ۑ�"���K�{�ł��B
 set /p nextkonanshint=(y / n)
 if %nextkonanshint% == y goto sound_two
 if %nextkonanshint% == n goto sound
 :sound
  echo;
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B)
  setlocal enabledelayedexpansion
   for /f "delims=\ tokens=1" %%s in ("!soundpath!") do set path1=%%s
  set soundpath=%soundpath:\=.%
  set back=sound_json
  :sound_json
  echo;sounds.json-----
  echo {
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  echo    ]
  echo   }
  echo }
  echo;
  echo sounds.json���������܂���!
  echo �ۑ����܂���?
  set /p user=(y / n)
  if %user% == n goto 2
  if %user% == y goto savesounds
  :savesounds
  echo json��ۑ����܂��B json��%cd%\sounds.json�ɂł���͂��ł��B
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
  echo �t�@�C���̕ۑ����������܂����B
  echo �t�@�C���p�X:"%cd%\sounds.json"
  echo;
 ) ELSE (
  set error=8N
  goto ERROR
 )
 set soundpath=%soundpath:/=.%
 goto %back%

 :sound_two
  echo ����:
  echo json�������ۑ����܂��B json��%cd%\sounds.json�ɂł���͂��ł��B
  echo;
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B)
  set soundpath=%soundpath:\=.%
  echo;sounds.json(����ǉ���)-----
  echo { 
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  set soundpath=%soundpath:/=\%
  echo;
  set soundpath=%soundpath:\=.%
  echo { > sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo;

  :soundsjson_pathset
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B),�I������ꍇ��"\\\"���g�p���Ă��������B
  if %soundpath% == \\\ goto end_sounds_json
  set soundpath=%soundpath:\=.%
  echo;sounds.json(����ǉ���)-----
  echo    ]
  echo   },
  echo "%soundpath:~0,-4%": {
  echo  "category": "neutral",
  echo  "sounds": [
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%"
  set soundpath=%soundpath:/=\%
  echo;
  set soundpath=%soundpath:\=.%
  echo    ] >> sounds.json
  echo   }, >> sounds.json
  echo "%soundpath:~0,-4%": { >> sounds.json
  echo  "category": "neutral", >> sounds.json
  echo  "sounds": [ >> sounds.json
  set soundpath=%soundpath:.=/%
  echo   "%soundpath:~0,-4%" >> sounds.json
  echo;
  goto soundsjson_pathset

  :end_sounds_json
  set soundpath=%soundpath:\=.%
  echo;sounds.json(����ǉ���)-----
  echo    ]
  echo   }
  echo }
  echo;
  echo    ] >> sounds.json
  echo   } >> sounds.json
  echo } >> sounds.json
  echo sounds.json�̋L�q���I�����܂��B
  echo �t�@�C���p�X:"%cd%\sounds.json"
  pause
  goto 2

:9
 echo RTM�̃f�B���N�g���\�����쐬���܂��B
 echo �ǂ��Ƀf�B���N�g�����쐬���܂���?(�L�q���ꂽ�p�X����"RTM"�t�H���_���ł��܂��B)
 echo;
 echo ����: ���łɎw�肳�ꂽ�f�B���N�g����RTM�t�H���_������Ƒ����o�O��܂��B
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
 echo �ǂ�? �ł���?
 pause
 cls
 goto welcome
:pack
 echo pack.json���쐬���܂��B
 echo ���݂̃f�B���N�g��: %cd% .
 set /p change=�ύX���܂���?(y/n)
 if %change% == y call :setpath
 echo;
 echo �A�h�I����(���f���p�b�N��)�����߂Ă�������:
 set /p modelpackname=
 echo �A�h�I������%modelpackname%�ɐݒ肳��܂����B
 echo;
 echo �z�[���y�[�W��URL�����߂Ă�������( �K�{�ł͂���܂���. �K�v�Ȃ��ꍇ�͋󔒂̂܂܃G���^�[���Ă��������B )
 set homepageurl=Null
 set /p homepageurl=
 echo �z�[���y�[�W��URL�� %homepageurl% �ɐݒ肳��܂����B
 echo;
 echo "�A�b�v�f�[�g�m�F�p�e�L�X�g�� URL"�����߂Ă��������B
 set /p url=
 echo "�A�b�v�f�[�g�m�F�p�e�L�X�g�� URL"�� %url% �ɐݒ肳��܂����B
 echo;
 echo �o�[�W���������߂Ă�������
 set /p vers=
 echo �o�[�W������ %vers% �ɐݒ肳��܂����B
 echo;
 echo Done!
 echo {
 echo   "name":"%modelpackname%",
 if not %homepageurl% == Null echo   "homepage":"%homepageurl%",
 echo   "updateURL":"%url%",
 echo   "version":"%vers%"
 echo }
 echo;
 echo �t�@�C����ۑ����܂���?
 set /p confirm=y/n:
 if %confirm% == n goto 2
 echo on
 echo { >>pack.json
 echo   "name":"%modelpackname%", >>pack.json
 if not %homepageurl% == Null echo   "homepage":"%homepageurl%", >>pack.json
 echo   "updateURL":"%url%", >>pack.json
 echo   "version":"%vers%" >>pack.json
 echo } >>pack.json
 echo off
 echo;
 pause
 goto 2
:signal
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo �M����json���쐬���܂��B
 echo;
 echo signalName�����߂Ă��������B
 set /p signalname=
 echo signalName�� %signalname% �ɐݒ肳��܂����B
 echo { >>%tempfile%
 echo  "signalName": "%signalname%", >>%tempfile%
 echo;
 echo signalModel�����߂Ă��������B
 set /p signalModel=
 echo signalModel�� %signalModel% �ɐݒ肳��܂����B
 echo  "signalModel": "%signalModel%", >>%tempfile%
 echo;
 echo signalTexture�����߂Ă��������B
 set /p signalTexture=
 echo signalTexture�� %signalTexture% �ɐݒ肳��܂����B
 echo  "signalTexture": "%signalTexture%", >>%tempfile%
 echo;
 echo lightTexture�����߂Ă��������B
 set /p lightTexture=
 echo lightTexture�� %lightTexture% �ɐݒ肳��܂����B
 echo  "lightTexture": "%lightTexture%", >>%tempfile%
 echo;
 echo buttonTexture�����߂Ă��������B
 set /p buttonTexture=
 echo buttonTexture�� %buttonTexture% �ɐݒ肳��܂����B
 echo  "buttonTexture": "%buttonTexture%", >>%tempfile%
 echo  "modelPartsFixture": { >>%tempfile%
 echo;
 echo modelPartsFixture�ɂ�����objects�����߂Ă��������B
 echo ����̓p�[�c(�Œ��)�Ɏg�p����I�u�W�F�N�g�̖��O�ł��B
 echo �����ݒ肷��ꍇ��%ESC%[7m"pole", "pole2", "pole3"%ESC%[0m�̌`���Ŏw�肵�Ă��������B ��������g�p����ꍇ��%ESC%[7m"%ESC%[0m�ň͂��K�v������܂��B
 set /p objects_fixture=
 echo   "objects": [%objects_fixture%], >>%tempfile%
 echo;
 echo modelPartsFixture�ɂ�����pos�����߂Ă��������B
 echo ����͉�]�̒��S�ʒu�̐ݒ�ł��B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos_fixture=
 echo   "pos": [%pos_fixture%] >>%tempfile%
 echo  }, >>%tempfile%
 echo  "modelPartsBody": { >>%tempfile%
 echo;
 echo modelPartsBody�ɂ�����objects�����߂Ă��������B
 echo ����̓p�[�c(�{��)�Ɏg�p����I�u�W�F�N�g�̖��O�ł��B
 echo �����ݒ肷��ꍇ��%ESC%[7m"doby", "light1", "light2", "light3"%ESC%[0m�̌`���Ŏw�肵�Ă��������B ��������g�p����ꍇ��%ESC%[7m"%ESC%[0m�ň͂��K�v������܂��B
 set /p objects_body=
 echo   "objects": [%objects_body%], >>%tempfile%
 echo;
 echo modelPartsBody�ɂ�����pos�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos_body=
 echo   "pos": [%pos_body%] >>%tempfile%
 echo  }, >>%tempfile%
 echo  "lights": [ >>%tempfile%
 echo;
 set firstlight=1
 :lightsetting
 echo ���C�g�̐ݒ�����߂Ă��������B
 echo �ݒ���I�����ꍇ�͂��̂܂�enter���Ă��������B
 echo;
 echo ^|����^|                        ����                        ^|
 echo ^|  S ^|�ǂ̐M�������͂��ꂽ���_�����邩(�M�����x����1~1024)^|
 echo ^|  I ^|�_�ŊԊu(0~1200 tick)                               ^|
 echo ^|  P ^|�g�p����I�u�W�F�N�g��(�u,�v�ŋ�؂�)               ^|
 echo;
 echo;
 echo �ȉ��̌`���œ��͂��Ă��������B: S([S���ڂ̐��l]) I([I���ڂ̐��l]) P(P���ڂ̕�����)
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
 echo rotateBody�����߂Ă��������B
 set /p rotateBody=(true/false) :
 echo  "rotateBody": %rotateBody% >>%tempfile%
 echo } >> %tempfile%
 goto signal_json
 :signal_json
 echo json���������܂���!
 echo;
 echo; filename: ModelSignal_%signalname%.json --
 echo;
 set back=signal_json_json
 for /f "delims=@" %%a in (%tempfile%) do (
  echo %%a
 )
 echo;
 echo �s����I�����Ă�������
 echo;
 echo  �s���̔ԍ�         �s���̓��e          
 echo;
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B  
 echo;
 set /p user=
 if %user% == 2 goto 2
 if %user% == 3 goto savesignaljson
 echo �G���[:�s���Ȕԍ�
 goto signal_json
 :savesignaljson
  echo F | xcopy %tempfile% %setpath%\ModelSignal_%signalname%.json /S /V /C /F /-Y
 goto signal_json
:rail
 echo ���[����json���쐬���܂��B
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo ���[����2��ނ̋L�q���@������܂��B �ǂ�����g�p���܂���?
 echo 1: ��{�̐ݒ���@ 2: �ȈՓI�Ȑݒ���@(�ގ�������:1)
 echo �����̌��"pre"��t���邱�ƂŃv���r���[���\�ł��B
 set railjson=Null
 set /p railjson=
 if %railjson% == 1 goto railjson1
 if %railjson% == 2 goto railjson2
 if %railjson% == 1pre goto railjson1pre
 if %railjson% == 2pre goto railjson2pre
 goto welcome
:railjson1
  echo;
  echo ���[���������߂Ă��������B
  set /p railname=
  echo railName: %railname%
  echo { >>%tempfile%
  echo  "railName": "%railname%", >>%tempfile%
  echo  "model": { >>%tempfile%
  echo;
  echo ���[�����f���t�@�C���̃p�X����͂��Ă��������B
  echo ����͕ϐ����g�p�����A"C:\rtm\assets\minecraft\models\bogie.mqo"�̌`���œ��͂��Ă��������B
  echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
  set /p modelFile=
  if %modelfile:~-4% == mqoz goto mat_oldsignal
  if %modelfile:~-3% == obj goto mat_oldsignal
  if %modelfile:~-4% == ngto goto mat_oldsignal
  if %modelfile:~-4% == ngtz goto mat_oldsignal
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
  echo ���[���̍ގ��������߂Ă��������B
  set /p mat=
  echo �ގ����� %mat% �ł��B
  echo   "textures": [ >>%tempfile%
  :matfirst
   echo �ގ��̖��O����͂��Ă��������B
   set /p matname=
   echo �ގ����� %matname% �ł��B
   echo;
   echo �ގ��̃e�N�X�`���p�X����͂��Ă��������B
   echo ����: %ESC%[41m\%ESC%[0m(�o�b�N�X���b�V��)�ł͂Ȃ�%ESC%[41m/%ESC%[0m(�X���b�V��)���g�p���Ă��������B
   set /p texturepath=
   echo �e�N�X�`���p�X�� %texturepath% �ł��B
   set matcount=1
  :matcounter
  if %mat% == %matcount% goto railbutton
   set /a matcount= %matcount% + 1
   echo %matcount% �߂̍ގ�������͂��Ă��������B
   set /p matname1=
   echo �ގ����� %matname1% �ł��B
   echo;
   echo %matname1% �̃e�N�X�`���p�X����͂��Ă��������B
   set /p texturep=
   echo �e�N�X�`���p�X�� %texturep% �ł��B
   echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
   goto matcounter
  :railbutton
  echo   ["%matname%", "%texturepath%", ""]], >>%tempfile%
  echo rendererPath��ݒ肷��ꍇ�͈ȉ��ɓ��͂��Ă��������B
  echo �w�肵�Ȃ��ꍇ��scripts/RenderRailStandard.js�ɂ��Ă��������B
  set rendererPath=Null
  set /p rendererPath=
  if %rendererPath% == Null echo   "rendererPath": "scripts/RenderRailStandard.js" >>%tempfile%
  if not %rendererPath% == Null echo   "rendererPath": "%rendererPath%" >>%tempfile%
  echo  }, >>%tempfile%
  :gouryu
  echo;
  echo �{�^���e�N�X�`���̃p�X��ݒ肵�Ă��������B
  set /p button=
  echo  "buttonTexture": "%button%", >>%tempfile%
  echo;
  echo ballastWidth�����߂Ă��������B
  echo 1�ȏ�̊�������̒l����͂��Ă��������B ����͓����u���b�N�̕��ł��B
  set /p ballast=
  echo  "ballastWidth": %ballast%, >>%tempfile%
  echo;
  echo allowCrossing�����߂Ă��������B
  echo �����Mob���ʂ蔲������悤�ɂ��邩�̐ݒ�ł��B
  set /p crossing=(true/false): 
  echo  "allowCrossing": %crossing%, >>%tempfile%
  echo;
  echo �����u���b�N�����߂Ă��������B
  echo e. g. gravel
  set /p blockname=
  echo  "defaultBallast": [{ >>%tempfile%
  echo   "blockName": "%blockname%", >>%tempfile%
  echo;
  echo %blockname% �̃��^�f�[�^��ݒ肵�Ă��������B
  echo �ʏ��0����͂��Ă��������B
  set /p meta=
  echo   "blockMetadata": %meta%, >>%tempfile%
  echo;
  echo �����̍��������߂Ă��������B
  echo 1��1m�ɂȂ�܂��B
  set /p height=
  echo   "height": %height% >>%tempfile%
  echo  }], >>%tempfile%
  echo  "polygonType": 3 >>%tempfile%
  echo } >>%tempfile%
:rail_json
  set back=rail_json
  echo json���������܂���!
  echo; filename: ModelRail_%railname%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo;
  echo �s����I�����Ă�������
  echo;
  echo  �s���̔ԍ�         �s���̓��e          
  echo;
  echo     2              �I�������܂��B       
  echo     3         json��ۑ����܂��B  
  echo;
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto saverailjson
  echo �G���[:�s���Ȕԍ�
  goto rail_json
  :saverailjson
  echo F | xcopy %tempfile% %setpath%\ModelRail_%railname%.json /V /C /F /-Y
  goto rail_json
:railjson2
  echo;
  echo ���[���������߂Ă��������B
  set /p railname=
  echo railName: %railname%
  echo { >>%tempfile%
  echo  "railName": "%railname%", >>%tempfile%
  echo;
  echo ���[���̃��f�������߂Ă��������B(�t�@�C����)
  set /p modelfile=
  echo  "railModel": "%modelfile%", >>%tempfile%
  echo modelFile: %modelfile%
  echo;
  echo ���[���̃e�N�X�`���p�X�����߂Ă��������B
  set /p railTexture=
  echo  "railTexture": "%railTexture%", >>%tempfile%
  echo;
  goto gouryu
:contami
 echo �R���e�i��json���쐬���܂��B
 echo;
 echo �R���e�i�̖��O�����߂Ă��������B
 set /p name=
 echo �R���e�i��: %name%
 echo;
 echo ���f�����w�肵�Ă��������B
 set /p model=
 echo ���f����: %model%
 echo;
 echo �e�N�X�`���p�X���w�肵�Ă��������B
 set /p texture=
 echo �e�N�X�`���p�X: %texture%
 echo;
 echo �{�^���e�N�X�`���̃p�X��ݒ肵�Ă��������B
 set /p buttontexture=
 echo �{�^���e�N�X�`���p�X: %buttontexture%
 echo;
 echo �R���e�i�̕������߂Ă��������B
 echo ����̓��f���ɓK�p�����킯�ł͂Ȃ��A�����蔻��̌v�Z�p�Ƃ��Ĉ����܂��B
 set /p width=
 echo ��: %width%
 echo;
 echo �R���e�i�̍��������߂Ă��������B
 echo ����̓��f���ɓK�p�����킯�ł͂Ȃ��A�����蔻��̌v�Z�p�Ƃ��Ĉ����܂��B
 set /p height=
 echo ����: %height%
 echo;
 echo �R���e�i�̒��������߂Ă��������B
 echo ����̓��f���ɓK�p�����킯�ł͂Ȃ��A�ݎԂɍڂ������̈ʒu�����p�Ƃ��Ĉ����܂��B
 set /p length=
 echo ����: %length%
 echo;
 :container_json
 set back=container_json
 echo; filename: ModelContainer_%name%.json --
 echo {
 echo  "containerName": "%name%",
 echo  "containerModel": "%model%",
 echo  "containerTexture": "%texture%",
 echo  "containerWidth": %width%,
 echo  "containerHeight": %height%,
 echo  "containerLength": %length%,
 echo  "buttonTexture": "%buttontexture%"
 echo }
 echo;
 echo �s����I�����Ă�������
 echo;
 echo  �s���̔ԍ�         �s���̓��e          
 echo;
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B  
 echo;
 set /p user=
 if %user% == 2 goto 2
 if %user% == 3 goto savecontami
 echo �G���[:�s���Ȕԍ�
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
 echo �t�@�C���̕ۑ����������܂����B
 echo �t�@�C���p�X:"%setpath%\ModelContainer_%name%.json"
 echo;
 goto %back%
:gun
 echo �Ί��json���쐬���܂��B
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo { >>%tempfile%
 echo �Ί�̖��O�����߂Ă��������B
 set /p name=
 echo ���O: %name%
 echo  "firearmName": "%name%", >>%tempfile%
 echo;
 echo ���f���t�@�C��������͂��Ă��������B
 set /p model=
 echo ���f��: %model%
 echo  "firearmModel": "%model%", >>%tempfile%
 echo;
 echo �e�N�X�`���p�X����͂��Ă�������
 set /p texture=
 echo �e�N�X�`��: %texture%
 echo  "firearmTexture": "%texture%", >>%tempfile%
 echo;
 echo �{�^���e�N�X�`���̃p�X����͂��Ă��������B
 set /p button=
 echo �{�^��: %button%
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo;
 echo �p�[�c(��]�Ȃ�)�̃I�u�W�F�N�g�������߂Ă��������B
 echo �����̃I�u�W�F�N�g�����w�肷��ꍇ��%ESC%[7mobject1", "object2%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p object=
 echo;
 echo �I�u�W�F�N�g��pos�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos=
 echo  "modelPartsN": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo �p�[�c(Y����])�̃I�u�W�F�N�g�������߂Ă��������B
 echo �����̃I�u�W�F�N�g�����w�肷��ꍇ��%ESC%[7mobject1", "object2%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p object=
 echo;
 echo �I�u�W�F�N�g��pos�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos=
 echo  "modelPartsY": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo �p�[�c(X����])�̃I�u�W�F�N�g�������߂Ă��������B
 echo �����̃I�u�W�F�N�g�����w�肷��ꍇ��%ESC%[7mobject1", "object2%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p object=
 echo;
 echo �I�u�W�F�N�g��pos�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos=
 echo  "modelPartsX": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo �p�[�c(�o����)�̃I�u�W�F�N�g�������߂Ă��������B
 echo �����̃I�u�W�F�N�g�����w�肷��ꍇ��%ESC%[7mobject1", "object2%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p object=
 echo;
 echo �I�u�W�F�N�g��pos�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pos=
 echo  "modelPartsBarrel": {"objects": ["%object%"],"pos": [%pos%]}, >>%tempfile%
 echo;
 echo �C���̈ʒu�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p muzzle=
 echo �C��: %muzzle%
 echo  "muzzlePos": [%muzzle%], >>%tempfile%
 echo;
 echo �C��̈ʒu�����߂Ă��������B
 echo %ESC%[7m0.0, 0.0, 0.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p player=
 echo �C��: %player%
 echo  "playerPos": [%player%], >>%tempfile%
 echo;
 echo ����p�x�̍ő�,�ŏ��l�����߂Ă��������B
 echo %ESC%[7m180.0, -180.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p yaw=
 echo ����p�x: %yaw%
 echo  "yaw": [%yaw%], >>%tempfile%
 echo;
 echo ��p�̍ő�,�ŏ��l�����߂Ă��������B
 echo %ESC%[7m180.0, -180.0%ESC%[0m�̌`���Ŏw�肵�Ă��������B
 set /p pitch=
 echo ��p: %pitch%
 echo  "pitch": [%pitch%], >>%tempfile%
 echo;
 echo Y����]�̑��x�����߂Ă��������B
 set /p speedy=
 echo ���x: %speedy%
 echo  "rotationSpeedY": %speedy%, >>%tempfile%
 echo;
 echo X����]�̑��x�����߂Ă��������B
 set /p speedtwitter=
 echo ���x: %speedtwitter%
 echo  "rotationSpeedX": %speedtwitter%, >>%tempfile%
 echo;
 echo ���R�C���̑傫�������߂Ă��������B
 set /p recoil=
 echo ���R�C��: %recoil%
 echo  "recoil": %recoil%, >>%tempfile%
 echo;
 echo ��l�̂̎��Ƀ��f����`�悵�Ȃ����ǂ��������߂Ă��������B
 set /p fpv=(true/false): 
 echo  "fpvMode": %fpv% >>%tempfile%
 echo } >>%tempfile%
 :gun_json
  set back=gun_json
  echo json���������܂���!
  echo; filename: ModelFirearm_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo;
  echo �s����I�����Ă�������
  echo;
  echo  �s���̔ԍ�         �s���̓��e          
  echo;
  echo     2              �I�������܂��B       
  echo     3         json��ۑ����܂��B  
  echo;
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savegunjson
  echo �G���[:�s���Ȕԍ�
  goto rail_json
  :savegunjson
  echo F | xcopy %tempfile% %setpath%\ModelFirearm_%name%.json /V /C /F /-Y
  goto %back%
 
:connector
 echo �R�l�N�^�[��json���쐬���܂��B
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo;
 echo �R�l�N�^�[�������߂Ă��������B
 set /p name=
 echo Name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%", >>%tempfile%
 echo  "model": { >>%tempfile%
 echo;
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelTrain_Temp.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
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
 echo �R�l�N�^�[�̃��f�������߂Ă��������B(�t�@�C����)
 set /p modelfile=
 echo   "modelFile": "%modelfile%", >>%tempfile%
 echo modelFile: %modelfile%
 echo;
 echo �R�l�N�^�[�̍ގ��������߂Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ł��B
 echo   "textures": [ >>%tempfile%
 echo �ގ��̖��O����͂��Ă��������B
 set /p matname=
 echo �ގ����� %matname% �ł��B
 echo;
 echo �ގ��̃e�N�X�`���p�X����͂��Ă��������B
 echo ����: %ESC%[41m\%ESC%[0m(�o�b�N�X���b�V��)�ł͂Ȃ�%ESC%[41m/%ESC%[0m(�X���b�V��)���g�p���Ă��������B
 set /p texturepath=
 echo �e�N�X�`���p�X�� %texturepath% �ł��B
 set matcount=1
 :cocounter
  if %mat% == %matcount% goto cobutton
 set /a matcount= %matcount% + 1
 echo %matcount% �߂̍ގ�������͂��Ă��������B
 set /p matname1=
 echo �ގ����� %matname1% �ł��B
 echo;
 echo %matname1% �̃e�N�X�`���p�X����͂��Ă��������B
 set /p texturep=
 echo �e�N�X�`���p�X�� %texturep% �ł��B
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto cocounter
 :cobutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 :csgo
 echo;
 echo �{�^���e�N�X�`���̃p�X��ݒ肵�Ă��������B
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo �{�^��: %button%
 echo;
 echo connectorType�����߂Ă��������B
 echo Relay,Input,Output�̒�����I��ł��������B
 echo �^�C�v�͈ȉ��̒ʂ�ł�: Relay:"���p�R�l�N�^",Input:"���̓R�l�N�^",Output:"�o�̓R�l�N�^"
 set /p type=(Relay/Input/Output): 
 echo  "connectorType":"%type%", >>%tempfile%
 echo �R�l�N�^: %connector%
 echo;
 echo wirePos�����߂Ă��������B
 echo ����̓��C���ڑ����̐ڑ��ʒu�ł��B(�u���b�N���S��%ESC%[41m0.0,0.0,0.0%ESC%[0m�ɂȂ�܂��B)
 echo %ESC%[41m0.0, 0.0, 0.0%ESC%[0m�̌`���œ��͂��Ă��������B ���ꂼ��x,y,z�̏��ł��B
 set /p pos=
 echo pos: %pos%
 echo  "wirePos": [%pos%], >>%tempfile%
 echo;
 echo smoothing�����߂Ă��������B
 set /p smooz=(true/false): 
 echo smoothing: %smooz%
 echo  "smoothing": %smooz%, >>%tempfile%
 echo;
 echo doCulling�����߂Ă��������B
 set /p doCulling=(true/false): 
 echo doCulling: %doCulling%
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo;
 echo accuracy�����߂Ă��������B
 set /p accuracy=(LOW,MEDIUM): 
 echo accuracy: %accuracy%
 echo  "accuracy": %accuracy%, >>%tempfile%
 echo;
 echo tags�����߂Ă��������B
 set /p tag=
 echo tag: %tag%
 echo  "tags": "%tag%" >>%tempfile%
 echo } >>%tempfile%
 :co_json
  set back=co_json
  echo json���������܂���!
  echo; filename: ModelConnector_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo;
  echo �s����I�����Ă�������
  echo;
  echo  �s���̔ԍ�         �s���̓��e          
  echo;
  echo     2              �I�������܂��B       
  echo     3         json��ۑ����܂��B  
  echo;
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savecojson
  echo �G���[:�s���Ȕԍ�
  goto %back%
  :savecojson
  echo F | xcopy %tempfile% %setpath%\ModelConnector_%name%.json /V /C /F /-Y
  goto %back%
:wire
 echo;
 echo ���C���[��json���쐬���܂��B
 echo;
 set back=wire_json
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo name�����߂Ă��������B
 set /p name=
 echo name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%" >>%tempfile%
 echo;
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelTrain_Temp.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
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
 echo ���C���[�̃��f�������߂Ă��������B(�t�@�C����)
 set /p modelfile=
 echo  "model": { >>%tempfile%
 echo   "modelFile": "%modelfile%" >>%tempfile%
 echo model: %modelfile%
 echo;
 echo %modelfile%�̍ގ�����ݒ肵�Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ł��B
 echo;
 echo   "textures": [ >>%tempfile%
 echo 1 �߂̍ގ�������͂��Ă��������B
 set /p matname=
 echo �ގ����� %matname% �ł��B
 echo;
 echo �ގ��̃e�N�X�`���p�X����͂��Ă��������B
 echo ����: %ESC%[41m\%ESC%[0m(�o�b�N�X���b�V��)�ł͂Ȃ�%ESC%[41m/%ESC%[0m(�X���b�V��)���g�p���Ă��������B
 set /p texturepath=
 echo �e�N�X�`���p�X�� %texturepath% �ł��B
 set matcount=1
 :wicounter
  if %mat% == %matcount% goto wibutton
 set /a matcount= %matcount% + 1
 echo %matcount% �߂̍ގ�������͂��Ă��������B
 set /p matname1=
 echo �ގ����� %matname1% �ł��B
 echo;
 echo %matname1% �̃e�N�X�`���p�X����͂��Ă��������B
 set /p texturep=
 echo �e�N�X�`���p�X�� %texturep% �ł��B
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto wicounter
 :wibutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 echo;
 :wifi
 echo �{�^���e�N�X�`���̃p�X��ݒ肵�Ă��������B
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo �{�^��: %button%
 echo;
 echo deflectionCoefficient�����߂Ă��������B
 echo ����̓J�e�i���[�Ȑ��̌W���Ɋւ���ݒ�ł��B
 set /p deflection=
 echo deflectionCoefficient: %deflection%
 echo  "deflectionCoefficient": %deflection%, >>%tempfile%
 echo;
 echo lengthCoefficient�����߂Ă��������B
 echo ����̓J�e�i���[�Ȑ��̌W���Ɋւ���ݒ�ł��B
 set /p length=
 echo lengthCoefficient: %length%
 echo  "lengthCoefficient": %length%, >>%tempfile%
 echo;
 echo sectionLength�����߂Ă��������B
 echo ����͋Ȑ���1�����̒����Ɋւ���ݒ�ł��B
 set /p section=
 echo sectionLength: %section%
 echo  "sectionLength": %section%, >>%tempfile%
 echo;
 echo useCustomColor�����߂Ă��������B
 set useCustomColor=true
 set /p useCustomColor=
 echo useCustomColor�� %useCustomColor% �ɐݒ肳��܂����B
 echo  "useCustomColor": %useCustomColor%, >>%tempfile%
 echo;
 echo doCulling�����߂Ă��������B
 set doCulling=true
 set /p doCulling=
 echo doCulling��%doCulling%�ɐݒ肳��܂����B
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo;
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing��%smoothing%�ɐݒ肳��܂����B
 echo  "smoothing": %smoothing%, >>%tempfile%
 echo } >%tempfile%
 echo;
 :wire_json
 echo json���������܂���!
  echo; filename: ModelWire_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo;
  echo �s����I�����Ă�������
  echo;
  echo  �s���̔ԍ�         �s���̓��e          
  echo;
  echo     2              �I�������܂��B       
  echo     3         json��ۑ����܂��B  
  echo;
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 goto savewijson
  echo �G���[:�s���Ȕԍ�
  goto %back%
  :savewijson
  echo F | xcopy %tempfile% %setpath%\ModelWire_%name%.json /V /C /F /-Y
  goto %back%
 

:car
 echo;
 echo ��蕨��json���쐬���܂��B
 echo;
 set back=car_json
 set tempfile=%temp%\.Rtm_Json_Creator_json.tscf
 echo name�����߂Ă��������B
 set /p name=
 echo name: %name%
 echo { >>%tempfile%
 echo  "name": "%name%", >>%tempfile%
 echo  "model": { >>%tempfile%
 echo;
 echo ���f���t�@�C���̃p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����AC:\rtm\assets\minecraft\models\ModelTrain_Temp.mqo�̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� / (�X���b�V��)�ł͂Ȃ� \ (�o�b�N�X���b�V��)���g�p���Ă��������B%ESC%[0m
 echo �����ǂݍ��݋@�\�������ȏꍇ��mqoz�܂���obj,ngto,ngtz�Ɠ��͂��Ă��������B
 set /p modelFile=
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
 echo ��蕨�̃��f�������߂Ă��������B(�t�@�C����)
 set /p modelfile=
 echo   "modelFile": "%modelfile%", >>%tempfile%
 echo model: %modelfile%
 echo;
 echo %modelfile%�̍ގ�����ݒ肵�Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ł��B
 echo;
 echo   "textures": [ >>%tempfile%
 echo 1 �߂̍ގ�������͂��Ă��������B
 set /p matname=
 echo �ގ����� %matname% �ł��B
 echo;
 echo �ގ��̃e�N�X�`���p�X����͂��Ă��������B
 echo ����: %ESC%[41m\%ESC%[0m(�o�b�N�X���b�V��)�ł͂Ȃ�%ESC%[41m/%ESC%[0m(�X���b�V��)���g�p���Ă��������B
 set /p texturepath=
 echo �e�N�X�`���p�X�� %texturepath% �ł��B
 set matcount=1
 :cacounter
  if %mat% == %matcount% goto cabutton
 set /a matcount= %matcount% + 1
 echo %matcount% �߂̍ގ�������͂��Ă��������B
 set /p matname1=
 echo �ގ����� %matname1% �ł��B
 echo;
 echo %matname1% �̃e�N�X�`���p�X����͂��Ă��������B
 set /p texturep=
 echo �e�N�X�`���p�X�� %texturep% �ł��B
 echo   ["%matname1%", "%texturep%", ""], >>%tempfile%
 goto cacounter
 :cabutton
 echo   ["%matname%", "%texturepath%", ""]]}, >>%tempfile%
 echo;
 :cartype
 echo ��蕨�̃^�C�v��ݒ肵�Ă��������B
 echo �g�p�\: Car,Ship,Plane,Lift
 echo ���ꂼ�ꎩ����,�D��,�q��@,���t�g�ł��B
 set /p Type=
 echo  "vehicleType": "%Type%", >>%tempfile%
 echo �^�C�v: %Type%
 if %Type% == Lift goto Lift
 echo;
 echo ����₷��,�n�ʂ�ݒ肵�Ă��������B
 echo �f�t�H���g�� 0.9 �ł��B
 set friction1=null
 set /p friction1=
 echo;
 echo ����₷��,�󒆂�ݒ肵�Ă��������B
 echo �f�t�H���g�� 0.9 �ł��B
 set /p friction2=
 echo;
 echo  "friction": [%friction1%, %friction2%], >>%tempfile%
 echo �����x,�n�ʂ�ݒ肵�Ă��������B
 set /p acceleration1=
 echo;
 echo �����x,�󒆂�ݒ肵�Ă��������B
 set /p acceleration2=
 echo  "acceleration": [%acceleration1%, %acceleration2%], >>%tempfile%
 echo;
 echo �ő呬�x,�n�ʂ�ݒ肵�Ă��������B
 set /p maxSpeed1=
 echo;
 echo �ő呬�x,�󒆂�ݒ肵�Ă��������B
 set /p maxSpeed2=
 echo  "maxSpeed": [%maxSpeed1%, %maxSpeed2%], >>%tempfile%
 echo;
 echo �ő�Yaw,�n�ʂ�ݒ肵�Ă��������B
 set /p yaw1=
 echo;
 echo �ő�Yaw,�󒆂�ݒ肵�Ă��������B
 set /p yaw2=
 echo  "maxYaw": [%yaw1%, %yaw2%], >>%tempfile%
 echo;
 echo Yaw�W��,�n�ʂ�ݒ肵�Ă��������B
 set /p yaw1k=
 echo;
 echo Yaw�W��,�󒆂�ݒ肵�Ă��������B
 set /p yaw2k=
 echo  "yawCoefficient": [%yaw1k%, %yaw2k%], >>%tempfile%
 echo;
 echo pitch�W��,�n�ʂ�ݒ肵�Ă��������B
 set /p pitch1=
 echo;
 echo pitch�W��,�󒆂�ݒ肵�Ă��������B
 set /p pitch2=
 echo  "pitchCoefficient": [%pitch1%, %pitch2%], >>%tempfile%
 echo;
 echo roll�W��,�n�ʂ�ݒ肵�Ă��������B
 set /p roll1k=
 echo;
 echo roll�W��,�󒆂�ݒ肵�Ă��������B
 set /p roll2k=
 echo  "rollCoefficient": [%roll1k%, %roll2k%], >>%tempfile%
 echo;
 echo ��Ԓ��ɐ���ł��邩�ǂ�����ݒ肵�Ă��������B
 set /p stop=(true/false) : 
 echo  "changeYawOnStopping": %stop% >>%tempfile%
 echo } >>%tempfile%
 goto car_json

 :Lift
 echo;
 echo �{�^���e�N�X�`���̃p�X��ݒ肵�Ă��������B
 set /p button=
 echo  "buttonTexture": "%button%", >>%tempfile%
 echo �{�^��: %button%
 echo;
 echo size��1�߂����߂Ă��������B
 set /p size1=
 echo size��1�߂� %size1% �ɐݒ肳��܂����B
 echo;
 echo size��2�߂����߂Ă��������B
 set /p size2=
 echo size��2�߂� %size2% �ɐݒ肳��܂����B
 echo  "size": [%size1% , %size2%], >>%tempfile%
 echo;
 echo playerPos�����߂Ă��������B
 echo 0.0, 0.48, 0.0 �̌`���œ��͂��Ă��������B
 set /p playerPos=
 echo  "playerPos": [[%playerPos%]], >>%tempfile%
 echo;
 echo vibration�����߂Ă��������B
 echo 0.0, 0.0 �̌`���œ��͂��Ă��������B
 set /p vibration=
 echo  "vibration":[%vibration%], >>%tempfile%
 echo;
 echo gripPos�����߂Ă��������B
 echo ����̓��t�g�ƃ��C���[�̐ړ_��x,y,z�̃��[�g���P�ʂŎw�肵�Ă��������B
 echo 0.0, 3.5, 0.0 �̌`���œ��͂��Ă��������B
 echo �q���g: RTM�Ƀv���C���X�g�[������Ă��郊�t�g�� 0.0, 3.5, 0.0 �ł��B
 set /p gripPos=
 echo  "gripPos": [%gripPos%], >>%tempfile%
 echo;
 echo useCustomColor�����߂Ă��������B
 set /p useCustomColor=(true/false): 
 echo  "useCustomColor": %useCustomColor% >>%tempfile%
 echo;
 echo smoothing�����߂Ă��������B
 set /p smooz=(true/false) : 
 echo  "smoothing": %smooz%, >>%tempfile%
 echo;
 echo doCulling�����߂Ă��������B
 set /p doCulling=(true/false) : 
 echo  "doCulling": %doCulling%, >>%tempfile%
 echo  "changeYawOnStopping": false, >>%tempfile%
 echo;
 echo accuracy�����߂Ă��������B
 set /p accuracy=(LOW/MIDIUM): 
 echo  "accuracy": "%accuracy%", >>%tempfile%
 echo;
 echo collisionParts�����߂Ă��������B
 echo "seat1" �̌`���œ��͂��Ă��������B �����w��̏ꍇ�� "seat1", "seat2", "seat3" �̌`���œ��͂��Ă��������B
 set /p collisionParts=
 echo  "collisionParts": [%collisionParts%], >>%tempfile%
 echo;
 echo tags�����߂Ă��������B
 echo �����w�肷��ꍇ��,�ŋ�؂��ē��͂��Ă��������B
 set /p tags=
 echo  "tags": "%tags%" >>%tempfile%
 echo } >>%tempfile%
 echo;
 :car_json
  echo json���������܂���!
  echo; filename: ModelVehicle_%name%.json --
  echo;
  for /f "delims=@" %%a in (%tempfile%) do (
   echo %%a
  )
  echo;
  echo �s����I�����Ă�������
  echo;
  echo  �s���̔ԍ�         �s���̓��e          
  echo;
  echo     2              �I�������܂��B       
  echo     3         json��ۑ����܂��B  
  echo;
  set /p user=
  if %user% == 2 goto 2
  if %user% == 3 echo F | xcopy %tempfile% %setpath%\ModelVehicle_%name%.json /V /C /F /-Y
  goto car_json
 
:setpath
 set /p setpath=Enter path here :
 pushd %setpath%
 echo Done.
 exit /b
:firstsetting
 echo �����ݒ���s���Ă��܂�...
 pushd %temp%
 md .RJC\json
 pushd %temp%\.RJC
 echo If you need regenerate action number file, Please delete this file.>>rjc.tscf
 set ERRORLEVEL=0
 where choice
 if %ERRORLEVEL% == 1 echo CHOICE COMMAND NOT FOUND. Create file: %temp%\.RJC\OSC.tscf
 if %ERRORLEVEL% == 1 echo OSC=TRUE>>%temp%\.RJC>>OSC.tscf
 set ERRORLEVEL=0
 where curl
 if %ERRORLEVEL% == 1 echo CURL COMMAND NOT FOUND. Create file: %temp%\.RJC\OSC.tscf
 if %ERRORLEVEL% == 1 echo OSC=TRUE>>%temp%\.RJC>>OSC.tscf
 echo;
 echo Please restart RtmJsonCreator.
 pause
 exit /b

:cantload_Noise
 echo [ERROR] TrialNoise�`�����N�����o����܂����B
 echo [ERROR] %modelFile%�ɑ΂���ǂݍ��݂͋����I�ɒ�~����܂����B
 echo ���s����ƏI�����܂��B
 pause
 exit /b
:cantload_notfound
 echo [ERROR] %modelfile%��������܂���ł����B
 echo ���s����ƏI�����܂��B
 pause
 exit /b
:PathError
 echo;
 echo;
 echo �p�X������̍\�����Ԉ���Ă���\��������܂�!
 echo;
 echo ���f���t�@�C���̍ގ���: !matname! �� !texture! �̌`���ł͂Ȃ��A�e�N�X�`���̃t�@�C�����݂̂��ގ��e�N�X�`���ɐݒ肷��悤�ɂ��Ă��������B
 echo �ꉞ�A���̂܂܂ł�RTM�͓��삵�܂����ARtmJsonCreator�͑Ή����Ă��Ȃ����߁A���̐��Json���쐬���邱�Ƃ͂ł��܂���B
 echo �܂��A���̃e�N�X�`���p�X�ɂ�%USERPROFILE%�z���ւ̃p�X���܂܂�Ă���\��������A�A�h�I����z�z���鎞�͖{���o���ɒ��ӂ��Ă��������B
 echo;
 pause
 exit /b
:License
 echo;
 echo;
 echo Copyright (c) 2022-2024 akikawa9616
 echo;
 echo Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the �gSoftware�h), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 echo;
 echo The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 echo;
 echo THE SOFTWARE IS PROVIDED �gAS IS�h, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 echo;
 pause
 goto selectwelcome
:update
 echo �{���ɃA�b�v�f�[�g�����s���܂���?
 echo ���܂ō쐬����Json(%temp%\.RJC\�z���ɒu����Ă������)�͍폜����܂��B
 echo;
 echo ����: �A�b�v�f�[�g����ƁASFS�o�[�W��������ʏ�łɂȂ�܂��B
 echo;
 set confirm=n
 set /p confirm=Y/N:
 if not %confirm% == y goto welcome
 pushd %temp%
 echo %temp%\.RJC\�z�����폜��...
 rd /S /Q %temp%\.RJC\
 echo %temp%\.RJC\�z�����폜���܂����B
 set nextpath=%random%
 echo nextpath��%nextpath%�ł��B
 if exist %temp%\.RJC\update\%nextpath%\RtmJsonCreator.bat set nextpath=%random%
 echo %temp%\rjcupdate.tscf���쐬... [%temp%\.RJC\update\%nextpath%]
 echo %temp%\.RJC\update\%nextpath%>%temp%\rjcupdate.tscf
 echo %temp%\.RJC\update\%nextpath%\���쐬...
 md %temp%\.RJC\update\%nextpath%\
 pushd %temp%\.RJC\update\%nextpath%\
 curl -sLJO https://github.com/akikawaken/Rtm_Json_Creator/releases/download/update/RtmJsonCreator.bat
 echo �A�b�v�f�[�g���������܂����B
 echo RtmJsonCreator���ċN�����Ă��������B
 pushd %userprofile%
 pause
 exit /b
:ams
 if '^%modelFile:~-1%^%modelFile:~0,1%' == '^"^"' ( set modelFile=%modelFile:~1,-1% ) 
 echo modelFilePath�� %modelFile% �ɐݒ肳��܂����B
 echo          "textures":[ >> %filename%
 echo;
 echo ���̃��f���̃e�N�X�`���t�H���_�p�X����͂��Ă��������B
 echo ����͕ϐ����g�p�����A textures/train �̌`���œ��͂��Ă��������B
 echo %ESC%[7m�K�� \ (�o�b�N�X���b�V��)�ł͂Ȃ� / (�X���b�V��)���g�p���Ă��������B%ESC%[0m
 set /p texturedir=
 echo dir: %texturedir%
 echo;
 if not exist "%modelfile%" goto cantload_notfound
 del %temp%\.ams1.tscf
 del %temp%\.ams2.tscf
 for /f "delims=" %%a in ('findstr /B /R /N /C:TrialNoise* "%modelFile%"') do ( goto cantload_Noise )
 for /f "delims=" %%a in ('findstr /B /R /N /C:Material* "%modelFile%"') do set mat=%%a
 for /f "delims=:" %%a in ('echo %mat%') do set lnnum=%%a
 echo �ގ��ݒ�̍s: %lnnum%
 for /f "delims=" %%a in ('findstr /B /R /C:Material* "%modelFile%"') do set mat=%%a
 set mat=%mat:~9%
 set mat=%mat:~0,-2%
 echo �ގ������擾: %mat%
 setlocal enabledelayedexpansion
 set /a "count=0"
 for /f "delims=" %%a in ("%modelFile%") do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )
 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1:~1!
 echo �ގ������擾: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo �e�N�X�`�������擾: !texture!
 set hoge=!texture:~1,2!
 if !hoge! == :\ goto PathError
 echo name: !matname! , texturedir: !texturedir! , texturename: !texture!
 echo       [!matname!, "%texturedir%/!texture!", ""]]}, >>%temp%\.ams2.tscf
 endlocal
 set matcount=1
 :matroop
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
 for /f "delims=" %%a in ("%modelFile%") do (
     set /a "count+=1"
     if !count!==%lnnum% (
         set "line=%%a"
     )
 )

 for /f "tokens=1* delims= " %%a in ("!line!") do (
    set "mat1=%%a"
 )
 set matname=!mat1:~1!
 echo �ގ������擾: !matname!
 for /f "delims=" %%a in ("!line!") do (
    set "texture=%%a"
    set "texture=!texture:*tex(=!"
    set "texture=!texture:)=!"
 )
 set texture=!texture:~1,-1!
 echo �e�N�X�`�������擾: !texture!
 set hoge=!texture:~1,2!
 if !hoge! == :\ goto PathError
 echo name: !matname! , texturedir: !texturedir! , texturename: !texture!
 echo       [!matname!, "%texturedir%/!texture!", ""], >>%temp%\.ams1.tscf
 endlocal
 goto matroop