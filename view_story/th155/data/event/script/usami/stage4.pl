#========================================================================
#	���q�F�X�e�[�W4�@����
#	�ꏊ�F
#   �X���C�u�F�h���~�[�@�G�`�[���F��
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,usami,usami,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,doremy2,doremy,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,yukari,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,usami,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,usami		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
����������\n�N���ɒ͂܂ꂽ�悤��\,c,0,0,"Ow ow ow. \nI feel like someone grabbed me."
,ClearBalloon,usami#�Ώۂ̐����o������

# =====
,Hide,usami,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��1,0,0
�����́A���̐��E��\n�����I�ɖ��̒�����\n��������o���ꂽ�悤��\,a,0,0,"This is the Real World. \nIt looks like you were pulled out of the dream by force."
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
���H�@�����̌��z���H\n�������\,a,0,0,"Huh? The usual Gensokyo? \nYay."
,ClearBalloon,usami#�����o������

,Hide,usami,-1280,
,Hide,doremy2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,yukari,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��2,0,0
����ɂ���\,a,0,0,"Hello."
,ClearBalloon,yukari

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
����΂��\n�M���́H\,a,0,0,"Good evening, and you are...?"
,ClearBalloon,usami#�����o������

,Function,"::battle.Show_EnemyName()",
,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
���͔��_��\n�M���ɋ~���̎��\n�����̂΂��ɗ��܂���\,a,0,0,"I'm Yukari Yakumo. \nI came to lend you a hand."
,ClearBalloon,yukari

,SetFocus,usami,	#�������L�������w��
,ImageDef,usami,��1,0,0
�s�v�c�̐��E����\n�A��o���Ă��ꂽ�̂�\n����������[�A���肪�Ƃˁ[\,a,0,0,"You took me out of a strange world. \nThank you for saving me."
,ClearBalloon,usami

,Hide,usami,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,doremy2,	#�������L�������w��
,ImageDef,doremy2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����܂�\n���̐��E�ɖ��f�Ŋ�����Ȃ��\n���[���ᔽ�ł�\,a,0,0,"That's a problem. \nInterfering without permission in the Dream World is against the rules.
,ClearBalloon,doremy2

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,�{1,0,0
����A���̏Z�l�����z���Ŗ\���\n�̂̓��[���ᔽ����Ȃ��āH\,a,0,0,"Oh so out of control dream dwellers isn't against the rules?"
,ImageDef,yukari,�]1,0,0
���̐��E��俎q��\n������ő�\�ꂵ�Ă����̂ɂ˂�\,a,0,0,"The Dream World Sumireko was creating a big mess over here."
,ClearBalloon,yukari

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,�]1,0,0
���́A���̖\���V��\n�O�̐��E�ɑ���Ԃ��ׂ�\n���̐��E����A��o�����̂�\,a,0,0,"I brought this naughty one out of the Dream World \nto send back to the Outside World."
,ClearBalloon,yukari

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
�����H�@�O�̐��E�ɁH\n�܊p���z���ɖ߂��ė����̂Ɂ[\,a,0,0,"What?? To the Outside World? \nBut I finally got back to the Gensokyo."
,ClearBalloon,usami#�����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(318)",# �w��BGM�Đ��J�n

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
�ⓚ���p�I\n�������Ə�����I\,b,0,0,"No arguing! \nQuickly get lost!"
,ClearBalloon,yukari


#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,yukari,��1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami

,SetFocus,yukari
���̐��E��俎q�Ȃ�\n�O�̐��E�ɑ���Ԃ�����\,a,0,0,"I sent the Dream World Sumireko back to the Outside World."
,ClearBalloon,yukari

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"if(::battle.team[0].current == ::battle.team[0].master )::battle.team[0].current.Team_Change_Slave(null)",

#�����\��ݒ�
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,�]1,0,0
,ImageDef,yukari,��1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
#,Show,koishi,-1280	,#�t�F�C�X�\���J�n

# =====
,Hide,usami,-1280, &

,SetFocus,yukari
,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ǂ̂悤�ȗ��R�ł���\n���̐��E�Ɋ������̂�\n����܂�\,a,0,0,"Whatever the reason, interfering with the Dream World is a problem."
,ImageDef,doremy2,��1,0,0
����俎q�̖\����\n�匳�͌��̏Z�l�������ł�\,a,0,0,"The main reason Dream Sumireko \nwas out of control is because of the Real Sumireko."
,ImageDef,doremy2,�{1,0,0
����������������̂�\n�悶��Ȃ��ł���\,a,0,0,"Shouldn't we take care of that first?"
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,��1,0,0
���H�����\n�ǂ������Ӗ��ł��H\,a,0,0,"Hm? \nWhat do you mean by that?"
,ClearBalloon,yukari

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�f1,0,0
���̏Z�l�̖\����\n���S�߈ˈٕς������Ȃ̂ł�\,a,0,0,"The recklessness of the dream dwellers \nis because of the Perfect Possession incident."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,doremy2,��2,0,0
������������Ȃ�����\n���̐��E�͌��̐��E��\n�e�����y�ڂ�������ł��傤\,a,0,0,"Unless we resolve that, the Dream World will continue to affect the Real World."
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,�f1,0,0
���̘b�ڂ��������ĉ�����\,a,0,0,"Please explain to me in detail."
,ClearBalloon,yukari

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�G1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂��Ă����\n�}�X�^�[�̖���ǂ�������\n�X���C�u�����̐��E�ɗ��܂�܂�\,a,0,0,"While using Perfect Possession, \nthe master's dream is pushed out and the slave is stuck in the Dream World."
�ǂ��o���ꂽ���̏Z�l��\n���̐��E�Ŗ\������̂ł�\,a,0,0,"And the dream dweller forced out will run wild in the Real World."
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂ɂ���ȕ���p���c�c\n��ϕ׋��ɂȂ�܂���\,c,0,0,"Perfect Possession has such side effects�c�c\nThat was very helpful."
,ClearBalloon,yukari

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��1,0,0
������\R[俎q|���̂�]�̏󋵂�\n��X�ɕ��G�ȗl�ł�\,a,0,0,"But Sumireko's (this girl's) situation, is especially complicated."
,ImageDef,doremy2,�f1,0,0
���S�߈ˈٕς����łȂ�\n����s�s�`�����e������\n����悤�ł�\,a,0,0,"Not only the Perfect Possession Incident \nbut a certain Urban Legend incident is involved too."
,ImageDef,doremy2,��1,0,0
���x�ǂ��ł�\n���̐��E��俎q��\n�����ɂ��邩����܂����H\,a,0,0,"Actually this is good. \nDo you know where the Dream World Sumireko is?"
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,��1,0,0
����Ȃ�c�c\,a,0,0,"Oh, she's�c�c"
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,60

,End
