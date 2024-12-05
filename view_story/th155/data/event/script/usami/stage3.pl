#========================================================================
#	���q�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�@�G�`�[���F�h���~�[�@�V�q
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,usami,usami,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,doremy2,doremy,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy,doremy,2p,1040,0,true

#2Pslave
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi2,tenshi,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,doremy_name,doremy,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/tenshi2/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(405)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��2,0,0
,ImageDef,doremy,��1,0,0
,ImageDef,tenshi2,��1,0,0

#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,usami,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,usami		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,usami,��1,0,0
�����͖��̐��E�����ā[�H\,a,0,0,"This is the Dream World?"
,ImageDef,usami,�f1,0,0
���̖��̐��E��\n���z���̎�����Ȃ��́[�H\,a,0,0,"My Dream World isn't the Gensokyo?"
,ClearBalloon,usami#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,usami,-1280,

#,Function,"::battle.team[1].current.StageIn_Fall()"
,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,doremy,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��2,0,0
�������܂��傤\,a,0,0,"Let me explain."
,ClearBalloon,doremy

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
���킠�A�����o�Ă���\,a,0,0,"Woah, something appeared."
,ImageDef,usami,��1,0,0
���Ă���H\n�M���͉������Ō����l��\,a,0,0,"Wait. \nI think I've seen you somewhere."
,ClearBalloon,usami#�����o������

,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������炸����\n�M���Ɋ��S�߈˂��Ă��܂�\,a,0,0,"I've been Perfect Possessing you since the beginning."
,ImageDef,doremy,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
Ḑ��⑑�q�̂悤��\n���̐l�Ԃ����̐��E�ɕ��ꍞ�ނ�\n�F�A������������ł�\,a,0,0,"As Lusheng and Zhuangzi said, \nwhen real humans find themselves in the Dream World, they tend to lose themselves."
,ImageDef,doremy,�]1,0,0
���͋M���������Ȃ�Ȃ��悤��\n���S�߈˂��ĊĎ����Ă��܂���\,a,0,0,"I Perfect Possessed and monitored you so that wouldn't happen."
,ClearBalloon,doremy

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,�f1,0,0
���S�߈ˁc�c�H\n������\,a,0,0,"Perfect Possession�c�c? \nWhat's that."
,ClearBalloon,usami#�����o������

,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈˂Ƃ́A���_�A���̑S�Ă�\n������s�ׂł�\,a,0,0,"Perfect Possession is an action where both the mind and body is possessed."
,ClearBalloon,doremy

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܂莄�Ɏ��߂��Ă���́H\n�M�����H\,a,0,0,"So I'm possessed? \nAnd you did it?" 
,ClearBalloon,usami#�����o������

,SetFocus,doremy		,#�������L�������w��
,ImageDef,doremy,��1,0,0
�����ł�\,a,0,0,"Exactly."
,ClearBalloon,doremy

,SetFocus,usami		,	#�����L�������w��
,ImageDef,usami,�{1,0,0
�₾�₾�₾�I\n�������Ɏ��̐g�̂���o�Ă����I\,a,0,0,"No, no no no! \nGet out of me right now!"
,ClearBalloon,usami#�����o������

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,doremy,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy3,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(316)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,usami,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,doremy,��1,0,0
,ImageDef,tenshi2,�]1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,doremy,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,usami

,SetFocus,doremy
,ImageDef,doremy,��2,0,0
����\n���̏Z�l�̖\�����~�߂Ȃ������\,a,0,0,"Now I need to stop the reckless dream dwellers."
,ClearBalloon,doremy

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,doremy,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,tenshi2,-1280,

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
,ImageDef,usami,�f1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,doremy,��1,0,0
,ImageDef,tenshi2,��1,0,0

,Show,usami,-1280	,&#�t�F�C�X�\���J�n,Show,doremy,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,usami		,
,SetFocus,doremy
����|���Ă�\n�����ς��܂����\,a,0,0,"Even if you defeat me, nothing will change."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,�f1,0,0
�M���͈��\,c,0,0,"Just who are you?"
,ClearBalloon,usami

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,SetFocus,doremy
,ImageDef,doremy,�G1,0,0
���̓h���~�[�X�C�[�g\n���̎x�z�҂ł�\,a,0,0,"I am Doremy Sweet. \nThe ruler of Dreams."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,��1,0,0
���̎x�z�҂ł����āc�c�H\n���̐��E�Ƃ����͖̂{���Ȃ̂�\,a,0,0,"The ruler of Dreams�c�c? \nSo the Dream World really does exist."
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,��2,0,0
�M���́A��������x��\n���z���ɗ��K���Ă��܂���\,a,0,0,"Each time you dream, you have been visiting the Gensokyo."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,doremy,��1,0,0
����͕��i����\n���̐��E�̋M����ǂ��o����\n���̋M�����������Ă����̂ł�\,a,0,0,"All this time, \nthe real you forced out and took over the Dream World you."
,ImageDef,doremy,�f1,0,0
���̐��E�ł͋M����\n�C���M�����[�ȑ��݂Ȃ̂ł���\,a,0,0,"In the Dream World, you are an irregular presence."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,��1,0,0
���[��\n�悭����Ȃ�\n���ǎ��͂ǂ������󋵂Ȃ̂�����\,a,0,0,"Hmm. \nI don't really understand. So what kind of situation am I in?"
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�}�����ꑱ�������̐��E�̋M����\n�\�����Ă��܂�\,a,0,0,"The Dream World you who was continuously oppressed is now out of control."
,ImageDef,doremy,��1,0,0
�ޏ��͌��̐��E�ɍs��\n�M���̑���ɖ\��Ă��܂���\,a,0,0,"She has gone to the Real World, and is causing trouble in your stead."
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���܂ŗ}������Ă�����\n�h��ɖ\��Ă���ł��傤��\,a,0,0,"For the amount she's been oppressed so far, \nshe's probably causing quite a scene."
,ImageDef,doremy,�]1,0,0
���̊ԁA�M���͖��̐��E����\n�o�邱�Ƃ͏o���Ȃ��ł��傤\,a,0,0,"During that time, you cannot leave the Dream World."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,��1,0,0
���̐��E����o���Ȃ�����\n����͍���[\,a,0,0,"I can't leave the Dream World? \nThat's a problem."
,ImageDef,usami,�f1,0,0
���Ƃ�������@�͖����́H\,a,0,0,"Isn't there something I can do?"
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�M�������̐��E�̋M����\n���Ă��������v����\n���̂��炢�䖝����ׂ��ł��傤\,a,0,0,"If you think about what you've done to your Dream World self so far, \nyou should endure this much."
,ImageDef,doremy,��1,0,0
���R�A���Ƃ���i�͂���܂���\,a,0,0,"And of course, there's no method."
,ClearBalloon,doremy

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.StageOut_SlideUpper()"#���`�[������ʏ�փW�����v���E
,Sleep,100,#�E�F�C�g����
#
#俎q�������鉉�o���K�v�Ǝv���܂�
#

,SetFocus,doremy
,ImageDef,doremy,��1,0,0
�����H�����Ă��܂���\,a,0,0,"What? She disappeared."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,doremy,�f1,0,0
����������˂�\n���̔ޏ��ɉ����������̂�����\,a,0,0,"That's strange. \nMaybe something happened to the Dream Sumireko."
,ImageDef,doremy,�{1,0,0
�܂��A�����������g��\n���S�߈˂�����\n�ǐՂ𑱂��܂��傤\,a,0,0,"Well, let's continue this investigation by Perfect Possessing my other self."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,doremy,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,tenshi2,-1280,

,Sleep,60

,End


# -------------------------------------------------------
