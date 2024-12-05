#========================================================================
#	�_�q�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F���@�G�`�[���F������@�@�z�s
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
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro,kokoro,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,kokoro_name,kokoro,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kokoro/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(403)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,kokoro,��1,0,0
,ImageDef,futo2,��1,0,0


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
���_�I�ɖ��f���Ă������ȓz��\n��������\,a,0,0,"I found a fellow who looks mentally off guard."
,ImageDef,miko,��1,0,0
�����A��ꂢ�I\,a,0,0,"Now go!"
,ClearBalloon,miko#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,kokoro,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro		,#�������L�������w��
,ImageDef,kokoro,��1,0,0
���H\n�����Ȃ艽�H\,a,0,0,"Huh? \nWhat's this suddenly?"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,futo2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,futo2,	#�������L�������w��
,ImageDef,futo2,��1,0,0
�o���܂���\n���S�ɜ߈˂��܂���\,a,0,0,"Success. \nI perfectly possessed."
,ClearBalloon,futo2

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
�ł�����\n����ł́A��̌��̒����A���ނ�\,a,0,0,"Well done. \nNow then, I'll leave the investigation of that matter in your hands."
,ClearBalloon,miko#�Ώۂ̐����o������

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,kokoro		,#�������L�������w��
,ImageDef,kokoro,�f1,0,0
���H\n�����N�����Ă���́H\,a,0,0,"Huh? \nWhat's happening?"
,ClearBalloon,kokoro

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,�{1,0,0
���A�M���Ɉ��삪���߂�����I\n��R���Ȃ��Ǝ���ł��܂���\,b,0,0,"Right now, an evil spirit is possessing you! \nYou must resist or you will die!"
,ClearBalloon,hijiri2

,SetFocus,kokoro		,#�������L�������w��
,ImageDef,kokoro,��1,0,0
���H�@���H\n�������Ă�̂��悭����ȁ[��\,a,0,0,"Wait, what? \nI don't get what you're saying."
,ClearBalloon,kokoro

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(310)",# �w��BGM�Đ��J�n

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
��X�𑊎�Ɏv�������\���\n��������������Č�����I\,b,0,0,"Let the enemy rage as its heart desires and let us unleash the evil spirit!"
,ClearBalloon,miko#�Ώۂ̐����o������


#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kokoro,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

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
,ImageDef,kokoro,��1,0,0
,ImageDef,futo2,�]1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,hijiri2,-1280	,&
,Show,kokoro,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,miko
,SetFocus,kokoro
,ImageDef,kokoro,��1,0,0
�����������\n�_�u���@���Ƃ̍s����\n�Ӗ��s�������ĕ|��\,a,0,0,"I won. \nThese two zealots' actions are so mysterious, it's scary."
,ClearBalloon,kokoro

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kokoro,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,futo2,-1280,

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
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,�]1,0,0
,ImageDef,kokoro,��1,0,0
,ImageDef,futo2,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n
,Show,kokoro,-1280	,#�t�F�C�X�\���J�n

,SetFocus,kokoro		,
,SetFocus,miko		,
,ImageDef,miko,��1,0,0
���q�͂ǂ����H\,a,0,0,"How are you feeling?"
,ClearBalloon,miko

#
#������ƕz�s����b���Ɋ��S�߈˂��镔�����R�����g�A�E�g���Ă��܂�
#

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,futo2,	#�������L�������w��
,ImageDef,futo2,�]1,0,0
�����Ԃ���K�ł�\,a,0,0,"Extremely comfortable." 
,ClearBalloon,futo2

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kokoro
,ImageDef,kokoro,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������͐S�n�悭�Ȃ���I\n�Ȃ�ŏ���Ɋ��S�߈˂��Ă�̂�\n�o�Ă���������I\,a,0,0,"Hey, I'm not comfortable! \nWhy are you perfect possessing me without asking! Get out!"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,futo2,	#�������L�������w��
,ImageDef,futo2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���₳��Ă�\n����ƌ����ĕω������ł�\,a,0,0,"Even if you refuse, there is no change."
,ClearBalloon,futo2

,SetFocus,miko		,
,ImageDef,miko,�]1,0,0
�Ȃ����\n�悭������\n������a�ɋ��͊��ӂ��邼\,a,0,0,"I see. I understand. \nLady Kokoro, thank you for your cooperation"
,ClearBalloon,miko

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,kokoro
,ImageDef,kokoro,��1,0,0
�������Ă����Ȃ��́[�H\,a,0,0,"You're not going to even explain?"
,ClearBalloon,kokoro

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�

,Sleep,60

,End

# -------------------------------------------------------
