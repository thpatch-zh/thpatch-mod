#========================================================================
#	�얲�F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�ؐ�@�G�`�[���F�}�~�]�E�@���g
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,reimu,reimu,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,kasen2,kasen,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou,mamizou,2p,1040,0,true

#2Pslave
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou2,mokou,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,mamizou_name,mamizou,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mamizou/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/mokou/name2.pat",1#�G�X���C�u�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#���w���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(402)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0

#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,110

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,50#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,kasen2,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,kasen2		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
�������̖�������\n�C�t�������Ƃ�����\,a,0,0,"I noticed something with Marisa just now."
,ClearBalloon,kasen2#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#�}�X�^�[�ɓ���ւ��

,Show,reimu,-1280,
,SetFocus,reimu		,	
,ImageDef,reimu,��1,0,0
���H\,a,0,0,"What?"
,ClearBalloon,reimu#�����o������

,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,kasen2		,	
,ImageDef,kasen2,��2,0,0
���B������Ă���悤��\n���ӂ̌��Ŋ��S�߈˂�\n���s����ȊO��\,a,0,0,"Not only is there a consensual Perfect Possession, like what we do,"
,ImageDef,kasen2,��1,0,0
�}�X�^�[�������o�̂܂�\n���S�߈ˏo����ꍇ�������\n��������\,a,0,0,"But there are cases where Perfect Possession is possible \nwithout the Master's knowledge."
,ClearBalloon,kasen2#�����o������

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#�}�X�^�[�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,reimu	
,ImageDef,reimu,��1,0,0
������\n�������߂Ċ��S�߈˂��ꂽ�Ƃ���\n�����o��������\,a,0,0,"That's true. \nThe first time I was Perfect Possessed, I had no idea."
,ClearBalloon,reimu#�����o������

#=====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

,SetFocus,kasen2		,	
,ImageDef,kasen2,�f1,0,0
�ƌ������Ƃ͈��p�����\n����I�ɐg�̂��������\n�Ƃ������ɂ��q����̂ł́c�c\,c,0,0,"If that's the case, \nit could be abused to one-sidedly possess someone's body�c�c"
,ClearBalloon,kasen2#�����o������

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#�}�X�^�[�ɓ���ւ��

,SetFocus,reimu	
,ImageDef,reimu,�f1,0,0
����́c�c���ȗ\�z�˂�\,a,0,0,"That�c�cwould be bad news."
,ClearBalloon,reimu#�����o������

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,mamizou,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mamizou		,#�������L�������w��
����\n���O���񂪏o�Ă����ƌ�������\,a,0,0,"Oh dear. \nTo see the two of you here means"
,ClearBalloon,mamizou

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��

,SetFocus,mamizou		,#�������L�������w��
,ImageDef,mamizou,��2,0,0
�����������J�n�������Ď����̂�\,a,0,0,"you've already started your investigation."
,ClearBalloon,mamizou

,Hide,mamizou,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,mokou2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��2,0,0
�����Ƃ��ٕ̈ς𒷂��y����ł�\n�ǂ��񂶂�Ȃ����H\,a,0,0,"Why can't we keep enjoying this incident?"
,ImageDef,mokou2,��1,0,0
��肭�����\n���s���ɖ\����邺\,a,0,0,"If you use it well, you can do anything you want."
,ClearBalloon,mokou2


#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,SetFocus,reimu	
,ImageDef,reimu,��1,0,0
�������̚k�o��\,a,0,0,"Perceptive as always."
�������S�߈˂𗘗p���Ă���\n�z�炪����Ƃ͂�\,a,0,0,"I didn't think anyone would already be taking advantage of Perfect Possession."
,ClearBalloon,reimu#�����o������

,Hide,mokou2,-1280,&
,Function,"::battle.team[1].current.Team_Change_Master(null)",		#�}�X�^�[�ɓ���ւ��

,SetFocus,mamizou		,#�������L�������w��
,ImageDef,mamizou,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܁A���X�N��𒲂ׂĂ���\n�Ƃ���������\,a,0,0,"Well, seeing you're investigating us now means"
,ImageDef,mamizou,�]1,0,0
���ٕ̈ςɂ���\n�S�������Ă��Ȃ��悤���Ⴊ��\,a,0,0,"you still no nothing about this incident."
,ClearBalloon,mamizou

,Hide,mamizou,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

,SetFocus,mokou2		,#�������L�������w��
,ImageDef,mokou2,��1,0,0
���ٕ̈�\n�����Ɗy���܂��ĖႤ���I\,b,0,0,"I'm gonna enjoy this incident a bit longer!"
,ClearBalloon,mokou2

,Function,"::battle.team[1].current.Team_Change_Master(null)",		#�}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mamizou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mokou2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(311)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#,Function,"::battle.Battle_Ready()",# �ΐ�J�n����
,Function,"::battle.Lose()",

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,�]1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,mamizou,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,mamizou
���̊��S�߈˂�\n��肭�g���ɂ�\n�R�c������悤�����\,a,0,0,"It seems you have some tricks to learn before mastering Perfect Possession."
,ClearBalloon,mamizou

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,kasen2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,mamizou,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,mokou2,-1280,

,Sleep,30

#,Function,"::battle.Continue()",# �Q�[���I�[�o�[��ʂ�
,Function,"::battle.Win()",

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#�����\��ݒ�
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0
,ImageDef,mamizou,��1,0,0
,ImageDef,mokou2,��1,0,0

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
,Show,mamizou,-1280	,#�t�F�C�X�\���J�n
#,Show,mokou2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,mamizou,
,SetFocus,reimu		,
���S�߈ˈٕς�\n���ɂ������p���Ă���z��\n�����Ȃ��\,a,0,0,"I can't believe we already have abusers of the Perfect Possession incident ."
,ClearBalloon,reimu

,SetFocus,mamizou
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������Ă���\n�����݂�ȂɍL�܂��Ă��邼��\,a,0,0,"What are you saying. \nEveryone already knows."
����菇�𓥂߂�\n�ȒP�ɜ߈˂ł���Ƃ�\,a,0,0,"If follow a certain procedure, Possession is very easy."
,ClearBalloon,mamizou

#=====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#�X���C�u�ɓ���ւ��

,Show,kasen2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen2		,	
����菇�c�c\n������ґz��\,a,0,0,"A certain step�c�c. \nYou mean meditation."
,ClearBalloon,kasen2#�����o������

,SetFocus,mamizou
������������Ⴊ�c�c\,a,0,0,"That's one way but�c�c"
�}�X�^�[�������ӂ��Ă��邩\n���f���Ă��邩�����\,a,0,0,"If either the Master agrees or is distracted,"
�ґz��Ԃɓ��邾����\n�߈˂ł���񂶂�\,a,0,0,"one can possess by being in a meditative state."
�ȒP�����邶���H\,a,0,0,"Isn't it too easy?"
,ClearBalloon,mamizou

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&
,Hide,mamizou,-1280,&
,Hide,mokou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
