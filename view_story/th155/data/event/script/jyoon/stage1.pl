#========================================================================
#	�����F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F�������@�h���~�[
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(401)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,�f1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
���S�߈˂�\n���̐��E�Ɋ�����Ȃ��\n�o����m���Ă��́H\,a,0,0,"Shion, did you know that Perfect Possession interferes with the Dream World?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,�]1,0,0
�܂��A�C�t���Ă������\,a,0,0,"I noticed."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,shion2,��1,0,0
�������߂��Ƃ���\n���i���疲�̐��E����Ă�����\,a,0,0,"When I possess, it's always through the Dream World."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,shion2,��1,0,0
���S�߈˂��������@\n�݂���������˂�\,a,0,0,"It looks like Perfect Possession uses the same method."
,ClearBalloon,shion2

,Show,shion2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
����A���������Ă�[\,c,0,0,"You should've told me that earlier."
,ImageDef,jyoon,��1,0,0
���̂����Ŗʓ|�Ȃ��Ƃ�\n�Ȃ������������Ȃ�\,a,0,0,"Now it's become so troublesome."
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Hide,shion2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,SetFocus,marisa	,
,ImageDef,marisa,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������I\,b,0,0,"I found 'em!"
,ImageDef,marisa,��1,0,0
���O�B�I\n�悭������Ă��ꂽ�ȁI\,a,0,0,"Hey you! How dare you!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���@�g���̐l�ԁc�c\n���񂽂�\R[�ǂ���|�E�E�E]���H\,a,0,0,"A human witch�c�cWhich one are you?
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[��\n�܂�\R[�ǂ���|�E�E�E]������Ȃ����\,a,0,0,"Hmm. \nWe still can't tell which is which?
,ClearBalloon,shion2

,SetFocus,marisa	,
,ImageDef,marisa,�f1,0,0
�ǂ����A���ĉ�����\,a,0,0,"Whaddya mean which?"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,��2,0,0
���񂽂�\R[��|����]�̏Z�l��\n���̐��E�̏Z�l�����Ď���\,a,0,0,"If you're from the Real World or the Dream World."
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���B�͂ˁA�\������\n���̐��E�̏Z�l��߂܂���\n���Č����Ă��\,a,0,0,"We were told to capture the reckless Dream World dwellers."
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ڂ͑S������������\n���̏Z�l�͖{���ۏo����\n����s���肾���āc�c\,a,0,0,"They look exactly the same \nbut it's said Dream dwellers show their true self and are emotionally unstable�c"
,ClearBalloon,jyoon

,SetFocus,marisa	,
,ImageDef,marisa,��1,0,0
�قق��A���̏Z�l��߂܂���A��\,a,0,0,"Ohh, capture the Dream dwellers."
,ImageDef,marisa,�{1,0,0
�얲�����̍��������ȁH\n�ޓz�͂��������\n��l�����ۂ��Ėڏ��Ȃ񂾂�\,a,0,0,"So Reimu is under Yukari's influence? \nShe's always more of the hero than me. What an eyesore.
,ClearBalloon,marisa

,SetFocus,marisa	,
,ImageDef,marisa,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,jyoon,��1,0,0
�܊p�A���̐��E�Ŗ\�����\n�Ƃ����̂ɁA���O�B�Ȃ񂩂�\n�߂܂��Ă��܂邩�I\,b,0,0,"Now that I can go crazy in the Real World, \nthere's no way am I gonna be captured by you!
,ClearBalloon,marisa

,SetFocus,marisa	,
,ImageDef,marisa,��1,0,0
�v������\n�\�����@�������Ă�邺�[�I\,b,0,0,"I'm gonna try as much reckless magic as I want!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���������I�@�E���[�I\n�����͖��̐��E�̖��������[�I\,b,0,0,"I found her! Kill her! \nThis is the Marisa from the Dream World!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(302)",# �w��BGM�Đ��J�n

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
,ImageDef,marisa,��1,0,0
,ImageDef,doremy2,�]1,0,0

#,Show,shion2,-1280	,&
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,marisa	,
,ImageDef,marisa,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�n��ȓz��\n�����̎��͂���ȓz���\n���ĂȂ������̂�\,a,0,0,"You weaklings. \nMy real self couldn't win to these guys?"
,ClearBalloon,marisa

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,marisa,��1,0,0
,ImageDef,doremy2,��1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,marisa	,
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܂��͈�l�Q�b�g�I\n���������Ɉ����n����\n�ǂ��񂾂��\,a,0,0,"Got our first one! \nWe just deliver her to Yukari, right?"
,ClearBalloon,jyoon

,SetFocus,marisa	,
�����[�A�����Ɩ\�ꂽ���������[\,a,0,0,"Damn it, I wanted to create more trouble."
,ClearBalloon,marisa

,SetFocus,shion2	,
,ImageDef,shion2,��2,0,0
���̒��q�ŁA�\���������̏Z�l��\n�T���čs�����ˁ[\,a,0,0,"Let's keep this up and find all of the crazy dream dwellers."
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
