#========================================================================
#	�V�q�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�j���ہ@�G�`�[���F������@�h���~�[
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
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro,kokoro,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,kokoro_name,kokoro,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kokoro/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#��\�����߂��@�\���܂���
,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,kokoro,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
�����́H\,a,0,0,"Who's this?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
���ʂ̗d��\n�����悭����Ȃ�����\n�t�r�_�̈���\,a,0,0,"I don't really know about mask youkai but it's type of tsukumogami." 
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,�]1,0,0
�t�r�_��\n����܂����˂ȓz����\,a,0,0,"A tsukumogami. \nAnother lowly thing."
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,kokoro,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro	,
,ImageDef,kokoro,��1,0,0
�N�H\,a,0,0,"Who's this?"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2	,
,ImageDef,doremy2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ޏ��́A�V�l�ł�\n�ŋ߉���Ȃ����R�œV�E��\n�ސT�A�Ǖ�����܂���\,a,0,0,"She is a celestial. \nShe was recently confined and expelled from Heaven for a stupid reason."
,ClearBalloon,doremy2

,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
�ȁH\n���̂���Ȃ��Ƃ�m���Ă���H\,a,0,0,"Wha- How do you know that?"
,ClearBalloon,tenshi

,SetFocus,doremy2	,
,ImageDef,doremy2,��1,0,0
���̐��E�̋M����\n��s���Ă܂�����\,a,0,0,"Your Dream World self was complaining."
,ClearBalloon,doremy2

,SetFocus,tenshi	,
,ImageDef,tenshi,�f1,0,0
���̐��E���ƁH\n���O�͈�́c�c\,a,0,0,"Dream World? \nWho in the world are you�c�c"
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,SetFocus,doremy2	,
,ImageDef,doremy2,�G1,0,0
���̓h���~�[�X�C�[�g\n���̎x�z�҂ł�\,a,0,0,"I am Doremy Sweet, Ruler of Dreams."
,ImageDef,doremy2,��2,0,0
�����Ă����炪\n���̐��E�̐`������\,a,0,0,"And this is Hata no Kokoro from the Dream World."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kokoro	,
,ImageDef,kokoro,�{1,0,0
���̐l�A�X������炯�ł�\n�ƂĂ��V��̐l�Ƃ͎v���܂���\,a,0,0,"This person is full of ugly emotions. \nI can't believe this is a celestial."
,ImageDef,kokoro,��1,0,0
���̗l�Ȋ���X���҂̑��݂�\n�󂯕t���܂���I\,a,0,0,"I can't accept the existence of someone with such ugliness."

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(310)",# �w��BGM�Đ��J�n

�������Ə���������I\,b,0,0,"Get lost!"
,ClearBalloon,kokoro


#�S���t�F�C�X�P��
,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kokoro,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,


,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,kokoro,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,kokoro,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,tenshi	,
,SetFocus,kokoro	,
,ImageDef,kokoro,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Â₩����Ĉ������ł��傤��\n����̃R���g���[����\n�o���Ă��܂���\,a,0,0,"You must've been spoiled as a child. \nYou can't control your emotions at all."
,ClearBalloon,kokoro

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kokoro,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

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
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,�]1,0,0
,ImageDef,kokoro,��1,0,0
,ImageDef,doremy2,��1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
#,Show,kokoro,-1280	,&#�t�F�C�X�\���J�n
,Show,doremy2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,doremy2	,
,SetFocus,tenshi	,

,Sleep,40
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̐��E�̘A�������āH\n�ア�z�قǂ悭�i����\,a,0,0,"You said you're from the Dream World? \nThe weaker they are, the louder they bark."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
�������߂Č����[\n���̎x�z�҂��āA�{���H\,a,0,0,"It's my first time seeing her. \nAre you really the ruler of dreams?"
,ClearBalloon,sinmyoumaru2

,SetFocus,doremy2	,
�����A�ܘ_�ł�\,a,0,0,"Of course."
,ClearBalloon,doremy2

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���Ⴀ�A�����������Ă�\n�V�E��Ǖ����ꂽ���Ă͖̂{���H\,a,0,0,"So what you said earlier about being exiled from Heaven is true?"
,ClearBalloon,sinmyoumaru2

,SetFocus,doremy2	,
,ImageDef,doremy2,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�{�l������̂ł�����\n�����Ă݂���@���ł��H\,a,0,0,"The person in question is right there. \nWhy don't you ask her yourself?"
,ClearBalloon,doremy2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܂��A�Ǖ��͖{������\n�Ƃ����Ă����s�s�ȗ��R�ł��[\,a,0,0,"Well, it's true I was exiled. \nBut it was a ridiculous reason."
,ImageDef,tenshi,��2,0,0
���͐����̓V�l�ŁA���܂�Ȃ���\n�̂�����Ȃ���d�����Ȃ��Ă�\n�ǂ��񂾂��ǂ��[\,a,0,0,"I'm a pure celestial and I've been important since I was born, \nso I don't need to work."
,ImageDef,tenshi,�f1,0,0
�ɂ���������������Ȃ��Î��p��\n\R[�O|����]���܂ݐH�����������Ȃ̂�\n�݂�ȑ呛����\,a,0,0,"And I was bored so I took a taste of some beef tongue for a festival. \nIt didn't even taste good but everyone was so upset."
,ImageDef,tenshi,�{1,0,0
�Î��̏����̎ז�������\n�b���n��ɕ���o���ꂽ��\n���s�s����Ȃ��H\,a,0,0,"They said I was in the way of preparing for the festival, \nso I was kicked out to Earth for the time being. \nIsn't it ridiculous?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
���A����\n��A���s�s�A�Ȃ̂��ȁH\,a,0,0,"Uh, yeah, err, it's ridiculous?"
,ClearBalloon,sinmyoumaru2

,Hide,doremy2,-1280, &
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,kokoro	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���s�s���Ǝv�����R������Ȃ�\,a,0,0,"I don't understand why it's ridiculous."
,ClearBalloon,kokoro

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kokoro,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
