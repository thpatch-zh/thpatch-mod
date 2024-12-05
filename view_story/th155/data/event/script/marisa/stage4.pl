#========================================================================
#	�������F�X�e�[�W4�@����
#	�ꏊ�F
#�@ �X���C�u�F�������@�G�`�[���F��
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,marisa,marisa,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,koishi2,koishi,1p,240,0,false#���O,�O���[�v��,x,y,���]

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

,LoadAnimationLocal,"data/actor/story_title/marisa/title4.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
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
,ImageDef,marisa,��2,0,0
,ImageDef,koishi2,�f1,0,0
,ImageDef,yukari,��2,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,marisa,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��2,0,0
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���C�u�X�e�[�W��\,a,0,0,"A live concert�c"
,ImageDef,marisa,�f1,0,0
����̓v���Y�����o�[�̃��C�u��\n����ƕ����Ă��邪�c�c\,a,0,0,"I heard tonight is Prismriver's concert but�c�c"
,ImageDef,marisa,��1,0,0
�܂��������́c�c�I\,b,0,0,"Don't tell me the mastermind is�c�c!"
,ClearBalloon,marisa#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,�f1,0,0
�܂����H\,a,0,0,"Is...?"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
����A��������\n����Ȕ��͖����Ǝv�����c�c\,a,0,0,"No�c�c. There's no way�c�c"
,ClearBalloon,marisa#�����o������

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[1].current.StageIn_Special()"#���s�`�[�������ꉉ�o�œo��
,Sleep,120#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",
,Show,yukari,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari		,#�������L�������w��
���炱��ȂƂ����\,a,0,0,"Oh, why hello."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
\R[��|���܂�]���c�c\n�m���ɁA�ٕς̐^����\n�߂Â��Ă���悤�Ɍ����邺\,a,0,0,"Yukari (you)�c�c \nIt looks like we're getting closer to the truth."
,ClearBalloon,marisa#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ɒH�蒅�������Ď���\n���S�߈˂̒��������Ă���̂�\,a,0,0,"Arriving this far means you're investigating Perfect Possession too."
,ImageDef,yukari,�]1,0,0
�Ƃ���ŁA�߈˂𓾈ӂƂ���푰\n���ĉ����Ǝv���H\,a,0,0,"By the way, what species do you think is skilled at possessing?"
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̂������Ȃ�\n�Ⴆ�ΗH��̂悤�Ȏ푰�c�c\,c,0,0,"A species without a physical body... like a ghost�c�c"
,ImageDef,marisa,��2,0,0
�͂��I�@����Ȃ܂����I\n���̃`���h���O�o���͑��삾���I\,b,0,0,"Gasp! No way! The Prismriver sisters are poltergeists�c!"
,ClearBalloon,marisa#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
���ӂӁA���ꂾ������\n��u�ŉ����ł����񂾂��ǂ˂�\n�ܘ_�Ⴄ��\,a,0,0,"Haha, that would make for an instant resolution but of course not."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
����ȁ[\n�ӂ��A���̂��z�b�Ƃ����������\,a,0,0,"True... Whew, I'm kinda relieved."
,ClearBalloon,marisa#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
����͂��Ă���\,a,0,0,"That aside."
,ImageDef,yukari,��2,0,0
���A�M����\n�d��ȑI���𔗂��Ă��܂�\,a,0,0,"Now, you need to make an important choice."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,�f1,0,0
�����H�@�I�����ƁH\,a,0,0,"Huh? A choice?"
,ClearBalloon,marisa#�����o������

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
�����ň����Ԃ���\n����^���𖡂키��\,a,0,0,"To turn back or find out the truth yourself."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���ς�炸���Ӗ��ȑI��������\n�����܂ŗ��ĒN�������Ԃ��񂾂�\,a,0,0,"A meaningless option as always. \nWho would turn back after getting this far."
,ClearBalloon,marisa#�����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 

,SetFocus,yukari		,#�������L�������w��
,ImageDef,yukari,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������A���ɕ����č��̘b��\n�����Ȃ��������Ƃɂ��邩\n�����A��l�Ō��߂Ȃ����I\,b,0,0,"One more thing. If you lose, you didn't hear any of this. \nNow, decide together!"
,ClearBalloon,yukari


#�S���t�F�C�X�P��
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,


,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,yukari,��1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,koishi2,-1280	,&
,Show,yukari,-1280	,#�t�F�C�X�\���J�n

,SetFocus,marisa
,SetFocus,yukari
,ImageDef,yukari,��1,0,0
�킴�ƕ�������肾�����̂�\n��편�s�ł���\,a,0,0,"I was planning to lose on purpose. A failed plan."
,ClearBalloon,yukari

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,

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
,ImageDef,marisa,�f1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,yukari,��1,0,0

,Show,yukari,-1280	,&#�t�F�C�X�\���J�n
,Show,marisa,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,marisa,&
,SetFocus,yukari
����A�����������\,a,0,0,"Oh no, I lost."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�݂�Ȋ��S�߈˂��g���Ă��钆��\n���O������l�Ȃ񂾂�\,a,0,0,"Everyone else's using Perfect Possession, \nbut you're the only one on your own."
,ClearBalloon,marisa#�����o������

,SetFocus,yukari
,ImageDef,yukari,�f1,0,0
�Ȃ�ł������邩����H\,a,0,0,"Do you know why?"
,ClearBalloon,yukari

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��2,0,0
���锻��[\n�F�B�����Ȃ�����ł���H\n���ȁ[��\,a,0,0,"I know I know! \nBecause you have no friends, right? How sad."
,ClearBalloon,koishi2

,SetFocus,yukari
,ImageDef,yukari,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���R�͂����ɔ���ł��傤\n���낻��v���Y�����o�[�B��\n���C�u���n�܂�܂�\,a,0,0,"You will soon find out the reason. \nPrismriver's concert will begin soon."
�ϋq��_����\n�ŋ��̓�l������܂���\n�M���B���ӏ܂��Ă݂���H\,a,0,0,"The cursed duo will appear targeting the audience. \nWhy don't the two of you watch?"
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,yukari,-1280,

,Sleep,60

,End
