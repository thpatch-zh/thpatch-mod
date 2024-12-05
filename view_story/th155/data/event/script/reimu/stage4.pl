#========================================================================
#	�얲�F�X�e�[�W4�@����
#	�ꏊ�F
#   �X���C�u�F�ؐ�@�G�`�[���F��
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

,GoSub,init				,# ���������[�`���Ăяo��
,LoadAnimationLocal,"data/actor/story_title/reimu/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#�G�����摜�ǂݍ���
,Function,"::battle.team[1].current.Wait_Outside()"#2P���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,yukari,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,kasen2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen2		,#�������L�������w��
,ImageDef,kasen2,��1,0,0
�݂�Ȋ��S�߈˂̉\��\n�U��񂳂�Ă���悤��\,a,0,0,"It seems everyone is swayed by the Perfect Possession rumor." 
,ClearBalloon,kasen2

# =====
,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Show,reimu,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,reimu		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
�����̒����ł�\n�債�����Ƃ͔���Ȃ�������\,a,0,0,"We didn't learn much from today's investigation."
�����͒����ɋy�т�����\,a,0,0,"It looks like this will be a long one."
,ClearBalloon,reimu#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,kasen2		,#�������L�������w��
,ImageDef,kasen2,�f1,0,0
����c�c\n�܂������͏I���Ȃ��݂�����\,a,0,0,"No�c�c \nIt seems today is not over yet."
,ClearBalloon,kasen2

#1P�t�F�C�X�P��
,Hide,reimu,-1280,&	
,Hide,kasen2,-1280,&


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[1].current.StageIn_Special()"#���s�`�[�������ꉉ�o�œo��
,Sleep,120#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,yukari,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂𗘗p���Ă̒����c�c\,a,0,0,"An investigation using Perfect Possession�c�c"
,ImageDef,yukari,��2,0,0
����͈��ӂŎd�g�܂ꂽ\n�ň��̑I���̈��\,a,0,0,"That is one of the worst choices set with evil intentions."
,ClearBalloon,yukari


# =====


,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(318)",# �w��BGM�Đ��J�n

,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��1,0,0
\R[��|����]�c�c�I\,c,0,0,"Yukari (you)�c�c!"
,ImageDef,reimu,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̃^�C�~���O�ŏo�Ă���\n�ƌ�������\n�܂��A���񂽂�����ł���̂ˁI\,b,0,0,"To come out at this timing must mean you're involved!"
,ClearBalloon,reimu

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����I�ɐg�̂��������悤��\n����Ȃ�āA�����̏��Ɓc�c\,a,0,0,"To forcibly possess one's body is the deed of the devil�c�c."
,ImageDef,yukari,�]1,0,0
����A�ד��̋ɂ݂���\n���̎�������Ȏ�������悤��\n������̂�����\,a,0,0,"No, the ultimate evil. \nDo I look like someone who would commit such an act?"
,ClearBalloon,yukari

,SetFocus,reimu,	#�������L�������w��
,ImageDef,reimu,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������I\n����������I\,a,0,0,"You do! \nYou look like just like it!"
,ImageDef,reimu,��1,0,0
�ٕςɊ֌W���Ă���Ƃ���\n�l�����Ȃ���I\,a,0,0,"I can only think that you're somehow involved with this Incident!"
,ClearBalloon,reimu



#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,yukari,��1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,yukari
,ImageDef,yukari,�f1,0,0
���̂܂܂ł�\n�����ɏ���i�͌����Ă��Ȃ�\n�󋵂͍ň���\,a,0,0,"At this rate, there is no method to beat the mastermind. \nThis is a horrible situation."
,ClearBalloon,yukari

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,30

#,Function,"::sound.StopBGM(1500)",# �R���e�j���[�҂��ւ�BGM�~�߂��ɑ��s
,Function,"::battle.Win()",# �Q�[���I�[�o�[��ʂ�

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,yukari,�f1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,ImageDef,reimu,�f1,0,0
�܂�Ŏ艞�����Ȃ��c�c\,a,0,0,"It's like there's no effect on her......"
,ClearBalloon,reimu


,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,yukari
,ImageDef,yukari,�f1,0,0
�����ȁc�c���S�߈˂̊댯��\n�M���B�ɂ͔���Ȃ��̂�\,a,0,0,"How foolish......\nThe two of you don't understand the dangers of Perfect Possession."
,ImageDef,yukari,��1,0,0
�Ȃ�΁A\R[�ߍ�|���܂�]��\R[����|����܂�]�Ŋw�ׁI\n�e���n���B��I\,b,0,0,"Then learn from malice! You shooting idiots!"
,ClearBalloon,yukari

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�


,Sleep,30

,Function,"::battle.Lose()",# �ΐ�ĊJ����

,End
# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::sound.StopBGM(1500);"
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.Go_Ending();"

,End
