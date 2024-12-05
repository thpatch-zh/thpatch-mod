#========================================================================
#	�����F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F�_�q�@�h���~�[
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,jyoon,jyoon,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,shion,"data/event/pic/shion/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,shion2,shion,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(403)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,�{1,0,0
,ImageDef,shion2,��2,0,0
,ImageDef,miko,��2,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,50#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#�����o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko	,
,ImageDef,miko,��2,0,0
�ق��A���O�B\n���玀�ɂɗ����̂���\n���y���Ȃǌ����Ă����ʂ�\,a,0,0,"Ah, you came to die by your own will. \nDon't expect a mercy killing."
,ClearBalloon,miko

,SetFocus,jyoon	,
,ImageDef,jyoon,�{1,0,0
�����Ȃ藐�\���Ȃ�\,a,0,0,"So rude."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��2,0,0
�ł����ꂾ������\n���̏Z�l������Ȃ���˂�\,a,0,0,"It's not enough to tell if it's a dream dweller."
,ClearBalloon,shion2

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
�������������z��������Ȃ�\,a,0,0,"She might always be like this."
,ClearBalloon,shion2

,SetFocus,miko	,
,ImageDef,miko,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�n����Γ݂���\n���O�B�̑��݂�\n���̐��̊Q���ł���\,a,0,0,"A light purse makes a heavy heart. \nYour existence is an evil to this world."
,ImageDef,miko,�]1,0,0
���܂����ŏ��ł����Ă�낤\,a,0,0,"Let me eliminate you now."
,ClearBalloon,miko

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�r���I�ȓz���ȁ[\n�a���ȂċM���ƂȂ��񂶂�\n�Ȃ������̂���\,a,0,0,"So snooty. \nWasn't it harmony is the greatest of virtues?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̏Z�l���낤���Ⴈ����\n����Ȃ�\��Ȃ���\,a,0,0,"I don't care if she's a dream dweller or not."
,ImageDef,shion2,��1,0,0
��������Ⴆ�I\,b,0,0,"Get her!"
,ClearBalloon,shion2

,SetFocus,miko	,
,ImageDef,miko,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���O�B�݂�����\n�S�̒ꂩ��n�����z���\n�F�߂�a�Ȃǎ������킹�Ă��Ȃ�\,a,0,0,"I have no peace for those who are poor from the bottom of the heart like you."
�������̐��E�������������I\,b,0,0,"Leave this world at once!"
,ClearBalloon,miko

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(306)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,miko,�]1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,shion2,-1280	,&#�t�F�C�X�\���J�n
,Show,miko,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,miko	,
,ImageDef,miko,�]1,0,0
�����̎��͊Â���\n�����Ɨ͂����������\n�ǂ��̂�\,a,0,0,"My Real World self is too soft. \nI should show off more of my power."
,ClearBalloon,miko

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,miko,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,Show,miko,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,miko	,
,SetFocus,jyoon	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����ς薲�̏Z�l�������ˁ[\n��[���A�Q�b�g���[\,a,0,0,"A dream dweller just like I thought. \nAll right, we got her!"
,ClearBalloon,jyoon

,SetFocus,miko	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������\n���̎��Ȃ炨�O�B��\n���������Ƃ��邾�낤\,a,0,0,"How frustrating. \nMy Real World self would probably let you live."
,ClearBalloon,miko

,SetFocus,miko	,
�����ł��̐��̈���ł��Ȃ��̂�\n���O�ł���\n���ꂪ���ɂ���\,a,0,0,"It's unfortunate evil in this world cannot be destroyed. \nAnd disappointing."
,ClearBalloon,miko

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�͂��͂�\n���񂽂͖{�C�Ŏ��B�̎���\n�����Ă���񂾂�\,a,0,0,"Ok ok, you really hate us, don't you?"
,ImageDef,shion2,�]1,0,0
�������������\,a,0,0,"We're used to it."
,ClearBalloon,shion2

,SetFocus,miko	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ă���̂ł͂Ȃ�\n���̐���������Ȃ���΂����Ȃ�\n�g���ɋ���Ă���̂�\,c,0,0,"I do not hate you. \nI am driven by a mission to destroy those who must be from ridden from this world."
���ꂪ���z���̘a�ł���\,a,0,0,"That is the peace of Gensokyo."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
