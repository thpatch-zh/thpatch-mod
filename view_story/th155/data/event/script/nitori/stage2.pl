#========================================================================
#	�ɂƂ�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F������@�G�`�[���F��ց@�@�@������
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
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa2,marisa,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(403)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,ichirin,��1,0,0
,ImageDef,marisa2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
#,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,ichirin,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin		,#�������L�������w��
,ImageDef,ichirin,��1,0,0
���S�߈ː�̗��K��\n�]�ނƂ����I\,a,0,0,"A Perfect Possession practice battle. \nJust what I was hoping for!"
,ClearBalloon,ichirin

,Show,nitori,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,��2,0,0
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
�݂�ȃm�����ǂ��ď����邺\,a,0,0,"Everyone's so helpful."
,ClearBalloon,nitori#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,ichirin,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,marisa2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,marisa2,	#�������L�������w��
,ImageDef,marisa2,�f1,0,0
�����́A�l�H���S�߈˂�\n�������Ă���悤�ȊO������\n�C��t���������ǂ�\,a,0,0,"This one's a demon researching artificial Perfect Possession. \nBe careful."
,ClearBalloon,marisa2

,Hide,marisa2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,ichirin		,#�������L�������w��
,ImageDef,ichirin,��1,0,0
�l�H�H\n�͓��Ȃ̂ɁH\,a,0,0,"Artificial? \nEven though she's a kappa?"
,ClearBalloon,ichirin

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,�]1,0,0
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
������\,a,0,0,"Yup."
�Ԃ��Ȃ��e�N�m���W�[��\n�𖾂���͂���\n���O�B���T���v���̈�ƂȂ�I\,a,0,0,"The technology should determine something soon. \nI'll use you two as samples too!"
,ClearBalloon,nitori#�Ώۂ̐����o������


,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,marisa2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(303)",# �w��BGM�Đ��J�n

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
,ImageDef,ichirin,��1,0,0
,ImageDef,marisa2,�]1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,kokoro2,-1280	,&
,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,nitori
,SetFocus,ichirin
���l�ׂ̈ɂ����K���Ȃ��Ƃ�\,a,0,0,"We must practice for Lady Hijiri too."
,ClearBalloon,ichirin

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,marisa2,-1280,

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
,ImageDef,ichirin,��1,0,0
,ImageDef,marisa2,��1,0,0

#�G�X���C�u�����b���J�n���邽�߉��}��
,Sleep,35
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,marisa2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,marisa2,	#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[���肭�����Ȃ���\,a,0,0,"Hmm.. It's not going well."
��ւƑg�񂾂�\n�����ƍ��킹�ĎO�l�ɂȂ�\,a,0,0,"Working with Ichirin, we become three with the Nyudou."
���̃C���M�����[�������˔j����\n�Ȃ邩���m��Ȃ��̂�\n���ĂȂ��񂶂Ⴀ�b�ɂȂ�Ȃ�\,a,0,0,"I thought that irregularity might be some kind of breakthrough, \nbut if we can't even win, there's no point.
,ClearBalloon,marisa2

,Hide,marisa2,-1280	,#�t�F�C�X�\���J�n
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# �X���C�u�ɓ���ւ��

,Show,ichirin,-1280	,#�t�F�C�X�\���J�n
,SetFocus,ichirin
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����������\n�ŋ��̓�l�̘b�����Ă���H\,a,0,0,"Are you talking about the cursed duo?
�����A���̍U���ׂ̈�\n�w�͂��Ă���̂�\,a,0,0,"I'm making an effort to capture them too."
,ClearBalloon,ichirin

,Hide,ichirin,-1280	,#�t�F�C�X�\���J�n
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �}�X�^�[�ɓ���ւ��

,Show,marisa2,-1280	,#�t�F�C�X�\���J�n
,SetFocus,marisa2,	#�������L�������w��
�Ȃ񂾂ƁA���O����\n�������L��������\,a,0,0,"What? You too? \nThen let's share information."
,ClearBalloon,marisa2

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,nitori,	#�������L�������w��
,ImageDef,nitori,�f1,0,0
�ǂ����H\,a,0,0,"How was it?"
,ClearBalloon,nitori#�����o������

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2,	#�������L�������w��
,ImageDef,kokoro2,��1,0,0
�����ɕ��������Ƃ�\n�t�ɘA�ъ������܂�Ă��܂�\,a,0,0,"By losing, they seemed to have formed a sense of solidarity."
,ClearBalloon,kokoro2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,marisa2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
