@echo off
set user=
goto :3
:2
 echo -------------------
 echo ���s����Ɠ��e�������܂��B
 echo ���s���Ă���낵���ł���?
 set user=
 set /p user=(y / n)
 if %user% == y goto 21
 if %user% == n goto %back%
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