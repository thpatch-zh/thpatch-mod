#========================================================================
#	�ɂƂ�F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F������@�G�`�[���F�V�q�@�@�@�j����
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,nitori,nitori,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,kokoro2,kokoro,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Team_SetFront_Slave()",#�퓬�J�n�O�ɃX���C�u�ɓ���ւ��
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(405)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,�f1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,nitori,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,nitori		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,nitori,�f1,0,0
���S�߈˂�\n���̐��E���x�z����A��\,a,0,0,"So Perfect Possession controls the Dream World."
,ImageDef,nitori,��2,0,0
�Ȃ���A����ւ���Ă��鎞��\n�����ɋ���̂��s����������\,a,0,0,"I see, I couldn't figure out where one went when they're replaced."
,ImageDef,nitori,��1,0,0
���̐��E�ɂ���ƍl�����\n�s�v�c�͖���\,a,0,0,"If I think that they go to the Dream World, it makes sense."
,ClearBalloon,nitori#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������L�������̂�\n�����ɔ閧�����肻���ł�\,a,0,0,"It seems like the secret to sharing emotions will be there too."
,ImageDef,kokoro2,��1,0,0
���̒��ŕ|���v���������\n�ڊo�߂Ă��|���ł���\,a,0,0,"If you have a scary experience in a dream, \nit's still scary after waking up too."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,�G1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�قق��A�m���ɑS�Ă��q��������\n����ŁA�l�H���S�߈˂̎�����\n�Ȃ�̏�ǂ��Ȃ��Ȃ���\,a,0,0,"True, everything is connecting. \nNow there are no barriers to realizing artificial Perfect Possession."
,ClearBalloon,nitori#�����o������

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̎x�z�҂̌x����\n�������ėǂ���ł��H\,a,0,0,"Is it ok to ignore the Dream Ruler's warning?"
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�]���Ȃ��i���ȂǂȂ��I\n�����O�i����݂̂��I\n���̐��E�Ȃǒm��������\,a,0,0,"There's no progress without sacrifice! \nWe gotta march forward! \nI don't care about the Dream World!"
,ClearBalloon,nitori#�����o������

,Hide,nitori,-1280,
,Hide,kokoro2,-1280,


,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,sinmyoumaru2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2,	#�������L�������w��
,ImageDef,sinmyoumaru2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���A��������\n������Ȃ�\n���K����Ƀs�b�^����\,a,0,0,"Oh, there they are. \nThe perfect practice opponent."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,Show,tenshi,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�R�̉��Ƃ�\n����͂܂��S�߂ȏꏊ��\n�Z��ł���˂�\,a,0,0,"And under a cliff. \nWhat a miserable place to live."
,ImageDef,tenshi,��1,0,0
��[���A�T�N�b�Ƃ�����Ⴈ��\,a,0,0,"Alright, let's get this over with."
,ClearBalloon,tenshi

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,�f1,0,0
�Ȃ񂾂��O��\,a,0,0,"What the hell."
,ClearBalloon,nitori#�����o������

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2,	#�������L�������w��
,ImageDef,sinmyoumaru2,��1,0,0
���O�B�Ɛ������\n�ŋ��̑��_����������I\,a,0,0,"After fighting with you guys, I found the strongest partner!"
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(409)",# �w��BGM�Đ��J�n

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��


,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,�]1,0,0
���͔�ߖ����V�q\n���M�ȍ��M�ȓV�l����\,a,0,0,"I'm Tenshi Hinanawi. \nA nobly noble celestial."
,ImageDef,tenshi,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�͓�����A���̐퓬���K�����\n�Ȃ�鎖���ւ�Ɏv���[\,a,0,0,"The likes of a Kappa should be honored to practice fighting with me."
,ClearBalloon,tenshi

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,�{1,0,0
���[�V�l���ƁH\n�Ȃ�Ƃ��s�����ȓz����\,a,0,0,"Huh? A celestial? \nWhat an unpleasant guy."
,ClearBalloon,nitori#�����o������

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
����܂���\,a,0,0,"I understand."
,ImageDef,kokoro2,�]1,0,0
���̓�l��\n�]�݂�����ۋC������������\n�Ƃ�������Ō��т��Ă��܂�\,a,0,0,"These two are bound by the emotion of "an empty brain is comfortable~""
,ClearBalloon,kokoro2

,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���܂���̓V�˂�����\n遂炸�ɂ����Ɨ��K����\n�������������Ă���\,a,0,0,"I'm a born genius but I'm properly practicing first. \nI have modesty too."
���̎��ɓG���҂Ȃǖ����I\n�����A�������Ɨ��K����ɂȂ�I\,a,0,0,"But no one is a match for me! \nNow be my practice opponent!"
,ClearBalloon,tenshi

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,nitori,	#�������L�������w��
,ImageDef,nitori,��1,0,0
�΂킹���\n�����������Ȃ񂾂�\,a,0,0,"Don't make me laugh. \nWhat modesty?"
,ImageDef,nitori,��1,0,0
�܂������A��������Ɠ|����\n�V�l�̊J���ɂ��Ă�邼�I\,a,0,0,"Well, whatever. \nLet's quickly finish this and I'll put you out to dry."
,ClearBalloon,nitori

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(354)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#��b�C�x���g�Ȃ��ŃR���e�B�j���[������

,Function,"::battle.Continue()",# �ΐ�J�n����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,�{1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,nitori
,SetFocus,tenshi
,ImageDef,tenshi,��1,0,0
���ꂪ���S�߈ˁI\n�Ȃ���A�y�������[�I\,a,0,0,"So this is Perfect Possession! So fun!"
,ClearBalloon,tenshi

,SetFocus,nitori
,ImageDef,nitori,�f1,0,0
�n���ȁc�c\n�������炱��\R[�e��|�G�l���M�[]��\n�N���Ă���񂾁H\,a,0,0,"No way...... where is this energy coming from?"
,ClearBalloon,nitori

,SetFocus,tenshi
,ImageDef,tenshi,��1,0,0
���ꂪ�����Ƃ����������\n�S�Ă����͂��I\n�Ђꕚ�����I�����d����I\,b,0,0,"This is the power all those living and alive possess! \nWorship me! Low level youkai!"
,ClearBalloon,tenshi


#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

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
