#========================================================================
#	���F�X�e�[�W1�@����
#	�ꏊ�F
#�@ �X���C�u�F�얲�@�G�`�[���F����
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����
,Function,"::battle.Enable_Boss_exp(false)"#�����㔚������


#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,yukari,yukari,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,reimu2,reimu,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P����
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,jyoon_name,jyoon,name,920,0,false

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/yukari/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�v���C���[���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera_Live()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,yukari,��1,0,0
,ImageDef,reimu2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�f1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,240

,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,120

#�ŏ��A���B�͏o�Ă��Ȃ�


,Function,"::battle.Show_EnemyName()",
,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������C�u�A�y���݂ˁ[�I\n�ϋq�B����x��D�������[\,a,0,0,"A concert again tonight. \nI'm excited! All you can steal from the audience-"
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Sleep,40#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�������o�ꂷ����ꉉ�o���}������܂�
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#�����o��
,Sleep,180#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2	,
,ImageDef,shion2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�˂�����\n���낻�뎄�ɂ������𕪂��Ă�[\,a,0,0,"Hey Jyoon, Give me some money too."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[�A�o����ɓn����\n�����ɖ��������Ⴄ�����\n�����͎��ɊǗ������ā[\,a,0,0,"Ehh. You always lose it right away. \nLeave the money to me."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����͂����Ɏg�����Ⴄ�񂾂���\n�S�R���ɉ���ė��Ȃ�����Ȃ�\,a,0,0,"You use it up right away. \nThere's never any left for me."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�g���؂�Ȃ����炢\n�D���Ηǂ��̂�\n�����͂���Ȃɂ���񂾂���\,a,0,0,"We just need to steal more than we can spend. \nLook at this mine in front of us."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
�܂�������\n�K�b�|�K�b�|�҂�����\,a,0,0,"That's true. Let's earn a lot."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���A�N��������\,a,0,0,"Ooh, someone came."
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Hide,shion2,-1280,
,Sleep,40#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#���o��

#,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

,Function,"::battle.team[0].current.StageIn_Special()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,yukari,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari	,
,ImageDef,yukari,��2,0,0
�����܂ł�\,a,0,0,"Stop there."
,ImageDef,yukari,��1,0,0
�n�R�_�̎����ɁA�u�a�_�̏���\n�����A���������߂����悤��\,a,0,0,"Poverty God Shion and Pestilence God Jyoon, enough of your mischief."
,ClearBalloon,yukari

,SetFocus,jyoon	,
,ImageDef,jyoon,�{1,0,0
���Ȃ̂�H\n�����������C�u���n�܂邩��\n�ז����Ȃ��ł��\,a,0,0,"What do you want? \nThe concert's about to start so get out of our way."
,ClearBalloon,jyoon



,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���ӂӁA��������\n����Ƃ��O�B�𒦂炵�߂鎞��\n�����񂾂���\,a,0,0,"Aha, how delightful. \nThe day to punish you two has finally come."
,ClearBalloon,yukari


,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[�A��������\n�͂��͂��A���B��\n���S�߈ˈٕς̍����ł���\,a,0,0,"Ugh, what is it. \nYes, yes we're the masterminds of the Perfect Possession incident."
���B�ɂ͐�Ώ��ĂȂ�\n���ĉ\�𕷂��ĂȂ��́H\,a,0,0,"Haven't you heard the rumor that you can't beat us?"
,ClearBalloon,jyoon

,SetFocus,yukari	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,yukari,�]2,0,0
����͂���Ă݂Ȃ���\n����Ȃ��񂶂�Ȃ�������H\,a,0,0,"I won't know unless I try."
,ImageDef,yukari,��2,0,0
���͈�l�ł���������\n�ŋ��̏����l���A��Ă��܂�����\,a,0,0,"I'm strong on my own, but I've brought the strongest assistant too."
,ImageDef,yukari,��2,0,0
�������o�Ă�����\n�K���ٕς͉�������̂ł�����\,a,0,0,"When my assistant arrives, the incident will be resolved no matter what."
,ClearBalloon,yukari

,SetFocus,shion2	,
,ImageDef,shion2,�]1,0,0
�˂�����\n�U�R�����������Ă��\n�؂Ȃ��˂��A�s�K���˂�\,a,0,0,"Hey Jyoon, this loser is saying something. \nHow sad and miserable."
,ClearBalloon,shion2


,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���ꂷ���Č��Ă��Ȃ���\n�����z�����^����\n�����Ė���������\,a,0,0,"It's so pitiful, I can't even watch. \nShe probably doesn't even have any fortune for me to soak up."
,ImageDef,jyoon,�]1,0,0
,Function,"::sound.StopBGM(1000);",# BGM��~
���C�u�̃h�T�N�T�ɕ����\n����ł��܂��������K��������\,a,0,0,"She might be better off dying during the commotion of the concert."
,ClearBalloon,jyoon

,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,yukari,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,reimu2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,yukari	,
,ImageDef,yukari,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�͂�\n���O�B�̗l�Ȑ����̌����҂�\n�{���̍K����m��Ȃ�\,a,0,0,"Hah. \nTruly hated people like you do not know real happiness."
,ImageDef,yukari,�{1,0,0
�K����m��Ȃ��҂�\n���i���Ђ�Ȃ����Ă��܂�\,a,0,0,"And those who do not know happiness have a twisted personality."
,ClearBalloon,yukari

,SetFocus,yukari	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,yukari,��2,0,0
��������Ԃ������I\,a,0,0,"But you should be delighted!"
,ImageDef,yukari,�]1,0,0
���O�B�Ɋ��S�s�k�Ƃ���\n�K��������Ă�낤\,a,0,0,"I shall provide you the happiness of complete defeat."
,ImageDef,yukari,��1,0,0
���삹��I\,b,0,0,"Rejoice!"
�l����ς���\n�X�y�V�������C�u�̎n�܂肾�I\,b,0,0,"A special concert that will change lives is about the start!"
,ClearBalloon,yukari

#�S���t�F�C�X�P��
,Hide,yukari,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,reimu2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,yukari,��1,0,0
,ImageDef,reimu2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0

,Show,yukari,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,reimu2,-1280	,&
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,yukari	,
,SetFocus,jyoon	,
���ꂷ���Č��Ă��Ȃ�\,a,0,0,"It's so pitiful, I can't even watch."
,ClearBalloon,jyoon

,Hide,yukari,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,reimu2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,yukari,�f1,0,0
,ImageDef,reimu2,�]1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0

,Sleep,45
,Function,"::battle.team[0].current.TalkPosition(null)"#1P����b�ʒu�Ɉړ�
,Sleep,5
,Function,"::battle.team[1].current.TalkPosition(null)"#2P����b�ʒu�Ɉړ�
,Sleep,90

,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,yukari	,
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂӂ�\n�������������Ęr�����悤�˂�\,a,0,0,"Hehehe. \nYou're not too bad."
,ImageDef,jyoon,�]1,0,0
�ł��A���낻��\n�V�т͏I���ɂ��悤���I\,a,0,0,"But let's put an end to the fun and games!"
,ClearBalloon,jyoon

,SetFocus,yukari	,
,ImageDef,yukari,�{1,0,0
�A��������c�c\n�얲�A�����͗ǂ��H\,d,0,0,"It will come�c�c Reimu, are you ready?"
,ClearBalloon,yukari

# =====
,Hide,yukari,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,reimu2,-1280	,#�t�F�C�X�\���J�n
,SetFocus,reimu2	,
,ImageDef,reimu2,��1,0,0
�悭����Ȃ����ǁA�C�����I\,d,0,0,"I don't really get it, but leave it to me!"
,ClearBalloon,reimu2

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���܂��ɁI\n���O�B�̕����͊m�肵���I\,c,0,0,"Right now! \nYour defeat is set!"
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

#
#�����Ǝ����������ɂ���ׂ���ꉉ�o���}������܂�
#
,Function,"::battle.team[1].current.Master_Spell_3_DemoStart()",		# �A�u�\�����[�g���[�U�[�A�N�V����

,Sleep,30
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�߈ˌ����u�A�u�\�����[�g���[�U�[�v\,e15x3,0,0,"Possession Exchange Absolute Loser"
,ClearBalloon,jyoon

,Hide,yukari,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,reimu2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,


#�������ŉ�b�G�͏����āA�f���Ɉڍs�B
#�����̓X���C�u�����̃X�y���J�[�h�𔭓�����B
#�r���ŐÎ~���āA���̉�b�B

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,yukari,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,reimu2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

,Sleep,60

,End
