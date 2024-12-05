#========================================================================
#	�ɂƂ�F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F������@�G�`�[���F俎q�@�@�@�h���~�[
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,nitori,nitori,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,kokoro2,kokoro,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami,usami,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,usami_name,usami,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/usami/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,usami,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,usami		,#�������L�������w��
�M���͉͓��H\,a,0,0,"Are you a kappa?"
,ClearBalloon,usami

,Show,nitori,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,nitori		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A�O���l��\,a,0,0,"Oh, an Outsider."
�������ɊO�̐��E�܂�\n���S�߈˂̉\�͍L������\n���Ȃ����\,a,0,0,"I hope the Perfect Possession rumor hasn't spread to the Outside World."
,ClearBalloon,nitori#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,SetFocus,usami		,#�������L�������w��
,ImageDef,usami,��2,0,0
���S�߈˂��ĉ��H\,a,0,0,"What's Perfect Possession?"
,ClearBalloon,usami

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
���������\,a,0,0,"Like this"
,ClearBalloon,kokoro2

,Hide,kokoro2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,��1,0,0
��������V�т���\,a,0,0,"and like this, you play."
,ClearBalloon,nitori

,SetFocus,usami		,#�������L�������w��
,ImageDef,usami,��1,0,0
�킠�A��u�ʐl�ɂȂ����I\n�ϐg�\�́H\,c,0,0,"Wow! You became someone else for a second! \nTransformation?"
,ClearBalloon,usami

,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,�G1,0,0
���S�߈˂Ƃ������ۂ�\n�ʏ�̜߈˂͐��_�݂̂���\n���S�߈˂͓��̂��Ə��ڂ��\,a,0,0,"It's a phenomenon called Perfect Possession. \nTypically, possession is only the spirit. \nBut Perfect Possession can change the entire body."
,ClearBalloon,nitori

,SetFocus,usami		,#�������L�������w��
,ImageDef,usami,��1,0,0
���̂��Ɯ߈˂������\n�e���|�[�e�[�V�������Ď�������\,a,0,0,"Possessing the entire body�c does that mean teleportation?"
������񌩂��ā[\,a,0,0,"Show me one more time."
,ClearBalloon,usami

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
�́[��\,a,0,0,"Ok~"
,ClearBalloon,kokoro2

,Hide,kokoro2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,�]1,0,0
����Ȋ�������\n����������悤�Ȃ�A���O���c�c\,a,0,0,"Like this. \nIf you're interested, why don't you�c�c"


,ImageDef,nitori,��1,0,0
���āA���O�A����\n�����Ɋ��S�߈˂���Ă��Ȃ����H\,a,0,0,"Wait. \nYou're already Perfect Possessed, aren't you?"
,ClearBalloon,nitori


,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::sound.PlayBGM(314)",# �w��BGM�Đ��J�n

,SetFocus,usami		,#�������L�������w��
,ImageDef,usami,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ��ӂ���\n�ٕςɋC���t�������c�c\,a,0,0,"Hehehe, you noticed the abnormality�c�c"
,ImageDef,usami,�]1,0,0
�������A���S�߈˂ł͖���\,a,0,0,"But it's not Perfect Possession."
,ImageDef,usami,��1,0,0
��͊��S�߈˂Ŗ��̐��E����\n�ǂ��o���ꂽ������l��俎q\,a,0,0,"I'm the other Sumireko who was kicked out of the Dream World \nby Perfect Possession."
�h���[��俎q���I\,b,0,0,"Dream Sumireko!"
,ClearBalloon,usami


#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��


# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,usami,�{1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,kokoro2,-1280	,&
,Show,usami,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,nitori
,SetFocus,usami
,ImageDef,usami,�{1,0,0
���S�߈˂́A���̐��E��}������\,a,0,0,"Perfect Possession will control the Dream World."

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

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
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,�]1,0,0
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,Show,usami,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,usami		,#�������L�������w��
,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,��1,0,0
���̐��E��俎q�H\n�������Ă�񂾁H\,a,0,0,"Sumireko from the Dream World? \nWhat do you mean?"
,ClearBalloon,nitori

,Hide,usami,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,doremy2,-1280	,#�t�F�C�X�\���J�n
,SetFocus,doremy2		,
,ImageDef,doremy2,�f1,0,0
���̂܂܂̈Ӗ���\,a,0,0,"It means exactly that."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂͖��̐��E��\n�x�z���čs���Ă��܂�\,a,0,0,"Perfect Possession has power over the Dream World."
���S�߈˂𑱂����\n�}�����ꂽ������l�̎���\n���̐��E�̎������\�������˂Ȃ�\,a,0,0,"By continuing Perfect Possession, your suppressed other self, \nyour Dream World self will lose control."
,ClearBalloon,doremy2

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��ςł�\n���̐l�̊���ǂ߂܂���\,a,0,0,"This is bad. \nI can't read her emotions."
,ImageDef,kokoro2,�f1,0,0
�V���N���������\n���݂��Ȃ��\��������܂�\,a,0,0,"There's a possibility this emotion doesn't exist in my database."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,�f1,0,0
���O�͈�̉��҂��H\,a,0,0,"Who the hell are you?"
,ClearBalloon,nitori

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,SetFocus,doremy2		,
,ImageDef,doremy2,�G1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̓h���~�[�X�C�[�g\n���̎x�z�҂ł�\,a,0,0,"I am Doremy Sweet. \nThe ruler of Dreams."
,ImageDef,doremy2,�f1,0,0
���S�߈˂̗��p��\n���̐��E����݂čT��������\n�ǂ��Ǝv���܂���\,a,0,0,"As the ruler of the Dream World, \nyou should refrain from abusing Perfect Possession." 
,ClearBalloon,doremy2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
