#========================================================================
#	�V�q�F�X�e�[�W1�@����@
#	�ꏊ�F
#�@ �X���C�u�F�j���ہ@�G�`�[���F��ց@�ɂƂ�
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,tenshi,tenshi,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,sinmyoumaru2,sinmyoumaru,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"
,DefineObject,nitori2,nitori,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/nitori/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#��\�����߂��@�\���܂���
,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.team[1].current.Wait_Outside()"

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(404)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��2,0,0
,ImageDef,ichirin,��1,0,0
,ImageDef,nitori2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�����͒N�H\,a,0,0,"Who's this?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��2,0,0
�����̏C�s�m����\n�����ƒ��ǂ��̗d���m��\,a,0,0,"A trainee monk at the temple. \nThe youkai monk who's friends with a nyudou."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�����H\n�����A���̉_���̎���\,a,0,0,"A Nyudou? \nOhh, that cloud bug."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,�f1,0,0
�_���H\,a,0,0,"Cloud bug?"
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�V�E�ł�\n�����Ȃ�Ē��P��������\,a,0,0,"In heaven, nyudou are like useless bugs."
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,ichirin,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin	,
,ImageDef,ichirin,��1,0,0
���A�M���͂ǂ����Łc�c\,a,0,0,"You...I've seen you somewhere�c�c"
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
��H\n��������Ƃ����������H\,a,0,0,"Hmm? We've met?"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,��2,1,0,0
���l�Ɛ���Ă���̂����܂���\n�V�l�l�ł����\,a,0,0,"I've seen you fighting with Lady Hijiri. \nYou're the celestial."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�����ɂ��I\n���񂽂�Ȃ��\n�����ɂ��y�΂Ȃ����M�Ȑl�Ԃ�I\,a,0,0,"Of course! \nYou guys are no match for a noble like me!"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,��1,0,0
���l���_�q�l�������Ă܂�����\n���̕s�ǓV�l�͏o�����Ȃ�������\,a,0,0,"Both Lady Hijiri and Lady Miko said that you're a delinquent Celestial."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
���[�H\,a,0,0,"What?"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�{���̓V�l��\n�v����肪������\n�퓬�ɂ������Ă����\,a,0,0,"A real celestial is thoughtful and tactful in battle."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�قق��A�����˂�\n�n�ʂɔ����L���Ă��邾����\n��낤�ǂ���\,a,0,0,"Hoho, well said for a fool groveling on the ground."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,tenshi,�]1,0,0
���x�ǂ�\n���̓V�l�̐퓬�������Ă�낤�I\,b,0,0,"Alright, let me show you a Celestial's battle!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,nitori2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(317)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0
,ImageDef,ichirin,�f1,0,0
,ImageDef,nitori2,�]1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,tenshi	,
,SetFocus,ichirin	,
,ImageDef,ichirin,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ア��˂��A����Ȃ̂�\n�V��ɏZ��ł���Ȃ��\n�������肾��\,a,0,0,"You're weak. \nIt's disappointing something like this lives in Heaven."
,ClearBalloon,ichirin

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,nitori2,-1280,

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
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,�]1,0,0
,ImageDef,ichirin,��1,0,0
,ImageDef,nitori2,��1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
,Show,ichirin,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,ichirin	,
,SetFocus,tenshi	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ�\n�����Ɖ͓��̑g�ݍ��킹�Ȃ񂩂�\n�����ē��R����\,a,0,0,"Hmph, of course I'll win against a nyudou and a kappa."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ԋ���Ă����ˁ[\n�����炪�ŋ��R���r��\n�ԈႢ�Ȃ��ˁI\,a,0,0,"We've gotten pretty good. \nNo doubt we're the strongest duo now!"
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ��ӂ���\n���l�ƌ����΁A����H���\n���M�Œm�͂ɒ������푰\,a,0,0,"Hehehe. \nIf you trace back the origins of Inchlings, \nthey are a noble and intellectual species." 
,ImageDef,tenshi,��1,0,0
���ɑ��������ǂ��p�[�g�i�[��\n�o��Ċ�������\,a,0,0,"I'm happy I met a partner worthy of me."
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,nitori2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
