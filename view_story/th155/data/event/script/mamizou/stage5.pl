#========================================================================
#	�}�~�]�E�F�X�e�[�W5�@����
#	�ꏊ�F
#�@ �X���C�u�F���g�@�G�`�[���F����
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
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P����
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,jyoon_name,jyoon,name,920,0,false

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�v���C���[���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera_Live()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
,ImageDef,mokou2,�]1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,120


,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,mamizou		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
�قق��A������炶���\n�v���Y�����o�[�y�c�����イ�̂�\n����Ȃɐl�C�Ȃ񂶂��\,a,0,0,"Ooh, it's a full house.\nThis Prismriver band is quite popular."
,ClearBalloon,mamizou#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���



# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,�]1,0,0
�A�b�v�e���|�Ȃ���\n�j�q���Ȏ����ς̂���Ȃ�\n����Ȃ̂�\,a,0,0,"Their up-tempo but nihilistic life or death songs are the selling point."
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
�ڂ�����\n���Ă̓t�@������ȁH\,a,0,0,"You know a lot. Are you a fan?"
,ClearBalloon,mamizou#�����o������

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
���A����͂Ƃ�����\n���������J�������c�c\,c,0,0,"That�c that's beside the point.\nThe concert will begin�c�c"
,ClearBalloon,mokou2


,Hide,mamizou,-1280,
,Hide,mokou2,-1280,

,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


,Show,jyoon,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
������[�I\n���C�u�A�y���݁[�I\n�����������t���n�܂�ˁ[�I\,a,0,0,"Yay! I'm excited for the concert!\nThe performance's going to start soon!"
,ImageDef,jyoon,��2,0,0
�ϋq�����S�ɂȂ�u�Ԃ�\n�K�����[\,a,0,0,"The moment when the crowd will be mindless is coming soon."
,ClearBalloon,jyoon

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,�]1,0,0
�҂��Ă�����\,a,0,0,"I was waiting for you."
,ClearBalloon,mamizou#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�{1,0,0
�N��H\n�y�������C�u���ז�����z��\,a,0,0,"Who are you, getting in the way of a fun concert."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
�N�͉����K�̓�b��}�~�]�E\n���͍ŋ���\n���S�߈˂̎g���肶��\,a,0,0,"I'm the bake-danuki, Mamizou Futatsuiwa.\nWe're the strongest experts of Perfect Possession."
,ClearBalloon,mamizou#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��2,0,0
���S�߈˂̎g����\n�͂́[��A�قف[��\,a,0,0,"Experts of Perfect Possession.\nHahaha hohoho."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈ˈٕς��N�������z��\n�����Ɍ����Ɠ���ł����̂���\n���O�̎������H\,a,0,0,"We predicted the culprits of the Perfect Possession incident would appear here.\nThat's you, isn't it?
,ClearBalloon,mamizou#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
������\n�悭�����܂ŒH�蒅�������\,a,0,0,"Yup, Good job getting all the way here."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#�����L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,mamizou,��1,0,0
���C�u�ɐS��D���Ă���\n�ϋq�ɜ߈˂��邽�߂�\n���S�߈˂̉\�𗬂�\,a,0,0,"You started a rumor about Perfect Possession to possess \nan audience captivated by the concert."
,ImageDef,mamizou,�]1,0,0
���X�̈Ă���\n�h��ɂ��߂�����\,a,0,0,"A pretty good plan but overdone."
,ImageDef,mamizou,��1,0,0
�N��������𗘗p����\n��������߂�������\,a,0,0,"We utilized Perfect Possession to become stronger."
,ImageDef,mamizou,��1,0,0
�����A������������I\,a,0,0,"Now, let the fight begin!"
,ClearBalloon,mamizou#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��2,0,0
�ՂՁ[�A���O��n������\,a,0,0,"hahaha, how stupid."
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�m���Ɋ��S�߈ˈٕς�\n���@�͂��̒ʂ肾��\n�ϋq�ɜ߈˂��邽�߂�\,a,0,0,"True, the motive for the Perfect Possession Incident was just that.\nTo possess the audience."
,ImageDef,jyoon,�]1,0,0
�����ǂ˂�\n�h��ɉ\���΂�܂����̂�\n�킴�ƂɌ��܂��Ă邶��Ȃ��I\,b,0,0,"But the rumor was obviously spread on purpose!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,�f1,0,0
�Ȃ񂶂�ƁH\,a,0,0,"What did you say?"
,ClearBalloon,mamizou#�����o������


,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,
,Sleep,190



,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�]1,0,0
����\R[�ː_����|��肪�݂��储��]\n�ŋ��ň���\R[�u�a�_|�₭�т傤����]\n������\,a,0,0,"I'm Jyoon Yorigami, the cursed and evil Pestilence God. And�c"
,ClearBalloon,jyoon

,Hide,jyoon,-1280,&

#
#�������o�ꂷ����ꉉ�o���}������܂�
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#�����o��
#

,Sleep,180#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2		,#�������L�������w��
����\R[�ː_����|��肪�݁@������]\n�ŋ��ň��̕n�R�_��\,a,0,0,"I'm Shion Yorigami, the cursed and evil Poverty God."
,ClearBalloon,shion2

,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
�u�a�_�ɕn�R�_�����\t[!?]\,a,0,0,"A Pestilence God and Poverty God!?"
,ClearBalloon,mamizou#�����o������

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280, &	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������l��\n��������闝�R�͖����ȁI\,b,0,0,"Two opponents... There's no need to go easy on them!"
,ClearBalloon,mokou2


#
#�����Ǝ����������ɂ���ׂ���ꉉ�o���}������܂�
#
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
#
#�����Ǝ����������ɂ���ׂ���ꉉ�o���}������܂�
#
#,Sleep,30
#,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
��炪���̍ŋ��ň��̎o���Ȃ̂�\n�g���ȂĒm�邪�ǂ��I\,e15x3,0,0,"You should experience yourselves why we are the cursed and evil sisters!"
,ClearBalloon,jyoon


#,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

# =====
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��


,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#��b�C�x���g�Ȃ��ŃR���e�B�j���[������

,Sleep,30

,Function,"::battle.Continue()",# �ΐ�J�n����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��2,0,0
,ImageDef,mokou2,�]1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon
,SetFocus,mokou2
,ImageDef,mokou2,�]1,0,0
������Ȃ����I\n����Ȃ��̂Ȃ̂��H\,a,0,0,"I think something is missing! Is this really it?"
,ClearBalloon,mokou2

,SetFocus,jyoon
,ImageDef,jyoon,��1,0,0
���͂͂͂�\,a,0,0,"Ahahaha."
,ClearBalloon,jyoon

,SetFocus,mamizou
,ImageDef,mamizou,��2,0,0
�����c�c\n���ŏ΂��Ă�����񂶂�H\,a,0,0,"You...... why are you laughing?"
,ClearBalloon,mamizou

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����ȒP���Ȗ\�͂�\n�{���̖\�͂̑O�ł�\n���Ӗ������炾��I\,c,0,0,"Because your simple throws are nothing against real violence!"
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,30
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�߈ˌ����u\R[�A�u�\�����[�g���[�U�[|���S�Ȕs�k�ҁI]�v\,e15x3,0,0,"Possession Exchange �hAbsolute Loser!�h"
,ClearBalloon,jyoon


#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�ĊJ����

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
