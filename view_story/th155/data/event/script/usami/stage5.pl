#========================================================================
#	���q�F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�@�G�`�[���F���q�@���q
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
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami2,usami,2p,1040,0,true

#2Pslave
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami3,usami,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,usami_name,usami,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/usami/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/usami/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(314)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,usami2,��1,0,0
,ImageDef,usami3,��1,0,0


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
����[�A�����̐��E��\n�߂��ė��������\,a,0,0,"Huh? I'm back in the Real World."
,ImageDef,usami,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̓��͍̂��A���ƂŐQ�Ă���\n���Ȃ񂾂���\n������Ăǂ��Ȃ����Ⴄ�́H\,c,0,0,"My body should be sleeping at home so what's going on?"
,ClearBalloon,usami#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,usami,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��


,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
\R[���E|������]�̗d���̎d�Ƃ�\n���̐��E�̋M����\n���̋M���������ɂ���݂���\,a,0,0,"Because of the Gap Youkai, \nboth the Dream World and Real World Sumireko are here."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,doremy2,�{1,0,0
�Ƃ߂�ꂽ\n���̂܂܂ł͖��ƌ��̋��Ԃ�\n�B���ɂȂ��Ă��܂���\,c,0,0,"We were tricked. \nLeft this way, the gap between Dreams and Reality will become ambiguous.
,ClearBalloon,doremy2

,Hide,usami,-1280,
,Hide,doremy2,-1280,


# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",
,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
�����A���H\,a,0,0,"Oh, it's me?"
,ClearBalloon,usami#�����o������

,Show,usami2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,usami2		,#�������L�������w��
,ImageDef,usami2,�f1,0,0
���A�����I\n�ǂ��������ƁH\,a,0,0,"Ah, it's me! \nWhat's happening?"
,ClearBalloon,usami2

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,�{1,0,0
���H\n�U�����[�I\,a,0,0,"Huh? \nIt's an imposter!"
,ClearBalloon,usami#�����o������

,SetFocus,usami2		,#�������L�������w��
,ImageDef,usami2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���H\n����俎q��\n�U���͋M������Ȃ��H\,a,0,0,"No? I'm Sumireko. \nAren't you the imposter?"
,ClearBalloon,usami2


,Function,"::sound.StopBGM(5000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g
# =====
,Hide,usami,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�f1,0,0
�ڂ̑O��俎q��\n���̏Z�l�̔��ł����c�c\n�ł��A�ǂ����āc�c\,a,0,0,"The Sumireko in front of me should be a dream dweller but�c�c why�c�c"
,ClearBalloon,doremy2

,Hide,usami2,-1280,
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,ImageDef,doremy2,��1,0,0
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",
,Show,usami3,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,usami3,	#�������L�������w��
,ImageDef,usami3,�{1,0,0
�ӂ�����ȁI\n�}�X�^�[�����O��\n��l�Ƃ��U����I\,a,0,0,"Stop messing around! \nYou and the Master are both imposters!"
,ClearBalloon,usami3

,Function,"::sound.PlayBGM(354)",# �w��BGM�Đ��J�n

,SetFocus,doremy2		,#�������L�������w��
�ǂ�����俎q��俎q��\n���S�߈˂��Ă���́H\,b,0,0,"Why is Sumireko Perfect Possessing Sumireko?"
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
���[�H\n���̋U������l����H\,a,0,0,"What? \nThere's two imposters?"
,ClearBalloon,usami#�����o������



,SetFocus,usami3		,#�������L�������w��
,ImageDef,usami3,��1,0,0
�U���B���s�[�s�[���邳���I\n�{���Ȃ�ŋ��̒��\�͎҂̔���\,a,0,0,"The imposters are so noisy! \nThe real one should be the strongest psychic."
,ClearBalloon,usami3

,Hide,usami3,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,usami2,	#�������L�������w��
,ImageDef,usami2,��1,0,0
�U���ǂ��������ȁI\n����ď������z���{��������ˁI\,b,0,0,"Shut up imposters! \nLet's fight and the one who wins is the real one!"
,ClearBalloon,usami2

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
�Ȃ�ł����Ȃ��\n�{�����������ɂ����Ȃ��I\n�܂Ƃ߂Ă������Ă��ȁI\,b,0,0,"Why did it end up like this. \nThere's no way the real one will lose! Come at me!"
,ClearBalloon,usami#�����o������


#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,usami3,-1280,


,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,usami2,�]1,0,0
,ImageDef,usami3,�]1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,usami2,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami

,SetFocus,usami2
,ImageDef,usami2,�]1,0,0
���������A�{����俎q��\,a,0,0,"I'm the real Sumireko."
,ClearBalloon,usami2

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,usami3,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,�f1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,usami2,��1,0,0
,ImageDef,usami3,��1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n
,Show,usami2,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami2


,Show,usami3,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami3


,SetFocus,usami
,ImageDef,usami,�f1,0,0
���[��\n�������񂪂炪�����Ⴄ�I\,a,0,0,"Ahh I'm so confused!"
,ClearBalloon,usami

,SetFocus,usami2
,ImageDef,usami2,��1,0,0
���X����ˁI\n�ł��A�U�҂͋����Ȃ���I\,a,0,0,"Not too bad! But I won't forgive an imposter!"
,ClearBalloon,usami2

,SetFocus,usami3
,ImageDef,usami3,�]1,0,0
�U�҂͈�l���Еt���Ă��I\,a,0,0,"Let's take care of imposters one by one!"
,ClearBalloon,usami3

,SetFocus,usami
,ImageDef,usami,�{1,0,0
�������āH\n�U�҂��ǂ����m���߂Ă݂ȁI\,a,0,0,"What did you say? Prove that I'm an imposter!"
,ClearBalloon,usami

,Hide,usami,-1280, &
,Hide,usami2,-1280, &
,Hide,usami3,-1280,

,Sleep,60

#,Show,usami2,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,usami2,&
,SetFocus,usami,
,ImageDef,usami,��1,0,0
,ImageDef,usami2,��2,0,0
���������ŋ��̃G�X�p�[���I\n�U�҂͏���������I,b,0,0


,SetFocus,usami2,
���B�������ŋ��̃G�X�p�[���I\n�U�҂͏���������I\,b,0,0,"I'm the strongest psychic! Get lost imposters!\nWe're the strongest psychics! Get lost imposter!"
,ClearBalloon,usami
,ClearBalloon,usami2

#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,usami2,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,usami3,-1280,

,Sleep,30

,Function,"::battle.Lose()",# �ΐ�ĊJ����

,End
# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::sound.StopBGM(1500);"
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.Go_Ending();"

,End

# -------------------------------------------------------
