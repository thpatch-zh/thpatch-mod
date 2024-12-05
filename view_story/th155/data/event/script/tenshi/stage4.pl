#========================================================================
#	�V�q�F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F�j���ہ@�G�`�[���F�ؐ�@�}�~�]�E
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
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou2,mamizou,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mamizou/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.team[1].current.Wait_Outside()"

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��2,0,0
,ImageDef,kasen,��1,0,0
,ImageDef,mamizou2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,kasen,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
�M�����\�̓V�l�l�ł���\,a,0,0,"Are you the rumored Celestial?"
,ClearBalloon,kasen

,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
������I\n�Ђꕚ�����ǂ�\,a,0,0,"Yup! Bow before me."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��2,0,0
�����́A�R�ɏZ�ސ�l��\n�₵���̂��_�Ђɂ悭�����\,a,0,0,"This one's a hermit that lives in the mountains. \nMaybe she's lonely, but she comes down to the shrine a lot."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
��l���A���X���i���Ă��邩��\,a,0,0,"A hermit. \nAre you devoting yourself everyday?"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,�@1,0,0
����\n�����Ȃ��Ă����Ă���܂�\,a,0,0,"Yes, I do so without being told."
,ClearBalloon,kasen

,Hide,kasen,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,mamizou2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mamizou2	,
,ImageDef,mamizou2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ񂶂�A���ꂪ�V�l�Ȃ̂��H\n�������Ⴛ���ȓz��\n�������Ⴂ�z�Ƒg��ł����\,a,0,0,"Is this the Inchling? \nA little one working with an even smaller one."
,ClearBalloon,mamizou2

,Hide,mamizou2,-1280,

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,kasen	,
,ImageDef,kasen,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����Ȃ�ł�\n�ꉞ�V�l�Ȃ�ł����\,a,0,0,"Even though she's like this, it seems she's still a celestial."
,ImageDef,kasen,�]1,0,0
������A�������̍���D������\n�Ȃ�Ǝv���܂���\,a,0,0,"Though one day, I believe I will take that spot."
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(313)",# �w��BGM�Đ��J�n

,SetFocus,tenshi	,
,ImageDef,tenshi,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ�\n�������X���i���Ă���񂾂�\,a,0,0,"Hmph, what do you mean you are devoted everyday."
�S�g������肪���o�Ă����\,a,0,0,"Your whole body is flowing with pride"
,ImageDef,tenshi,��1,0,0
�V�l�Ƃ��Ē������Ă�낤�I\n���̌���\R[�a|����]���A�o�ɓ�����I\,a,0,0,"Let me caution you as a celestial! \nBlend with the light and become one with the dust!"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
�����͂���\n����������Ȃ�\n�V�l�̒������Ȃ���I\,a,0,0,"Hahaha, a Celestial warning that doesn't resonate at all!"
,ImageDef,kasen,��1,0,0
���̌��t\n�M���ɂ�������Ԃ���I\,a,0,0,"I shall return those words right back to you!"
,ImageDef,kasen,��1,0,0
�V�̌����̂Ă�\R[�H|������]�Ɋ҂�I\,b,0,0,"Abandon the Heaven's light and return to the dirt!"
,ClearBalloon,kasen


#�S���t�F�C�X�P��
,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mamizou2,-1280,


,Sleep,60

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
,ImageDef,kasen,�]1,0,0
,ImageDef,mamizou2,�]1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,tenshi	,
,SetFocus,kasen	,
����ȑ����ۂ��V�l������̂˂�\,a,0,0,"It seems that vulgar celestials exist too."
,ClearBalloon,kasen

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
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
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,�]1,0,0
,ImageDef,kasen,��1,0,0
,ImageDef,mamizou2,��1,0,0

,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n


,SetFocus,kasen	,
,SetFocus,tenshi	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ア�I�@�シ����I\n����Ȃ�œV�ɏ�����\n�v���Ȃ�I\,a,0,0,"Weak! Too weak! \nDon't think you'll reach Heaven with that!"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ă��V�l�c�c��\n���̐��i������Ȃ������̂�\n�{����\,a,0,0,"Once a Celestial, always a Celestial�c...It's true that I still lack diligence."
,ClearBalloon,kasen

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
�����ւ��ցA��肭�����₵����\,c,0,0,"Hehehe, it sure went well."
,ImageDef,sinmyoumaru2,�]1,0,0
���̐�l�Ɖ����K��\n���z���ł��w�܂�̎��͎�\,a,0,0,"This hermit and bake-tanuki are the most distinguished in Gensokyo."
�����A��X���ŋ��ƌ����Ă�\n�ߌ��ł͖����ł���\,a,0,0,"Now, it won't be an overstatement to say we're the strongest."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ񂩂��O�c�c\n�o��������ƌ����ς���ĂȂ��H\,a,0,0,"Hey�c.\nYou sound different from when we first met?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����H\n����Ȃ��Ƃ́[\n�����Ǝv���܂����˂�\,a,0,0,"Um? No way. \nI sure don't think so."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܁A������\,a,0,0,"Well whatever."
,ImageDef,tenshi,�]1,0,0
�ł��n��ōŋ��ɂȂ�Ȃ��\n���R������Ȃ�\,a,0,0,"And of course we'll become the most powerful on Earth."
,ImageDef,tenshi,��1,0,0
��[���A�V�E�ɋA���܂ł�\n�n����x�z���邩�I\,a,0,0,"All right, until I can go back to Heaven, I guess I'll rule the Earth!"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,�]1,0,0
�ǂ������˂�\n�������V�l�l\,a,0,0,"Nice, very nice Lady Tenshi."
,ImageDef,sinmyoumaru2,��1,0,0
�l���鎖�̃X�P�[����\n�Ⴂ�܂��˂�\,a,0,0,"Your way of thinking is on a different level."
,ClearBalloon,sinmyoumaru2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,sinmyoumaru2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mamizou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
