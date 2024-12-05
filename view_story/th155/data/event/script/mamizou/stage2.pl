#========================================================================
#	�}�~�]�E�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F���g�@�G�`�[���F���@�@�@�@���
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,mamizou,mamizou,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,mokou2,mokou,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(403)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,��2,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,hijiri,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri		,#�������L�������w��
�ǂ��ł��傤\n���K�����ł���\,a,0,0,"A practice match? \nWhy not."
,ClearBalloon,hijiri

,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,mamizou		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,mamizou,��2,0,0
�݂�ȗ���������˂�\,a,0,0,"Everyone's so understanding."
,ImageDef,mamizou,�f1,0,0
���Ⴊ�A����������\n��l���Ⴀ�s����������\n�����������S�߈˂�����Ƃ���\,a,0,0,"But it's unfair if there's two of us.\nYou should also use Perfect Possession."
,ImageDef,mamizou,��1,0,0
�����������Ă�낤���H\,a,0,0,"Should I teach you?"
,ClearBalloon,mamizou#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,ichirin2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2,	#�������L�������w��
,ImageDef,ichirin2,��2,0,0
�K�v�Ȃ���\n�����Ȃ�n�m���Ă����\,a,0,0,"No need.\nI'm well aware of the method."
,ImageDef,ichirin2,��1,0,0
�}�X�^�[�̓��ӂ������\n���Ȃ��o����\,a,0,0,"If the master is in agreement, there is no problem."
,ImageDef,ichirin2,�]1,0,0
�}�X�^�[�����f���Ă���Ȃ�\n���ӂ����������I�ɜ߈ˏo����\,a,0,0,"If the master isn't paying attention,\nforced Perfect Possession is possible without consent."
,ClearBalloon,ichirin2

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,�f1,0,0
�ق��A�������S�߈˂��Ă���̂�\n����əN���ڂ����˂�\,a,0,0,"Ah, so you're already practicing Perfect Possession too.\nAnd more familiar than me."
,ClearBalloon,mamizou#�����o������

,Hide,ichirin2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
�������Ă���̂�\n�M�������ł͖����̂ł�\n�����A�����I\,a,0,0,"You aren't the only one researching.\nNow, let's fight!"
,ClearBalloon,hijiri

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

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
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,�]1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,mokou2,-1280	,&
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,mamizou
,SetFocus,hijiri
����ȑ��ȃR���r��\n������C�����܂���\,a,0,0,"I didn't think I would lose to an improvised duo like you."

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

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
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,��1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n
#,Show,ichirin2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,hijiri		,#�������L�������w��

,SetFocus,mamizou		,
�����ԓ����ł����˂�\,a,0,0,"I'm getting used to this."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2,	#�������L�������w��
�ǂ��߈ˊ���\,a,0,0,"It was a good possession."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,mokou2,��1,0,0
����ς肨�O\n�����̒K����Ȃ���\,a,0,0,"You're no simple Tanuki after all, are you?"
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,
,ImageDef,mamizou,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������\n����̃p���[�Ǝ̂Đg����\n�������Ă�ł���̂���\,a,0,0,"What do you mean?\nYour power and desperation brought us victory."
,ClearBalloon,mamizou

,Show,hijiri,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����g�����Ȃ��Ă�̂ł���\,a,0,0,"You've mastered it quite a bit."
���������Ă����Ȃ���\n�����Ƌ����l�Ƒg�܂Ȃ���\n�����Ȃ���ˁI\,b,0,0,"I can't lose either.\nI need to work with someone stronger!"
,ClearBalloon,hijiri

,Hide,hijiri,-1280, &
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,ichirin2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2,	#�������L�������w��
,ImageDef,ichirin2,��1,0,0
�����H\,c,0,0,"What?"
,ClearBalloon,ichirin2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
