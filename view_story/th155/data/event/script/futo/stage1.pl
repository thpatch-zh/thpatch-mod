#========================================================================
#	�z�s�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F��ց@�G�`�[���F�j���ہ@�@������
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,futo,futo,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,ichirin2,ichirin,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru,sinmyoumaru,2p,1040,0,true

#2Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi2,koishi,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,sinmyoumaru_name,sinmyoumaru,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/koishi/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(401)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,sinmyoumaru,��1,0,0
,ImageDef,koishi2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,futo,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,futo		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
�₠�₠�A���S�߈ː�ŏ�������\,a,0,0,"Well well, properly fight in a Perfect Possession Battle."
,ClearBalloon,futo#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,futo,-1280,

,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,sinmyoumaru,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru		,#�������L�������w��
,ImageDef,sinmyoumaru,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������[\n���Ⴀ�A�߈ː�������Ă���\n���炿����Ƒ҂��Ăˁ[\,a,0,0,"Ok! I'll go find someone to possess, so wait here."
,ClearBalloon,sinmyoumaru

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,�f1,0,0
����A����͂���\n�߈˂���Ă邶��Ȃ���\,a,0,0,"No. You are already possessed."
,ClearBalloon,futo#�����o������

,SetFocus,sinmyoumaru		,#�������L�������w��
,ImageDef,sinmyoumaru,��2,0,0
���H\,a,0,0,"Huh?"
,ClearBalloon,sinmyoumaru

,Hide,sinmyoumaru,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,koishi2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2,	#�������L�������w��
,ImageDef,koishi2,��1,0,0
����[��\n�s��������΂�����߈�\n��E���E���I\,a,0,0,"Tada! Random possession SUCCESS!"
,ClearBalloon,koishi2

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
�������S�߈˂�������\n�܂������A�������I\,a,0,0,"Forced perfect possession. \nI shall let it slide. Let's fight!" 
,ClearBalloon,futo#�����o������

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

#�S���t�F�C�X�P��
,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,koishi2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(312)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,futo,��1,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,sinmyoumaru,��1,0,0
,ImageDef,koishi2,�]1,0,0

,Show,futo,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,sinmyoumaru,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,futo
,SetFocus,sinmyoumaru
,ImageDef,sinmyoumaru,��1,0,0
�|�I\n���̊Ԃɂ��߈˂���Ă���\,a,0,0,"Scary! \nPossessed before I knew it." 
,ClearBalloon,sinmyoumaru

,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,koishi2,-1280,

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
,ImageDef,futo,��1,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,sinmyoumaru,��1,0,0
,ImageDef,koishi2,��1,0,0

,Show,sinmyoumaru,-1280	,&#�t�F�C�X�\���J�n
#,Show,koishi2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,sinmyoumaru		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[���[���[\n�悭����Ȃ��z�Ɋ��S�߈˂����\n���̏�ŕ�����Ƃ͂Ȃ񂽂���J\,a,0,0,"I lost. \nI was Perfect Possessed by someone \nI don't know and lost on top of that. So humiliating."
,ClearBalloon,sinmyoumaru

,Show,futo,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,futo		,	#�����L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�R���r�l�[�V�����ň���������\n���i����\,a,0,0,"Your fighting was appalling. \nMake an effort."
,ClearBalloon,futo#�����o������

,SetFocus,sinmyoumaru		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�g�݂����Ȃ��z�Ƒg�܂����\n���̏�Ő��������Ƃ�\n���̏�Ȃ����J\,a,0,0,"I was teamed up with someone I don't want and lectured on top of that. \nSo humiliating. 
,ClearBalloon,sinmyoumaru

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,ichirin2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2,	#�������L�������w��
,ImageDef,ichirin2,��1,0,0
���[���A���낻����̖񑩂�[\,a,0,0,"Hey, It's about time to change!
,ClearBalloon,ichirin2

,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���A������\n�ς܂��\,a,0,0,Futo "Oh, is that so. My apologies."
,ClearBalloon,futo#�����o������

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,&

,Sleep,60

,End

# -------------------------------------------------------
