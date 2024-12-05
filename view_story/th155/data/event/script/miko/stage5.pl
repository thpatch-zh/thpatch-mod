#========================================================================
#	�_�q�F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F���@�G�`�[���F����
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,miko,miko,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,hijiri2,hijiri,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P����
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,jyoon_name,jyoon,name,920,0,false

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�v���C���[���\���ҋ@
,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera_Live()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,�f1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,120

,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,miko		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,�f1,0,0
�����̓��C�u�J�����Ɍ����\n���ƁH\,a,0,0,"So the mastermind will appear during the concert?"
,ClearBalloon,miko#�Ώۂ̐����o������

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
���������n�܂�݂���������\n���傤�Ǘǂ������Ƃ�����\,a,0,0,"It seems like it'll begin soon. \nI guess we had good timing."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�{1,0,0
���₵�����A����͕s������\n�����̖ړI�������Ă��܂����I\,a,0,0,"No, this seems troublesome. \nI think I figured out the mastermind's intention!"
,ClearBalloon,miko#�����o������

,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,Show,jyoon,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
������[�I\n���C�u�A�y���݁[�I\,a,0,0,"Yay! \nA concert, how fun!"
,ImageDef,jyoon,��1,0,0
�ϋq���S��D����\n�u�Ԃ��K���ˁ[�I\,a,0,0,"The moment when the audience is captivated is coming!"
,ClearBalloon,jyoon

,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�]1,0,0
�����܂ł�\n���S�߈ˈٕς̐K����͂񂾂��I\,a,0,0,"Stop there. \nWe've caught the tail of the Perfect Possession incident!"
,ClearBalloon,miko#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
�ށA�N���H\,a,0,0,"Hmm, who's that?"
,ImageDef,jyoon,�{1,0,0
���O�͍ŋ߂悭����\n�����邳�����l�����\,a,0,0,"You're that annoying saint I see lately."
����ɁA�P�l�C���̑m���܂�\,a,0,0,"And the pretentious monk."
,ClearBalloon,jyoon

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
���O�͉��҂�\n���𖼏��\,a,0,0,"Who are you? \nTell me your name."
,ClearBalloon,miko#�����o������

,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�]1,0,0
����\R[�ː_����|��肪�݂��储��]\n�x�������炷���_��\,a,0,0,"I'm Jyoon Yorigami. \nA goddess that brings wealth."
,ClearBalloon,jyoon

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,�f1,0,0
�x�������炷�����āH\n�Ƃ񂾉R����A�M������\n����ȕ��̃I�[�����������Ȃ�\,a,0,0,"Brings wealth? \nWhat a terrible lie. \nI only sense an intense negative aura."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�]2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���O�̖ړI�͔����Ă���\,a,0,0,"I've discovered your intention."
���C�u�ɖ����̊ϋq��\n�������S�߈˂���\,a,0,0,"Enforced Perfect Possession of an audience preoccupied by a concert."
,ImageDef,miko,�]1,0,0
�����ĉ�������̂��c�c����\n���̔h��ȏo�ŗ����������\n���i��D���Ă���񂶂�Ȃ����H\,a,0,0,"And what will happen after�c�c \nfrom the looks of your fancy dress, it's to steal valuables, is it not?"
,ClearBalloon,miko#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ց[�A�悭�����܂Ŕ��������\,a,0,0,"Wow, Well to figure out that much."
,ImageDef,jyoon,��1,0,0
���̒ʂ��\n�����Ȋϋq�Ȃ�߈˂����肾����\,a,0,0,"That's exactly right. \nA preoccupied audience is possessing as much as I like."
,ClearBalloon,jyoon

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�{1,0,0
�l�̕��𓐂ނȂ�\n�O�����̊O���ł���I\,b,0,0,"To steal another's possessions, is a demon within a demon!
,ClearBalloon,miko#�����o������

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,�{1,0,0
\R[�s������|�ʂ��ނׂ��炸]\n����Ȑ�܂����R�\�D���ٕς�\n�N�����Ȃ�āA��������\,a,0,0,"Thou shall not steal. \nThat a pitiful thief would cause such an incident, it's the end of the world."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����Ƃ���\n����ȉ����O��\n���̐���������Ă�낤\,a,0,0,"Quite right. \nSuch a foolish demon should be demolished."
,ClearBalloon,miko#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����͂���\n�����z�͂��񂽒B���I\n���ɏ��Ă�Ǝv���Ă�́H\,a,0,0,"Hahaha. \nYou're the foolish ones! \nYou think you can win against me?"
,ImageDef,jyoon,�]1,0,0
�O���H�@��܂����H�@���\���\\n���ɂƂ��Ă͖J�ߌ��t����[\,b,0,0,"Demon? Pitiful? That's ok. \nI take is a compliment~"
,ClearBalloon,jyoon

#
#�������o�ꂷ����ꉉ�o���}������܂�
,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Hide,jyoon,-1280,
,Sleep,40#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.team[1].current.shion.Shion_StageIn()"#�����o��
,Sleep,180#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,shion2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2		,#�������L�������w��
�˂�����\n�����牽�Ƃ����Ȃ���\n���C�u�n�܂����Ⴄ��\,a,0,0,"Hey Jyoon. \nWe need to do something about them or the concert will start."
,ClearBalloon,shion2

,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
�Ȃ񂾂ƁA�O������l�g��\,a,0,0,"It's a pair of demons?"
,ClearBalloon,miko#�����o������

#���t�J�n
,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��2,0,0
���͍ŋ��ň���\R[�u�a�_|�₭�т傤����]\n������\,a,0,0,"I'm the cursed and evil Pestilence God, and"
,ClearBalloon,jyoon

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����o��\R[�ː_����|��肪�݂�����]\n�ŋ��ň��̕n�R�_��\,a,0,0,"I'm the sister Shion Yorigami, the cursed and evil Poverty God."
�l�I�ɂ͕s�{�ӂ�����\n���B�ɏ���i�͖�����\,a,0,0,"Personally there's no choice, but there's no way to win against us."
,ClearBalloon,shion2

#
#�����Ǝ����������ɂ���ׂ���ꉉ�o���}������܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Sleep,30
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
��炪���̍ŋ��ň��̎o���Ȃ̂�\n�g���ȂĒm�邪�ǂ��I\,e15x3,0,0,"You should experience yourselves why we are the cursed and evil sisters!"
,ClearBalloon,jyoon

#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

,Sleep,60

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
,ImageDef,miko,�f1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,miko
,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,jyoon

,SetFocus,miko
,ImageDef,miko,�]1,0,0
�������O���ɕ����铹���͂Ȃ�\n�������Ə���������\,a,0,0,"There is no reason for the righteous to lose to evil. Get lost."
,ClearBalloon,miko

,SetFocus,shion2
,ImageDef,shion2,��1,0,0
����ῂ����Aῂ����˂�\n���O�B���P���Ă����ق�\n��������[\,a,0,0,"Oh, so bright, so bright. \nThe more you shine, the more I'm happy."
,ClearBalloon,shion2

,SetFocus,miko
,ImageDef,miko,�f1,0,0
�����ƁH\,a,0,0,"What do you mean?"
,ClearBalloon,miko

,SetFocus,shion2,
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�P���قǂɁA��������p��\n�����邩��ˁI\,c,0,0,"Because I'll get to see you that much frustrated soon!"
,ClearBalloon,shion2

,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�


,Sleep,30
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�߈ˌ����u\R[�A�u�\�����[�g���[�U�[|���S�Ȕs�k�ҁI]�v\,e15x3,0,0,"Possession Exchange �gAbsolute Loser!�h"
,ClearBalloon,jyoon

#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,

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
