#========================================================================
#	�������F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�������@�G�`�[���F��ց@�@�z�s
#	�X�e�[�W�^�C�g��
#	   �u�y�������S�߈ː�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,marisa,marisa,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,koishi2,koishi,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������


#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(405)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,marisa,��2,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,ichirin,��2,0,0
,ImageDef,futo2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,marisa,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,marisa		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,marisa,��2,0,0
���[�����邩�[�H\n��킵�悤���[�I\,a,0,0,"Hey, You there? \nLet's fight!"
,ClearBalloon,marisa#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,marisa,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,ichirin,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin		,#�������L�������w��
,ImageDef,ichirin,��1,0,0
�ӂ��ӂ��ӁA������[\,a,0,0,"Hehehe, sure thing!"
,ClearBalloon,ichirin

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��1,0,0
�ӂ��ӂ���\n�������������m��Ȃ���\n�ʔ����͂���ɓ��ꂽ��\,a,0,0,"Hehehe, \nI might be breaking the rules \nbut I've got an interesting new power."
,ImageDef,marisa,�]1,0,0
�����܂ł��񂽑����\n�������ĖႤ��\,a,0,0,"Until I get used to it, let me try it out on you!"
,ClearBalloon,marisa

,SetFocus,ichirin		,#�������L�������w��
,ImageDef,ichirin,��1,0,0
��������\n�����V�����͂�\n�������������Ƃ���Ȃ�\,a,0,0,"Oh, what a coincidence. \nI wanted to test a new power too."
,ClearBalloon,ichirin

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��1,0,0
�c�c�Ƃ����ƁH\,c,0,0,"�c�c what do you mean?"
,ClearBalloon,marisa

,Hide,ichirin,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,futo2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,futo2,	#�������L�������w��
,ImageDef,futo2,�]1,0,0
����������������񂪂ˁc�c\,a,0,0,"It may be violating the rules�c�c"
,ImageDef,futo2,��1,0,0
��l������ōs�����ĖႤ��\,a,0,0,"But we shall be fighting together."
,ClearBalloon,futo2

,Hide,marisa,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��1,0,0
���[�A�Ȃ񂾁[\n�M���B�����S�߈˂��Ă�̂��[\,a,0,0,"Boo, you guys are using Perfect Possession too?"
,ImageDef,koishi2,�f1,0,0
��Έ�ň���I��\n�{�R�肽�������̂ɂȁ[�I\,a,0,0,"I really wanted to beat you up two against one."
,ClearBalloon,koishi2

,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,

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
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,ichirin,�f1,0,0
,ImageDef,futo2,�]1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,koishi2,-1280	,&
,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n
#Show,futo2,-1280	,

,SetFocus,marisa		,
,SetFocus,ichirin
,ImageDef,ichirin,�f1,0,0
��l�̐S���o���o�������\n���ł��̃R���r�Ȃ́H\,a,0,0,"Your minds are disconnected. \nWhy did you team up?"
,ClearBalloon,ichirin

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,�]1,0,0
,ImageDef,ichirin,��1,0,0
,ImageDef,futo2,��1,0,0

#,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
#,Show,futo2,-1280	,&#�t�F�C�X�\���J�n
,Show,ichirin,-1280	,#�t�F�C�X�\���J�n
,Show,marisa,-1280	,
,SetFocus,marisa		,

,SetFocus,ichirin		,#�������L�������w��
�������[\n�����������\,a,0,0,"Oh my, we lost."
,ClearBalloon,ichirin

,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
�܂��R���r��Ɋ���Ȃ�����\n���Ƃ����Ă���\,a,0,0,"I'm still not used to fighting with someone but we managed."
,ImageDef,marisa,��1,0,0
�������A���O�B�����S�߈˂�\n�g���Ƃ͂Ȃ�\,a,0,0,"But, I didn't think you two would be using Perfect Possession too."
,ClearBalloon,marisa

,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,futo2,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,futo2,	#�������L�������w��
,ImageDef,futo2,��1,0,0
��[��\n���x�͂������}�X�^�[����\,a,0,0,"All right, this time I shall be Master."
,ClearBalloon,futo2

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Show,ichirin,-1280	,#�t�F�C�X�\���J�n
,SetFocus,ichirin
,ImageDef,ichirin,��1,0,0
���[�A�܂����傤���Ȃ��Ȃ�\n�񑩂������\,a,0,0,"What? Well nothing I can do. \nIt was a promise."
,ClearBalloon,ichirin

,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
�ւ��A����ȂɊȒP��\n�}�X�^�[��؂�ւ�����\n�o����̂�\,a,0,0,"Huh, you can switch the Master that easily?"
,ClearBalloon,marisa#�����o������

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
