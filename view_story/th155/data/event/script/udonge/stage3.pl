#========================================================================
#	���F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F�_�q�@�z�s
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,udonge,udonge,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,doremy2,doremy,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��2,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,miko,�]2,0,0
,ImageDef,futo2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,miko,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,�]2,0,0
�قق�\n���X���X�Ə����𒧂݂ɗ���҂�\n�׌��Ɉ�����\,a,0,0,"Aha, one who picks a fight fair and square cannot be treated lightly."
,ClearBalloon,miko

,Show,udonge,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,udonge		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̏ォ��ڐ���\n�����D���Ȃ��̂��\,a,0,0,"I hate condescending attitudes."
,ImageDef,udonge,�]1,0,0
�В����Ă��銄�ɂ�\n���ɂ����􂵂ĂȂ���\,a,0,0,"You're so arrogant but you haven't done anything."
,ClearBalloon,udonge#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,��1,0,0
�ȁA�Ȃ񂾂�\n�����悤�ɂȂ�����\n�C��Ȍ��̓e��\,a,0,0,"Wha.. What did you say, you weak Moon Rabbit?"
,ClearBalloon,miko

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
�����������Ă邾����\,a,0,0,"I'm only speaking the truth."
,ClearBalloon,udonge#�����o������

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,�]2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�I�h�I�h���Ă��邾������\n�v���Ă�������甍�����悤����\,a,0,0,"I thought you were only a nervous rabbit, but it seems that you've matured."
,ImageDef,miko,��2,0,0
�ł͎���������������\n�����̌��ʁA�s�s�`���ٕς�\n��d�҂���������\,c,0,0,"Then I shall speak the truth as well. \nFrom the investigation results, \nthe ring leader of the Urban Legend incident has been identified." 
,ImageDef,miko,�{1,0,0
���z�������̓s�̉���Ȃ�������\n�������܂ꂽ�񂾂�\,a,0,0,"Gensokyo was entangled in the Lunar Capital's ridiculous riot." 
,ImageDef,miko,��1,0,0
�������A���͓s�s�`���ٕς�\n���p�������S�߈ˈٕς̕���\n���Ђł���\,a,0,0,"However, now there's the threat of the Perfect Possession \nIncident which abuses the Urban Legend Incident."
,ImageDef,miko,��1,0,0
�b��ɂȂ�͉̂����̐푈���\n�g�߂Ȓs�b���񂩂�\,a,0,0,"Soon a nearby lover's quarrels will be news rather than a distant war."
,ImageDef,miko,�]1,0,0
���̓e�̂��O�ɂ͉������b\n���������\,a,0,0,"Though it may be disappointing for you, moon rabbit."
,ClearBalloon,miko

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�{1,0,0
,ImageDef,miko,��1,0,0
����Șb�͂ǂ��ł��ǂ���I\,b,0,0,"I don't care about that!"
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,udonge,�]1,0,0
���͂����A�M�����R�e���p����\n������������\n�C���C���̉����̂��߂ɂˁI\,a,0,0,"I just want to beat you black and blue and relieve my irritation!"
,ClearBalloon,udonge#�����o������

,Hide,udonge,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��1,0,0
�^�Ɏ󂯂Ȃ��ŉ�������\,a,0,0,"Please do not take her seriously."
,ClearBalloon,doremy2

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,��1,0,0
��H\n���O�͒N���H\,a,0,0,"Hm? \nWho are you?"
,ClearBalloon,miko

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�G1,0,0
���̓h���~�[�X�C�[�g\n���̐��E�̎x�z�҂ł�\n�Ȍエ���m�肨����\,a,0,0,"I am Doremy Sweet. \nThe ruler of the Dream World. \nPleased to make your acquaintance" 
,ImageDef,doremy2,��1,0,0
�����ɂ������\n���̐��E�̗��Ȃ̂ł�\,a,0,0,"The Reisen here, is Reisen from the Dream World."
,ClearBalloon,doremy2

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,��1,0,0
���̐��E�̗�傾�ƁH\n���������Ă���\,a,0,0,"Reisen from the Dream World? \nWhat are you saying."
,ClearBalloon,miko

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��2,0,0
���̐��E�̏Z�l��\n����L���őf���Ȃ�ł���\,a,0,0,"Dream World dwellers are highly sensitive and honest."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(351)",# �w��BGM�Đ��J�n

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�{1,0,0
�S�`���S�`�����邳��\,a,0,0,"Ugh, so annoying."
,ImageDef,udonge,��1,0,0
�����琶�܂ꂽ�א��\n�������Ɛ키��I\,b,0,0,"An evil hermit born from the mouth. \nLet's fight!"
���̌��z���͂��O���������\n��Ԃ悤�ȓz��΂��肾��\n���͐��`�̃q�[���[���I\,b,0,0,"Everyone will be happy, if you disappear from the Gensokyo. \nI'm the hero of justice!"
,ClearBalloon,udonge#�����o������

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�l�S��f�킷�҂�\n���߂���Ă���悤����\,a,0,0,"She seems to be possessed by someone who deceives."
�X�����A�ڂ��o�܂����Ă�낤�I\,b,0,0,"Very well, I shall wake you up!"
,ClearBalloon,miko


#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,


,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,miko,�f1,0,0
,ImageDef,futo2,�]1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,miko,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,udonge		,

,SetFocus,miko
���C�̓e�������Ƃ͂�\,a,0,0,"To think a mad rabbit would go mad."
,ClearBalloon,miko

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,

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
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,�]1,0,0
,ImageDef,miko,��1,0,0
,ImageDef,futo2,��1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
#,Show,futo2,-1280	,&#�t�F�C�X�\���J�n
,Show,miko,-1280	,


,SetFocus,miko
,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
���[�A�������肵��\n����Ŗڊo�߂̓o�b�`����\,a,0,0,"Ah, I feel refreshed. \nNow I'll wake up feeling great."
,ClearBalloon,udonge#�����o������

,SetFocus,miko
���̐��E�̗��Ƃ����b��\n�{���Ȃ̂��H\,a,0,0,"Is this story about the Reisen of the Dream World true?"
,ClearBalloon,miko

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������\n���̐��E�͂�肽�������\n�C����������[\,a,0,0,"Yup. \nI can do whatever I want in the Real World. \nIt's the best!"
,ClearBalloon,udonge#�����o������

,SetFocus,miko
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������͊��S�߈˂̐^����\n�ǂ��̂ɖZ������\n���O�̋Y���ɂ͕t�������Ă���\,a,0,0,"I'm busy pursuing the truth behind Perfect Possession. \nI don't have time to listen to your rubbish."
,ClearBalloon,miko

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̊��S�߈˂Ȃ̂ł����c�c\,b,0,0,"About this Perfect Possession�c�c"
,ImageDef,doremy2,�{1,0,0
���ꂪ�A���̐��E�ɉe����\n�^���Ă���̂ł�\,a,0,0,"It's affecting the Dream World."
,ClearBalloon,doremy2

,SetFocus,miko
�قق�\n�b��\,a,0,0,"Oh? Speak."
,ClearBalloon,miko

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂���Ă����\n�p�[�g�i�[�͖��̐��E�ɐ��݂܂�\,a,0,0,"While under Perfect Possession, the partner lays hidden in the Dream World."
,ImageDef,doremy2,��1,0,0
���̉e���Ŗ��̏Z�l��\n�Z����ǂ��o����Ă��܂��̂ł�\,a,0,0,"And because of that, the dream dweller is pushed out of their home." 
,ImageDef,doremy2,��2,0,0
�ڂ̑O�̗��͂��̈�l�ł���\,c,0,0,"The Reisen in front of you is one of those dwellers."
,ClearBalloon,doremy2

,SetFocus,miko
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ�ƁA���̐��E�ɂ�\n�e�����y�ԂƂ́c�c\,a,0,0,"To affect even the Dream World�c�c"
���ꂪ�{���Ȃ�\n�ꍏ���������S�߈ˈٕς�\n���������Ȃ��Ƃ�\,a,0,0,"If that is true, I must resolve the Perfect Possession incident immediately."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
