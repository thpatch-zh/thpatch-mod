#========================================================================
#	�ɂƂ�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F������@�G�`�[���F�z�s�@�@�@�얲
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
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo,futo,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,futo_name,futo,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/futo/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,futo,��1,0,0
,ImageDef,reimu2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
#,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,futo,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,futo		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
�ǂ����B�����͖��[����\,a,0,0,"All is well. \nI am ready."
,ClearBalloon,futo#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,futo,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,reimu2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu2,	#�������L�������w��
,ImageDef,reimu2,�]1,0,0
�Ȃ񂾁A�͓������肩�[\n�債�ė��K�ɂ��Ȃ�Ȃ���\,a,0,0,"Oh, so our opponent is the kappa- \nThis won't be much of a practice."
,ClearBalloon,reimu2

,Show,nitori,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,�G1,0,0
�قق��A�������g�ݍ��킹����\n�܂��ǂ��A�s�����I\,a,0,0,"What an interesting team. \nWhatever, let's fight!"
,ClearBalloon,nitori

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,futo,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(305)",# �w��BGM�Đ��J�n

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
,ImageDef,futo,��1,0,0
,ImageDef,reimu2,�]1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,kokoro2,-1280	,
,Show,futo,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,nitori
,SetFocus,futo
���āA���S�߈˂̒����𑱂��邼\,a,0,0,"Now, let's continue the Perfect Possession investigation."
,ClearBalloon,futo

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,futo,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

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
,ImageDef,kokoro2,��1,0,0
,ImageDef,futo,��1,0,0
,ImageDef,reimu2,��1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,Show,futo,-1280	,&#�t�F�C�X�\���J�n
#,Show,reimu2,-1280	,#�t�F�C�X�\���J�n


,SetFocus,futo		,
,SetFocus,nitori		,
��[��\n�ǂ��T���v������ɓ�����\,a,0,0,"All right, I got a good sample."
,ClearBalloon,nitori

,SetFocus,futo		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������\n�ʂ̃X���C�u�ōĒ��킵������\,a,0,0,"How frustrating. \nI would like to challenge with a different slave."
,ClearBalloon,futo

,Hide,futo,-1280	,&#�t�F�C�X�\���J�n
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,reimu2,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,reimu2		,
����ς�A�X���C�u�͋�肾�Ȃ�\n�����ƐF��ȑ���ŗ��K���Ȃ���\,a,0,0,"Like I thought, I'm not good at being a slave. \nI need to practice with other people."
,ClearBalloon,reimu2

,SetFocus,nitori		,
,ImageDef,nitori,�f1,0,0
�ǂ����H\n�������������H\,a,0,0,"How was it? \nDid you find out anything?"
,ClearBalloon,nitori

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
����܂�\n��l�͉������Ƃ������\n�V���N�����Ă��܂�\,a,0,0,"I did. \nTheir emotions of frustration are synchronized."
,ClearBalloon,kokoro2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,futo,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
