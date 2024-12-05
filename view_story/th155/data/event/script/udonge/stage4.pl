#========================================================================
#	���F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F���g�@�얲
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
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou,mokou,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,mokou_name,mokou,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mokou/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��2,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,mokou,��2,0,0
,ImageDef,reimu2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�G1,0,0
�^�C�����~�b�g\n���̐��E�ɖ߂鎞�Ԃł�\,a,0,0,"Time's up. \nIt's time to return to the Dream World."
,ClearBalloon,doremy2


# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Show,udonge,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,udonge		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��2,0,0
���[�A�܂��\�ꑫ��Ȃ���\,a,0,0,"But I'm not done."
,ClearBalloon,udonge#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��2,0,0
�\����h�����߂�\n���Ŕ��U���鎖����؂ł���\,a,0,0,"To prevent recklessness, venting in the Real World is important..."
,ImageDef,doremy2,��1,0,0
���̐��E�̑؍݂�\n�����Ȃ�߂��Ă�\n�o�����X�������܂�\,a,0,0,"But staying in the Real World for too long will throw off the balance too."
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
���ƈ�킾�������ł��傤�H\n�܊p�̌��Ȃ񂾂���\,a,0,0,"Can I fight one more time? \nI'm finally in the Real World."
,ClearBalloon,udonge#�Ώۂ̐����o������

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[��\n�댯�͊댯�����ǁc�c\,a,0,0,"Hmm�c It is dangerous but�c�c"
,ImageDef,doremy2,��1,0,0
�M�������Ă����\n��J���Ă���悤�����c�c\,a,0,0,"Watching you, I can see you're struggling�c�c."
,ImageDef,doremy2,��1,0,0
����܂���\n�����Ō�̈��Ƃ��܂�\,a,0,0,"All right.\nThis is the last fight."

,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
��������I\n�b���킩��[\,a,0,0,"Yay! \nSo understanding."
,ClearBalloon,udonge#�Ώۂ̐����o������

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,mokou,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou		,#�������L�������w��
,ImageDef,mokou,��2,0,0
��������\n���O���\�̕ςȗ�傾��\,a,0,0,"I found you. \nYou're the rumored strange Reisen."
,ClearBalloon,mokou

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���x�ǂ�\n�Ō�̑���͋M���A�s���l��\n���܂��I\,a,0,0,"Perfect timing. \nMy last opponent will be you - an immortal!"
�����A�������I\,b,0,0,"Now, let's fight!"
,ClearBalloon,udonge#�Ώۂ̐����o������

,SetFocus,mokou		,#�������L�������w��
,ImageDef,mokou,��1,0,0
��������\n��傿���̕�����\n�����𒧂�ł���Ȃ��\,a,0,0,"I'm so happy. \nReisen-chan challenging me to a fight."
,ClearBalloon,mokou

,SetFocus,udonge		,	#�����L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,udonge,�]1,0,0
�ӂӂ�\n�O�X����s�������܂��Ă����̂�\,a,0,0,"Hehehe I've been dissatisfied for awhile now."
,ImageDef,udonge,��1,0,0
�M���̗l�ȕs�����q��\n�|�тɕ��u���Ă��鎖���I\,b,0,0,"That a troublemaker like you has been left alone in the bamboo forest!"
,ClearBalloon,udonge#�Ώۂ̐����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(354)",# �w��BGM�Đ��J�n

,SetFocus,mokou		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,mokou,��1,0,0
�v���΁A�얲�Ɠ���ւ��\n���O�Ɛ�����̂�\n���S�߈ˈٕς̎n�܂肾����\,a,0,0,"If I think about it, \nswitching with Reimu and fighting with you \nwas the beginning of the Perfect Possession incident."
,ImageDef,mokou,��1,0,0
���̎��Ƃ͌��Ⴆ��悤��\n����������\,a,0,0,"You've matured since then that I hardly recognize you."
,ImageDef,mokou,�]1,0,0
���͊��S�߈˂��g�����Ȃ�\n���ꂩ�牽�{�������Ȃ�����\n���O�͂ǂ����H\,b,0,0,"I've mastered Perfect Possession and now I'm a million times stronger. \nHow about you?"
,ImageDef,mokou,��1,0,0
�А��̗ǂ��͌������ł͂Ȃ���\n���ۂɌ����Ă݂�I\,b,0,0,"Show me that your spirit isn't all talk!"
,ClearBalloon,mokou


#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,


,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,mokou,�]1,0,0
,ImageDef,reimu2,�]1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,mokou,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,udonge		,
,SetFocus,mokou
��������������\,a,0,0,"It was all talk."
,ClearBalloon,mokou

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

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
,ImageDef,udonge,��2,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,mokou,��2,0,0
,ImageDef,reimu2,��1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
,Show,mokou,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,udonge
,SetFocus,mokou
,ImageDef,mokou,��2,0,0
�Ȃ�قǁA�������ł�\n������������\,a,0,0,"I see, I guess she wasn't all words"
,ClearBalloon,mokou

,SetFocus,udonge
,ImageDef,udonge,��1,0,0
�������Ԃ������́I\n�{�C�ł������Ă����I\,b,0,0,"There's no time! Come at me with all you got!"
,ClearBalloon,udonge

,SetFocus,mokou
,ImageDef,mokou,��1,0,0
�ǂ����낤�I\n�ꔭ�Ō��߂Ă��I\,a,0,0,"Alright! I'll take care of it in one shot!"
,ClearBalloon,mokou

,SetFocus,mokou
,ImageDef,mokou,��1,0,0
�����ɏĂ����I\n\R[����|���̂�]�̉��łȁI\,b,0,0,"Burn forever! From the flame of life!"
,ClearBalloon,mokou




#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�ĊJ����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��2,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,mokou,��2,0,0
,ImageDef,reimu2,��1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
,Show,mokou,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,udonge
,SetFocus,mokou
,ImageDef,mokou,��2,0,0
�Ȃ�قǁA�������ł�\n������������\,a,0,0
,ClearBalloon,mokou

,SetFocus,udonge
,ImageDef,udonge,��1,0,0
�������Ԃ������́I\n�{�C�ł������Ă����I\,b,0,0
,ClearBalloon,udonge

,SetFocus,mokou
,ImageDef,mokou,��1,0,0
�ǂ����낤�I\n�ꔭ�Ō��߂Ă��I\,a,0,0
,ClearBalloon,mokou

,SetFocus,mokou
,ImageDef,mokou,��1,0,0
�����ɏĂ����I\n\R[����|���̂�]�̉��łȁI\,b,0,0
,ClearBalloon,mokou




#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

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


# -------------------------------------------------------
