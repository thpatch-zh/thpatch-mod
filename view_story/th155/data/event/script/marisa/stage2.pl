#========================================================================
#	�������F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�������@�G�`�[���F�ɂƂ聕������
#	�X�e�[�W�^�C�g��
#	   �u�͓��̖�]�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,marisa,marisa,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,koishi2,koishi,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"
,DefineObject,nitori,nitori,2p,1040,0,true

#2Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro2,kokoro,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,nitori_name,nitori,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/nitori/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kokoro/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��2,0,0
,ImageDef,nitori,�G1,0,0
,ImageDef,kokoro2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,marisa,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,marisa		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�v������芮�S�߈˂���\n�ȒP�Ȃ񂾂�\,a,0,0,"Perfect Possession's much easier than I thought."
,ImageDef,marisa,��1,0,0
�Ă�����A�����̔\�͂�\n�֌W���Ă���̂��Ǝv��������\,a,0,0,"I was sure your ability had something to do with it."
,ClearBalloon,marisa#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��2,0,0
���������v���Ă��[\n���A�����Ȃ����Ȃ��A��\n�v���Ă��̂�\,a,0,0,"Me too. \nI thought I got stronger�c"
,ClearBalloon,koishi2


# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�N�Ƃł��ȒP�ɑg�߂��Ȃ�\n����Ȉ����ɂ����z����Ȃ���\n�ʂ̓z�Ƒg�ݑւ��Ă��ǂ�����\,a,0,0,"If you can partner up with anyone, \nI should work with someone who isn't so hard to deal with.."
,ClearBalloon,marisa#�����o������

,Hide,marisa,-1280,&
,Hide,koishi2,-1280,
,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",
,Show,nitori,-1280,&	#�Ώۃt�F�C�X�\���J�n
,ImageDef,nitori,�G1,0,0
,SetFocus,nitori		,#�������L�������w��
�����A�����̂��O\n���S�߈˂��Ă���ȁH\,a,0,0,"Hey, you there. \nYou're using Perfect Possession?"
,ClearBalloon,nitori

,SetFocus,marisa		,
,ImageDef,marisa,��2,0,0
�����A�͓����m���Ă���̂�\n���S�߈˂̉\\,a,0,0,"Ooh, so the Kappa's heard about the Perfect Possession rumor too."
,ClearBalloon,marisa

,Show,nitori,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,nitori		,#�������L�������w��
,ImageDef,nitori,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����Ɋ��S�߈˂��Đ�^��͒���\n���O�������ɕt�������Ă��炤��\,a,0,0,"I'm personally analyzing Perfect Possession. \nI'll have you help with my experiment too." 
,ClearBalloon,nitori

,Hide,nitori,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,kokoro2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2,	#�������L�������w��
,ImageDef,kokoro2,��1,0,0
�����y������I\n�߈˂��y������I\,a,0,0,"Experiments are fun! \nPossession is fun too!"
,ClearBalloon,kokoro2

,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
�c�c\,a,0,0,"�c�c"
,ImageDef,marisa,��1,0,0
���̓�l�ɑg�ݑւ���̂�\n�����Ȃ�\,a,0,0,"I don't want to work with these two either."
��芸����\n�R���r���҂͕ۗ��ɂ��Ă�����\,a,0,0,"I guess for now I'll wait on the partner reassessment."
,ClearBalloon,marisa


,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,nitori,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kokoro2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(307)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,�]1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,koishi2,-1280	,&
,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,marisa		,&

,SetFocus,nitori
��͂͏������I\n���S�߈˂̏����͉\�ʂ肾��\,a,0,0,"Analysis is going smoothly! \nThe conditions for Perfect Possession are just as the rumors said."
,ClearBalloon,nitori

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,nitori,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kokoro2,-1280,

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
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,�]1,0,0
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0


,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
#,Show,kokoro2,-1280	,#�t�F�C�X�\���J�n
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,marisa		,

,SetFocus,nitori
�����Ă��܂�����\n�ǂ��������ʂ͎�ꂽ\,a,0,0,"We lost but I collected some good test results."
,ClearBalloon,nitori

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
�������ĉ����H\,a,0,0,"What's the experiment?"
,ClearBalloon,marisa

,SetFocus,nitori
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̊��S�߈˂�\n�s�s�`���ٕς̉e���ł��鎖��\n���炩�ł���\,a,0,0,"So far it's clear this Perfect Possession is due \nto a consequence of the Urban Legend incident."
�܂�s�s�`���ٕς����������\n���S�߈˂��I����Ă��܂�\n�ƌ������ɂȂ�\,a,0,0,"And once the Urban Legend Incident is settled, \nPerfect Possession will end too."
,ClearBalloon,nitori

,SetFocus,marisa		,
,ImageDef,marisa,�{1,0,0
�܂����A���O�c�c\,a,0,0,"Don't tell me you're�c�c"
,ClearBalloon,marisa

,SetFocus,nitori
,ImageDef,nitori,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ��ӂ���\n�ٕς����܂邻�̑O��\n�l�H���S�߈˂�����������I\,a,0,0,"Hehehe. \nBefore the incident is settled, \nI'm going to perfect artificial Perfect Possession!"
,ClearBalloon,nitori

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,nitori,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kokoro2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
