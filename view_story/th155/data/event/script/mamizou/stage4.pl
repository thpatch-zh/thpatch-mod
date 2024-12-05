#========================================================================
#	�}�~�]�E�F�X�e�[�W4�@����
#	�ꏊ�F
#�@ �X���C�u�F���g�@�G�`�[���F��
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
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@
,Function,"::battle.Enable_BossKo_StandUp()"#�G���������Ȃ�+��b�f���ŋN���オ�������

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��2,0,0
,ImageDef,yukari,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,mamizou,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,mamizou		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���ꂩ�炱����\n���C�u�����イ�̂����̂�\,a,0,0,"So something called the Concert will be here now."
���̃��C�u����\n�l�Ԃ���R�W�܂�A��\,a,0,0,"In this Concert, I heard many people will gather."
,ClearBalloon,mamizou#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��2,0,0
�ǂ������H\n���͉��z�Ɛ키���肾�H\,a,0,0,"What's wrong? \nWho do you plan on fighting next?"
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
�N�ɂȂ邩�A�s������\n�����������猩�����������z��\n�o�Ă��邩�������\,a,0,0,"We don't know yet but maybe someone we've never seen before."
,ImageDef,mamizou,��1,0,0
���S�߈˂̉\���d�g�܂ꂽ����\n���������̘b���Ⴊ��\,a,0,0,"That is, if it has to do with the Perfect Possession rumor. 
,ClearBalloon,mamizou#�����o������

,Hide,mamizou,-1280,
,Hide,mokou2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",
,Show,yukari,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��[\n�v���Y�����o�[�y�c�̃��C�u\n�y���݂���[\,a,0,0,"A Prisimriver Concert! How exciting"
,ImageDef,yukari,��1,0,0
����A�M���B��\n���C�u�����ɗ����̂�\,a,0,0,"Oh, you two came to see the concert too?"
,ClearBalloon,yukari

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,�f1,0,0
���قǋ����͖�������\,a,0,0,"I'm not really interested."
,ClearBalloon,mamizou#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,�f1,0,0
�ƌ������Ƃ́A�A���Ȃ̂�\n���邩��ɃA���ł�����˂�\,a,0,0,"So this means it's about that.\nIt's obviously about that."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�A���H�@����ς肨�O����\n���C�u�ɋ�������Ȃ��\n���������Ǝv����\,a,0,0,"That? \nI thought it was strange you would have an interest in the Concert."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,mamizou,�]1,0,0
���S�߈˂̉\�𗬂����z��\n�����Ɍ���邩��������\n����ł�̂��Ⴊ�c�c\,a,0,0,"I figured the one who spread the Perfect Possession rumor would appear here."
,ClearBalloon,mamizou#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
���S�߈ˁH\n���₾���A�A�����āA�A���ł���\,a,0,0,"Perfect Possession?\nNo, I mean that�c that thing."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
������H\,a,0,0,"What?"
,ClearBalloon,mamizou#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
�_�t���ł���\n�ǂ��������ċM��\n�_�t���Ɍ����邶��Ȃ�\,a,0,0,"Scalpers.\nObviously, you look like scalpers."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,�{1,0,0
�_�A�_�t������\t[!?]\n����΂����ꂨ����\,a,0,0,"Sca�cscalpers!?\nDon't act innocent."
,ClearBalloon,mamizou#�����o������


# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,�{1,0,0
�����A�K�̒U��\n�����͌��z�������Ă�\n�v���Ӑl����\,a,0,0,"Hey, Master Tanuki, this one's on Gensokyo's black list."
�������o�Ă������Ď���\n�����������N���Ȃ�\,a,0,0,"When she appears, only bad things occur."
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,	#�����L�������w��
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ă���\,a,0,0,"I've heard."
,ImageDef,mamizou,��1,0,0
�������A���g�a\n���ꂩ��͗��K�����ł͂Ȃ���\,a,0,0,"Alright Lady Mokou, this won't be a practice match."
,ImageDef,mamizou,��2,0,0
���S�߈ː�̎��H�҂̎n�܂肶��\n�C�𔲂���\,a,0,0,"This is the start of a true Perfect Possession battle.\nStay focused."
,ClearBalloon,mamizou#�����o������

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,mokou2,	#�������L�������w��
,ImageDef,mokou2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�҂��Ă���I\n���̖��A���x�ł��̂ĂĂ��I\,a,0,0,"I've been waiting for this!\nI'll throw away this life a million times!"
,ClearBalloon,mokou2

,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,60

,Function,"::sound.PlayBGM(318)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0
,ImageDef,yukari,�]1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,mokou2,-1280	,&
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,mamizou
,SetFocus,yukari
���ꂼ���l���̕���\n���������񂶂�Ȃ��H\,a,0,0,"Maybe you're each stronger on your own?"
,ClearBalloon,yukari

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

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
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,�]1,0,0
,ImageDef,yukari,��1,0,0

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,mamizou		,
,SetFocus,yukari		,#�������L�������w��
��Έ�Ȃ�Ĕڋ�����[\,a,0,0,"Two against one is unfair."
,ClearBalloon,yukari

,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,mamizou		,
,ImageDef,mamizou,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���O����\n�������C�u�����ɗ���\n�Ȃ�Ď��͂Ȃ������\,a,0,0,"You didn't come just to see the Concert."
,ClearBalloon,mamizou

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����˂�\n�M���B�Ȃ���Ȃ����\,a,0,0,"That's true.\nI suppose if it's the two of you, there won't be any problems."
,ClearBalloon,yukari

,SetFocus,mamizou		,
,ImageDef,mamizou,��1,0,0
�Ƃ����ƁH\,a,0,0,"Which means?"
,ClearBalloon,mamizou

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈ˈٕς̍����ɂ���\n�b���܂��傤\n�M���B�̑_���͂���ł���H\,a,0,0,"Let me tell you of the mastermind behind the Perfect Possession Incident.\nThat's your aim, isn't it?
,ClearBalloon,yukari

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,mokou2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
����ς�ւ���Ă�����\,a,0,0,"So you are involved."
,ClearBalloon,mokou2

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
�ւ���ĂȂ�Ă��Ȃ�\,a,0,0,"I'm not involved."
�ނ���]��̖T�ᖳ�l�Ԃ��\n����Ă��Ă���̂�\,a,0,0,"Rather I'm having trouble with their arrogance."
,ClearBalloon,yukari

,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
���O�ɂ����܂Ō��킹��Ƃ�\,a,0,0,"For you to even say that�c"
,ImageDef,mokou2,��1,0,0
�y���݂��ȁI\,a,0,0,"I'm looking forward to it!"
,ClearBalloon,mokou2


,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�z��͂��̃��C�u���Ɍ����\,a,0,0,"They will appear at this concert hall."
,ImageDef,yukari,��2,0,0
�����āA���S�Ŋy���ފϋq�S����\n�߈˂��悤�Ƃ��Ă���\,a,0,0,"And they will be trying to possess \nthe entire audience mindlessly enjoying the show."
,ClearBalloon,yukari

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,
,ImageDef,mamizou,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ȁA�Ȃ񂶂��\n�S���ɜ߈˂���ƁH\,b,0,0,"Wha�c what?\nPossess everyone?"
,ImageDef,mamizou,��1,0,0
�Ȃ�قǂ���ŁA���O�����\n�j�~���悤�Ƃ����ɒ����Ă���\n�󂶂��\,a,0,0,"I see, so you were waiting to prevent it."
,ClearBalloon,mamizou

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������������\n�ǂ���ł����ǂ˂�\,c,0,0,"If that were the case..."
,ClearBalloon,yukari

,SetFocus,mamizou		,
,ImageDef,mamizou,�]1,0,0
�H\n�܁A���S���Ă���A���̖���\n�N���ŋ��̃R���r������Ă�낤\,a,0,0,"? Well, don't worry.\nWe, the strongest duo will take care of it."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,�]1,0,0
���������A�ϋq������Ă��邼\n�r�����\,a,0,0,"The audience will come soon.\nMy arm's burning with excitement. "
,ClearBalloon,mokou2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,60

,End
