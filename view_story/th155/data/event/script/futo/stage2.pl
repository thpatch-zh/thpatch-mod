#========================================================================
#	�z�s�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�z�s�@�G�`�[���F���g�@�@�@���
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
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou,mokou,2p,1040,0,true

#2Pslave
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"
,DefineObject,udonge2,udonge,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,mokou_name,mokou,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mokou/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/udonge/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(405)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,ichirin,��1,0,0
,ImageDef,futo2,��1,0,0
,ImageDef,mokou,�]1,0,0
,ImageDef,udonge2,�f1,0,0


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
��[���A���͎����}�X�^�[��[�I\n�����̂��O�I\n���S�߈ː�ŏ������悤�I\,a,0,0,"All right,  I'm the Master next! You there! \nLet's fight with a Perfect Possession Battle! 
,ClearBalloon,ichirin#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,ichirin,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,mokou,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou		,#�������L�������w��
,ImageDef,mokou,�]1,0,0
���x�ǂ��Ƃ���ɗ���\n�����}�X�^�[����\n���K�����������Ƃ��낾\,a,0,0,"Good timing. \nI wanted to practice being a Master too. 
,ClearBalloon,mokou

,Hide,mokou,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,udonge2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,udonge2,	#�������L�������w��
,ImageDef,udonge2,�f1,0,0
�m���Ɛ�l�̓�l�c�c\n���C�o�����m���Ǝv��������\n�R���r��g�ނƂ͈ӊO��\,a,0,0,"A monk and hermit duo�c�c \nI thought you were rivals but working together is unexpected.
,ClearBalloon,udonge2

,SetFocus,ichirin		,	#�����L�������w��
,ImageDef,ichirin,��1,0,0
���l�̍��ł�\n��l�Ŋ��S�߈˂̒������s����\,a,0,0,"It's Lady Hijiri's strategy. \nShe said to investigate Perfect Possession together."
,ClearBalloon,ichirin#�Ώۂ̐����o������

,Hide,udonge2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,mokou		,#�������L�������w��
,ImageDef,mokou,��1,0,0
���ł��ǂ�\n�キ�Ȃ���΂ȁI\,b,0,0,"I don't care. \nAs long as you're not weak. 
,ClearBalloon,mokou


,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,futo2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,udonge2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(311)",# �w��BGM�Đ��J�n

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
,ImageDef,mokou,��1,0,0
,ImageDef,udonge2,�]1,0,0

,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,mokou,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,ichirin
,SetFocus,mokou
,ImageDef,mokou,��1,0,0
����ς�}�X�^�[����\n�������肱�Ȃ���\,a,0,0,"Like I thought, being the Master doesn't suit me."
,ClearBalloon,mokou

,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,futo2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,udonge2,-1280,

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
,ImageDef,ichirin,�]1,0,0
,ImageDef,futo2,�]1,0,0
,ImageDef,mokou,��1,0,0
,ImageDef,udonge2,��1,0,0

,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n
,Show,mokou,-1280	,&#�t�F�C�X�\���J�n
#,Show,udonge2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,mokou		,
,SetFocus,ichirin	
,ImageDef,ichirin,�]1,0,0	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�g�݊���ĂȂ��̂̓o���o����\,a,0,0,"It's obvious you're not used to working together." 
,ClearBalloon,ichirin

,SetFocus,mokou		,
�l�I�ɂ̓X���C�u�̕����ǂ���\n�����̏o�Ԃ����\�����Ηǂ�\,a,0,0,"Personally I prefer being a slave. \nI just like going wild when it's my turn."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,��1,0,0		,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������������Ȃ�ł����˂�\n�݂�Ȏ哱���������}�X�^�[��\n�D�ނƎv���Ă܂�����\,a,0,0,"Is that how it is? \nI thought everyone liked being the Master who has control."
,ClearBalloon,ichirin

,SetFocus,mokou		,
�ؑւ̃^�C�~���O��\n�l�ɔC���������y��\n�퓬�ɐ�O�ł��邾��H\,a,0,0,"It's easier to leave the changeover timing to someone else. \nThen I can concentrate on the battle."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,��2,0,0	,
�X���C�u���ǂ����\n�������S�߈˂Ƃ�����i��\n����܂���\,a,0,0,"If you prefer being the Slave, \nthere's the method of enforced Perfect Possession too."
,ClearBalloon,ichirin

,SetFocus,mokou		,
�����ґz��Ԃɓ����\n���f���Ă���l�Ԃ�\n�߈˂ł���Ƃ����A������\,a,0,0,"Oh, when you can possess someone off guard \nby going into a deep meditative state."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,�f1,a,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ł�\n�����ƁA���낻��}�X�^�[����\n���Ԃ����ǁc�c\,a,0,0,"Yes. \nOh, it's about time to change Master�c�c"
,ImageDef,ichirin,�f1,a,0,0
�z�s����A�����Ȃ���˂�\n�ǂ������̂�����H\,c,0,0,"There's no word from Futo yet. \nI wonder what happened?"
,ClearBalloon,ichirin

,SetFocus,mokou		,
���݂Ƀ}�X�^�[������Ă���̂�\n�ʔ����z�炾\,a,0,0,"You're alternating the Master? \nHow interesting."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,��1,0,0	,
�ǂ������}�X�^�[����\n�化�܂��܂����̂Łc�c\,a,0,0,"Well, we had a big fight over who should be the Master�c�c"

,ImageDef,ichirin,��1,a,0,0
�������A�z�s����A����������\n�������Ă狭�����S�߈˂���\n�݂悤������\,a,0,0,"I know, since there's no word from Futo, \nmaybe I'll test enforced Perfect Possession."
,ClearBalloon,ichirin

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,ichirin,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,mokou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,udonge2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Sleep,60

,End

# -------------------------------------------------------
