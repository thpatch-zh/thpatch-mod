#========================================================================
#	�얲�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F�ؐ�@�G�`�[���F�_�q����
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,reimu,reimu,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,kasen2,kasen,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri2,hijiri,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/hijiri/name2.pat",1#�G�X���C�u�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(403)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��1,0,0

#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
Show,miko,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko		,#�������L�������w��
�Ȃ���A���O�������n�߂���\,a,0,0,"I see you've made your move as well."
,ClearBalloon,miko

,Show,reimu,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,reimu		,	#�����L�������w��
,ImageDef,reimu,��2,0,0
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
���̂Ƃ���\n���̌������t���Ȃ����ǂ�\,a,0,0,"We haven't found anything yet though."
,ImageDef,reimu,��1,0,0
�܂��A���̂���\n���Ƃ��Ȃ�񂶂�Ȃ��H\,a,0,0,"Well, we'll figure it out at some point, right?
,ClearBalloon,reimu#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,miko,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,hijiri2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2,	#�������L�������w��
,ImageDef,hijiri2,��1,0,0
����ɂȂ�Ȃ��ޏ��˂�\,a,0,0,"What an unreliable shrine maiden."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280,&
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,#�������L�������w��
,ImageDef,miko,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��X�����ٕ̈ς̒�����\n���łɓ����Ă���\,a,0,0,"We have already been investigating this incident for a while."
,ImageDef,miko,�]1,0,0
���ׂ̈ɍ���R���r��g�񂾂̂�\n��X�̎ז������Ȃ��ł���邩\,a,0,0,"For that reason, we've teamed up. So please don't get in our way."
,ClearBalloon,miko

,SetFocus,reimu		,	#�����L�������w��
,ImageDef,reimu,�{1,0,0
����Ȃ킯�ɍs������\,a,0,0,"Like that's going to happen."
,ImageDef,reimu,��1,0,0
�s��������΂�����ł�\n�ٕς͎������������I\,a,0,0,"Even if it's by chance, I'll resolve this incident!"
,ClearBalloon,reimu#


,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,hijiri2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(306)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,�]1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,miko,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,miko

,ImageDef,miko,��1,0,0
���āA���悢��\n���ŋ��ٕϒ������̊����J�n��\,a,0,0,"Now, it's time for the strongest incident investigation team to begin its work!"
,ClearBalloon,miko


#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,miko,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,hijiri2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �Q�[���I�[�o�[��ʂ�

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#�����\��ݒ�
,ImageDef,reimu,�]1,0,0
,ImageDef,kasen2,�]1,0,0
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
,Show,miko,-1280	,#�t�F�C�X�\���J�n
#,Show,hijiri2,-1280	,#�t�F�C�X�\���J�n


,SetFocus,reimu
,SetFocus,miko
�Ȃ��\n���S�߈˂͎g�����Ȃ��̂�\n�R�c������l����\,a,0,0,"I see, there are some tricks in mastering Perfect Possession.
,ClearBalloon,miko

,SetFocus,reimu		,
,ImageDef,reimu,�]1,0,0
���񂽂��l����A�䂪��������\n�����ł��ĂȂ��񂶂�Ȃ��H\,a,0,0,"Aren't the two of you too egotistical to cooperate?
,ClearBalloon,reimu

,SetFocus,miko
����������\n����l�ł��ǂ��̂���\,a,0,0,"That may be true. \nI would be fine by myself,"
���ٕ̈ς͊��S�߈˂��Ȃ���\n�����͓���Ɗ���\n�d���������g��ł��邾����\,a,0,0,"but I felt investigating this incident would be difficult \nwithout using Perfect Possession. \nI had no choice but to form a team."
�����Ȃ�Ė��p�ł���\,a,0,0,"Cooperation is unnecessary."
,ClearBalloon,miko

# =====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,kasen2		,
,ImageDef,kasen2,�]2,0,0
�����a�𑸂�\n���Č����ĂȂ����������H\,a,0,0,"Did you not always say harmony is to be valued?"
,ClearBalloon,kasen2#�����o������

,SetFocus,miko		,
�����\n��ɋt�炤�Ȃƌ����Ӗ���\,a,0,0,"That means, do not oppose me."
,ClearBalloon,miko

,SetFocus,kasen2		,
,ImageDef,kasen2,��1,0,0
�����A���������c�c\,c,0,0,"Oh, now I understand�c."
,ClearBalloon,kasen2#�����o������

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&
,Hide,miko,-1280,&
,Hide,hijiri2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
