#========================================================================
#	�����F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F���@�h���~�[
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
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(404)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,�{1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,hijiri,��2,0,0
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

#,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
#,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,hijiri,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri	,
,ImageDef,hijiri,��2,0,0
����\n��̑|���͏I������̂�����\,a,0,0,"Jyoon, did you finish cleaning the yard?"
,ClearBalloon,hijiri

,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,�{1,0,0
�ׁ[�I\n���܂ł����̑|���Ȃ�\n���݂����ꂽ������Ă������I\,a,0,0,"Whatever! \nI can't keep cleaning this Temple forever!"
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,��1,0,0
������̂ł����H\n�ł́A�M�������ł����܂�\,a,0,0,"Are you going to run away? \nThen I will destroy you."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,�]1,0,0
�͂��H�@���ŁH\n�o�������Ȃ����Ă݂��\,a,0,0,"Huh? Destroy? \nTry it if you can."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�C���t���Ȃ������̂ł����H\n�M���̔]���ɂ�\R[���Ŕ��e|�E�E�E�E]��\n���ߍ��܂�Ă���̂ł�\,a,0,0,"Did you not realize? \nYour brain is embedded with an extinction bomb."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
��H�@���Ŕ��e�H\n�Ȃ񂶂Ⴛ���\,c,0,0,"Wha�c? An extinction bomb? \nWhat's that."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,�]1,0,0
���̎����Ŕ������܂���\n�M�������R����ꍇ�́A�����܂�\,a,0,0,"It will trigger with my spell. \nIf you oppose, I will start chanting."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���A����ȏ�k���[\,a,0,0,"What kind of joke is that."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
�R���ǂ�������Ȃ���\n�ǂ�����H\,a,0,0,"I can't tell if it's a lie. \nWhat do you wanna do?"
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,�]1,0,0
���܂��Ă邶��Ȃ��I\,b,0,0,"Duh!"
,ImageDef,jyoon,��1,0,0
���������������Ȃ��悤��\n�U�ߑ�����܂ł�I\,b,0,0,"Attack so she can't chant the spell!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(304)",# �w��BGM�Đ��J�n

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
,ImageDef,hijiri,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,shion2,-1280	,&
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,hijiri	,
,ImageDef,hijiri,��1,0,0
�ȁ[��Ă�\n���Ŕ��e�Ȃ�Ă����\n�y�Ȃ񂾂��ǂ�\,a,0,0,"As if. \nIt would be easier if there was a extinction bomb though."
,ClearBalloon,hijiri

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,

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
,ImageDef,shion2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,doremy2,��1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,hijiri	,
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ȁ[��\n���������̏Z�l�����\,a,0,0,"Huh, she was a dream dweller too."
,ImageDef,jyoon,�]1,0,0
���Ŕ��e���ĉR�ł���H\n�r�r���đ������[\,a,0,0,"The extinction bomb was a lie right? \nWhat a waste of time being scared."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�o���������\n���ȓz���ȒP�ɏ��łł���\n�����͂Ȃ����ȁ[�A���Ďv������\,a,0,0,"You're right. \nI wish there was a spell to easily destroy those I hate."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�l�ɂ͋�J�������邭����\n���������ȍl���������Ă�̂˂�\,a,0,0,"Even though you force work on others�c \nyou sure have a lazy way of thinking."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�y������͈̂��ł͂Ȃ���\n�C�Ƃ��Ȃ��Ă�����΂����\n�z�������Ƃ͂Ȃ�����Ȃ�\,a,0,0,"Living comfortably isn't a sin. \nIt's better to reach enlightenment without meditation."
�Ƃ���ŋM���A�����Ȃ��ł�\,a,0,0,"By the way, don't run away."
��q�B�ɏC�Ƃ��Ƃ����Ă���\n�|���A�����A�������点��\n��񂾂���ˁB�����y���邽�߂�\,a,0,0,"I have my disciples clean, cook, and wash \nunder the guise of meditation training to make my life easier."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
���ꂪ��������V��̖{��������\,a,0,0,"This must be the true colors of the lazy monk."
,ImageDef,jyoon,��1,0,0
�c�c�ς�\n�����}�ɐe�ߊ����N���Ă���\,a,0,0,"�c�cstrange. \nI suddenly feel close to her."
,ImageDef,jyoon,�]1,0,0
����������Ƃ�����\n���󂵂Ă݂悤����\,a,0,0,"Maybe I'll stay at the temple a little longer."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
����A����\T[!?]\,a,0,0,"Jyo, Jyoon!?"
,ClearBalloon,shion2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
