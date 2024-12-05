#========================================================================
#	�ɂƂ�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F������@�G�`�[���F�j���ہ@�@�}�~�]�E
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
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru,sinmyoumaru,2p,1040,0,true

#2Pslave
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou2,mamizou,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,sinmyoumaru_name,sinmyoumaru,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mamizou/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,sinmyoumaru,��1,0,0
,ImageDef,mamizou2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,nitori,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,nitori		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,nitori,�G1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��͂�A���S�߈˂��s����\n�ꕔ�̊�����L�������\,a,0,0,"As I thought, with Perfect Possession some emotions are shared."
,ImageDef,nitori,��1,0,0
����͐��_�̈ꕔ���L��\n�s���Ă���Ǝv����\,a,0,0,"It looks like a partial sharing of the spirit."
,ImageDef,nitori,�]1,0,0
������A���񂽂̊�����\n�ڂ�t������������\,a,0,0,"I'm also amazing for thinking of attaching an eye to your emotion sight."
,ClearBalloon,nitori#�Ώۂ̐����o������

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��


#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����_���I�Ɋo��������\n���l�̊���ǂ߂�悤��\n�Ȃ�����\,a,0,0,"After logically memorizing emotions, now I can read the emotions of others."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����𑀂邠�񂽂̗͂�\n���S�߈ˉ�͂̊̂ƂȂ�\,a,0,0,"Your ability to control emotions is the crux of this Perfect Possession analysis."
,ClearBalloon,nitori#�����o������

,Hide,nitori,-1280,
,Hide,kokoro2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,sinmyoumaru,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ǂ��Ƃ���ɗ��K���肪���邼\n���S�߈˂Ő킨�����[\,a,0,0,"Hey I found a practice opponent. \nLet's fight with Perfect Possession."
,ClearBalloon,sinmyoumaru

,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�݂�ȁA�V�����͂��g��������\n�����������Ă����\,a,0,0,"Hmm, looks like everyone's itching to try this new power."
,ImageDef,nitori,��1,0,0
�������ȒP�߂���\n�΂����~�܂�Ȃ���\,a,0,0,"This experiment is so easy, I can't help but laugh."
,ClearBalloon,nitori#�����o������

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,�]1,0,0
���͂͂͂�\,a,0,0,"Ahahahaha"
,ClearBalloon,kokoro2

,SetFocus,sinmyoumaru		,#�������L�������w��
,ImageDef,sinmyoumaru,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������������肩�H\n�����͍ŋ��̏����l��\n�X���C�u�ɂ����I\,a,0,0,"You think you already won? \nI made the strongest helper my slave!"
������C�����Ȃ�\,b,0,0,"I won't lose."
,ClearBalloon,sinmyoumaru

,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mamizou2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(312)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,��1,0,0
,ImageDef,sinmyoumaru,�f1,0,0
,ImageDef,mamizou2,�]1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,kokoro2,-1280	,&
,Show,sinmyoumaru,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,nitori
,SetFocus,sinmyoumaru		,
,ImageDef,sinmyoumaru,�f1,0,0
���Ă�����\n�ǂ����������肱�Ȃ��Ȃ�\,a,0,0,"I won but it doesn't feel like it."
,ClearBalloon,sinmyoumaru

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mamizou2,-1280,

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
,ImageDef,nitori,��1,0,0
,ImageDef,kokoro2,�]1,0,0
,ImageDef,sinmyoumaru,��1,0,0
,ImageDef,mamizou2,��1,0,0

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,Show,sinmyoumaru,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,nitori		,
,SetFocus,sinmyoumaru		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�K�Ƃ͑����ǂ���������������\n�ĊO�������肱�Ȃ��Ȃ�\,a,0,0,"I seem compatible with the tanuki but something feels off."
,ClearBalloon,sinmyoumaru

,Hide,sinmyoumaru,-1280	,&#�t�F�C�X�\���J�n
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mamizou2,-1280	,#�t�F�C�X�\���J�n
,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,SetFocus,mamizou2		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������̂�\n�����Ƌ����Ȃꂻ�����������\n���ҊO�ꂶ���\,a,0,0,"That's true. \nI thought we would be stronger, but it was a disappointment."
����ł͍ŋ��̓�l�ɂ�\n����G�������ɂȂ��̂�\,a,0,0,"At this rate, we won't be a match for the cursed duo."
,ClearBalloon,mamizou2

,Hide,mamizou2,-1280	,#�t�F�C�X�\���J�n
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Show,sinmyoumaru,-1280	,#�t�F�C�X�\���J�n
,SetFocus,sinmyoumaru		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������ƈ�����������\n�g�ݍ��킹�����锤���I\n�ꑫ���ꂪ�񂶂�ܑ̂Ȃ���\,a,0,0,"There must be a pairing that makes me look better. \nOne plus one equals two isn't enough."
,ClearBalloon,sinmyoumaru

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,kokoro2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kokoro2		,#�������L�������w��
,ImageDef,kokoro2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��l�͋��~���Ō��т��Ă��܂�\,a,0,0,"Those two are bound by greed."
,ImageDef,kokoro2,�]1,0,0
���̏ꍇ�́A����̋��L��\n���S�߈˂�Ǝ�ȕ��ɂ��Ă��܂�\,a,0,0,"In this case, their shared emotions have turned Perfect Possession \ninto something fragile." 
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Show,nitori,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,nitori		,	#�����L�������w��
,ImageDef,nitori,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ�قǂ�\n����̋��L���k�ƂȂ鎖�������\,a,0,0,"I see. \nShared emotions can be in vain too."
,ClearBalloon,nitori#�����o������

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kokoro2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mamizou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
