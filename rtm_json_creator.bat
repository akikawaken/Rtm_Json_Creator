@echo off
rem (c) 2022 - 2023 akikawa9616
title Rtm_Json_Creator.bat
set user=
set version=0.9.4(public)
set tsw=NONE
set time2=%time: =0%
set nowtime=%time2:~0,2%%time2:~3,2%%time2:~6,2%
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:welcome
echo rtm json createor�ւ悤����!
echo �s����I�����Ă�������
:selectwelcome
echo ----------------------------------------
echo  �s���̔ԍ�         �s���̓��e          
echo ----------------------------------------
echo     1        ��Ԃ�json���쐬���܂��B     
echo     2              �I�������܂��B       
echo     3        �Ŕ�json���쐬���܂��B 
echo     4        �X�y�V�����T���N�X�ƍ��  
echo     5   �@�\����ݒu����json���쐬���܂��B 
echo     6         NPC��json���쐬���܂��B 
echo     7          ����json���쐬���܂��B
echo     8        sounds.json���쐬���܂��B
echo     9      �f�B���N�g�����\�����܂��B
echo    10  �w�肳�ꂽ�f�B���N�g����zip�����܂��B
echo ----------------------------------------
set /p start=�s���̐�������͂��Ă�������...
set back=selectwelcome
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
if %start% == 749 goto json 
if %start% == 827 goto signjson
if %start% == 999 goto soundcreate
if %start% == error goto werror
if %start% == setpath goto setpath
echo �G���[:�s���Ȕԍ��ł��B
goto selectwelcome
:1
 cls
 set tsw=t
 echo ��Ԃ�json���쐬���܂��B
 echo �����JSON�������ۑ�����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
 echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\ModelTrain_%%trainname%%.json�ɂł���͂��ł��B)
 echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
 echo -----------------
 rem TrainName setting start
 echo trainName�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p trainname=
 echo trainname�� %trainname% �ɐݒ肳��܂����B
 echo { > ModelTrain_%trainname%.json
 echo    "trainName": "%trainname%", >> ModelTrain_%trainname%.json
 rem TrainName setting end
 echo -----------------
 rem Traintype setting start
 echo traintype�����߂Ă��������B �g�p�\:EC,DC,CC,TC
 echo EC=�d��
 echo DC=�C����
 echo CC=�ݎ�
 echo TC=�^���N��
 set /p traintype=
 echo traintype�� %traintype% �ɐݒ肳��܂����B 
 echo    "trainType": "%traintype%", >> ModelTrain_%trainname%.json
 rem Traintype setting end
 echo ------------------
 rem tags setting start
 echo tags�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)��","
 echo �����w�肷��ꍇ��","�ŋ�؂��ē��͂��Ă��������B(��:tag1,tag2,tag3)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo    "tags":"%tags%", >> ModelTrain_%trainname%.json
 rem tags setting end
 echo ------------------
 rem trainmodel setting start
 echo modelFile�����߂Ă��������B
 echo ��Ԃ�3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFile=
 echo modelFile�� %modelFile% �ɐݒ肳��܂����B
 echo "trainModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 echo          "textures":[>> ModelTrain_%trainname%.json
 echo ------------------
 set count=1
:matcountsetting
 set /p matcount=��ԃ��f���̍ގ�������͂��Ă�������
 echo �ގ����� %matcount% �ɐݒ肳��܂����B
:matcheck
 if %matcount% equ %count% ( goto matlast ) ELSE ( goto matsetting )
:matsetting
 set /a count=%count%+1
   echo ------------------
   echo ��Ԃ�3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"], >> ModelTrain_%trainname%.json
 goto matcheck
:matlast
   echo ��Ԃ�3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat=
   echo �ގ�,%count%�߂̖��O�� %mat% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mattexture=
   echo %mat% �̃e�N�X�`���p�X�� %mattexture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat% �� %mattexture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mata=
   echo %mat% �� %mattexture% �̃I�v�V������ %mata% �ɐݒ肳��܂����B
   echo ------------------
   echo                      ["%mat%", "%mattexture%", "%mata%"] >> ModelTrain_%trainname%.json
   echo                     ] >> ModelTrain_%trainname%.json
   echo               }, >> ModelTrain_%trainname%.json
   goto 12
:12
 rem bogiemodel setting start
 echo modelfile�����߂Ă��������B
 echo �{�M�[��3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFileb=
 echo modelFile�� %modelFileb% �ɐݒ肳��܂����B
 echo "bogieModel2":{ >> ModelTrain_%trainname%.json
 echo     "modelFile": "%modelfileb%", >> ModelTrain_%trainname%.json
 echo     "textures": [>> ModelTrain_%trainname%.json
 echo ------------------
 set count=1
:bogiematcountsetting
 set /p matcount=�{�M�[���f���̍ގ�������͂��Ă��������B
 echo �ގ����� %matcount% �ɐݒ肵�Ă��������B
:bogiematcheck
 if %matcount% equ %count% ( goto bogiematlast ) ELSE ( goto bogiematsetting )
:bogiematsetting
 set /a count=%count%+1
 echo ------------------
 echo �{�M�[��3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p bogie1=
 echo �ގ�,%count%�߂̖��O�� %bogie1% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p bogie1texture=
 echo %bogie1% �̃e�N�X�`���p�X�� %bogie1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo                   ["%bogie1%", "%bogie1texture%",""], >> ModelTrain_%trainname%.json
 goto bogiematcheck
 :bogiematlast
 echo ------------------
 echo �{�M�[��3D���f���̍ގ�,%count%�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p bogie1=
 echo �ގ�,%count%�߂̖��O�� %bogie1% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p bogie1texture=
 echo %bogie1% �̃e�N�X�`���p�X�� %bogie1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo                   ["%bogie1%", "%bogie1texture%",""] >> ModelTrain_%trainname%.json
 echo                 ] >> ModelTrain_%trainname%.json
 echo               }, >> ModelTrain_%trainname%.json
 goto 1222
 

:1222
 rem buttontexture setting start
 echo buttontexture�����߂Ă��������B
 echo ���q�I����ʂ̃{�^���̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/button_train.png �ȂǂɂȂ�܂��B)
 set /p button=
 echo �{�^���e�N�X�`���ւ̃p�X�� %button% �ɐݒ肳��܂����B
 echo  "buttonTexture": "%button%", >> ModelTrain_%trainname%.json
 rem buttontexture setting end
 echo ------------------
 rem playerpos setting start
 echo playerpos��1�߂����߂Ă��������B �g�p�\:int�l�̂��ׂĂ̐���
 echo �q���g:�^�]�Ȃ̈ʒu�͎��ۂɓǂݍ��܂��Ă�������ɂ��񂾂񗝑z�ɋ߂Â���̂���ԗǂ����@�ł��B
 echo ����͉^�]�Ȃ̈ʒu(�{�M�[���E�N���b�N���A�^�]��ԂɂȂ����Ƃ��ɌŒ肳�����W)��ݒ肵�܂��B
 echo ���q�̒��S����̈ʒu�ŁA�P�ʂ�"���[�g��"�ł��B
 echo �܂��� x �ł��B
 set /p playerPosx=
 echo ���� y �ł��B ���݂̍��W: [ x=%playerPosx% , y=���ݒ� , z=���ݒ� ]
 set /p playerPosy=
 echo ���� z �ł��B ���݂̍��W: [ x=%playerPosx% , y=%playerPosy% , z=���ݒ� ]
 set /p playerPosz=
 echo ------------------
 echo playerpos��2�߂����߂Ă��������B �g�p�\:int�l�̂��ׂĂ̐���
 echo 1�߂̍��W: [ x=%playerPosx% , y=%playerPosy% , z=%playerPosz% ]
 echo 2�߂͑�̂̏ꍇ�Ax��z�����̐����𔽓]?(�Ⴆ��x��1�Ȃ��-1�ɂ���Ȃ�)�����邱�ƂŊ������܂��B ���������ł����삵�܂��B
 echo �܂��� x �ł��B
 set /p playerPos2x=
 echo ���� y �ł��B ���݂̍��W: [ x=%playerPos2x% , y=���ݒ� , z=���ݒ� ]
 set /p playerPos2y=
 echo ���� z �ł��B ���݂̍��W: [ x=%playerPos2x% , y=%playerPos2y% , z=���ݒ� ]
 set /p playerPos2z=
 echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]], >> ModelTrain_%trainname%.json
 rem playerpos setting end
 echo ------------------
 rem bogiepos setting start
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
 echo ------------------
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
 rem bogiepos setting end
 echo ------------------
 rem traindistance setting start
 echo trainDistance�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo ����͎ԗ��̒�����2����1�ɂ���Ƃ����ł��傤�B
 set /p trainDistance=
 echo trainDistance�� %trainDistance% �ɐݒ肳��܂����B
 echo  "trainDistance": %trainDistance%,  >> ModelTrain_%trainname%.json
 rem traindistance setting end
 echo ------------------
 rem accuracy setting start
 echo accuracy�����߂Ă��������B �g�p�\:LOW,MEDIUM
 echo �啶���œ��͂��Ă��������B
 set /p accuracy=
 echo accuracy�� %accuracy% �ɐݒ肳��܂����B
 rem accuracy setting end
 echo ------------------
 rem option
 echo ���̐�͂��ׂăI�v�V�����ł��B�K�v�Ȃ��ꍇ��json���\�������܂ł̌������Ȃ��璷�������Ă��������B
 echo  %ESC%[41mjson�����������Ƃ��Aenter�������Ă���ƍ쐬����json�����ł��܂��B%ESC%[0m
 rem %ESC%[41m is set text color to red, %ESC%[0m is set text color to white(default)
 pause
 rem option
 echo ------------------
 echo accelerateion�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo  -- N km/h/s �̏ꍇ N x 0.0006944 �̒l������
 echo ����48��json���\������܂��B
 set /p accelerateion=
 echo accelerateion�� %accelerateion% �ɐݒ肳��܂����B
 if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo maxSpeed��1�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ����47��json���\������܂��B
 set /p maxSpeed1=
 echo maxSpeed��1�߂� %maxSpeed1% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��2�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1%
 echo ����46��json���\������܂��B
 set /p maxSpeed2=
 echo maxSpeed��2�߂� %maxSpeed2% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��3�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2%
 echo ����45��json���\������܂��B
 set /p maxSpeed3=
 echo maxSpeed��3�߂� %maxSpeed3% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��4�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
 echo ����44��json���\������܂��B
 set /p maxSpeed4=
 echo maxSpeed��4�߂� %maxSpeed4% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��5�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
 echo ����43��json���\������܂��B
 set /p maxSpeed5=
 echo maxSpeed��5�߂� %maxSpeed5% �ɐݒ肳��܂����B
 if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%], >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_Horn�����߂Ă��������B
 echo ����42��json���\������܂��B
 set /p sound_horn=
 echo sound_horn�� %sound_horn% �ɐݒ肳��܂����B
 if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%", >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_DoorOpen�����߂Ă��������B
 echo ����41��json���\������܂��B
 set /p sound_DoorOpen=
 echo sound_DoorOpen�� %sound_DoorOpen% �ɐݒ肳��܂����B
 if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%", >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_DoorClose�����߂Ă��������B
 echo ����40��json���\������܂��B
 set /p sound_DoorClose=
 echo sound_DoorClose�� %sound_DoorClose% �ɐݒ肳��܂����B
 if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": %sound_DoorClose%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_Stop�����߂Ă��������B
 echo ����39��json���\������܂��B
 set /p sound_Stop=
 echo sound_Stop�� %sound_Stop% �ɐݒ肳��܂����B
 if not "%sound_Stop%" == "" echo  "sound_Stop": %sound_Stop%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_S_A�����߂Ă��������B
 echo ����38��json���\������܂��B
 set /p sound_S_A=
 echo sound_S_A�� %sound_S_A% �ɐݒ肳��܂����B
 if not "%sound_S_A%" == "" echo  "sound_S_A": %sound_S_A%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_Deceleration�����߂Ă��������B
 echo ����37��json���\������܂��B
 set /p sound_Deceleration=
 echo sound_Deceleration�� %sound_Deceleration% �ɐݒ肳��܂����B
 if not "%Deceleration%" == "" echo  "sound_Deceration": %sound_Deceleration%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo sound_D_S�����߂Ă��������B
 echo ����36��json���\������܂��B
 set /p sound_D_S=
 echo sound_D_S�� %sound_D_S% �ɐݒ肳��܂����B
 if not "%sound_D_S%" == "" echo  "sound_D_S": %sound_D_S%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo rolling�����߂Ă��������B �g�p�\:0.0~10.0
 echo ����35��json���\������܂��B
 set /p rolling=
 echo rolling�� %rolling% �ɐݒ肳��܂����B
 if not "%rolling%" == "" echo  "rolling": %rolling%, >> ModelTrain_%trainname%.json
 echo ------------------
 echo mutejointsound�����߂Ă��������B �g�p�\:false,true
 set /p mutejointsound=
 echo mutejointsound�� %mutejointsound% �ɐݒ肳��܂����B
 if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo rollSpeedCoefficient�����߂Ă��������B
 echo ����34��json���\������܂��B
 set /p rollSpeedCoefficient=
 echo rollSpeedCoefficient�� %rollSpeedCoefficient% �ɐݒ肳��܂����B
 if not "%rollSpeedCoefficient%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo rollCoefficient�����߂Ă��������B
 echo ����33��json���\������܂��B
 set /p rollCoefficient=
 echo rollCoefficient�� %rollCoefficient% �ɐݒ肳��܂����B
 if not "%rollCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo rollVariationCoefficient�����߂Ă��������B
 echo ����32��json���\������܂��B
 set /p rollVariationCoefficient=
 echo rollVariationCoefficient�� %rollVariationCoefficient% �ɐݒ肳��܂����B
 if not "%rollVariationCoefficient%" == "" echo  "rollVariationCoefficient": %rollVariationCoefficient%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo rollWidthCoefficient�����߂Ă��������B
 echo ����31��json���\������܂��B
 set /p rollWidthCoefficient=
 echo rollWidthCoefficient�� %rollWidthCoefficient% �ɐݒ肳��܂����B
 if not "%rollWidthCoefficient%" == "" echo  "rollWidthCoefficient": %rollWidthCoefficient%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo useCustomColor�����߂Ă��������B
 echo ����30��json���\������܂��B
 set /p useCustomColor=
 echo useCustomColor�� %useCustomColor% �ɐݒ肳��܂����B
 if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo defaultData�����߂Ă��������B
 echo ����29��json���\������܂��B
 set /p defaultData=
 echo defaultData�� %defaultData% �ɐݒ肳��܂����B
 if not "%defaultData%" == "" echo  "defaultData": %defaultData%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo scale�����߂Ă��������B
 echo ngto���f���̏ꍇ�͐ݒ肵�������悢�ł��傤
 echo ����28��json���\������܂��B
 set /p scale=
 echo scale�� %scale% �ɐݒ肳��܂����B
 if not "%scale%" == "" echo  "scale": %scale%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo offset��1�߂����߂Ă��������B
 echo ����27��json���\������܂��B
 set /p offset=
 echo offset��1�߂� %offset% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��2�߂����߂Ă��������B (offset��1�߂� %offset% �ł�)
 echo ����26��json���\������܂��B
 set /p offset2=
 echo offset��2�߂� %offset2% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��3�߂����߂Ă��������B (offset1:%offset% , offset2:%offset2%)
 echo ����25��json���\������܂��B
 set /p offset3=
 echo offset��3�߂� %offset3% �ɐݒ肳��܂����B
 if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%], >> ModelTrain_%trainname%.json
 echo -------------------
 echo smoothing�����߂Ă��������B �g�p�\:false/true
 echo ����24��json���\������܂��B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 if not "%smoothing%" == "" echo  "smoothing": %smoothing%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo doCulling�����߂Ă��������B �g�p�\:false/true
 echo ����23��json���\������܂��B
 set /p doCulling=
 echo doCulling�� %doCulling% �ɐݒ肳��܂����B
 if not "%doCulling%" == "" echo  "doCulling": %doCulling%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo serverScriptPath�����߂Ă��������B
 echo ����22��json���\������܂��B
 set /p serverScriptPath=
 echo serverScriptPath�� %serverScriptPath% �ɐݒ肳��܂����B
 if not "%serverScriptPath%" == "" echo  "serverScriptPath": %serverScriptPath%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo guiScriptPath�����߂Ă��������B
 echo ����21��json���\������܂��B
 set /p guiScriptPath=
 echo guiScriptPath�� %guiScriptPath% �ɐݒ肳��܂����B
 if not "%guiScriptPath%" == "" echo  "guiScriptPath": %guiScriptPath%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo guiTexture�����߂Ă��������B
 echo ����20��json���\������܂��B
 set /p guiTexture=
 echo guiTexture�� %guiTexture% �ɐݒ肳��܂����B
 if not "%guiTexture%" == "" echo  "guitexture": %guiTexture%, >> ModelTrain_%trainname%.json
 echo -------------------
 echo renderAABB��1�߂����߂Ă��������B
 echo ����19��json���\������܂��B
 set /p renderAABB1=
 echo renderAABB��1�߂� %renderAABB1% �ł��B
  echo -------------------
 echo renderAABB��2�߂����߂Ă��������B
 echo ����18��json���\������܂��B
 set /p renderAABB2=
 echo renderAABB��2�߂� %renderAABB2% �ł��B
  echo -------------------
 echo renderAABB��3�߂����߂Ă��������B
 echo ����17��json���\������܂��B
 set /p renderAABB3=
 echo renderAABB��3�߂� %renderAABB3% �ł��B
  echo -------------------
 echo renderAABB��4�߂����߂Ă��������B
 echo ����16��json���\������܂��B
 set /p renderAABB4=
 echo renderAABB��4�߂� %renderAABB4% �ł��B
  echo -------------------
 echo renderAABB��5�߂����߂Ă��������B
 echo ����15��json���\������܂��B
 set /p renderAABB5=
 echo renderAABB��5�߂� %renderAABB5% �ł��B
  echo -------------------
 echo renderAABB��6�߂����߂Ă��������B
 echo ����14��json���\������܂��B
 set /p renderAABB6=
 echo renderAABB��6�߂� %renderAABB6% �ł��B
 if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ], >> ModelTrain_%trainname%.json
 echo --------------------
 echo size��1�߂����߂Ă��������B
 echo ����13��json���\������܂��B
 set /p size1=
 echo size��1�߂� %size1% �ɐݒ肳��܂����B
 echo --------------------
 echo size��2�߂����߂Ă��������B
 echo ����12��json���\������܂��B
 set /p size2=
 echo size��2�߂� %size2% �ɐݒ肳��܂����B
 if not "%size1%" == "" echo  "size": [%size1% , %size2%], >> ModelTrain_%trainname%.json
 echo --------------------
 echo soundScriptPath�����߂Ă��������B
 echo ����11��json���\������܂��B
 set /p soundScriptPath=
 echo soundScriptPath�� %soundScriptPath% �ɐݒ肳��܂����B
 if not "%soundScriptPath%" == "" echo  "soundScriptPath": %soundScriptPath%, >> ModelTrain_%trainname%.json
 echo --------------------
 echo smoke�̏o��x���W�����߂Ă��������B
 echo ����10��json���\������܂��B
 set /p smoke1=
 echo smoke�� %smoke1% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��y���W�����߂Ă��������B
 echo ����9��json���\������܂��B
 set /p smoke2=
 echo smoke�� %smoke2% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��z���W�����߂Ă��������B
 echo ����8��json���\������܂��B
 set /p smoke3=
 echo smoke�� %smoke3% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̃p�[�e�B�N�������߂Ă��������B
 echo ����7��json���\������܂��B
 set /p smoke4=
 echo smoke�� %smoke4% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 echo ����6��json���\������܂��B
 set /p smoke5=
 echo smoke�� %smoke5% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 echo ����5��json���\������܂��B
 set /p smoke6=
 echo smoke�� %smoke6% �ɐݒ肳��܂����B
 if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]], >> ModelTrain_%trainname%.json
 echo --------------------
 echo notDisplayCab�����߂Ă��������B
 echo ����4��json���\������܂��B
 set /p notDisplayCab=
 echo notDisplayCab�� %notDisplayCab% �ɐݒ肳��܂����B
 if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%, >> ModelTrain_%trainname%.json
 echo --------------------
 echo wheelRotationSpeed�����߂Ă��������B
 echo ����3��json���\������܂��B
 set /p wheelRotationSpeed=
 echo wheelRotationSpeed�� %wheelRotationSpeed% �ɐݒ肳��܂����B
 if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%, >> ModelTrain_%trainname%.json
 echo --------------------
 echo sound_BrakeRelease�����߂Ă��������B
 echo ����2��json���\������܂��B
 set /p sound_BrakeRelease=
 echo sound_BrakeRelease�� %sound_BrakeRelease% �ɐݒ肳��܂����B
 if not "%sound_BrakeRelease%" == "" echo  "sound_BrakeRelease": "%sound_BrakeRelease%", >> ModelTrain_%trainname%.json
 echo --------------------
 echo sound_BrakeRelease2�����߂Ă��������B
 echo ����1��json���\������܂��B
 set /p sound_BrakeRelease2=
 echo sound_BrakeRelease2�� %sound_BrakeRelease2% �ɐݒ肳��܂����B
 if not "%sound_BrakeRelease2%" == "" echo  "sound_BrakeRelease2": "%sound_BrakeRelease2%", >> ModelTrain_%trainname%.json
 echo --------------------
 echo isSingleTrain�����߂Ă��������B
 echo ����0��json���\������܂��B
 set /p isSingleTrain=
 echo isSingleTrain�� %isSingleTrain% �ɐݒ肳��܂����B
 if not "%isSingleTrain%" == "" echo  "isSingleTrain": %isSingleTrain%, >> ModelTrain_%trainname%.json
 echo --------------------
 echo "accuracy": "%accuracy%" >> ModelTrain_%trainname%.json
 echo } >> ModelTrain_%trainname%.json
 goto train_json
 :train_json
 echo json���������܂���!
 echo;
 echo -- filename: ModelTrain_%trainname%.json --
 echo;
 set back=train_json
 for /f "delims=" %%a in (ModelTrain_%trainname%.json) do (
  echo %%a
 )
:2
 echo -------------------
 echo ���s����Ɠ��e�������܂��B
 echo ���s���Ă���낵���ł���?
 set user=
 set /p user=(y / n)
 if %user% == y goto 21
 if %user% == n goto %back%
 echo �I���Ȃ�:%back%
 goto %back%
 :21
  exit
:3
 cls
 set tsw=S
 echo �Ŕ�json���쐬���܂��B
 echo �����r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo -------------
 echo texture�����߂Ă��������B(��ɕۑ����Ă������Ŕ�png�t�@�C�������g���q�Ȃ��œ��͂��Ă��������B)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo -------------
 echo backTexture�����߂Ă��������B �g�p�\:0,1,2 
 echo  0=���\�������e�N�X�`���ɂȂ�܂��B
 echo  1=�摜�̉E���������̃e�N�X�`���ɂȂ�܂��B
 echo  2=�������ʂ̐F�Ɠ����F�ɂȂ�܂��B
 set /p backTexture=
 echo backTexture�� %backTexture% �ɐݒ肳��܂����B
 echo -------------
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̍����ɂȂ�܂��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��̒����ɂȂ�܂��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo -------------
 echo depth�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.375)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��s�ɂȂ�܂��B
 set /p depth=
 echo depth�� %depth% �ɐݒ肳��܂����B
 echo -------------
 echo frame�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p frame=
 echo frame�� %frame% �ɐݒ肳��܂����B
 echo -------------
 echo animationCycle�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p animationCycle=
 echo animationCycle�� %animationCycle% �ɐݒ肳��܂����B
 echo -------------
 echo color�����߂Ă��������B �g�p�\:6���̐���
 echo  -- 16 �i���J���[�R�[�h�� 10 �i���ɕϊ������l
 echo �킩��Ȃ��Ȃ��0�ɂ��܂��傤�B
 set /p color=
 echo color�� %color% �ɐݒ肳��܂����B
 echo -------------
 echo lightValue�����߂Ă��������B �g�p�\:-16~15
 echo ����͊Ŕ̔����̓x������ݒ肵�܂��B
 echo -16 �����_���ɓ_�ł���
 echo -15~-1 RS�M���������Ă��鎞�A��������(�����͔����̋���)
 echo 0 �������Ȃ�
 echo 1~15 ��ɔ�������(�����͔����̋���)
 set /p lightValue=
 echo lightValue�� %lightValue% �ɐݒ肳��܂����B
 echo -------------
 echo json���������܂���!
 goto signjson
:signjson
 set back=signjson
 echo ------�t�@�C����:SignBoard_%texture%.json-------
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
 echo �s����I�����Ă�������
 echo ----------------------------------------
 echo  �s���̔ԍ�         �s���̓��e          
 echo ----------------------------------------
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto signedit
 if %user% == 2 goto 2
 if %user% == 3 goto savesignjson
 echo �G���[:�s���Ȕԍ�
 goto signjson

:savesignjson
 echo json��ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
 echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\SignBoard_%texture%�ɂł���͂��ł��B)
 echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
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

:signedit
 echo �ǂ̕�����ҏW���܂���?
 echo json�̃f�[�^�l�̖��O����͂��Ă��������B(���json����f�[�^�l���R�s�y���Ă��������B�������啶���̈Ⴂ�ŃG���[�ɂȂ��Ă��܂��܂��B)
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
 echo �G���[:�s���Ȗ��O
 goto signedit
 :signedit_t
 echo -------------
 echo texture�����߂Ă��������B(��ɕۑ����Ă������Ŕ�png�t�@�C�������g���q�Ȃ��œ��͂��Ă��������B)
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 goto signjson
 :signedit_b
 echo -------------
 echo backTexture�����߂Ă��������B �g�p�\:0,1,2 
 echo  0=���\�������e�N�X�`���ɂȂ�܂��B
 echo  1=�摜�̉E���������̃e�N�X�`���ɂȂ�܂��B
 echo  2=�������ʂ̐F�Ɠ����F�ɂȂ�܂��B
 set /p backTexture=
 echo backTexture�� %backTexture% �ɐݒ肳��܂����B
 goto signjson
 :signedit_h
 echo -------------
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̍����ɂȂ�܂��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 goto signjson
 :signedit_w
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��̒����ɂȂ�܂��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 goto signjson
 :signedit_d
 echo -------------
 echo depth�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.375)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��s�ɂȂ�܂��B
 set /p depth=
 echo depth�� %depth% �ɐݒ肳��܂����B
 goto signjson
 :signedit_f
 echo -------------
 echo frame�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p frame=
 echo frame�� %frame% �ɐݒ肳��܂����B
 goto signjson
 :signedit_a
 echo -------------
 echo animationCycle�����߂Ă��������B �g�p�\:����
 echo �A�j���[�V�������Ȃ��ꍇ��1�ɐݒ肵�Ă��������B
 set /p animationCycle=
 echo animationCycle�� %animationCycle% �ɐݒ肳��܂����B
 goto signjson
 :signedit_c
 echo -------------
 echo color�����߂Ă��������B �g�p�\:6���̐���
 echo  -- 16 �i���J���[�R�[�h�� 10 �i���ɕϊ������l
 echo �킩��Ȃ��Ȃ��0�ɂ��܂��傤�B
 set /p color=
 echo color�� %color% �ɐݒ肳��܂����B
 goto signjson
 :signedit_l
 echo -------------
 echo lightValue�����߂Ă��������B �g�p�\:-16~15
 echo ����͊Ŕ̔����̓x������ݒ肵�܂��B
 echo -16 �����_���ɓ_�ł���
 echo -15~-1 RS�M���������Ă��鎞�A��������(�����͔����̋���)
 echo 0 ���s���Ȃ�
 echo 1~15 ��ɔ�������(�����͔����̋���)
 set /p lightValue=
 echo lightValue�� %lightValue% �ɐݒ肳��܂����B
 goto signjson

:4
 echo ���:akikawa9616
 echo ----
 echo �X�y�V�����T���N�X(�h�̗�)
 echo  json�̃f�[�^�l�̒�
 echo   -- .zip
 echo   -- �͂������Ƃ�����
 echo  �f�o�b�O
 echo   -- akikawa9616
 echo   -- ���Ƃ��� ^| https://www.youtube.com/@Yonkatsu12
 echo thank you !
 echo;
 echo ���̃v���O������MIT���C�Z���X�Ō��J����Ă��܂��B
 echo;
 echo -----------------------------
 echo Copyright (c) 2022-2023 akikawa9616
 echo;
 echo Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the �gSoftware�h), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 echo;
 echo The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 echo;
 echo THE SOFTWARE IS PROVIDED �gAS IS�h, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 echo -----------------------------
 echo version: %version%
 pause
 cls
 goto selectwelcome
:5
 cls
 set tsw=w
 echo �@�\����ݒu���̂ǂ���쐬���܂���?
 echo �������͂��Ȃ��ꍇ�͋����I�����܂��B
 echo �g�p�\:�Ւf�@,�]�Q�@,���D�@,�����@,�Ɩ�,�Ԏ~��,ATC,��Ԍ��o��,�Ɩ�
 echo ----------
 echo if u cant type japanese,pls type english machineType:
 echo Gate,Point,Turnstile,Vendor,Light,BumpingPost,Antenna_Send,Antenna_Receive
 echo (hint: "Antenna_Send"="Automatic Train Control","Antenna_Receive"="Train detector")
 set /p machineType=
 if %machineType% == "�Ւf�@" set machineType=Gate
 if %machineType% == "�]�Q�@" set machineType=Point
 if %machineType% == "���D�@" set machineType=Turnstile
 if %machineType% == "�����@" set machineType=Vendor
 if %machineType% == "�Ɩ�" set machineType=Light
 if %machineType% == "�Ԏ~��" set machineType=BumpingPost
 if %machineType% == "ATC" set machineType=Antenna_Send
 if %machineType% == "��Ԍ��o��" set machineType=Antenna_Receive
 if %machineType% == "Train detector" set machineType=Antenna_Receive
 goto 5-1

 :5-1
 echo �@�\����ݒu����json���쐬���܂��B
 echo �����A�r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo -------------
 echo name�����߂Ă��������B
 echo ����͋@�\����ݒu���̖��O�ɂȂ�܂��B�������Ȃ��悤�Ȗ��O��ݒ肵�Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 echo -------------
 echo modelfile�����߂Ă��������B
 set /p modelFile=
 echo modelfile�� %modelFile% �ɐݒ肳��܂����B
 echo -------------
 echo %modelFile% �̍ގ�����ݒ肵�Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ɐݒ肳��܂����B
 echo -------------
 echo 3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 echo ------------------
 if %mat% geq 2 goto smat2
 goto switcher
 :smat2
   echo 3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat2=
   echo �ގ�,2�߂̖��O�� %mat2% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat2texture=
   echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 3 goto smat3
 goto switcher
 :smat3
   echo 3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat3=
   echo �ގ�,3�߂̖��O�� %mat3% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat3texture=
   echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 4 goto smat4
 goto switcher
 :smat4
   echo 3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat4=
   echo �ގ�,4�߂̖��O�� %mat4% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat4texture=
   echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
 if %mat% geq 5 goto smat5
 goto switcher
 :smat5
   echo 3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat5=
   echo �ގ�,5�߂̖��O�� %mat5% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat5texture=
   echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 6 goto smat6
 goto switcher
 :smat6
   echo 3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat6=
   echo �ގ�,6�߂̖��O�� %mat6% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat6texture=
   echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 7 goto smat7
 goto switcher
 :smat7
   echo 3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat7=
   echo �ގ�,7�߂̖��O�� %mat7% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat7texture=
   echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 8 goto smat8
 goto switcher
 :smat8
   echo 3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat8=
   echo �ގ�,8�߂̖��O�� %mat8% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat8texture=
   echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 9 goto smat9
 goto switcher
 :smat9
   echo 3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat9=
   echo �ގ�,9�߂̖��O�� %mat9% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat9texture=
   echo %mat9% �̃e�N�X�`���p�X�� %mat9texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 10 goto smat10
 goto switcher
 :smat10
   echo 3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat10=
   echo �ގ�,10�߂̖��O�� %mat10% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat10texture=
   echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 11 goto smat11
 goto switcher
 :switcher
 echo buttontexture�����߂Ă��������B
 set /p button=
 echo buttonTexture�� %button% �ɐݒ肳��܂����B
 echo --------------------
 echo sound_onactivate�����߂Ă��������B
 set /p sound_onactivate=
 echo sound_onactivate�� %sound_onactivate% �ɐݒ肳��܂����B
 echo --------------------
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo --------------------
 echo doCulling�����߂Ă��������B
 set /p doCulling=
 echo doCulling�� %doCulling% �ɐݒ肳��܂����B
 echo --------------------
 echo accuracy�����߂Ă��������B
 set /p accuracy=
 echo accuracy�� %accuracy% �ɐݒ肳��܂����B
 echo --------------------
 echo tags�����߂Ă��������B
 echo �����w�肷��ꍇ��","���g�p���Ă��������B(��:akikawa,point,original)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo --------------------
 echo ���߂łƂ��������܂�!
 echo �������܂���!
 echo ------------
 echo �ȉ��Ɋ����������̂�\�����܂��B
 goto switcher_json
:switcher_json
 set back=switcher_json
 echo -----�t�@�C����:ModelMachine_%name%.json-----
 echo {
 echo   "name": "%name%",
 echo   "model": {
 echo     "modelFile": "%modelFile%",
  if %mat% == "" goto error
  if %mat% == 1 echo     "textures":[ ["%mat1%", "%mat1texture%", ""]] },
  if %mat% == 2 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""]] },
  if %mat% == 3 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""]] },
  if %mat% == 4 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""]] },
  if %mat% == 5 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""]] },
  if %mat% == 6 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""]] },
  if %mat% == 7 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""]] },
  if %mat% == 8 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""]] },
  if %mat% == 9 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""]] },
  if %mat% == 10 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""],["%mat10%", "%mat10texture%", ""]] },
 echo   "buttonTexture": "%button%",
 echo   "machineType": "%machinetype%",
 echo   "sound_OnActivate": "%sound_onactivate%",
 echo   "smoothing": %smoothing%,
 echo   "doCulling": %doCulling%,
 echo   "accuracy": "%accuracy%",
 echo   "tags": "%tags%"
 echo }
 echo -----------------------------------
 echo �s����I�����Ă�������
 echo ----------------------------------------
 echo  �s���̔ԍ�         �s���̓��e          
 echo ----------------------------------------
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B(beta)  
 echo ----------------------------------------
 set /p user=
 if %user% == 1 goto switcheredit
 if %user% == 2 goto 2
 if %user% == 3 goto saveswitcherjson
 echo �G���[:�s���Ȕԍ�
 goto switcher_json

:saveswitcherjson
 echo json��ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
 echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\ModelMachine_%name%�ɂł���͂��ł��B)
 echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
 pause
 echo { > ModelMachine_%name%.json
 echo   "name": "%name%", >> ModelMachine_%name%.json
 echo   "model": { >> ModelMachine_%name%.json
 echo     "modelFile": "%modelFile%", >> ModelMachine_%name%.json
  if %mat% == 1 echo     "textures":[ ["%mat1%", "%mat1texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 2 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 3 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 4 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 5 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 6 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 7 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 8 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 9 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 10 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""],["%mat10%", "%mat10texture%", ""]] }, >> ModelMachine_%name%.json
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
  echo �t�@�C���̕ۑ����������܂����B
  echo �t�@�C����:"ModelMachine_%name%.json"
  echo;
 ) ELSE (
  set error=53N
  goto ERROR
 )
 goto %back%

:switcheredit
 echo �ǂ̕�����ҏW���܂���?
 echo ���̂ǂꂩ�̖��O����͂��Ă�������
 echo name,modelfile,textures,buttonTexture,sound_OnActivate,smoothing,doCulling,accuracy,tags
 echo �ގ��֌W��ύX����ꍇ�͗L���Ȑ�������͂��Ă��������B
 echo;
 echo --�L���Ȑ���--
 echo %mat1% ��ҏW����ꍇ�� 1 �������Ă��������B
 if %mat% geq 2 echo %mat2% ��ҏW����ꍇ�� 2 �������Ă��������B
 if %mat% geq 3 echo %mat3% ��ҏW����ꍇ�� 3 �������Ă��������B
 if %mat% geq 4 echo %mat4% ��ҏW����ꍇ�� 4 �������Ă��������B
 if %mat% geq 5 echo %mat5% ��ҏW����ꍇ�� 5 �������Ă��������B
 if %mat% geq 6 echo %mat6% ��ҏW����ꍇ�� 6 �������Ă��������B
 if %mat% geq 7 echo %mat7% ��ҏW����ꍇ�� 7 �������Ă��������B
 if %mat% geq 8 echo %mat8% ��ҏW����ꍇ�� 8 �������Ă��������B
 if %mat% geq 9 echo %mat9% ��ҏW����ꍇ�� 9 �������Ă��������B
 if %mat% geq 10 echo %mat10% ��ҏW����ꍇ�� 10 �������Ă��������B
 set /p user=
 if %user% == name goto switcheredit_name
 if %user% == modelfile goto switcheredit_model
 if %user% == textures goto switcheredit_texture
 if %user% == buttonTexture goto switcheredit_button
 if %user% == sound_OnActivate goto switcheredit_sound
 if %user% == smoothing goto switcheredit_smoo
 if %user% == doCulling goto switcheredit_call
 if %user% == accuracy goto switcheredit_acc
 if %user% == tags goto switcheredit_tags
 if %user% == 1 goto switcheredit_mat_1
 if %user% == 2 goto switcheredit_mat_2
 if %user% == 3 goto switcheredit_mat_3
 if %user% == 4 goto switcheredit_mat_4
 if %user% == 5 goto switcheredit_mat_5
 if %user% == 6 goto switcheredit_mat_6
 if %user% == 7 goto switcheredit_mat_7
 if %user% == 8 goto switcheredit_mat_8
 if %user% == 9 goto switcheredit_mat_9
 if %user% == 10 goto switcheredit_mat_10
 echo �G���[:�s���Ȗ��O
 goto switcher_json

 :switcheredit_name
 echo -------------
 echo name�����߂Ă��������B
 echo ����͋@�\����ݒu���̖��O�ɂȂ�܂��B�������Ȃ��悤�Ȗ��O��ݒ肵�Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_model
 echo -------------
 echo modelfile�����߂Ă��������B
 set /p modelFile=
 echo modelfile�� %modelFile% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_texture
 echo -------------
 echo buttontexture�����߂Ă��������B
 set /p button=
 echo buttonTexture�� %button% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_sound
 echo --------------------
 echo sound_onactivate�����߂Ă��������B
 echo ���̒l���������邩�킩��Ȃ��ꍇ��"minecraft:random.click"����͂��Ă��������B
 set /p sound_onactivate=
 echo sound_onactivate�� %sound_onactivate% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_smoo
 echo --------------------
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_acc
 echo --------------------
 echo accuracy�����߂Ă��������B
 set /p accuracy=
 echo accuracy�� %accuracy% �ɐݒ肳��܂����B
 goto switcher_json
 
 :switcheredit_tags
 echo --------------------
 echo tags�����߂Ă��������B
 echo �����w�肷��ꍇ��","���g�p���Ă��������B(��:akikawa,point,original)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_1
 echo -------------
 echo 3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_2
 echo -------------
 echo 3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat2=
 echo �ގ�,2�߂̖��O�� %mat2% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat2texture=
 echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_3
 echo -------------
 echo 3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat3=
 echo �ގ�,3�߂̖��O�� %mat3% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat3texture=
 echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_4
 echo -------------
 echo 3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat4=
 echo �ގ�,4�߂̖��O�� %mat4% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat4texture=
 echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_5
 echo -------------
 echo 3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat5=
 echo �ގ�,5�߂̖��O�� %mat5% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat5texture=
 echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_6
 echo -------------
 echo 3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat6=
 echo �ގ�,6�߂̖��O�� %mat6% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat6texture=
 echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_7
 echo -------------
 echo 3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat7=
 echo �ގ�,7�߂̖��O�� %mat7% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat7texture=
 echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_8
 echo -------------
 echo 3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat28=
 echo �ގ�,8�߂̖��O�� %mat8% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat8texture=
 echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
 goto switcher_json

 :switcheredit_mat_9
 echo -------------
 echo 3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat9=
 echo �ގ�,9�߂̖��O�� %mat9% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat2texture=
 echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
 goto switcher_json
 
 :switcheredit_mat_10
 echo -------------
 echo 3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat10=
 echo �ގ�,10�߂̖��O�� %mat10% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat10texture=
 echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
 goto switcher_json



:6
 cls
 set tsw=n
 echo NPC��json���쐬���܂��B
 echo �����A�r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo -------------
 echo name�����߂Ă��������B
 echo �����NPC�̖��O�ɂȂ�܂��B�������Ȃ��悤�Ȗ��O��ݒ肵�Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 echo -------------
 set nomodel=1
 set /p nomodel=���f����ݒ肹����json���쐬����ꍇ��y,�ݒ肷��ꍇ�͉����̃L�[�������Ă��������B
 set mat=0
 if %nomodel% == y goto npc
 echo -------------
 echo modelfile�����߂Ă��������B
 set /p modelFile=
 echo modelfile�� %modelFile% �ɐݒ肳��܂����B
 echo -------------
 echo %modelFile% �̍ގ�����ݒ肵�Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ɐݒ肳��܂����B
 echo -------------
 echo 3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 echo ------------------
 if %mat% geq 2 goto nmat2
 goto npc
 :nmat2
   echo 3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat2=
   echo �ގ�,2�߂̖��O�� %mat2% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat2texture=
   echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 3 goto nmat3
 goto npc
 :nmat3
   echo 3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat3=
   echo �ގ�,3�߂̖��O�� %mat3% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat3texture=
   echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 4 goto nmat4
 goto npc
 :nmat4
   echo 3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat4=
   echo �ގ�,4�߂̖��O�� %mat4% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
   set /p mat4texture=
   echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
 if %mat% geq 5 goto nmat5
 goto npc
 :nmat5
   echo 3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat5=
   echo �ގ�,5�߂̖��O�� %mat5% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat5texture=
   echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 6 goto nmat6
 goto npc
 :nmat6
   echo 3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat6=
   echo �ގ�,6�߂̖��O�� %mat6% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat6texture=
   echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 7 goto nmat7
 goto npc
 :nmat7
   echo 3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat7=
   echo �ގ�,7�߂̖��O�� %mat7% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat7texture=
   echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 8 goto nmat8
 goto npc
 :nmat8
   echo 3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat8=
   echo �ގ�,8�߂̖��O�� %mat8% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat8texture=
   echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 9 goto nmat9
 goto npc
 :nmat9
   echo 3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat9=
   echo �ގ�,9�߂̖��O�� %mat9% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat9texture=
   echo %mat9% �̃e�N�X�`���p�X�� %mat9texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 10 goto nmat10
 goto npc
 :nmat10
   echo 3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat10=
   echo �ގ�,10�߂̖��O�� %mat10% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B 
   set /p mat10texture=
   echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 11 goto nmat11
 goto npc

:npc
 echo -------------
 echo role�����߂Ă��������B
 echo attendant,guard,mannequin,passenger�̂ǂꂩ���g�p�ł��܂��B
 set /p role=
 echo role�� %role% �ɐݒ肳��܂����B
 echo --------------------
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo --------------------
 echo doCulling�����߂Ă��������B
 set /p doCulling=
 echo doCulling�� %doCulling% �ɐݒ肳��܂����B
 echo --------------------
 echo json���������܂���!
 goto npcjson
:npcjson
 set back=npcjson
 echo ------�t�@�C����:ModelNPC_%name%.json-------
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
 echo �s����I�����Ă�������
 echo ----------------------------------------
 echo  �s���̔ԍ�         �s���̓��e          
 echo ----------------------------------------
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3         json��ۑ����܂��B(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto npcedit
 if %user% == 2 goto 2
 if %user% == 3 goto savenpcjson
 echo �G���[:�s���Ȕԍ�
 goto %back%

:savenpcjson
 echo json��ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
 echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\ModelNPC_%name%�ɂł���͂��ł��B)
 echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
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
  echo �t�@�C���̕ۑ����������܂����B
  echo �t�@�C���p�X:"%cd%\ModelNPC_%name%.json"
  echo;
 ) ELSE (
  set error=63N
  goto ERROR
 )
 goto %back%

:npcedit
 echo �ǂ̕�����ҏW���܂���?
 echo ���̂ǂꂩ�̖��O����͂��Ă�������
 echo name,modelfile,role,doCulling,smoothing
 echo �ގ��֌W��ύX����ꍇ�͗L���Ȑ�������͂��Ă��������B
 echo;
 echo --�L���Ȑ���--
 if %mat% geq 1 echo %mat1% ��ҏW����ꍇ�� 1 �������Ă��������B
 if %mat% geq 2 echo %mat2% ��ҏW����ꍇ�� 2 �������Ă��������B
 if %mat% geq 3 echo %mat3% ��ҏW����ꍇ�� 3 �������Ă��������B
 if %mat% geq 4 echo %mat4% ��ҏW����ꍇ�� 4 �������Ă��������B
 if %mat% geq 5 echo %mat5% ��ҏW����ꍇ�� 5 �������Ă��������B
 if %mat% geq 6 echo %mat6% ��ҏW����ꍇ�� 6 �������Ă��������B
 if %mat% geq 7 echo %mat7% ��ҏW����ꍇ�� 7 �������Ă��������B
 if %mat% geq 8 echo %mat8% ��ҏW����ꍇ�� 8 �������Ă��������B
 if %mat% geq 9 echo %mat9% ��ҏW����ꍇ�� 9 �������Ă��������B
 if %mat% geq 10 echo %mat10% ��ҏW����ꍇ�� 10 �������Ă��������B
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
 echo name�����߂Ă��������B
 set /p name=
 echo name�� %name% �ɐݒ肳��܂����B
 goto %back%
 :npcedit_role
 echo -------------
 echo role�����߂Ă��������B
 set /p role=
 echo name�� %role% �ɐݒ肳��܂����B
 goto %back%
 :npcedit_model
 echo -------------
 echo modelfile�����߂Ă��������B
 set /p modelfile=
 echo modelfile�� %modelfile% �ɐݒ肳��܂����B
 goto %back%
 :npcedit_smoo
 echo -------------
 echo smoothing�����߂Ă��������B
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 goto %back%
 :npcedit_call
 echo -------------
 echo doculling�����߂Ă��������B
 set /p doculling=
 echo doculling�� %doculling% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_1
 echo -------------
 echo 3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_2
 echo -------------
 echo 3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat2=
 echo �ގ�,2�߂̖��O�� %mat2% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat2texture=
 echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_3
 echo -------------
 echo 3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat3=
 echo �ގ�,3�߂̖��O�� %mat3% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat3texture=
 echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_4
 echo -------------
 echo 3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat4=
 echo �ގ�,4�߂̖��O�� %mat4% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat4texture=
 echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_5
 echo -------------
 echo 3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat5=
 echo �ގ�,5�߂̖��O�� %mat5% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat5texture=
 echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_6
 echo -------------
 echo 3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat6=
 echo �ގ�,6�߂̖��O�� %mat6% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat6texture=
 echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_7
 echo -------------
 echo 3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat7=
 echo �ގ�,7�߂̖��O�� %mat7% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat7texture=
 echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_8
 echo -------------
 echo 3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat28=
 echo �ގ�,8�߂̖��O�� %mat8% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat8texture=
 echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
 goto %back%

 :npcedit_mat_9
 echo -------------
 echo 3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat9=
 echo �ގ�,9�߂̖��O�� %mat9% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat2texture=
 echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
 goto %back%
 
 :npcedit_mat_10
 echo -------------
 echo 3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat10=
 echo �ގ�,10�߂̖��O�� %mat10% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B
 set /p mat10texture=
 echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
 goto %back%

:7
 cls
 set tsw=f
 echo ����json���쐬���܂��B
 echo �����r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo -------------
 echo texture�����߂Ă��������B
 echo "textures/flag/flag_[texturename].png" �̂悤�ɐݒ肵�Ă��������B
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo ------------
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo -------------
 echo resolutionV�����߂Ă��������B
 set /p resolutionV=
 echo resolutionV�� %resolutionV% �ɐݒ肳��܂����B
 echo --------------
 echo resolutionU�����߂Ă��������B
 set /p resolutionU=
 echo resolutionU�� %resolutionU% �ɐݒ肳��܂����B
 echo --------------
 echo poleLength�����߂Ă��������B
 echo 2.0����2m�ɂȂ�܂��B(���Ԃ�)
 set /p poleLength=
 echo poleLength�� %poleLength% �ɐݒ肳��܂����B
 echo --------------
 echo json���������܂���!
 goto flagjson
:flagjson
 set back=flagjson
 echo ------�t�@�C����:Flag_%texture:~19,-4%.json-------
 echo {
 echo   "texture": "%texture%",
 echo   "height": %height%,
 echo   "width": %width%,
 echo   "resolutionV": %resolutionV%,
 echo   "resolutionU": %resolutionU%,
 echo   "poleLength" : %poleLength%
 echo }
 echo ------------------------------------------------
 echo �s����I�����Ă�������
 echo ----------------------------------------
 echo  �s���̔ԍ�         �s���̓��e          
 echo ----------------------------------------
 echo     1              json��ҏW����       
 echo     2              �I�������܂��B       
 echo     3           json��ۑ����܂��B(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto flagedit
 if %user% == 2 goto 2
 if %user% == 3 goto saveflagjson
 echo �G���[:�s���Ȕԍ�
 goto %back%
:saveflagjson
 echo json��ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
 echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\ModelNPC_%name%�ɂł���͂��ł��B)
 echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
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
 echo -------------
 echo texture�����߂Ă��������B ����: %texture%
 echo "textures/flag/flag_[texturename].png" �̂悤�ɐݒ肵�Ă��������B
 set /p texture=
 echo texture�� %texture% �ɐݒ肳��܂����B
 echo ------------
 echo height�����߂Ă��������B �g�p�\:�����Ə�����O�ʂ܂�(��:0.75) 
 echo ����:%height%
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə�����O�ʂ܂�(��:2.25)
 echo ����: %width%
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo -------------
 echo resolutionV�����߂Ă��������B ����: %resolutionV%
 set /p resolutionV=
 echo resolutionV�� %resolutionV% �ɐݒ肳��܂����B
 echo --------------
 echo resolutionU�����߂Ă��������B ����: %resolutionU%
 set /p resolutionU=
 echo resolutionU�� %resolutionU% �ɐݒ肳��܂����B
 echo --------------
 echo poleLength�����߂Ă��������B ����: %poleLength%
 echo 2.0����2m�ɂȂ�܂��B(���Ԃ�)
 set /p poleLength=
 echo poleLength�� %poleLength% �ɐݒ肳��܂����B
 echo --------------
 goto %back%

:8
 cls
 set tsw=sounds
 echo sounds.json���쐬���܂��B
 echo --------
 setlocal enabledelayedexpansion
 echo 2�ȏ�T�E���h��ǉ����܂���?
 echo ���̏ꍇ�A"json�t�@�C���̕ۑ�"���K�{�ł��B
 set /p nextkonanshint=(y / n)
 if %nextkonanshint% == y goto sound_two
 if %nextkonanshint% == n goto sound
 :sound
  echo --------
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B)
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
  echo sounds.json���������܂���!
  echo �ۑ����܂���?
  set /p user=(y / n)
  if %user% == n goto 2
  if %user% == y goto savesounds
  :savesounds
  echo json��ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
  echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\sounds.json�ɂł���͂��ł��B)
  echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
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
  echo json�������ۑ����܂��B json�͎��s�����R�}���h�v�����v�g�̃p�X��ɂł���͂��ł��B
  echo (�Ⴆ��c:\json\�Ƀp�X����Ă���cmd�Ŏ��s�����ꍇ��c:\json\sounds.json�ɂł���͂��ł��B)
  echo �_�u���N���b�N�N���̏ꍇ��batch�t�@�C��������ꏊ��json�t�@�C�����쐬����܂��B
  echo --------
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B)
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(����ǉ���)-----
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
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B),����̓��͂ŏI���ɂ���ꍇ��"\\\"���g�p���Ă��������B
  if %soundpath% == \\\ goto end_sounds_json
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(����ǉ���)-----
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
  echo ���ꂪ�Ō�̂��̂Ƃ��ăZ�b�g����܂����B
  set /p soundpath=�T�E���h�̃p�X��ݒ肵�Ă��������B(�Ⴆ�΁Ac:\addon\assets\my_sound\train\chime1.ogg���w�肷��ꍇ��"train\chime1.ogg"�Ɠ��͂��Ă��������B)
  set soundpath=%soundpath:\=.%
  echo -----sounds.json(����ǉ���)-----
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
  echo sounds.json�̋L�q���I�����܂��B
  echo �t�@�C���p�X:"%cd%\sounds.json"
  pause
  goto 2

:9
 echo RTM�̃f�B���N�g���\�����쐬���܂��B
 echo �ǂ��Ƀf�B���N�g�����쐬���܂���?(�L�q���ꂽ�p�X����"RTM"�t�H���_���ł��܂��B)
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
 tree
 echo �ǂ�? �ł���?
 pause
 cls
 goto welcome
:zip
 echo;
 echo ���̋@�\�̓x�[�^�łł��B
 echo ����ۏ؊O�ł��B
 echo;
 echo �f�B���N�g����zip�����܂��B
 echo �ǂ̃f�B���N�g����zip�����܂���? assets�t�H���_�̃p�X����͂��Ă��������B(c:\rtm\assets��zip�������ꍇ��c:\rtm\assets�Ɠ��́B)
 echo �q���g: �B���t�@�C����zip������܂���
 set /p directry=
 md %temp%\.rtm
 Powershell Compress-Archive -Path %directry%\* -DestinationPath %temp%\.rtm\rtm_addon%random%
 explorer.exe %temp%\.rtm
 echo Done.
 pause
 exit
:soundcreate
 echo ���̃T�E���h�N���G�C�g�@�\��sounds.json�̍쐬�e�X�g�Ɏg�p���邽�߂̂��̂ł��B
 echo sound.log�t�@�C�����폜����K�v������܂���? (�K�v�Ȃ��ꍇ�͍����łɂ�����̂�+�ō쐬����܂�,�Ⴆ�΁A99�s�̃t�@�C�������ɑ��݂��Ă���5�s�ǉ��������ꍇ�͕K�v�Ȏ���I�����邱�Ƃ�99�s�Ƀv���X��5�s�����������邱�Ƃ��ł��܂��B)
 set /p confirm=(y / n)
 if %confirm% == y del /F sound.log
 if %confirm% == n goto next
 :next
 echo ���s�K�v�ł���?
 echo �󔒂�0�A�͂���߂���ɑ傫�������w�肵�Ă��܂��A�~�߂����Ƃ���"CTRL + C"�����邱�ƂŃo�b�`�t�@�C���������I�����Ă��������B
 echo ����Ȃ��ƃo�b�`�t�@�C����������������薳����sounds.log�̃t�@�C���T�C�Y���傫���Ȃ�܂�(1�b��1KB�y�[�X�ő����܂�)
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
 if not %stopcount% == %count% echo stopcount��count�̐����Ⴄ���Ƃ����m���܂����B ������̃J�E���^�[���������Ȃ炱��͊Ԉ���Ă��܂��B ���̏ꍇ�͖������Ă��������B
 echo;
 pause
 exit
:setpath
 set /p setpath=Enter path here :
 pushd %setpath%
 echo Done.
 goto welcome
rem memo
 rem �ϐ�:bogie �̓{�M�[�ގ����̔���ɂ̂ݎg�p���܂��B  bogiemodel2��bogiemodel3�ŋ��p�ł��B(bogiemodel3�̏ꍇ�͑O�ɂȂ�܂��B)
 rem �ϐ�:bogie2 ��bogiemodel3�̂Ƃ��̂ݎg�p���A��̃��f���̍ގ����ł��B
rem ERROR CODE
 rem 33N 
  rem �Ŕ�json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 13N
  rem ��Ԃ�json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 53N
  rem �@�\����ݒu����json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 63N
  rem NPC��json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 73N
  rem ����json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 8N
  rem sounds.json��ۑ�������ɂ��̃t�@�C����������܂���ł����B
 rem 0-00
  rem �̈ӓI�ɔ����������G���[�B
 
:werror
 echo �̈ӓI�ȃG���[�B
 set error=0-00
 goto error



:ERROR
  echo �\���󂠂�܂���B�ǂ����ŃG���[���������܂����B
  echo �\�ł���΁A��҂Ɏ��s�����ۂ̏ڍ׏��𑗐M���Ă��������B
  echo ����̉��ǂɏ����g�p�����Ă��������܂��B
  echo (��O�҂ւ̑��M��A���̌��J�͈�؂��܂���B)
  echo;
  echo --�ڍ׏��--
  echo OS:%OS%
  echo cmdext:%cmdextversion%
  echo dir:%cd%
  echo T/S/W/N:%tsw%
  echo error-code:%error%
  pause