#========================================================================
#	�얲�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�ؐ�@�G�`�[���F��������������
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,reimu,reimu,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,kasen2,kasen,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi2,koishi,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/koishi/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()",#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)",#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(401)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0

#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,reimu,-1280,
,SetFocus,reimu		,
,ImageDef,reimu,��1,0,0
���Ă�\n�������璲�����悤������\,a,0,0,"Let's see. \nWhere should we start investigating."
,ClearBalloon,reimu#�����o������
,Hide,reimu,-1280, &

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S

,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,kasen2,-1280,
,SetFocus,kasen2		,
,ImageDef,kasen2,��1,0,0
�N������ȉ\���L�߂��̂���\n�T��ɂ͓����ɔ�э��ނ���\n�Ȃ����\,a,0,0,"To find out  who spread this rumor, \nwe have no choice but to dive into the heart of this incident."
,ImageDef,kasen2,��2,0,0
��̓I�ɂ�\n���犮�S�߈˂��s���Đ키\,a,0,0,"Specifically to fight using Perfect Possession ourselves."
,ClearBalloon,kasen2#�����o������
,Hide,kasen2,-1280,&


,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,ImageDef,reimu,��1,0,0
,SetFocus,reimu
��|���肪���������ꂵ��������\,a,0,0,"We have no leads so I guess that's the only option."
,ImageDef,reimu,�G1,0,0
�ƂȂ�Ƃ���ς�ŏ��́c�c\,a,0,0,"Which means we should start with�c�c"
,ClearBalloon,reimu#�����o������

#1P�t�F�C�X�P��
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&

#,Function,"::sound.PlaySE(800)",# �w��SE�Đ�
#,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��

,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,marisa,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��2,0,0
�悤\n�ɂ�����������悤���[�I\,a,0,0,"Hey, I'm bored so let's have a quick match!"
,ClearBalloon,marisa


,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��2,0,0
�ǂ��Ƃ���ɗ������\,a,0,0,"You came at the right time."
,ImageDef,reimu,��2,0,0
���S�߈˒�����\n�ŏ��̔팟�̂Ƃ��đ���������\,a,0,0,"You're perfect as the first test subject of our Perfect Possession investigation."
,ClearBalloon,reimu

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,�f1,0,0
�팟�́H\n���̘b���H\,a,0,0,"Test Subject? \nWhat are you talking about?"
,ClearBalloon,marisa
,Hide,reimu,-1280,&

,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kasen2		,#�������L�������w��
,ImageDef,kasen2,�]1,0,0
��������\n�����͓�Έ�ōs�����ĖႤ��\,a,0,0,"I'm sorry but today we will fight two versus one."
,ClearBalloon,kasen2

,SetFocus,marisa,	#�������L�������w��
,ImageDef,marisa,��1,0,0
�킠�A����ւ�����I\n���S�߈˂��ȁH\,a,0,0,"Whoa, you swapped with her! \nSo that's Perfect Possession?"
,ClearBalloon,marisa

,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,SetFocus,reimu,	#�������L�������w��
,ImageDef,reimu,��1,0,0
���ۂɗ��p���Ă݂�\n�^����T�鎖�ɂ����́I\,a,0,0,"We've decided to investigate the truth by actually using it!"
,ClearBalloon,reimu

,Hide,reimu,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kasen2,	#�������L�������w��
,ImageDef,kasen2,��1,0,0
������ƁA�҂���\n�������A���Ɂc�c\,c,0,0,"Wait, Marisa�c you are already�c�c"
,ClearBalloon,kasen2

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Hide,marisa,-1280,&

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,koishi,-1280,&
,SetFocus,koishi2		,
,ImageDef,koishi2,�f1,0,0
����A�����͉���������H\,a,0,0,"Huh, where am I?"
,ClearBalloon,koishi2

,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,reimu,	#�������L�������w��
,ImageDef,reimu,��1,0,0
���񂽂�����\n���S�߈˂���Ă��[\t[!?]\,b,0,0,"You were already under Perfect Possession too!?"
,ClearBalloon,reimu

#,Function,"::battle.team[1].current.StageOut_Dash()"#���s�`�[������ʏォ��o��
#,Function,"::battle.team[1].current.StageOut_SlideUpper()"#���s�`�[������ʏォ��o��
#,Sleep,120#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,koishi2,-1280,

,Sleep,60

#,Function,"::sound.PlayBGM(301)",# �w��BGM�Đ��J�n

#,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#,Function,"::battle.Battle_Ready()",# �ΐ�J�n����
,Function,"::battle.Lose()",

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,�]1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,marisa
,ImageDef,marisa,��1,0,0
���Ŏ������S�߈˂���Ă��񂾁H\,a,0,0,"Why was I perfect possessed?"
,ClearBalloon,marisa

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,koishi,-1280,

,Sleep,30

#,Function,"::sound.StopBGM(1500)",# BGM��~
#,Thread,"::battle.Continue();"#�R���e�j���[�m�F��ʂ�
#,Function,"::battle.Continue()",# �ΐ�J�n����
,Function,"::battle.Win()",

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,�]1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
#,Show,koishi2,-1280	,#�t�F�C�X�\���J�n
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
#,SetFocus,koishi2		,
,SetFocus,marisa		,
�����A����͈�̉��Ȃ񂾁H\n�������ʐl�Ɠ���ւ�����悤��\,a,0,0,"Hey, what's this? It feels like I swapped with someone else."
,ClearBalloon,marisa
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,reimu		,
,ImageDef,reimu,��1,0,0
���񂽂͋C���t����\n���Ȃ������̂�\,a,0,0,"So you didn't notice anything happened."
,ImageDef,reimu,��2,0,0
���̂����_������ւ��\n���ꂪ���S�߈˂ƌĂ΂�镨��\,a,0,0,"The body and mind switching places is called Perfect Possession.
,ClearBalloon,reimu

,SetFocus,marisa		,
���S�߈˂̉\�͕����Ă�����\n����ȊȒP�ɓ���ւ���̂�\,a,0,0,"I've heard of this Perfect Possession rumor, \nbut I didn't think it was this easy.
����͖ʔ��c�c\n����s�v�c��\,a,0,0,"This sounds fun�c�cno, interesting."
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,koishi2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
