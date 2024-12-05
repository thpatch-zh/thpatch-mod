#========================================================================
#	�}�~�]�E�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F���g�@�G�`�[���F�������@�@�얲
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(404)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,reimu2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
#,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,marisa,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,marisa		,#�������L�������w��
�Ȃ񂩗p���H\,a,0,0,"What do you want?"
,ClearBalloon,marisa

,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,mamizou		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
���S�߈ː��\n���K����ɂȂ��Ă���񂩂�\,a,0,0,"Will you be my practicing partner for Perfect Possession?"
,ClearBalloon,mamizou#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��1,0,0
�ŋ߂��ꂪ������\n�݂�ȋ�����ǋ�����̂�\n�]�O�������̂�\,a,0,0,"I hear that a lot lately.\nEveryone's devoted to becoming stronger."
,ImageDef,marisa,�]1,0,0
�܂��A�\����\,a,0,0,"Well, I don't mind."
,ClearBalloon,marisa

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
���₠�A�����������ď������\n����ł͑���\,a,0,0,"Thanks for understanding.\nNow let's begin."
,ClearBalloon,mamizou#�����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(302)",# �w��BGM�Đ��J�n

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
,ImageDef,marisa,��1,0,0
,ImageDef,reimu2,�]1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,mokou2,-1280	,&
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,mamizou
,SetFocus,marisa
�����Ԋ���Ă�����\n�ŋ��̊��S�߈ˎg���͎�����\,a,0,0,"I'm getting good at this.\nIt looks like I'm the strongest user of Perfect Posession."
,ClearBalloon,marisa

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,reimu2,��1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,Show,reimu,-1280	,#�t�F�C�X�\���J�n

,SetFocus,marisa		,&#�������L�������w��
,SetFocus,mamizou		,
���K����A���肪�Ƃ���\,a,0,0,"Thank you practicing partner."
,ClearBalloon,mamizou

,SetFocus,marisa		,#�������L�������w��
�����ĂĂāc�c\n����Ȃɗ��K����\n�ǂ�������肾�H\,a,0,0,"oww�c�c \nWhat are you planning to do practicing that much?"
,ClearBalloon,marisa


,SetFocus,mamizou		,
,ImageDef,mamizou,�]1,0,0
�����𐬂��ɂ�\n��������K�v�����邶���\,a,0,0,"To achieve anything, strength is necessary."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
�V�����h�����~�������炳\,a,0,0,"And I want to feel something new."
,ClearBalloon,mokou2

,SetFocus,marisa		,#�������L�������w��
��l�̈ӌ���\n�قȂ��Ă���悤����\n���v�Ȃ̂�\,a,0,0,"Your opinions are different. \nAre you going to be ok?"
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
