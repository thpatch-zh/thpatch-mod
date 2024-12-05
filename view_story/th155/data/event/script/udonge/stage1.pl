#========================================================================
#	���F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F�������@�@�얲
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa2,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/marisa/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,reimu,�f1,0,0
,ImageDef,marisa2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,udonge,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,udonge		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
�c�c�g�����ǂ��Ȃ���\,a,0,0,"These wavelengths are no good."
,ClearBalloon,udonge#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��2,0,0
����̌���\n��i�Ƌ��C�̌�������Ă���\,a,0,0,"Tonight's moon is emitting a particularly insane light.
,ClearBalloon,udonge#�����o������

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
����ȓ���\n���������N����񂾂�˂�\,a,0,0,"I have a bad feeling something's going to happen on these kind of days."
,ClearBalloon,udonge#�����o������

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��

,Show,reimu,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,�f1,0,0
����ς肠�񂽂ˁH\,a,0,0,"So it was you."
,ClearBalloon,reimu

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��1,0,0
�|�тŋ��C�̓e��\n�\��Ă�����ĕ���������\,a,0,0,"I heard a mad rabbit was causing trouble in the bamboo forest."
,ClearBalloon,reimu

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�f1,0,0
���[\n�\���I���̗\��\,a,0,0,"Ugh, just as I predicted."
,ClearBalloon,udonge#�����o������

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,�]1,0,0
���C���Č������炠�񂽂�����\,a,0,0,"If we're talking about insane, that'd be you."
,ClearBalloon,reimu

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
�͂��͂�\n�\��Ă�������͂Ȃ�����\,a,0,0,"Yes, yes. \nI didn't mean to create a scene."
,ClearBalloon,udonge#�����o������

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,�f1,0,0
����[�H\n���񂽁A�Ȃ񂩂����ƈႤ�H\,a,0,0,"Hmm... \nSomething seems different about you today."
,ClearBalloon,reimu
,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
�قق�\,c,0,0,"Aha."
,Function,"::sound.PlayBGM(352)",# �w��BGM�Đ��J�n
,ImageDef,udonge,��1,0,0
���΂͛ޏ��A�悭�������˂�\,a,0,0,"As expected of the Shrine Maiden. \nYou noticed well."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,udonge,��1,0,0
���͖��̐��E��\n���E�D�܉؉@�E�C�i�o\,a,0,0,"I'm Reisen Udongein Inaba from the Dream World."
,ImageDef,udonge,��1,0,0
�M���̒m���Ă�����Ƃ͈قȂ�\n������l�̗�傾�I\,a,0,0,"Different from the Reisen you know- I'm the other Reisen!"
,ClearBalloon,udonge#�����o������

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��1,0,0
���̂܂�Ȃ���k�c�c\n�����̗�傩������Ȃ�\,a,0,0,"What a bad joke�c�c maybe it is the usual Reisen."
,ClearBalloon,reimu

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�]1,0,0
��k���ǂ����A�������Ă݂�H\,a,0,0,"Do you want to fight and see if it's a joke?"
,ClearBalloon,udonge#�����o������


#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu,-1280,


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

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
,ImageDef,marisa2,�f1,0,0
,ImageDef,reimu,�]1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,reimu,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,udonge		,
,SetFocus,reimu		,
,ImageDef,reimu,�f1,0,0
�Ȃ񂩕ςȗ�傾������˂�\,a,0,0,"What a strange Reisen."
,ClearBalloon,reimu

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu,-1280,

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
,ImageDef,doremy2,��2,0,0
,ImageDef,marisa2,��1,0,0
,ImageDef,reimu,��1,0,0

#,Show,marisa2,-1280	,&#�t�F�C�X�\���J�n
,Show,reimu,-1280	,#�t�F�C�X�\���J�n

,SetFocus,reimu		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̎x�z�҂ƃR���r��\n�g��ł���Ȃ��\n�ǂ����āc�c\,c,0,0,"Why are you working with the Dream Ruler�c�c."
,ClearBalloon,reimu

,Hide,reisen,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,doremy2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ɂ������\n�M���̒m���Ă�����ł�\n����܂���\,a,0,0,"The Reisen you see here, is not the Reisen you know."
,ImageDef,doremy2,��2,0,0
�{���ɖ��̐��E����\n�o�Ă������Ȃ̂ł�\,a,0,0,"She is the Reisen from the Dream World."
,ClearBalloon,doremy2

,SetFocus,reimu		,
�Ӂ[��\n�S�R�Ӗ����킩��Ȃ�����\,a,0,0,"Hmm I don't understand at all but"
���񂽂��o�Ă������Ď���\n���X�ł��Ȃ��̂�\,a,0,0,"Seeing you here must means it's not all bad."
,ClearBalloon,reimu

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�f1,0,0
���S�߈˂ɂ͕���p������\,a,0,0,"Perfect Possession has side effects."
,ImageDef,doremy2,�]1,0,0
�ƌ������ł�\n�M�����C�ɗ��߂Ă�����\,a,0,0,"Please keep this in mind."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,udonge		,
,ImageDef,udonge,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ��ӂ��ӁA���߂Ă̌��̐��E��\n�����҂��󂯂Ă���̂��y���݂�\,b,0,0,"Hehehe, it's my first time in the Real World. \nI'm excited to see what's to come."
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,marisa2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu,-1280,

,Sleep,60

,End

# -------------------------------------------------------
