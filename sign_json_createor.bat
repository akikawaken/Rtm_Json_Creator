@echo off
set user=
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
echo ----------------------------------------
set /p start=�s���̐�������͂��Ă�������...
set back=selectwelcome
if %start% == 1 goto 1
if %start% == 2 goto 2
if %start% == 3 goto 3
if %start% == 4 goto 4
if %start% == 749 goto json 
if %start% == 827 goto signjson
echo �G���[:�s���Ȕԍ��ł��B
goto selectwelcome
:1
 cls
 echo ��Ԃ�json���쐬���܂��B
 echo �����r���Ń~�X�������ꍇ�́A�Ō�ɕҏW�ł���̂ł����ŕύX���Ă��������B
 echo -----------------
 echo trainName�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p trainname=
 echo trainname�� %trainname% �ɐݒ肳��܂����B
 echo -----------------
 echo traintype�����߂Ă��������B �g�p�\:EC,DC,CC,TC
 echo EC=�d��
 echo DC=�C����
 echo CC=�ݎ�
 echo TC=�^���N��
 set /p traintype=
 echo traintype�� %traintype% �ɐݒ肳��܂����B 
 echo ------------------
 echo tags�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)��","
 echo �����w�肷��ꍇ��","�ŋ�؂��ē��͂��Ă��������B(��:tag1,tag2,tag3)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo ------------------
 echo modelFile�����߂Ă��������B
 echo ��Ԃ�3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFile=
 echo modelFile�� %modelFile% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ��������߂Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �� %mat1texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
 set /p mat1a=
 echo %mat1% �� %mat1texture% �̃I�v�V������ %mat1a% �ɐݒ肳��܂����B
 echo ------------------
 if %mat% geq 2 goto mat2
 goto bogies
 :mat2
   echo ��Ԃ�3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat2=
   echo �ގ�,1�߂̖��O�� %mat2% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat2texture=
   echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �� %mat2texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat2a=
   echo %mat2% �� %mat2texture% �̃I�v�V������ %mat2a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 3 goto mat3
 goto bogies
 :mat3
   echo ��Ԃ�3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat3=
   echo �ގ�,1�߂̖��O�� %mat3% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat3texture=
   echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �� %mat3texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat3a=
   echo %mat3% �� %mat3texture% �̃I�v�V������ %mat3a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 4 goto mat4
 goto bogies
 :mat4
   echo ��Ԃ�3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat4=
   echo �ގ�,1�߂̖��O�� %mat4% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat4texture=
   echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �� %mat4texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat4a=
   echo %mat4% �� %mat4texture% �̃I�v�V������ %mat4a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 5 goto mat5
 goto bogies
 :mat5
   echo ��Ԃ�3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat5=
   echo �ގ�,1�߂̖��O�� %mat5% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat5texture=
   echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �� %mat5texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat5a=
   echo %mat5% �� %mat5texture% �̃I�v�V������ %mat5a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 6 goto mat6
 goto bogies
 :mat6
   echo ��Ԃ�3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat6=
   echo �ގ�,1�߂̖��O�� %mat6% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat6texture=
   echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �� %mat6texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat6a=
   echo %mat6% �� %mat6texture% �̃I�v�V������ %mat6a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 7 goto mat7
 goto bogies
 :mat7
   echo ��Ԃ�3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat7=
   echo �ގ�,1�߂̖��O�� %mat7% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat7texture=
   echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �� %mat7texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat7a=
   echo %mat7% �� %mat7texture% �̃I�v�V������ %mat7a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 8 goto mat8
 goto bogies
 :mat8
   echo ��Ԃ�3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat8=
   echo �ގ�,1�߂̖��O�� %mat8% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat8texture=
   echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �� %mat8texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat8a=
   echo %mat8% �� %mat8texture% �̃I�v�V������ %mat8a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 9 goto mat9
 goto bogies
 :mat9
   echo ��Ԃ�3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat9=
   echo �ގ�,1�߂̖��O�� %mat9% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat9texture=
   echo %mat9% �̃e�N�X�`���p�X�� %mat9texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �� %mat9texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat9a=
   echo %mat9% �� %mat9texture% �̃I�v�V������ %mat9a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 10 goto mat10
 goto bogies
 :mat10
   echo ��Ԃ�3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat10=
   echo �ގ�,1�߂̖��O�� %mat10% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat10texture=
   echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �� %mat10texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat10a=
   echo %mat10% �� %mat10texture% �̃I�v�V������ %mat10a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 11 goto mat11
 goto bogies
 :bogies
 echo �{�M�[�̃��f����O��ʂɐݒ肵�܂���?
 echo �ʂɂ��Ȃ��ꍇ��1,�ʂɂ���ꍇ��2����͂��Ă��������B
 
 rem bogiemodel3�����������ꍇ�A����echo,���̎���set�͍폜���Ă��������B���̎���rem��rem�̂ݍ폜���Ă��������B
 echo ���݁A���f����ʂɂ���@�\�͎g�p�ł��܂���B
 set bogie12=1
 rem set /p bogie12=(1 / 2)

 echo �{�M�[�̃��f����: %bogie12%
 echo -----------------
 if %bogie12% == 1 goto 12
 if %bogie12% == 2 goto 122
 if %bogie12% == 8273 goto 1222
 echo �����͕K�{�v�f�ł��B �K��1��2����͂��Ă��������B
 echo debug:8273�Ń{�M�[���X�L�b�v���܂��B
 goto bogies
 rem �ȉ�bogiemodel2�̏ꍇ
:12
 echo modelfile�����߂Ă��������B
 echo �{�M�[��3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFileb=
 echo modelFile�� %modelFileb% �ɐݒ肳��܂����B
 echo ------------------
 echo �{�M�[��3D���f���̍ގ��������߂Ă��������B
 set /p bogie=
 echo �ގ����� %bogie% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p bogie1=
 echo �ގ�,1�߂̖��O�� %bogie1% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p bogie1texture=
 echo %bogie1% �̃e�N�X�`���p�X�� %bogie1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �� %bogie1texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
 set /p bogie1a=
 echo %bogie1% �� %bogie1texture% �̃I�v�V������ %bogie1a% �ɐݒ肳��܂����B
 echo ------------------
 if %bogie% geq 2 goto bogie2
 goto 1222
 :bogie2
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie2=
   echo �ގ�,1�߂̖��O�� %bogie2% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie2texture=
   echo %bogie2% �̃e�N�X�`���p�X�� %bogie2texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 3 goto bogie3
 goto 1222
 :bogie3
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie3=
   echo �ގ�,1�߂̖��O�� %bogie3% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie3texture=
   echo %bogie3% �̃e�N�X�`���p�X�� %bogie3texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 4 goto bogie4
 goto 1222
 :bogie4
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie4=
   echo �ގ�,1�߂̖��O�� %bogie4% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie4texture=
   echo %bogie4% �̃e�N�X�`���p�X�� %bogie4texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 5 goto bogie5
 goto 1222
 :bogie5
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie5=
   echo �ގ�,1�߂̖��O�� %bogie5% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie5texture=
   echo %bogie5% �̃e�N�X�`���p�X�� %bogie5texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 6 goto bogie6
 goto 1222
 :bogie6
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie6=
   echo �ގ�,1�߂̖��O�� %bogie6% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie6texture=
   echo %bogie6% �̃e�N�X�`���p�X�� %bogie6texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 7 goto bogie7
 goto 1222
 :bogie7
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie7=
   echo �ގ�,1�߂̖��O�� %bogie7% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie7texture=
   echo %bogie7% �̃e�N�X�`���p�X�� %bogie7texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 8 goto bogie8
 goto 1222
 :bogie8
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie8=
   echo �ގ�,1�߂̖��O�� %bogie8% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie8texture=
   echo %bogie8% �̃e�N�X�`���p�X�� %bogie8texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 9 goto bogie9
 goto 1222
 :bogie9
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie9=
   echo �ގ�,1�߂̖��O�� %bogie9% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie9texture=
   echo %bogie9% �̃e�N�X�`���p�X�� %bogie9texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 10 goto bogie10
 goto 1222
 :bogie10
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie10=
   echo �ގ�,1�߂̖��O�� %bogie10% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie10texture=
   echo %bogie10% �̃e�N�X�`���p�X�� %bogie10texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 11 goto bogie11
 goto 1222
 
rem �ȉ�bogiemodel3�̏ꍇ
:122
 echo �{�M�[��3D���f���̍ގ��������߂Ă��������B(�O)
 set /p bogie=
 echo �ގ����� %bogie% �ɐݒ肳��܂����B
 echo ------------------
 echo �{�M�[��3D���f���̍ގ��������߂Ă��������B(��)
 set /p bogie2=
 echo �ގ����� %bogie2% �ɐݒ肳��܂����B
 echo ------------------
 echo modelfile�����߂Ă��������B
 echo �{�M�[��3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFileb=
 echo modelFile�� %modelFileb% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p bogie1=
 echo �ގ�,1�߂̖��O�� %bogie1% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p bogie1texture=
 echo %bogie1% �̃e�N�X�`���p�X�� %bogie1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �� %bogie1texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
 set /p bogie1a=
 echo %bogie1% �� %bogie1texture% �̃I�v�V������ %bogie1a% �ɐݒ肳��܂����B
 echo ------------------
 if %bogie% geq 2 goto bogieb2
 goto 1222
 :bogieb2
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie2=
   echo �ގ�,1�߂̖��O�� %bogie2% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie2texture=
   echo %bogie2% �̃e�N�X�`���p�X�� %bogie2texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie2% �� %bogie2texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie2a=
   echo %bogie2% �� %bogie2texture% �̃I�v�V������ %bogie2a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 3 goto bogie3
 goto 1222
 :bogie3
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie3=
   echo �ގ�,1�߂̖��O�� %bogie3% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie3texture=
   echo %bogie3% �̃e�N�X�`���p�X�� %bogie3texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie3% �� %bogie3texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie3a=
   echo %bogie3% �� %bogie3texture% �̃I�v�V������ %bogie3a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 4 goto bogie4
 goto 1222
 :bogie4
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie4=
   echo �ގ�,1�߂̖��O�� %bogie4% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie4texture=
   echo %bogie4% �̃e�N�X�`���p�X�� %bogie4texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie4% �� %bogie4texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie4a=
   echo %bogie4% �� %bogie4texture% �̃I�v�V������ %bogie4a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 5 goto bogie5
 goto 1222
 :bogie5
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie5=
   echo �ގ�,1�߂̖��O�� %bogie5% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie5texture=
   echo %bogie5% �̃e�N�X�`���p�X�� %bogie5texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie5% �� %bogie5texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie5a=
   echo %bogie5% �� %bogie5texture% �̃I�v�V������ %bogie5a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 6 goto bogie6
 goto 1222
 :bogie6
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie6=
   echo �ގ�,1�߂̖��O�� %bogie6% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie6texture=
   echo %bogie6% �̃e�N�X�`���p�X�� %bogie6texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie6% �� %bogie6texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie6a=
   echo %bogie6% �� %bogie6texture% �̃I�v�V������ %bogie6a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 7 goto bogie7
 goto 1222
 :bogie7
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie7=
   echo �ގ�,1�߂̖��O�� %bogie7% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie7texture=
   echo %bogie7% �̃e�N�X�`���p�X�� %bogie7texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie7% �� %bogie7texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie7a=
   echo %bogie7% �� %bogie7texture% �̃I�v�V������ %bogie7a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 8 goto bogie8
 goto 1222
 :bogie8
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie8=
   echo �ގ�,1�߂̖��O�� %bogie8% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie8texture=
   echo %bogie8% �̃e�N�X�`���p�X�� %bogie8texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie8% �� %bogie8texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie8a=
   echo %bogie8% �� %bogie8texture% �̃I�v�V������ %bogie8a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 9 goto bogie9
 goto 1222
 :bogie9
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie9=
   echo �ގ�,1�߂̖��O�� %bogie9% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie9texture=
   echo %bogie9% �̃e�N�X�`���p�X�� %bogie9texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie9% �� %bogie9texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie9a=
   echo %bogie9% �� %bogie9texture% �̃I�v�V������ %bogie9a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 10 goto bogie10
 goto 1222
 :bogie10
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie10=
   echo �ގ�,1�߂̖��O�� %bogie10% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie10texture=
   echo %bogie10% �̃e�N�X�`���p�X�� %bogie10texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie10% �� %bogie10texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p bogie10a=
   echo %bogie10% �� %bogie10texture% �̃I�v�V������ %bogie10a% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 11 goto bogie11
 goto 1222

:1222
 echo buttontexture�����߂Ă��������B
 echo ���q�I����ʂ̃{�^���̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/button_train.png �ȂǂɂȂ�܂��B)
 set /p button=
 echo �{�^���e�N�X�`���ւ̃p�X�� %button% �ɐݒ肳��܂����B
 echo ------------------
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
 echo ------------------
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
 echo ------------------
 echo trainDistance�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo ����͎ԗ��̒�����2����1�ɂ���Ƃ����ł��傤�B
 set /p trainDistance=
 echo trainDistance�� %trainDistance% �ɐݒ肳��܂����B
 echo ------------------
 echo accuracy�����߂Ă��������B �g�p�\:LOW,MEDIUM
 echo �啶���œ��͂��Ă��������B
 set /p accuracy=
 echo accuracy�� %accuracy% �ɐݒ肳��܂����B
 echo ------------------
 rem option
 echo ���̐�͂��ׂăI�v�V�����ł��B�K�v�Ȃ��ꍇ��enter�𒷉������Ă��������B
 echo json����������ƁAenter�ȊO�������Ă��Ȃ��ꍇ�Ajson���\�������~���܂��B
 pause
 rem option
 echo ------------------
 echo accelerateion�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo  -- N km/h/s �̏ꍇ N x 0.0006944 �̒l������
 set /p accelerateion=
 echo accelerateion�� %accelerateion% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��1�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 set /p maxSpeed1=
 echo maxSpeed��1�߂� %maxSpeed1% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��2�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1%
 set /p maxSpeed2=
 echo maxSpeed��2�߂� %maxSpeed2% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��3�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2%
 set /p maxSpeed3=
 echo maxSpeed��3�߂� %maxSpeed3% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��4�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
 set /p maxSpeed4=
 echo maxSpeed��4�߂� %maxSpeed4% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��5�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
 set /p maxSpeed5=
 echo maxSpeed��5�߂� %maxSpeed5% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_Horn�����߂Ă��������B
 set /p sound_horn=
 echo sound_horn�� %sound_horn% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_DoorOpen�����߂Ă��������B
 set /p sound_DoorOpen=
 echo sound_DoorOpen�� %sound_DoorOpen% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_DoorClose�����߂Ă��������B
 set /p sound_DoorClose=
 echo sound_DoorClose�� %sound_DoorClose% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_Stop�����߂Ă��������B
 set /p sound_Stop=
 echo sound_Stop�� %sound_Stop% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_S_A�����߂Ă��������B
 set /p sound_S_A=
 echo sound_S_A�� %sound_S_A% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_Deceleration�����߂Ă��������B
 set /p sound_Deceleration=
 echo sound_Deceleration�� %sound_Deceleration% �ɐݒ肳��܂����B
 echo ------------------
 echo sound_D_S�����߂Ă��������B
 set /p sound_D_S=
 echo sound_D_S�� %sound_D_S% �ɐݒ肳��܂����B
 echo ------------------
 echo rolling�����߂Ă��������B �g�p�\:0.0~10.0
 set /p rolling=
 echo rolling�� %rolling% �ɐݒ肳��܂����B
 echo ------------------
 echo mutejointsound�����߂Ă��������B �g�p�\:false,true
 set /p mutejointsound=
 echo mutejointsound�� %mutejointsound% �ɐݒ肳��܂����B
 echo -------------------
 echo rollSpeedCoefficient�����߂Ă��������B
 set /p rollSpeedCoefficient=
 echo rollSpeedCoefficient�� %rollSpeedCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 echo rollVariationCoefficient�����߂Ă��������B
 set /p rollVariationCoefficient=
 echo rollVariationCoefficient�� %rollVariationCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 echo rollWidthCoefficient�����߂Ă��������B
 set /p rollWidthCoefficient=
 echo rollWidthCoefficient�� %rollWidthCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 echo useCustomColor�����߂Ă��������B
 set /p useCustomColor=
 echo useCustomColor�� %useCustomColor% �ɐݒ肳��܂����B
 echo -------------------
 echo defaultData�����߂Ă��������B
 set /p defaultData=
 echo defaultData�� %defaultData% �ɐݒ肳��܂����B
 echo -------------------
 echo scale�����߂Ă��������B
 echo ngto���f���̏ꍇ�͐ݒ肵�������悢�ł��傤
 set /p scale=
 echo scale�� %scale% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��1�߂����߂Ă��������B
 set /p offset=
 echo offset��1�߂� %offset% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��2�߂����߂Ă��������B (offset��1�߂� %offset% �ł�)
 set /p offset2=
 echo offset��2�߂� %offset2% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��3�߂����߂Ă��������B (offset1:%offset% , offset2:%offset2%)
 set /p offset3=
 echo offset��3�߂� %offset3% �ɐݒ肳��܂����B
 echo -------------------
 echo smoothing�����߂Ă��������B �g�p�\:false/true
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo -------------------
 echo doCalling�����߂Ă��������B �g�p�\:false/true
 set /p doCalling=
 echo doCalling�� %doCalling% �ɐݒ肳��܂����B
 echo -------------------
 echo serverScriptPath�����߂Ă��������B
 set /p serverScriptPath=
 echo serverScriptPath�� %serverScriptPath% �ɐݒ肳��܂����B
 echo -------------------
 echo guiScriptPath�����߂Ă��������B
 set /p guiScriptPath=
 echo guiScriptPath�� %guiScriptPath% �ɐݒ肳��܂����B
 echo -------------------
 echo guiTexture�����߂Ă��������B
 set /p guiTexture=
 echo guiTexture�� %guiTexture% �ɐݒ肳��܂����B
 echo -------------------
 echo renderAABB��1�߂����߂Ă��������B
 set /p renderAABB1=
 echo renderAABB��1�߂� %renderAABB1% �ł��B
  echo -------------------
 echo renderAABB��2�߂����߂Ă��������B
 set /p renderAABB2=
 echo renderAABB��2�߂� %renderAABB2% �ł��B
  echo -------------------
 echo renderAABB��3�߂����߂Ă��������B
 set /p renderAABB3=
 echo renderAABB��3�߂� %renderAABB3% �ł��B
  echo -------------------
 echo renderAABB��4�߂����߂Ă��������B
 set /p renderAABB4=
 echo renderAABB��4�߂� %renderAABB4% �ł��B
  echo -------------------
 echo renderAABB��5�߂����߂Ă��������B
 set /p renderAABB5=
 echo renderAABB��5�߂� %renderAABB5% �ł��B
  echo -------------------
 echo renderAABB��6�߂����߂Ă��������B
 set /p renderAABB6=
 echo renderAABB��6�߂� %renderAABB6% �ł��B
 echo --------------------
 echo size��1�߂����߂Ă��������B
 set /p size1=
 echo size��1�߂� %size1% �ɐݒ肳��܂����B
 echo --------------------
 echo size��2�߂����߂Ă��������B
 set /p size2=
 echo size��2�߂� %size2% �ɐݒ肳��܂����B
 echo --------------------
 echo soundScriptPath�����߂Ă��������B
 set /p soundScriptPath=
 echo soundScriptPath�� %soundScriptPath% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��x���W�����߂Ă��������B
 set /p smoke1=
 echo smoke�� %smoke1% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��y���W�����߂Ă��������B
 set /p smoke2=
 echo smoke�� %smoke2% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��z���W�����߂Ă��������B
 set /p smoke3=
 echo smoke�� %smoke3% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̃p�[�e�B�N�������߂Ă��������B
 set /p smoke4=
 echo smoke�� %smoke4% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 set /p smoke5=
 echo smoke�� %smoke5% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 set /p smoke6=
 echo smoke�� %smoke6% �ɐݒ肳��܂����B
 echo --------------------
 echo notDisplayCab�����߂Ă��������B
 set /p notDisplayCab=
 echo notDisplayCab�� %notDisplayCab% �ɐݒ肳��܂����B
 echo --------------------
 echo wheelRotationSpeed�����߂Ă��������B
 set /p wheelRotationSpeed=
 echo wheelRotationSpeed�� %wheelRotationSpeed% �ɐݒ肳��܂����B
 echo --------------------
 echo sound_BrakeRelease�����߂Ă��������B
 set /p sound_BrakeRelease=
 echo sound_BrakeRelease�� %sound_BrakeRelease% �ɐݒ肳��܂����B
 echo --------------------
 echo sound_BrakeRelease2�����߂Ă��������B
 set /p sound_BrakeRelease2=
 echo sound_BrakeRelease2�� %sound_BrakeRelease2% �ɐݒ肳��܂����B
 echo --------------------
 echo isSingleTrain�����߂Ă��������B
 set /p isSingleTrain=
 echo isSingleTrain�� %isSingleTrain% �ɐݒ肳��܂����B
 echo --------------------

 echo ���߂łƂ��������܂�!
 echo �������܂���!
 echo ------------
 echo �ȉ��Ɋ����������̂�\�����܂��B
 goto json

:json
 set back=json
 echo -----�t�@�C����:ModelTrain_%trainname%.json-------
 echo {
 echo    "trainName": "%trainname%",
 echo    "trainType": "%traintype%",
 echo    "tags":"%tags%",
 echo    "trainModel2":{"modelFile": "%modelFile%",
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

 if %bogie12% == 1 goto bogie1
 if %bogie12% == 2 goto bogie2
 if %bogie12% == 8273 goto bogie8273
 echo �ϐ����ݒ�:"bogie12" , ��Ԑݒ���X�L�b�v���܂��B
 goto json2
 :bogie8273
  echo debug mode.
  echo skip bogie settings.
  goto json2
 :bogie1
 rem bogiemodel2
  echo  "bogieModel2":{
  echo    "modelFile": "%modelFileb%",
  if %bogie% == 1 echo         "textures":[ ["%bogie1%", "%bogie1texture%"]] },
  if %bogie% == 2 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"]] },
  if %bogie% == 3 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"]] },
  if %bogie% == 4 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"]] },
  if %bogie% == 5 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"]] },
  if %bogie% == 6 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"]] },
  if %bogie% == 7 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"]] },
  if %bogie% == 8 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"]] },
  if %bogie% == 9 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"]] },
  if %bogie% == 10 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"]] },
 
 rem bogiemodel3�����������ꍇ�A���̕��͂�2�s���ȊO��rem���O���Ă��������B
 rem :bogie2
 rem bogiemodel3
  rem echo "bogieModel3":[
  rem if %bogie% == 1 echo         {"modelFile": "%modelFileb%","textures":[ ["%bogie1%", "%bogie1texture%", "%bogie1a%"]]},{"modelFile": "%modelmobie2%","textures":[ ["%bogie1%", "%bogie1texture%", "%bogie1a%"]]} }],


 :json2
 echo  "buttonTexture": "%button%",
 echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]], 
 echo  "bogiePos": [[%bogieposx%, %bogieposy%, %bogieposz%], [%bogiepos2x%, %bogiepos2y%, %bogiepos2z%]], 
 echo  "trainDistance": %trainDistance%, 
 if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%,
 if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%],
 if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%",
 if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%",
 if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%],
 if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": %sound_DoorClose%,
 if not "%sound_Stop%" == "" echo  "sound_Stop": %sound_Stop%,
 if not "%sound_S_A%" == "" echo  "sound_S_A": %sound_S_A%,
 if not "%sound_accleration%" == "" echo  "sound_accleration": %sound_accleration%,
 if not "%Deceleration%" == "" echo  "sound_Deceration": %sound_Deceleration%,
 if not "%sound_D_S%" == "" echo  "sound_D_S": %sound_D_S%,
 if not "%rolling%" == "" echo  "rolling": %rolling%,
 if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%,
 if not "%rollspeedcoefficint%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%,
 if not "%rollWidthCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%,
 if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%,
 if not "%defaultData%" == "" echo  "defaultData": %defaultData%,
 if not "%scale%" == "" echo  "scale": %scale%,
 if not "%smoothing%" == "" echo  "smoothing": %smoothing%,
 if not "%doCalling%" == "" echo  "doCalling": %doCalling%,
 if not "%serverScriptPath%" == "" echo  "serverScriptPath": %serverScriptPath%,
 if not "%guiScriptPath%" == "" echo  "guiScriptPath": %guiScriptPath%,
 if not "%guiTexture%" == "" echo  "guitexture": %guiTexture%,
 if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ]
 if not "%size1%" == "" echo  "size": [%size1% , %size2%]
 if not "%soundScriptPath%" == "" echo  "soundScriptPath": %soundScriptPath%,
 if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]],
 if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%,
 if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%
 echo "accuracy": "%accuracy%"
 echo }
 echo --------------------------------------------------
 echo ����json�Ŗ������Ă��܂���?
 echo �ҏW������ꍇ��1,�I������ꍇ��2�������Ă��������B
 set user=
 set /p user=
 if %user% == 1 goto trainedit
 if %user% == 2 goto 2
 echo �G���[:�s���Ȕԍ�
:trainedit
 echo �ǂ̕�����ҏW���܂���?
 echo ���̂ǂꂩ�̖��O����͂��Ă�������
 echo trainname,traintype,tags,trainmodel2,bogiemodel2,buttontexture,playerpos,bogiepos,traindistance,acceleration,maxspeed1,sound_horn,sound_dooropen,sound_stop,sound_doorclose,offset,sound_s_a,sound_accleration,sound_BrakeRelease,sound_BrakeRelease2,deceleration,sound_d_s,rolling,mutejointsound,rollspeedcoefficient,rollVariationCoefficient,rollWidthCoefficient,usecustomcolor,defaultdata,scale,smoothing,docalling,serverscriptpath,guiscriptpath,guitexture,renderaabb,size,soundscriptpath,smoke,notDisplayCab,wheelRotationSpeed,isSingleTrain,accuracy
 echo trainmodel��mat�̒��g��ύX����ꍇ��"mat"�Ƒł��Ă��������B,bogiemodel�̏ꍇ��"mat2"�ł��B
 set /p user=
 if %user% == trainname goto trainedit_name
 if %user% == traintype goto trainedit_type
 if %user% == tags goto trainedit_tag
 if %user% == trainmodel2 goto trainedit_trainmodel
 if %user% == mat goto trainedit_mat
 if %user% == bogiemodel2 goto trainedit_bogiemodel
 if %user% == mat2 goto trainedit_bogiemat
 if %user% == buttontexture goto trainedit_button
 if %user% == playerpos goto trainedit_player
 if %user% == bogiepos goto trainedit_bogie
 if %user% == traindistance goto trainedit_distance
 if %user% == acceleration goto trainedit_accele
 if %user% == maxspeed goto trainedit_maxspeed
 if %user% == sound_horn goto trainedit_horn
 if %user% == sound_dooropen goto trainedit_dooropen
 if %user% == sound_stop goto trainedit_stop
 if %user% == sound_doorclose goto trainedit_doorclose
 if %user% == offset goto trainedit_off
 if %user% == sound_s_a goto trainedit_sa
 if %user% == sound_accleration goto trainedit_acceles
 if %user% == deceleration goto trainedit_decele
 if %user% == sound_d_s goto trainedit_ds
 if %user% == rolling goto trainedit_rickroll
 if %user% == mutejointsound goto trainedit_mute
 if %user% == rollspeedcoefficient goto trainedit_rollspeed
 if %user% == usecustomcolor goto trainedit_custom
 if %user% == defaultdata goto trainedit_data
 if %user% == scale goto trainedit_scale
 if %user% == smoothing goto trainedit_smooth
 if %user% == docalling goto trainedit_docall
 if %user% == serverscriptpath goto trainedit_server
 if %user% == guiscriptpath goto trainedit_guiscript
 if %user% == guitexture goto trainedit_gui
 if %user% == renderaabb goto trainedit_render
 if %user% == size goto trainedit_size
 if %user% == soundscriptpath goto trainedit_soundscript
 if %user% == smoke goto trainedit_smoke
 if %user% == notDisplayCab goto trainedit_notdisplay
 if %user% == wheelRotationSpeed goto trainedit_wheel
 if %user% == accuracy goto trainedit_accuracy
 if %user% == rollVariationCoefficient goto trainedit_rollvaria
 if %user% == rollWidthCoefficient goto trainedit_roll
 if %user% == sound_BrakeRelease goto trainedit_brake
 if %user% == sound_BrakeRelease2 goto trainedit_brake2
 if %user% == isSingleTrain goto trainedit_single
 echo �G���[:�s���Ȗ��O
 goto json
 :trainedit_name
 echo -----------------
 echo trainName�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)
 echo �m�[�g:����������邽�߂ɁA[��Җ�]_1�̂悤�Ȍ`�ɂ���̂��������߂ł��B(�������[]�͊O���Ă�������)
 set /p trainname=
 echo trainname�� %trainname% �ɐݒ肳��܂����B
 echo -----------------
 goto json
 :trainedit_type
 echo traintype�����߂Ă��������B �g�p�\:EC,DC,CC,TC
 echo EC=�d��
 echo DC=�C����
 echo CC=�ݎ�
 echo TC=�^���N��
 set /p traintype=
 echo traintype�� %traintype% �ɐݒ肳��܂����B 
 echo ------------------
 goto json
 :trainedit_tag
 echo tags�����߂Ă��������B �g�p�\:���p�p����(�p��͏������̂݉\)��","
 echo �����w�肷��ꍇ��","�ŋ�؂��ē��͂��Ă��������B(��:tag1,tag2,tag3)
 set /p tags=
 echo tags�� %tags% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_trainmodel
 echo modelFile�����߂Ă��������B
 echo ��Ԃ�3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFile=
 echo modelFile�� %modelFile% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_mat
 echo ��Ԃ�3D���f���̍ގ��������߂Ă��������B
 set /p mat=
 echo �ގ����� %mat% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p mat1=
 echo �ގ�,1�߂̖��O�� %mat1% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p mat1texture=
 echo %mat1% �̃e�N�X�`���p�X�� %mat1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo %mat1% �� %mat1texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
 set /p mat1a=
 echo %mat1% �� %mat1texture% �̃I�v�V������ %mat1a% �ɐݒ肳��܂����B
 echo ------------------
 if %mat% geq 2 goto editmat2
 goto json
 :editmat2
   echo ��Ԃ�3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat2=
   echo �ގ�,1�߂̖��O�� %mat2% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat2texture=
   echo %mat2% �̃e�N�X�`���p�X�� %mat2texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat2% �� %mat2texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat2a=
   echo %mat2% �� %mat2texture% �̃I�v�V������ %mat2a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 3 goto editmat3
 goto json
 :editmat3
   echo ��Ԃ�3D���f���̍ގ�,3�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat3=
   echo �ގ�,1�߂̖��O�� %mat3% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat3texture=
   echo %mat3% �̃e�N�X�`���p�X�� %mat3texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat3% �� %mat3texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat3a=
   echo %mat3% �� %mat3texture% �̃I�v�V������ %mat3a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 4 goto editmat4
 goto json
 :editmat4
   echo ��Ԃ�3D���f���̍ގ�,4�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat4=
   echo �ގ�,1�߂̖��O�� %mat4% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat4texture=
   echo %mat4% �̃e�N�X�`���p�X�� %mat4texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat4% �� %mat4texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat4a=
   echo %mat4% �� %mat4texture% �̃I�v�V������ %mat4a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 5 goto editmat5
 goto json
 :editmat5
   echo ��Ԃ�3D���f���̍ގ�,5�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat5=
   echo �ގ�,1�߂̖��O�� %mat5% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat5texture=
   echo %mat5% �̃e�N�X�`���p�X�� %mat5texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat5% �� %mat5texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat5a=
   echo %mat5% �� %mat5texture% �̃I�v�V������ %mat5a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 6 goto editmat6
 goto json
 :editmat6
   echo ��Ԃ�3D���f���̍ގ�,6�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat6=
   echo �ގ�,1�߂̖��O�� %mat6% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat6texture=
   echo %mat6% �̃e�N�X�`���p�X�� %mat6texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat6% �� %mat6texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat6a=
   echo %mat6% �� %mat6texture% �̃I�v�V������ %mat6a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 7 goto editmat7
 goto json
 :editmat7
   echo ��Ԃ�3D���f���̍ގ�,7�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat7=
   echo �ގ�,1�߂̖��O�� %mat7% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat7texture=
   echo %mat7% �̃e�N�X�`���p�X�� %mat7texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat7% �� %mat7texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat7a=
   echo %mat7% �� %mat7texture% �̃I�v�V������ %mat7a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 8 goto editmat8
 goto json
 :editmat8
   echo ��Ԃ�3D���f���̍ގ�,8�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat8=
   echo �ގ�,1�߂̖��O�� %mat8% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat8texture=
   echo %mat8% �̃e�N�X�`���p�X�� %mat8texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat8% �� %mat8texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat8a=
   echo %mat8% �� %mat8texture% �̃I�v�V������ %mat8a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 9 goto editmat9
 goto json
 :editmat9
   echo ��Ԃ�3D���f���̍ގ�,9�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat9=
   echo �ގ�,1�߂̖��O�� %mat9% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat9texture=
   echo %mat9% �̃e�N�X�`���p�X�� %mat9texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat9% �� %mat9texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat9a=
   echo %mat9% �� %mat9texture% �̃I�v�V������ %mat9a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 10 goto editmat10
 goto json
 :editmat10
   echo ��Ԃ�3D���f���̍ގ�,10�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p mat10=
   echo �ގ�,1�߂̖��O�� %mat10% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/traintexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p mat10texture=
   echo %mat10% �̃e�N�X�`���p�X�� %mat10texture% �ɐݒ肳��܂����B
   echo ------------------
   echo %mat10% �� %mat10texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
   set /p mat10a=
   echo %mat10% �� %mat10texture% �̃I�v�V������ %mat10a% �ɐݒ肳��܂����B
   echo ------------------
 if %mat% geq 11 goto editmat11
 goto json
 :trainedit_bogiemodel
 echo modelfile�����߂Ă��������B
 echo �{�M�[��3D���f���̃t�@�C������"�g���q����"�œ��͂��Ă��������B
 set /p modelFileb=
 echo modelFile�� %modelFileb% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_bogiemat
 echo �{�M�[��3D���f���̍ގ��������߂Ă��������B
 set /p bogie=
 echo �ގ����� %bogie% �ɐݒ肳��܂����B
 echo ------------------
 echo ��Ԃ�3D���f���̍ގ�,1�߂̖��O�����߂Ă��������B
 echo �ގ�������͂��Ă��������B
 set /p bogie1=
 echo �ގ�,1�߂̖��O�� %bogie1% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
 echo �I�v�V�����͎��Őݒ肵�܂��B
 set /p bogie1texture=
 echo %bogie1% �̃e�N�X�`���p�X�� %bogie1texture% �ɐݒ肳��܂����B
 echo ------------------
 echo %bogie1% �� %bogie1texture% �ɃI�v�V���������܂���? �g�p�\: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo �I�v�V������ݒ肵�Ȃ�/�悭�킩��Ȃ��̂Ȃ�΁A�������͂�����enter���Ă�������
 set /p bogie1a=
 echo %bogie1% �� %bogie1texture% �̃I�v�V������ %bogie1a% �ɐݒ肳��܂����B
 echo ------------------
 if %bogie% geq 2 goto editbogie2
 goto json
 :editbogie2
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie2=
   echo �ގ�,1�߂̖��O�� %bogie2% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie2% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie2texture=
   echo %bogie2% �̃e�N�X�`���p�X�� %bogie2texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 3 goto editbogie3
 goto json
 :editbogie3
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie3=
   echo �ގ�,1�߂̖��O�� %bogie3% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie3% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie3texture=
   echo %bogie3% �̃e�N�X�`���p�X�� %bogie3texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 4 goto editbogie4
 goto json
 :editbogie4
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie4=
   echo �ގ�,1�߂̖��O�� %bogie4% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie4% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie4texture=
   echo %bogie4% �̃e�N�X�`���p�X�� %bogie4texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 5 goto editbogie5
 goto json
 :editbogie5
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie5=
   echo �ގ�,1�߂̖��O�� %bogie5% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie5% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie5texture=
   echo %bogie5% �̃e�N�X�`���p�X�� %bogie5texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 6 goto editbogie6
 goto json
 :editbogie6
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie6=
   echo �ގ�,1�߂̖��O�� %bogie6% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie6% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie6texture=
   echo %bogie6% �̃e�N�X�`���p�X�� %bogie6texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 7 goto editbogie7
 goto json
 :editbogie7
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie7=
   echo �ގ�,1�߂̖��O�� %bogie7% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie7% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie7texture=
   echo %bogie7% �̃e�N�X�`���p�X�� %bogie7texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 8 goto editbogie8
 goto json
 :editbogie8
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie8=
   echo �ގ�,1�߂̖��O�� %bogie8% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie8% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie8texture=
   echo %bogie8% �̃e�N�X�`���p�X�� %bogie8texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 9 goto editbogie9
 goto json
 :bogie9
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie9=
   echo �ގ�,1�߂̖��O�� %bogie9% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie9% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie9texture=
   echo %bogie9% �̃e�N�X�`���p�X�� %bogie9texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 10 goto editbogie10
 goto json
 :editbogie10
   echo �{�M�[��3D���f���̍ގ�,2�߂̖��O�����߂Ă��������B
   echo �ގ�������͂��Ă��������B
   set /p bogie10=
   echo �ގ�,1�߂̖��O�� %bogie10% �ɐݒ肳��܂����B
   echo ------------------
   echo %bogie10% �̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/bogietexture.png �ȂǂɂȂ�܂��B)
   echo �I�v�V�����͎��Őݒ肵�܂��B
   set /p bogie10texture=
   echo %bogie10% �̃e�N�X�`���p�X�� %bogie10texture% �ɐݒ肳��܂����B
   echo ------------------
 if %bogie% geq 11 goto editbogie11
 goto json
 :trainedit_button
 echo buttontexture�����߂Ă��������B
 echo ���q�I����ʂ̃{�^���̃e�N�X�`���ւ̃p�X���L�q���Ă��������B(���ʂł���΁A textures/train/button_train.png �ȂǂɂȂ�܂��B)
 set /p button=
 echo �{�^���e�N�X�`���ւ̃p�X�� %button% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_player
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
 echo ------------------
 goto json
 :trainedit_bogie
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
 echo ------------------
 goto json
 :trainedit_distance
 echo trainDistance�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo ����͎ԗ��̒�����2����1�ɂ���Ƃ����ł��傤�B
 set /p trainDistance=
 echo trainDistance�� %trainDistance% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_accuracy
 echo accuracy�����߂Ă��������B �g�p�\:LOW,MEDIUM
 echo �啶���œ��͂��Ă��������B
 set /p accuracy=
 echo accuracy�� %accuracy% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_accele
 echo accelerateion�����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo  -- N km/h/s �̏ꍇ N x 0.0006944 �̒l������
 set /p accelerateion=
 echo accelerateion�� %accelerateion% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_maxspeed
 echo maxSpeed��1�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 set /p maxSpeed1=
 echo maxSpeed��1�߂� %maxSpeed1% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��2�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1%
 set /p maxSpeed2=
 echo maxSpeed��2�߂� %maxSpeed2% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��3�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2%
 set /p maxSpeed3=
 echo maxSpeed��3�߂� %maxSpeed3% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��4�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
 set /p maxSpeed4=
 echo maxSpeed��4�߂� %maxSpeed4% �ɐݒ肳��܂����B
 echo ------------------
 echo maxSpeed��5�߂����߂Ă��������B �g�p�\:3���܂ł̐����Ə������ʂ܂�
 echo 0.1�ɂ�13km/h(���Ԃ�)
 echo ���݂̐ݒ�: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
 set /p maxSpeed5=
 echo maxSpeed��5�߂� %maxSpeed5% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_horn
 echo sound_Horn�����߂Ă��������B
 set /p sound_horn=
 echo sound_horn�� %sound_horn% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_dooropen
 echo sound_DoorOpen�����߂Ă��������B
 set /p sound_DoorOpen=
 echo sound_DoorOpen�� %sound_DoorOpen% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_doorclose
 echo sound_DoorClose�����߂Ă��������B
 set /p sound_DoorClose=
 echo sound_DoorClose�� %sound_DoorClose% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_stop
 echo sound_Stop�����߂Ă��������B
 set /p sound_Stop=
 echo sound_Stop�� %sound_Stop% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_sa
 echo sound_S_A�����߂Ă��������B
 set /p sound_S_A=
 echo sound_S_A�� %sound_S_A% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_decele
 echo sound_Deceleration�����߂Ă��������B
 set /p sound_Deceleration=
 echo sound_Deceleration�� %sound_Deceleration% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_ds
 echo sound_D_S�����߂Ă��������B
 set /p sound_D_S=
 echo sound_D_S�� %sound_D_S% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_rickroll
 echo rolling�����߂Ă��������B �g�p�\:0.0~10.0
 set /p rolling=
 echo rolling�� %rolling% �ɐݒ肳��܂����B
 echo ------------------
 goto json
 :trainedit_mute
 echo mutejointsound�����߂Ă��������B �g�p�\:false,true
 set /p mutejointsound=
 echo mutejointsound�� %mutejointsound% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_rollspeed
 echo rollSpeedCoefficient�����߂Ă��������B
 set /p rollSpeedCoefficient=
 echo rollSpeedCoefficient�� %rollSpeedCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_rollvaria
 echo rollVariationCoefficient�����߂Ă��������B
 set /p rollVariationCoefficient=
 echo rollVariationCoefficient�� %rollVariationCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_roll
 echo rollWidthCoefficient�����߂Ă��������B
 set /p rollWidthCoefficient=
 echo rollWidthCoefficient�� %rollWidthCoefficient% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_custom
 echo useCustomColor�����߂Ă��������B
 set /p useCustomColor=
 echo useCustomColor�� %useCustomColor% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_data
 echo defaultData�����߂Ă��������B
 set /p defaultData=
 echo defaultData�� %defaultData% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_scale
 echo scale�����߂Ă��������B
 echo ngto���f���̏ꍇ�͐ݒ肵�������悢�ł��傤
 set /p scale=
 echo scale�� %scale% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_off
 echo offset��1�߂����߂Ă��������B
 set /p offset=
 echo offset��1�߂� %offset% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��2�߂����߂Ă��������B (offset��1�߂� %offset% �ł�)
 set /p offset2=
 echo offset��2�߂� %offset2% �ɐݒ肳��܂����B
 echo -------------------
 echo offset��3�߂����߂Ă��������B (offset1:%offset% , offset2:%offset2%)
 set /p offset3=
 echo offset��3�߂� %offset3% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_smooth
 echo smoothing�����߂Ă��������B �g�p�\:false/true
 set /p smoothing=
 echo smoothing�� %smoothing% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_docall
 echo doCalling�����߂Ă��������B �g�p�\:false/true
 set /p doCalling=
 echo doCalling�� %doCalling% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_server
 echo serverScriptPath�����߂Ă��������B
 set /p serverScriptPath=
 echo serverScriptPath�� %serverScriptPath% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_guiscript
 echo guiScriptPath�����߂Ă��������B
 set /p guiScriptPath=
 echo guiScriptPath�� %guiScriptPath% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_gui
 echo guiTexture�����߂Ă��������B
 set /p guiTexture=
 echo guiTexture�� %guiTexture% �ɐݒ肳��܂����B
 echo -------------------
 goto json
 :trainedit_render
 echo renderAABB��1�߂����߂Ă��������B
 set /p renderAABB1=
 echo renderAABB��1�߂� %renderAABB1% �ł��B
  echo -------------------
 echo renderAABB��2�߂����߂Ă��������B
 set /p renderAABB2=
 echo renderAABB��2�߂� %renderAABB2% �ł��B
  echo -------------------
 echo renderAABB��3�߂����߂Ă��������B
 set /p renderAABB3=
 echo renderAABB��3�߂� %renderAABB3% �ł��B
  echo -------------------
 echo renderAABB��4�߂����߂Ă��������B
 set /p renderAABB4=
 echo renderAABB��4�߂� %renderAABB4% �ł��B
  echo -------------------
 echo renderAABB��5�߂����߂Ă��������B
 set /p renderAABB5=
 echo renderAABB��5�߂� %renderAABB5% �ł��B
  echo -------------------
 echo renderAABB��6�߂����߂Ă��������B
 set /p renderAABB6=
 echo renderAABB��6�߂� %renderAABB6% �ł��B
 echo --------------------
 goto json
 :trainedit_size
 echo size��1�߂����߂Ă��������B
 set /p size1=
 echo size��1�߂� %size1% �ɐݒ肳��܂����B
 echo --------------------
 echo size��2�߂����߂Ă��������B
 set /p size2=
 echo size��2�߂� %size2% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_soundscript
 echo soundScriptPath�����߂Ă��������B
 set /p soundScriptPath=
 echo soundScriptPath�� %soundScriptPath% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_smoke
 echo smoke�̏o��x���W�����߂Ă��������B
 set /p smoke1=
 echo smoke�� %smoke1% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��y���W�����߂Ă��������B
 set /p smoke2=
 echo smoke�� %smoke2% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̏o��z���W�����߂Ă��������B
 set /p smoke3=
 echo smoke�� %smoke3% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�̃p�[�e�B�N�������߂Ă��������B
 set /p smoke4=
 echo smoke�� %smoke4% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 set /p smoke5=
 echo smoke�� %smoke5% �ɐݒ肳��܂����B
 echo --------------------
 echo smoke�����߂Ă��������B
 set /p smoke6=
 echo smoke�� %smoke6% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_notdisplay
 echo notDisplayCab�����߂Ă��������B
 set /p notDisplayCab=
 echo notDisplayCab�� %notDisplayCab% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_wheel
 echo wheelRotationSpeed�����߂Ă��������B
 set /p wheelRotationSpeed=
 echo wheelRotationSpeed�� %wheelRotationSpeed% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_brake
 echo sound_BrakeRelease�����߂Ă��������B
 set /p sound_BrakeRelease=
 echo sound_BrakeRelease�� %sound_BrakeRelease% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_2
 echo sound_BrakeRelease2�����߂Ă��������B
 set /p sound_BrakeRelease2=
 echo sound_BrakeRelease2�� %sound_BrakeRelease2% �ɐݒ肳��܂����B
 echo --------------------
 goto json
 :trainedit_single
 echo isSingleTrain�����߂Ă��������B
 set /p isSingleTrain=
 echo isSingleTrain�� %isSingleTrain% �ɐݒ肳��܂����B
 goto json 
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
 echo height�����߂Ă��������B �g�p�\:�����Ə������ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̍����ɂȂ�܂��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə������ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��̒����ɂȂ�܂��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 echo -------------
 echo depth�����߂Ă��������B �g�p�\:�����Ə������ʂ܂�(��:0.375)
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
 echo ����json�Ŗ������Ă��܂���?
 echo �ҏW������ꍇ��1,�I������ꍇ��2�������Ă��������B
 set user=
 set /p user=
 if %user% == 1 goto signedit
 if %user% == 2 goto 2
 echo �G���[:�s���Ȕԍ�
 goto signjson
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
 echo height�����߂Ă��������B �g�p�\:�����Ə������ʂ܂�(��:0.75) 
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̍����ɂȂ�܂��B
 set /p height=
 echo height�� %height% �ɐݒ肳��܂����B
 goto signjson
 :signedit_w
 echo -------------
 echo width�����߂Ă��������B  �g�p�\:�����Ə������ʂ܂�(��:2.25)
 echo �P�ʂ�"���[�g��"�ł��B
 echo ����͊Ŕ̉��̒����ɂȂ�܂��B
 set /p width=
 echo width�� %width% �ɐݒ肳��܂����B
 goto signjson
 :signedit_d
 echo -------------
 echo depth�����߂Ă��������B �g�p�\:�����Ə������ʂ܂�(��:0.375)
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
echo akikawa9616�̘A����:twitter:@akikawa_9616,mail:akikawa9616@outlook.jp
echo ----
echo �X�y�V�����T���N�X
echo  json�̃f�[�^�l�̒�
echo   -- .zip
echo   -- [�X�y�V�����T���N�X,�񓚑҂�]
echo  �f�o�b�O
echo   -- akikawa9616
echo  (c) 2022-2023 akikawa9616
echo thank you !
pause
cls
goto selectwelcome
rem memo
 rem �ϐ�:bogie �̓{�M�[�ގ����̔���ɂ̂ݎg�p���܂��B  bogiemodel2��bogiemodel3�ŋ��p�ł��B(bogiemodel3�̏ꍇ�͑O�ɂȂ�܂��B)
 rem �ϐ�:bogie2 ��bogiemodel3�̂Ƃ��̂ݎg�p���A��̃��f���̍ގ����ł��B
rem �Ή����Ă���f�[�^�l
 rem train
  rem trainname,traintype,tags,trainmodel2,bogiemodel2,buttontexture,playerpos,bogiepos,traindistance,acceleration,maxspeed1,sound_horn,sound_dooropen,sound_stop,sound_doorclose,offset,sound_s_a,sound_accleration,sound_BrakeRelease,sound_BrakeRelease2,deceleration,sound_d_s,rolling,mutejointsound,rollspeedcoefficient,rollVariationCoefficient,rollWidthCoefficient,usecustomcolor,defaultdata,scale,smoothing,docalling,serverscriptpath,guiscriptpath,guitexture,renderaabb,size,soundscriptpath,smoke,notDisplayCab,wheelRotationSpeed,isSingleTrain,accuracy
 rem signboard
  rem texture,backtexture,height,width,depth,frame,animationcycle,color,lightvalue