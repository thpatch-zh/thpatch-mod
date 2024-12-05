#========================================================================
#	�z�s�F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F�z�s�@�G�`�[���F�ؐ�@�@�@�얲
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,ichirin,ichirin,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,futo2,futo,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(404)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,ichirin,��1,0,0
,ImageDef,futo2,�f1,0,0
,ImageDef,kasen,��2,0,0
,ImageDef,reimu2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,ichirin,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,ichirin		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,ichirin,��1,0,0
����H\n�������܂ł̐��E�͖��H\,a,0,0,"Huh? Where did the Dream World go?"
,ClearBalloon,ichirin#�Ώۂ̐����o������

# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �}�X�^�[�ɓ���ւ��

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Show,futo2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,futo2		,#�������L�������w��
,ImageDef,futo2,�f1,0,0
�����������ځ[���Ƃ���\n�ςȖ������Ă����C�����邼\,c,0,0,"My head feels light. \nI think I saw a strange dream."
,ClearBalloon,futo2

# =====
,Hide,futo2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,ichirin		,	#�����L�������w��
,ImageDef,ichirin,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���񂽂������Ȃ̂�\n�������e�Y�ꂿ��������ǁc�c\,a,0,0,"You too? \nI already forgot the dream though�c�c."
,ImageDef,ichirin,��1,0,0
�܁A������\n���S�߈˂̒������ĊJ���܂���\,a,0,0,"Oh well. \nLet's continue the Perfect Possession investigation."
,ClearBalloon,ichirin#�Ώۂ̐����o������

,Hide,ichirin,-1280,
,Hide,futo2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,kasen,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen		,#�������L�������w��
,ImageDef,kasen,��2,0,0
�ǂ��A�X���C�u���Ɋ��ꂽ�H\,a,0,0,"How is it? \nAre you used to being a slave now?"
,ClearBalloon,kasen

,Hide,kasen,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,reimu2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu2,	#�������L�������w��
,ImageDef,reimu2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���[��\n�ǂ��ɂ����R�������Ȃ���˂�\,a,0,0,"Hmm�c I feel paralyzed."
,ImageDef,reimu2,��1,0,0
�����Ɏ哱�����Ȃ��̂�\n���傤�ɍ���Ȃ���[\,a,0,0,"Not having control doesn't suit me."
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Show,kasen,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen		,#�������L�������w��
,ImageDef,kasen,�@1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�M���ɂ́A��������Ƃ����S��\n����Ȃ��񂾂�\,a,0,0,"You lack in coordination."
,ImageDef,kasen,��1,0,0
����A���q����H\,a,0,0,"Oh, a customer?"
,ClearBalloon,kasen

,SetFocus,ichirin		,	#�����L�������w��
,ImageDef,ichirin,��2,0,0
�ǂ����[\n���S�߈˂̒����ɗ��܂���\,a,0,0,"Hello, I came to investigate Perfect Possession."
,ImageDef,ichirin,�]1,0,0
����������������Ă���\n�݂����ł���\,a,0,0,"It looks like you're investigating too."
,ClearBalloon,ichirin#�Ώۂ̐����o������

,Show,kasen,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen		,#�������L�������w��
,ImageDef,kasen,��1,0,0
���������\n�M���B�̐e�������͂���\n���������Ă��邯��\,a,0,0,"I heard. \nYour boss is also assisting in the investigation."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,kasen,�]1,0,0
�܂��܂��ٕω����܂�\n���������Ă��Ȃ��Ƃ�\,a,0,0,"But you're still far from arriving at a resolution."
,ClearBalloon,kasen

,SetFocus,ichirin		,	#�����L�������w��
,ImageDef,ichirin,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����͎��Ԃ̖��ł��傤\n���̎��Ԃ������ł����炻����\n�����ɋ��͂��Ă���̂ł�\,a,0,0,"A resolution is just a matter of time. \nWe are helping to decrease the time as much as possible."
,ClearBalloon,ichirin#�Ώۂ̐����o������

,Show,kasen,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen		,#�������L�������w��
,ImageDef,kasen,��1,0,0
�܂��A���x�ǂ�������\n�������ٕ̈ω����l�����P����\,a,0,0,"Well, good timing. \nThis incident resolver is also in intensive training."
�X���C�u�Ɋ��ꂳ���Ă����\n��킵�܂��傤�I�{�C�ł�\,a,0,0,"She is adjusting to being a Slave so let's battle! \nPlease take it seriously."
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,futo2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(301)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,ichirin,��1,0,0
,ImageDef,futo2,��1,0,0
,ImageDef,kasen,�]1,0,0
,ImageDef,reimu2,�]1,0,0

,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,ichirin	,
,SetFocus,kasen		,
,ImageDef,kasen,�]1,0,0
���肪�シ����\n���K�ɂȂ�Ȃ��������\,a,0,0,"The opponent was too weak. It wasn't a good practice."
,ClearBalloon,kasen

,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,futo2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

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
,ImageDef,ichirin,��2,0,0
,ImageDef,futo2,��1,0,0
,ImageDef,kasen,��1,0,0
,ImageDef,reimu2,��1,0,0

,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n
#,Show,reimu2,-1280	,#�t�F�C�X�\���J�n


,SetFocus,kasen		,
,SetFocus,ichirin		,
,ImageDef,ichirin,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�悵�������I\n���������Ď��B�ŋ�����Ȃ��H\,a,0,0,"Yes, we won! Maybe we're the strongest?"
,ClearBalloon,ichirin

# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,futo2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,futo2		,#�������L�������w��
,ImageDef,futo2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ȃ����������\n��l�ƛޏ��̑g�ݍ��킹�ɂ�\n���Ă���\,a,0,0,"We seem to be alright. \nWe were even able to win against a hermit and shrine maiden."
,ImageDef,futo2,��1,0,0
�Ȃ񂾂��N�ɂ������Ȃ�\n�C�����Ă�����\,a,0,0,"I am starting to feel as though we will never lose."
,ClearBalloon,futo2


,SetFocus,kasen	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������������ł�\n�ŋ��̓�l�ɂ͂Ȃ�Ȃ�\,c,0,0,"You cannot become the strongest duo only by being strong."
�M���B�̐e���͂�����\n���������ł��傤��\,a,0,0,"I'm sure that is what your boss will say too."
,ClearBalloon,kasen



# =====
,Hide,futo2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,ichirin		,
,ImageDef,ichirin,��1,0,0
��[���A�����ɂ��݁[\,a,0,0,"Hey, you sore loser!"
,ClearBalloon,ichirin



# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,futo2		,#�������L�������w��
,ImageDef,futo2,�]1,0,0
�����ɂ��݁[\,a,0,0,"Sore loser!"
,ClearBalloon,futo2


,Hide,kasen,-1280, &
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,reimu2,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu2,	#�������L�������w��
,ImageDef,reimu2,��1,0,0
���킹�Ă����܂��傤\n�Ō�ɏ�������̂�\n�ǂ������Ȃ񂾂���\,a,0,0,"Let me say this. \nI'll be the one to win in the end anyways."
,ClearBalloon,reimu2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,futo2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
