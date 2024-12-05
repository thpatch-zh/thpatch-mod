#========================================================================
#	���q�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F�얲�@�h���~�[
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
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy3,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,reimu_name,reimu,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,reimu,��1,0,0
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
����H\n�����̂悤�ɋ����肵���̂�\n�����͈�́H\,a,0,0,"Huh? I was just taking a nap as usual. \nWhere am I?"
,ClearBalloon,usami#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,usami,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,reimu,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
俎q����Ȃ�\n\R[�����|�E�E�E]�Ƃ���ŉ�̂͒�������\,a,0,0,"Isn't it Sumireko. \nIt's rare to see you here."
,ClearBalloon,reimu

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
���烌�C������\n���񂽂�������Ď���\n�����͌��z���Ȃ̂�\,a,0,0,"Oh, hi Reimu. \nSince you're here, I guess this is the Gensokyo."
,ClearBalloon,usami#�����o������

,Function,"::sound.StopBGM(3000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��2,0,0
���z���Ɍ�����H\,a,0,0,"Does it look like the Gensokyo?"
,ClearBalloon,reimu

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,�f1,0,0
�H\,a,0,0,"?"
,ClearBalloon,usami#�����o������


,Function,"::sound.PlayBGM(314)",# �w��BGM�Đ��J�n

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���񂽂�\R[��|����]��俎q�Ȃ̂�\n�����ɋ���ׂ��l�Ԃ��Ⴀ�Ȃ���\,a,0,0,"You're the real Sumireko. \nYou're someone who shouldn't be here."
�ڂ��o�܂���I\,b,0,0,"Wake up!"
,ClearBalloon,reimu


#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,reimu,��1,0,0
,ImageDef,doremy3,�]1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,reimu,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,usami
,SetFocus,reimu
,ImageDef,reimu,��1,0,0
�����ɂ͊O�̐��E�����z��������\,a,0,0,"There's no Outside World or Gensokyo here."
,ClearBalloon,reimu

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,usami,1,0,0
,ImageDef,doremy2,�]1,0,0
,ImageDef,reimu,�]1,0,0
,ImageDef,doremy3,��1,0,0


,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
,Show,usami,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami		,
,SetFocus,reimu
���͂́A���񂽖��q��\n�Ȃ����݂�����\,a,0,0,"Hahaha, It looks like you're lost."
,ClearBalloon,reimu

,SetFocus,usami		,
,ImageDef,usami,�f1,0,0
�Ȃ񂩕ςȃ��C����\n�����͍�������\n�s�������񂾂��ǁ[\,a,0,0,"What a weird Reimu. \nI want to go to the Kourindou today-"
,ClearBalloon,usami

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
�������甲���o���ɂ�\n������l��俎q��T������\,a,0,0,"To escape from here, you'll have to find the other Sumireko."
,ClearBalloon,reimu

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy3,-1280,

,Sleep,60

,End

# -------------------------------------------------------
