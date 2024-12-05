#========================================================================
#	�_�q�F�X�e�[�W4�@����@
#	�ꏊ�F
#�@ �X���C�u�F���@�G�`�[���F��
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

,LoadAnimationLocal,"data/actor/story_title/miko/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/koishi/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#�G�����摜�ǂݍ���
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
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��2,0,0
,ImageDef,yukari,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��
,Sleep,50

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��2,0,0
�����͉����H\,a,0,0,"Where are we?"
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
���C�u��ꂾ\n���ꂩ��v���Y�����o�[�y�c��\n���C�u���s���邼\,a,0,0,"The concert hall. \nThe Prismriver concert will be begin soon."
,ClearBalloon,miko#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���
# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
�����ɒN���������̂�����\,a,0,0,"I wonder if someone will appear."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��2,0,0
����A�����Ɋ�����͉̂c�Ƃ�\n�ϋq�̑O�ŉ���������\,a,0,0,"No, I made a stop for business. \nI plan to address the audience."
,ClearBalloon,miko#�����o������

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
���H�@�c�ƁH�@���[�H\n����Ȃ̕����ĂȂ���[\,a,0,0,"Hm? Business? \nI didn't hear anything about this."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�x���҂��W�߂�Ƃ����̂�\n���������n���Ȋ�������\n�n�܂�̂�\,a,0,0,"To gather followers, one must begin with small steps such as this."
,ClearBalloon,miko#�����o������

,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,yukari,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
���C�u�A�y���݂˂�\,a,0,0,"A concert. Exciting."
,ClearBalloon,yukari

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
�M���́c�c�m��\n���z���𗠂ŋ������Ă���Ƃ���\,a,0,0,"You�c�cI've heard you rule the Gensokyo from behind the scenes."
,ClearBalloon,miko#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��2,0,0
����A���S�߈˂̒����H\n�N�ɗ��܂ꂽ��ł�����\n�����o����\,a,0,0,"Oh my, a Perfect Possession investigation? \nYou work hard without being asked."
,ClearBalloon,yukari

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�f1,0,0
�����ɏo�Ă����H\n�܂������C�u�����ɗ���\n�Ȃ�Ă��Ƃ͖������\,a,0,0,"What did you come here for? \nI doubt it's to see the concert�c"
,ClearBalloon,miko#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����G�őg�ނȂ�āc�c\,a,0,0,"To work with your business rival�c�c"
�Ō�A��l�Ő키�`�ɂȂ���\n�c�O�Ȍ��ʂɂȂ�̂��ڂɌ�����\,a,0,0,"In the end, I see that the two of you will end up fighting each other \nwith an unfortunate result."
,ClearBalloon,yukari

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�{1,0,0
����ɓ�����\n�����ɉ����ɗ����̂��H\,a,0,0,"Answer my question. \nWhat are you here for?"
,ClearBalloon,miko#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�˂��A�M���B�̒����̑���\n���Ɉ����p�����ĖႦ�Ȃ�������\,a,0,0,"Your investigation, could you let me take it over?"
,ClearBalloon,yukari

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
�ォ��o�Ă���\n�����悱���A�ƌ����̂��I\,a,0,0,"You mean to say, hand over our information?"
,ImageDef,miko,�{1,0,0
�����A����Ȃ����邼�I\n�S�ꎸ�]������I\,b,0,0,"Absurd, absurd! \nI'm deeply disappointed."
,ImageDef,miko,��1,0,0
��Έꂾ����Ƃ�����\n�������邱�Ƃ͖���\n�S�͂ōs�����I\,b,0,0,"Just because it's two vs. 1, there's no need to hold back. \nWe will fight at full force!"
,ClearBalloon,miko#�����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
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
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��1,0,0
,ImageDef,yukari,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,hijiri2,-1280	,&
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,miko
,SetFocus,yukari
,ImageDef,yukari,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A�������ʂ������Ă����H\n���͖{�C�ł͕��������Ȃ���\,a,0,0,"Now, will you share the investigation results? \nI seriously don't want to lose."
,ClearBalloon,yukari

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
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
,ImageDef,miko,�{1,0,0
,ImageDef,hijiri2,�]1,0,0
,ImageDef,yukari,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n
,Show,yukari,-1280	,&#�t�F�C�X�\���J�n


,SetFocus,yukari,&
,SetFocus,miko		,
,ImageDef,miko,�{1,0,0
���O�A�{�C�ł͖�����\n����ł͋�������\,a,0,0,"You're not serious. \nThis isn't interesting."
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,��2,0,0
�����\����\n�M���B�̒������ʂ�\n�킢���Ŕ�������\,a,0,0,"It's enough. \nI figured out your investigation results from your fighting methods."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����ł͎��̕�����������c�c\,c,0,0,"And now some information from me."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,�f1,0,0
���H\,a,0,0,"Information?"
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,��,0,0
���͂��ł�\n���S�߈ˈٕς̍�����͂�ł���\,a,0,0,"I have already figured out the mastermind \nbehind the Perfect Possession Incident."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,��1,0,0
�Ȃ񂾂ƁH\,a,0,0,"What did you say?"
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ł��ˁA������ł��j��\n��i������Ȃ���\,a,0,0,"But the means to destroy this fellow, I don't know."
�������񂪗~��������\n�Ƃ����͖̂{����\,a,0,0,"So it was true I wanted information."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,�{1,0,0
����Șb�A�N���M������c�c\,a,0,0,"Who can believe that kind of story�c�c"
���O�������ł���\���̕���\n�����ɂ���ł͂Ȃ����I\,a,0,0,"There's a good chance that you are the mastermind!"
,ClearBalloon,miko

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
�c�c���\�ɂȂ��Ă��Ȃ����̂�\n���B���͂�ł������\,a,0,0,"�c�cWe've found information that's not yet a rumor."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,hijiri2,��2,0,0
���ӊ��S�߈˂̏ꍇ��\n�}�X�^�[���ɜ߈ˉ�����\n�哱��������\,a,0,0,"With consensual Perfect Possession, \nthe master has the power to cancel possession."
,ImageDef,yukari,��1,0,0
�������S�߈˂̏ꍇ��\n�X���C�u���Ɏ哱��������\n�ƌ�������\,a,0,0,"With enforced Perfect Possession, the slave has that power."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,miko		,
,ImageDef,miko,�{1,0,0
����\,a,0,0,"Hey."
,ClearBalloon,miko

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Y�݂�ł�������F��Ȑl�Ԃ�\n���Ă������ɂ�\,a,0,0,"I've seen many humans confide in their troubles."
���肪�R��f���Ă��邩�ǂ���\n�Ȃ�Ă����ɔ���\,a,0,0,"I can tell if one is lying, right away."
,ImageDef,hijiri2,�f1,0,0
�����͔����R��f���Ă��邯��\n������͂�ł���Ƃ����̂�\n�R�ł͖�����\,a,0,0,"Half of her stories are lies but it's true that she has found the mastermind."
,ImageDef,hijiri2,��2,0,0
�ÂɁA����񋟂����\n���B���T�����߂Ă���\n�����������Ă����\,a,0,0,"She's hinting that If we secretly provide information."
,ImageDef,hijiri2,�]1,0,0
���ē��킹�Ă�񂾂���\n������Ƃ��Ă͋���������\n�����ł���H\,a,0,0,"she'll tell us something about the mastermind. \nSo wouldn't it be faster to share our information?"
,ClearBalloon,hijiri2

,SetFocus,yukari
,ImageDef,yukari,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ӂ��ӂ���\,a,0,0,"Hehehe."
,ImageDef,yukari,��1,0,0
�������̑m���̕���\n���n���肻����\,a,0,0,"This monk is street smart."
,ImageDef,yukari,��1,0,0
�{���ɂ�����񂪕�������\n�ł́A�����炩����ō��̏���\n�����Ă�����\,a,0,0,"I heard some good information. \nNow I will share some of mine."
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,hijiri2,-1280,

,Sleep,60

,End
