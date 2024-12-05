#========================================================================
#	�V�q�F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F�j���ہ@�G�`�[���F���@�얲
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,tenshi,tenshi,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,sinmyoumaru2,sinmyoumaru,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,yukari,�]1,0,0
,ImageDef,reimu2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150


#�ŏ��V�q�͓o�ꂹ���B
,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,yukari,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari	,
,ImageDef,yukari,�]1,0,0
�X���C�u�ɂ͊��ꂽ������H\,a,0,0,"Have you become used to being a slave?"
,ClearBalloon,yukari

,Hide,yukari,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,reimu2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu2	,
,ImageDef,reimu2,��1,0,0
�܂����Ƃ���\,a,0,0,"Somewhat."
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�n�R�u�a�R���r�U�����̖��^��\n�M���̗��K�ʂɂ������Ă����\n�����c�c\,a,0,0,"The fate of capturing the  Poverty and Pestilence Duo will come down \nto your training but�c�c"
,ClearBalloon,yukari

,Hide,yukari,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,reimu2	,
,ImageDef,reimu2,��1,0,0
�����H\,a,0,0,"But?"
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,yukari	,
,ImageDef,yukari,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���Ƃ������\n���S�ɂ���ׂɂ�\n����������Ȃ��C������\,a,0,0,"I feel something is missing to make it perfect."
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Hide,yukari,-1280,
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::sound.PlayBGM(409)",# �w��BGM�Đ��J�n

#�V�q����
,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
��H\n�����͂��̎��̗d���I\,a,0,0,"Eh? It's that youkai from before!"
,ClearBalloon,tenshi

,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
����H\n�Ȃ�ŋM�����n��ɁH\,a,0,0,"Oh dear. \nWhy are you on Earth?"
,ClearBalloon,yukari

,SetFocus,tenshi	,
,ImageDef,tenshi,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����������\n�n��ɂ͂������c���Ă���\,a,0,0,"I forgot, this one was still left."
,ImageDef,tenshi,��1,0,0
������|���Ȃ����\n�n��͎x�z�ł��Ȃ��I\,b,0,0,"I need to beat her or I can't rule the Earth!"
,ClearBalloon,tenshi

,SetFocus,yukari	,
,ImageDef,yukari,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ�ł���ȃ^�C�~���O��\n�����̂�����\,a,0,0,"Why do you have to appear at this moment?"
�M���ɂ͋����Ȃ�����\n�������Ƌ���\,b,0,0,"I don't have any interest so please go away."
,ClearBalloon,yukari

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����́A�����Z�̃I���p���[�h\n�ŗL���ȗd����\n�C�𔲂��Ȃ�[\,a,0,0,"This one's a youkai famous for never-ending foul play. \nPay attention!"
,ClearBalloon,sinmyoumaru2

,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����H\n�����̏��l�́c�c\n�����̏��l����Ȃ����\,a,0,0,"Oh? This Inchling�c�c it's not the usual little one."
,ClearBalloon,yukari

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,�]1,0,0
���ւց[�A�悭�������˂�\n�������A������\n���̐��E�̐j���ۂ��I\,a,0,0,"Hehehe, you noticed well. \nYup, I'm Sinmyoumaru from the Dream World!"
�h�T�N�T�ɕ����\n�����I�Ɏ��߂��Ă������\,c,0,0,"When everyone was confused, I forced possession."
,ClearBalloon,sinmyoumaru2


,ImageDef,yukari,��1,0,0
# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ񂾂��āH\n���񂽂͐j���ۂ���Ȃ��́H\,a,0,0,"What did you say? \nYou're not Sinmyoumaru?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
�j���ۂ͐j���ۂ�����\n���̐��E�̐j���ۂ�\,a,0,0,"I am Sinmyoumaru, but Sinmyoumaru from the Dream World."
,ImageDef,sinmyoumaru2,�]1,0,0
�������̕����ʔ���������������\n�������̐킢�̎���\n����ւ���Ă�����̂�\,a,0,0,"This side seemed more fun so I switched places during the last battle."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ւ��[�A����Ȃ��Əo����񂾁I\n�܂����Ƃ��Ă͋������\n�ǂ����ł�������\,a,0,0,"Huh, so you can do something like that! \nWell, as long as we're strong, I don't really care."
,ClearBalloon,tenshi


,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
�킢�̓r����\n�X���C�u�����ւ��������āH\n����͉u�a�_�̔\�͂Ɠ����c�c\,a,0,0,"Switched slaves during battle? \nThe same power as the Pestilence God�c"
,ClearBalloon,yukari

,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ���A�����������Ƃ��I\n\R[�u�a�_|������]�̔\�͂̎d�g�݂��������I\,a,0,0,"I see, now I understand! \nI can see how the Pestilence God's ability works!"
,ClearBalloon,yukari

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ԃ��������ĂȂ���\n�������Ɛ키��I\n���z���̎x�z�҂͎������I\,b,0,0,"Stop grumbling and let's fight! \nI'm going to become the ruler of Gensokyo!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(318)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,yukari,��1,0,0
,ImageDef,reimu2,�]1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,tenshi	,
,SetFocus,yukari	,
,ImageDef,yukari,��1,0,0
�v��ʏ�����ɓ��ꂽ��\n����ŏ��Ă�\,a,0,0,"I've gained some unexpected information. \nWith this we can win."
,ClearBalloon,yukari

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,tenshi,�f1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,yukari,��1,0,0
,ImageDef,reimu2,��1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,yukari
,SetFocus,tenshi
,ImageDef,tenshi,�f1,0,0
�S�����ɂ��炸����\n���O�͒N�Ɛ���Ă���H\,a,0,0,"Present in body but absent in spirit. Who are you fighting against?"
,ClearBalloon,tenshi

,SetFocus,yukari
,ImageDef,yukari,�]1,0,0
���O�B�̂��A��\n���̓�l���U���ł�������\,a,0,0,"Thanks to the two of you, it looks like Jyoon & Shion will be captured."
,ClearBalloon,yukari

,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,ImageDef,yukari,��1,0,0
���S�߈˂͌��؂�����I\n����\R[�z��|�X���C�u]�͎��R���I\,a,0,0,"I have figured out Perfect Possession! Now slaves are free!"
,ClearBalloon,yukari

#�S���t�F�C�X�P��
,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

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


# -------------------------------------------------------
