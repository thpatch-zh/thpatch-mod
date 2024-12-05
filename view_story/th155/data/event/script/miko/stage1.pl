#========================================================================
#	�_�q�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F���@�G�`�[���F�������@�@���
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,miko,miko,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,hijiri2,hijiri,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi,koishi,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,koishi_name,koishi,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/koishi/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(401)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,��2,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,koishi,�f1,0,0
,ImageDef,ichirin2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,miko		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,��2,0,0
���O�ɂ͉��݂͖�����\n������ɂȂ��ĖႤ��\,a,0,0,"I have no resentment against you but I will use you as my guinea pig."
,ClearBalloon,miko#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,koishi,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi		,#�������L�������w��
,ImageDef,koishi,�f1,0,0
������H\,a,0,0,"A guinea pig?"
,ClearBalloon,koishi

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
��ցA���ł���\,a,0,0,"Ichirin, Now is the time."
,ClearBalloon,hijiri2

,Hide,koishi,-1280,
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,ichirin2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2,	#�������L�������w��
,ImageDef,ichirin2,��1,0,0
���m���܂����I\n����ł����̂��ȁH\,a,0,0,"Understood! \nIs this ok?"
,ClearBalloon,ichirin2

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
��낵���A�������S�߈˂�\n����������\,a,0,0,"Good, enforced Perfect Possession succeeded."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko,	#�������L�������w��
,ImageDef,miko,�]2,0,0
�ȒP��������\n�����l���Ă��Ȃ�����\n�z���������炩\,a,0,0,"It was quite easy. \nSince it was a thoughtless looking fellow."
,ClearBalloon,miko

,Hide,ichirin2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,koishi		,#�������L�������w��
,ImageDef,koishi,��1,0,0
����A���Ȃ�\n�N���Ɋ��S�߈˂��ꂽ�H\,a,0,0,"Wait, did someone just Perfect Possess me?"
,ClearBalloon,koishi

,SetFocus,miko,	#�������L�������w��
,ImageDef,miko,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ق��A�꒚�O�Ɋ��S�߈˂̎���\n�m���Ă���񂾂�\,a,0,0,"Hm, so you've heard of Perfect Possession."
,ImageDef,miko,��1,0,0
�Ȃ�Θb�͑���\n���S�߈˂ɕt����\n�F�X���ׂ����ĖႤ���I\,b,0,0,"This will save us time. \nWe're going to investigate Perfect Possession!"
,ClearBalloon,miko

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,koishi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(308)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,koishi,��1,0,0
,ImageDef,ichirin2,�]1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,koishi,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,miko
,SetFocus,koishi
������[�A�����������\,a,0,0,"Yay, we won!"
,ClearBalloon,koishi
,Hide,koishi,-1280,

,Show,ichirin2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2,	#�������L�������w��
,ImageDef,ichirin2,��1,0,0
���݂܂���\n���q�ɏ���Ă��܂��܂���\,a,0,0,"I'm sorry. \nI got carried away.
,ClearBalloon,ichirin2

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,koishi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

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
,ImageDef,miko,�]1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,koishi,��1,0,0
,ImageDef,ichirin2,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n
,Show,koishi,-1280	,&#�t�F�C�X�\���J�n
#,Show,ichirin,-1280	,#�t�F�C�X�\���J�n


,SetFocus,koishi
,SetFocus,miko		,
,ImageDef,miko,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���݂����ӂ̏�̏ꍇ��\n�����I�Ɋ��S�߈˂����ꍇ��\n���̌�ɑ傫�ȍ��ق͖�����\,a,0,0,"Whether by mutual agreement or enforced Perfect Possession, \nthere's little difference after."
,ClearBalloon,miko

,SetFocus,koishi
����[\n���̊Ԃɂ��߈˂���Ă�����\n����͈�̉��̎����H\,a,0,0,"Huh? \nI was possessed suddenly but what kind of experiment is this?
,ClearBalloon,koishi

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������Ă��߂�Ȃ�����\n�������S�߈˂̒�����\n�T�v���C�Y�ł������s�o���Ȃ���\,a,0,0,"I'm sorry to frighten you. \nEnhanced Perfect Possession Investigation can only be executed by surprise."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,miko,��1,0,0
�o�����ӂ��Ă���Ȃ�\n�e�ՂɊ��S�߈˂ł���\,a,0,0,"If both parties agree, Perfect Possession is simple." 
,ImageDef,miko,�f1,0,0
���_�I�ɖ��f���Ă��鑊�肾��\n�����I�Ɋ��S�߈˂ł���\,a,0,0,"If the partner is mentally off guard, Perfect Possession can be enforced."
,ImageDef,miko,��2,0,0
�����͉��ׂ̈Ɍ�҂̏�����\n�L�߂��̂��c�c\,a,0,0,"What is the reason for the mastermind to create the latter condition�c�c"
,ClearBalloon,miko

,SetFocus,koishi
���[�A����Ŗ��ӎ��̓���\n��������������\n�߈˂����肵�Ă��̂�\,a,0,0,"Ohh, so that's why I was unconsciously possessed here and there."
,ClearBalloon,koishi

,SetFocus,miko		,
,ImageDef,miko,��1,0,0
�������S�߈˂̌o���҂������̂�\n�F�X�b�𕷂����Ă�����\,a,0,0,"So you've experienced enhanced Perfect Possession before. \nTell us more."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,koishi,-1280,

,Sleep,60

,End

# -------------------------------------------------------
