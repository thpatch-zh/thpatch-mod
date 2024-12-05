#========================================================================
#	�����F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F�}�~�]�E�@�h���~�[
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,jyoon,jyoon,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,shion,"data/event/pic/shion/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,shion2,shion,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou,mamizou,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,mamizou_name,mamizou,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mamizou/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��


,Function,"::sound.PlayBGM(405)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,50#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#�����o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
�قق��A�N�����̏Z�l�����\,a,0,0,"Ooh, I'm a dream dweller?"
,ClearBalloon,mamizou

,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
�\�ɂȂ��Ă���\n�K�̑叫�����������Ȃ�������\,a,0,0,"There was a rumor the Tanuki leader went crazy."
,ClearBalloon,jyoon

,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�悭�������̂�\n�����ɂ��N�͖��̏Z�l����\,a,0,0,"You know well. \nIndeed I'm a dream dweller."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���Ⴊ�A�����������ƂȂ�\n�������\,a,0,0,"But crazy? I think not."
,ImageDef,mamizou,�]1,0,0
���̙N���A���X�ɋC���g��������\n���邾������\n���������̂͌��̙N�����\,a,0,0,"Myself in the Real World is overly attentive. \nShe's the crazy one."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��̂ȁA����ȋ������E�̓z���\n�����Ȃ�Ă���K�v�͂Ȃ������\,a,0,0,"Anyways, there's no need to hold back in this small world."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
�N�ɏ]���z�����c����\n���z�̌��z���ɂ��Ă�낤\n���Č����Ă邾������\,a,0,0,"I say, only keep those who obey me and create an ideal Gensokyo."
,ClearBalloon,mamizou

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ɂ�\n���̏Z�l�炵�������Ԃ�\n���ɗL��������܂���\,a,0,0,"Really, spoken like a true dream dweller. \nThank you very much."
,ImageDef,shion2,��1,0,0
�ǂ����Ė��̏Z�l��\n�����������Ȃ����M��\n�������ӂ�Ă���񂾂�\,a,0,0,"Why are dream dwellers so full of false confidence?"
,ClearBalloon,shion2

,SetFocus,mamizou	,
,ImageDef,mamizou,�]1,0,0
�ӂ����ӂ����ӂ�\n�������Ȃ��Ƃ�\,c,0,0,"Hohoho, false confidence you say."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������Ȃ����ǂ��������Ă��\,a,0,0,"I'll show you if it's false or not."
,ImageDef,mamizou,��1,0,0
�����K�̓��̒��X\n�������E���Ă�낤�I\,b,0,0,"I, the Leader of Tanuki, shall personally trick and kill you!"
,ClearBalloon,mamizou

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mamizou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(309)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,shion2,-1280	,&
,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,mamizou	,
,ImageDef,mamizou,��1,0,0
���z���͙N�̕ʑ��ɂ��Ă�낤\n���̎��́A�{���ɗ~����\n�{�y����ɓ���邼��\,a,0,0,"I'll make the Gensokyo my vacation home. \nNext, I shall conquer the desired mainland."
,ClearBalloon,mamizou

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mamizou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,�]1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,doremy2,��1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,mamizou	,
,SetFocus,jyoon	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�͂��A�������z�̌��z����\n���̒��x�̘r�Ȃ�\n���R�̃{�X�����X��\,a,0,0,"Hah. What do you mean the ideal Gensokyo. \nIf that's all you got, at best it's a mountain boss."
,ClearBalloon,jyoon

,SetFocus,mamizou	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����\n�����͐Q�s����������������\,c,0,0,"Grr, I was sleep deprived. \nThat's all."
,ClearBalloon,mamizou

,SetFocus,shion2,
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���͂Ƃ�����A���̏Z�l�Q�b�g�I\n���������I\,a,0,0,"Anyways, another dream dweller! \nSo far so good!"
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�o����ƈꏏ�Ȃ̂�\n���̂�������\n���݂����[\,a,0,0,"Even though I'm working with you, it's going smoothly today. \nIt's like a dream."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
����Ȍ��݂��������Ȃ��\n�~�����Ȃ�������\,c,0,0,"I didn't want a sister who says such nasty words."
,ClearBalloon,shion2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mamizou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
