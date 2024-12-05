#========================================================================
#	�}�~�]�E�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F���g�@�G�`�[���F���@�@�@�j����
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
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"
,DefineObject,udonge,udonge,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,udonge_name,udonge,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/udonge/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.team[0].current.Team_SetFront_Slave()",#�퓬�J�n�O�ɃX���C�u�ɓ���ւ��
,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,udonge,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,udonge,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,udonge		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂̗��K�����H\n�ǂ����ǁA��C�T�̋M����\n�R���r��g�ނȂ�Ē��������\,a,0,0,"A Perfect Possession Training Match?\nAll right, but to see a lone wolf like you work with someone is rare."
,ClearBalloon,udonge

,Show,mokou2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�i�������Ă�������\n����Ȃ̂͏��߂ĂŊy������\,a,0,0,"I've lived a long time, but something this fun is the first."
,ImageDef,mokou2,��1,0,0
�l�Ɏ��߂����Ėʔ����񂾂�\,a,0,0,"Possessing people is pretty fun."
,ClearBalloon,mokou2

,SetFocus,udonge		,#�������L�������w��
,ImageDef,udonge,��1,0,0
�����A�M���̓X���C�u���Ȃ́H\n�}�X�^�[�͒N�H\,a,0,0,"Huh, you're the Slave?\nWho's the Master?"
,ClearBalloon,udonge

,Hide,mokou2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,mamizou		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�N���}�X�^�[����\n���Q����v���Ă����Ȃ���\,a,0,0,"I'm the Master.\nIt was a mutual interest that led to this."
,ClearBalloon,mamizou#�Ώۂ̐����o������

,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,sinmyoumaru2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2,	#�������L�������w��
,ImageDef,sinmyoumaru2,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���Q����v�I\n�����Ɠ������ˁ[�I\,b,0,0,"A mutual interest!\nThe same as us!"
,ClearBalloon,sinmyoumaru2


#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ق�\n���̂��������̂Ƒg�񂾂̂�\,a,0,0,"Oh? So you teamed up with this small one."
,ClearBalloon,mokou2


,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,udonge		,#�������L�������w��
,ImageDef,udonge,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���Q�͈�v���ĂȂ���I\,a,0,0,"We don't have mutual interests!"
���̎q��������߈˂��Ă���\n����������\,a,0,0,"This kid suddenly possessed me by force."
,ImageDef,udonge,�f1,0,0
���͂����Ɨ���ɂȂ�z��\n�g�݂��������̂�\,c,0,0,"I wanted to work with someone more reliable."

,ClearBalloon,udonge


,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Hide,udonge,-1280,
,SetFocus,sinmyoumaru2,	#�������L�������w��
,ImageDef,sinmyoumaru2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�q����������Ȃ�I\n�����߂��ΕS�l�͂��I\,b,0,0,"Don't treat me like a kid!\nWhen I possess, it's tremendous."
,ImageDef,sinmyoumaru2,�]1,0,0
���f���Ă���e����������\n�߈˂��Ă�����񂾂���\n�����Ɗ�ׁI\,a,0,0,"I possessed because there was a distracted rabbit.\nBe happy!"
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,sinmyoumaru2,��1,0,0
���������A�n�߂��[�I\,a,0,0,"Now let's start the match!"
,ClearBalloon,sinmyoumaru2

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,udonge,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(315)",# �w��BGM�Đ��J�n

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
,ImageDef,udonge,��1,0,0
,ImageDef,sinmyoumaru2,�]1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,mokou2,-1280	,&
,Show,udonge,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,mamizou
,SetFocus,udonge
���S�߈˂˂�\n�g�����Ȃ�����ʔ�������\,a,0,0,"Perfect Possession�c\nSeems fun if you can handle it."
,ClearBalloon,udonge

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,udonge,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

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
,ImageDef,mamizou,�f1,0,0
,ImageDef,mokou2,�]1,0,0
,ImageDef,udonge,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,mamizou		,	#�����L�������w��
,SetFocus,udonge
����[�A�������[\,a,0,0,"Ahh, I lost."
,ClearBalloon,udonge

,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280	,#�t�F�C�X�\���J�n
,SetFocus,sinmyoumaru2,	#�������L�������w��
,ImageDef,sinmyoumaru2,��1,0,0
���̓e�A�ア�I\n�����Ƌ����z�T���Ĝ߈˂���\,a,0,0,"What a weak rabbit!\nI should find a strong guy to possess."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,udonge
,ImageDef,udonge,��1,0,0
�ア�̂͂ǂ�����I\n�����c�c\,a,0,0,"Who's the weak one!\nSigh�c"
,ClearBalloon,udonge

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�\�ʂ�}�X�^�[�����f���Ă����\n����I�ɜ߈˂ł���悤�����\,a,0,0,"As the rumors say,\nif the Master is distracted, possession can be one-sided."
,ImageDef,mamizou,�f1,0,0
���Ⴊ�A���E�^�D�̌���\n�}�X�^�[�ɂ��邩��̂�\,a,0,0,"But the Master has the power of life or death."
,ImageDef,mamizou,��1,0,0
�D���D��ŃX���C�u��I�ԓz��\n�������Ǝv���񂶂Ⴊ�c�c\,a,0,0,"I'm sure there are few who choose to be the Slave but�c�c"
,ImageDef,mamizou,��1,0,0
�Ȃ�ł���Ȏd�g�݂��\��\n�g�ݍ��܂�Ă�񂶂�낤��\,a,0,0,"I wonder why this kind of device is included in the rumor."
,ImageDef,mamizou,��1,0,0
�c�c�̂��A�e��\,a,0,0,"�c�cHey, rabbit."
,ImageDef,mamizou,�]1,0,0
�����ŋ߂Ől���W�܂�\n�C�x���g�Ƃ��m��Ȃ����H\,a,0,0,"Do you know of any events where people will gather?"
,ClearBalloon,mamizou#�Ώۂ̐����o������

,SetFocus,udonge
,ImageDef,udonge,��1,0,0
�����H�C�x���g�H\n�����˂��A�m���c�c\,a,0,0,"What? Event?\nHmm, I think�c�c"
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,udonge,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
