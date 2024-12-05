#========================================================================
#	���q�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F�������@�h���~�[
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,usami,usami,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,doremy2,doremy,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy3,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy3/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,doremy3,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,usami,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,
,SetFocus,usami		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������A�m���Ă���ꏊ��\n�ړ��o���Ȃ�\,a,0,0,"That's strange. \nI can't move to the usual places."
���̕s�C���Ȑ��E����\n�ǂ�����Ă������o���Ȃ���\,a,0,0,"I can't seem to escape this creepy world."
,ClearBalloon,usami#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,usami,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,marisa,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,marisa		,#�������L�������w��
�����Ă����\,a,0,0,"You're lost."
,ClearBalloon,marisa

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
�����A�}���T�����[�I\,c,0,0,"Oh Marisa!"
,ImageDef,usami,��1,0,0
����������\n�������甲���o���Ȃ��ā[\,a,0,0,"I'm saved. \nI can't get out of here-"
,ClearBalloon,usami#�Ώۂ̐����o������

,Function,"::sound.StopBGM(2000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂӂӁA�����o���Ȃ���\,a,0,0,"Hehehehe, you can't escape?"
,Function,"::sound.PlayBGM(351)",# �w��BGM�Đ��J�n
����Ȏ��R�̐��E�Ȃ̂ɂȁI\,a,0,0,"But it's such a free world!"
,ClearBalloon,marisa#�Ώۂ̐����o������

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,�f1,0,0
���H\n��̉����[�I\,a,0,0,"Huh? \nWhat are you saying!"
,ClearBalloon,usami#�Ώۂ̐����o������


#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy3,-1280,


,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,marisa,�{1,0,0
,ImageDef,doremy3,�]1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami

,SetFocus,marisa
,ImageDef,marisa,�{1,0,0
���S�߈˂̏��ׂ�\n���R�ɂȂ鎞�Ԃ������Ă��邺\,a,0,0,"There's less time to be free because of this Perfect Possession."
,ClearBalloon,marisa

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy3,-1280,

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
,ImageDef,usami,�{1,0,0
,ImageDef,doremy2,�]1,0,0
,ImageDef,marisa,�]1,0,0
,ImageDef,doremy3,��1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
#,Show,doremy2,-1280	,#�t�F�C�X�\���J�n


,SetFocus,marisa
,SetFocus,usami		,
,ImageDef,usami,�{1,0,0
�Ⴄ�I\n�M���̓}���T����Ȃ��I\,a,0,0,"No! \nYou're not Marisa!"
,ClearBalloon,usami

,SetFocus,marisa
�����͂���\n���͖��������B�ԈႢ�Ȃ�\,a,0,0,"Ahahaha. \nI'm Marisa. No doubt about it."
,ClearBalloon,marisa

,SetFocus,usami		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,usami,�f1,0,0
�������̃��C������������������\,a,0,0,"The Reimu just now was strange too."
,ImageDef,usami,�f1,0,0
�����ڂ͂��̂܂܂Ȃ̂�\n���g��������ւ���Ă���݂���\,a,0,0,"She looks the same, \nbut it's like she was a different person on the inside."
,ImageDef,usami,��1,0,0
���������Ď����ςȐ��E��\n�������񂾂́H\n�p���������[���h������I\,a,0,0,"Maybe I wandered into a strange world? \nA parallel world?"
,ClearBalloon,usami

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
�����ǂ��̂������̂�\,a,0,0,"I can't tell if you're quick or slow�c"
,ImageDef,marisa,�]1,0,0
�����͖��̐��E��\n���O�͖����Ă���񂾂�\,a,0,0,"This is the Dream World. \nYou're sleeping right now."
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy3,-1280,

,Sleep,60

,End

# -------------------------------------------------------
