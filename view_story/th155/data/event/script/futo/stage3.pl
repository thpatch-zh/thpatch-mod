#========================================================================
#	�z�s�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F��ց@�G�`�[���F�h���~�[�@俎q
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,futo,futo,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,ichirin2,ichirin,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy,doremy,2p,1040,0,true

#2Pslave
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami2,usami,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,doremy_name,doremy,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/usami/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,�{1,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,doremy,��1,0,0
,ImageDef,usami2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,futo,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,futo		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,�{1,0,0
�ӂށA���������ȏꏊ����\,a,0,0,"Hmm, a strange place this is." 
,ClearBalloon,futo#�Ώۂ̐����o������

# =====
,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Show,ichirin2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2		,#�������L�������w��
,ImageDef,ichirin2,��1,0,0
�������S�߈˂͐�������\n�݂��������ǁc�c\,a,0,0,"It seems like forced Perfect Possession succeeded but�c�c."
,ImageDef,ichirin2,�f1,0,0
���񂽁A�����͉����Ȃ̂�\,a,0,0,"Futo, where is this place?"
,ClearBalloon,ichirin2

# =====
,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,�f1,0,0
�S�������\n�C���t�����炱��ȂƂ����\,c,0,0,"I do not know. \nWhen I came to, I was here."
,ClearBalloon,futo#�����o������

,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,doremy,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��1,0,0
����͋�����\,a,0,0,"This is surprising."
,ImageDef,doremy,��1,0,0
���̐��E�ɂ���l��\n���S�߈˂����������̂�\,a,0,0,"It seems Perfect Possession is achievable on those in the Dream World."
,ClearBalloon,doremy

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
���̐��E�A���ƁH\,a,0,0,"The Dream World you say?"
,ClearBalloon,futo#�����o������

,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ʏ�A���̐��E�ɂ���l�Ԃ�\n���S�߈˂��邱�Ƃ͏o���Ȃ�\,a,0,0,"Usually, Perfect Possession is not possible on humans in the Dream World."
,ImageDef,doremy,�]1,0,0
�����ǋM���B��\n�}�X�^�[�����ӂ���`��\n���S�߈˂���\,a,0,0,"But the two of you were able to use Perfect Possession with the Master's consent."
,ImageDef,doremy,��1,0,0
�}�X�^�[���Q�ڂ��Ȃ���\n���S�߈˂ɓ��ӂ����Ƃ���\n�ɂ߂Ē������P�[�X����\,a,0,0,"The Master agreeing to Perfect Possession while half asleep is a very rare case."
,ClearBalloon,doremy

# =====
,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,ichirin2		,#�������L�������w��
,ImageDef,ichirin2,��1,0,0
���Ă��Ƃ́A���񂽐Q�Ă��́H\,a,0,0,"So you were asleep?"
,ClearBalloon,ichirin2

# =====
,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
���A����\n�ǂ�����������\,a,0,0,"Hm, I wonder."
,ImageDef,futo,�{1,0,0
������A���������邼\n�ق�A�ڂ̑O�̂�����\n���S�߈˂��Ă���\,a,0,0,"More importantly, let us continue investigating. \nLook, this fellow in front of us is under perfect possession."
,ImageDef,futo,��1,0,0
���S�߈ː�̎��풲����\,a,0,0,"This will be a battle investigation of Perfect Possession."
,ClearBalloon,futo#�����o������

,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��1,0,0
�키�̂ł���\,a,0,0,"So you would like to fight."
,ImageDef,doremy,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�A���A���͊��S�߈˂��Ă���\n�킯�ł͂���܂���\,a,0,0,"But it doesn't mean I'm under Perfect Possession."
,ImageDef,doremy,��1,0,0
�f�r���閲����ی삵�Ă�����\n�߂��Ȃ��̂ł���\n����ł��ǂ����\,c,0,0,"I was only protecting a wandering dream soul. \nBut if that's okay with you..."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(316)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,futo,��1,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,doremy,�]1,0,0
,ImageDef,usami2,�]1,0,0

,Show,futo,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,doremy,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,futo
,SetFocus,doremy
,ImageDef,doremy,�]1,0,0
���̒��ł̔s�k��\n���x���W�o���Ȃ����J�ł��傤\,a,0,0,"It must be embarrassing you can't get revenge after losing in a dream."
,ClearBalloon,doremy

,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&
,Hide,doremy,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",	


#�����\��ݒ�
,ImageDef,futo,��1,0,0
,ImageDef,ichirin2,�]1,0,0
,ImageDef,doremy,��1,0,0
,ImageDef,usami2,��1,0,0

,Show,futo,-1280	,&#�t�F�C�X�\���J�n
,Show,doremy,-1280	,&#�t�F�C�X�\���J�n
#,Show,usami,-1280	,#�t�F�C�X�\���J�n

,SetFocus,doremy
,SetFocus,futo		,	#�����L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������I\,a,0,0,"Victory!"
,ImageDef,futo,�f1,0,0
�������A�������̂Ȃ�\n�s�v�c�ȍU���΂��肾��\n����͉��҂��H\,a,0,0,"Although there were many mysterious attacks I've never seen. \nWho are you?
,ClearBalloon,futo#�����o������

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,SetFocus,doremy
,ImageDef,doremy,�G1,0,0
���̓h���~�[�E�X�C�[�g\n���̎x�z�҂ł�\,a,0,0,"I am Doremy Sweet, ruler of the Dream World."
,ClearBalloon,doremy

,SetFocus,doremy
,ImageDef,doremy,��1,0,0
���S�߈˂Ƃ�\n���̐��E�̎����������鎖��\n�s���܂�\,a,0,0,"Perfect possession occurs by taking over your dream self."
,ImageDef,doremy,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̍���D�������̏���\n�ƌ��������o���Ă����ĉ�����\,a,0,0,"Please remember stealing the Dream World is the deed of the devil.
,ClearBalloon,doremy

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,�f1,0,0
�ǂ��������Ƃ���H\,a,0,0,"What do you mean?
,ClearBalloon,futo#�����o������

,SetFocus,doremy
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂���Ă����\n���������Ȃ��Ȃ�܂�\,a,0,0,"During Perfect Possession, you will not be able to see dreams."
,ImageDef,doremy,�f1,0,0
���̊Ԃ̖��́A��̉����֏�����\n���܂��̂ł��傤\,a,0,0,"The dreams during that time, just where do they disappear...?"
,ClearBalloon,doremy

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
�ށA���������Ă���̂�����Ȃ�\,c,0,0,"Hm, I do not understand."
�ӎ�����ԁc�c\,c,0,0,"Starting to lose consciousness�c"
,ClearBalloon,futo#�����o������

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.StageOut_SlideUpper()"#���`�[������ʏ�փW�����v���E

,SetFocus,doremy
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�}�X�^�[���ڂ��o�܂����悤��\,a,0,0,"The Master seems to have awoken."
,ImageDef,doremy,�{1,0,0
���̂܂܂ł�\n���̂���ǂ��o���ꂽ���̐��E��\n�ҒB���\�����Ă��܂�\,a,0,0,"If this continues, \nthose in the Dream World who were driven out of their body, will lose control."
,ImageDef,doremy,��2,0,0
���낵�����Ƃ��n�܂�O��\n���S�߈ˈٕς���������\n�ق������̂�\,a,0,0,"Before something horrible happens, \nI hope the Perfect Possession incident is resolved."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy,-1280,

,Sleep,60

,End

# -------------------------------------------------------
