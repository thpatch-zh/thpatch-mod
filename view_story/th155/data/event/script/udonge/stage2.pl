#========================================================================
#	���F�X�e�[�W2�@����@
#	�ꏊ�F
#�@ �X���C�u�F�h���~�[�@�G�`�[���F���@���
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,udonge,udonge,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,doremy2,doremy,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(404)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,��2,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,udonge,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,udonge		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,udonge,��1,0,0
�o�Ă����Ł[�I\,a,0,0,"Come out, come out!"
,ClearBalloon,udonge#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,hijiri,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri		,#�������L�������w��
����A���̓e��\,a,0,0,"Oh! It's the Moon Rabbit."
,ImageDef,hijiri,��1,0,0
���ꂩ��s�s�`���ٕς̎���\n���ׂĒ������ʂ��o����\,a,0,0,"I continued looking into the Urban Legend Incident, and I found something."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,hijiri,�f1,0,0
�ٕς��N���������{�l�炵���l��\n���������Ƃ����\�𕷂�����\,a,0,0,"There's a rumor someone's seen the person responsible for the Incident."
,ImageDef,hijiri,�]1,0,0
����͊m���Ɍ��̖��ł�����\n�i�����Ɠs�s�`���ٕς̊ւ�肪\n���炩�ɂȂ��ė����̂ł���\,a,0,0,"It was definitely a Lunarian. \nThe connection between Eientei and the Urban Legend Incident is clearer"
,ImageDef,hijiri,��1,0,0
����ɂ��Ăǂ��v���Ă��܂��H\,a,0,0,"But what do you think about this?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����Șb�͂ǂ��ł��ǂ���\,b,0,0,"I don't care about that."
,ClearBalloon,udonge#�����o������

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
�͂��H\,a,0,0,"Yes?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���݈ӎ��Ŏ��͋M����\n�C�����Ă���炵��\,a,0,0,"I seem to be unconsciously annoyed with you."
���̃C�����͐��Ȃ���\n����Ȃ���\,a,0,0,"I need to fight you or this irritation won't disappear."
,ClearBalloon,udonge#�����o������

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
�ǂ������́H\n���S�߈ː���������́H\,a,0,0,"What's wrong? \nDo you want to do a Perfect Possession battle?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,��1,0,0
���S�߈�\n����ɂ͊��ӂ��Ă����\,a,0,0,"Perfect Possession. \nI'm so grateful for it."
���ꂪ�Ȃ���Ύ������̐��E��\n�o�Ă����Ȃ����������\,a,0,0,"If it wasn't for that, I wouldn't be here in the Real World."
,ClearBalloon,udonge#�����o������

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,�f1,0,0
��b�����藧���Ȃ�\n�ǂ����ʂ̐��E�̐l��\n��b���Ă���悤��\,c,0,0,"This conversation is impossible. \nI seem to be having a conversation with someone from a different world."
,ClearBalloon,hijiri

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������\n�����ɂ���͖̂��̐��E�̗��\n�M���̒m���Ă�����ł͂Ȃ���\,a,0,0,"Quite so. This is Reisen from the Dream World. \nNot the Reisen you know."
,ClearBalloon,doremy2

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��2,0,0
����A���S�߈˂��Ă��̂�\n�M���͒N������H\,a,0,0,"Oh, so you were Perfect Possessing her. \nAnd who might you be?"
,ClearBalloon,hijiri

,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,�G1,0,0
���̓h���~�[�X�C�[�g\n���̐��E�̎x�z�҂ł�\n�Ȍエ���m�肨����\,a,0,0,"I am Doremy Sweet. The ruler of the Dream World. \nPleased to make your acquaintance." 
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(353)",# �w��BGM�Đ��J�n

,SetFocus,udonge		,	#�����L�������w��
,ImageDef,udonge,�]1,0,0
,ImageDef,hijiri,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A�����ǂ����\n�܊p�̌��̐��E�A���i�͌����Ȃ�\n�������킹�ĖႤ��I\,a,0,0,"Are you done? \nNow that I'm in the Real World, I'd like to say a few things."
,ImageDef,udonge,��1,0,0
�U�P�����V��߁I\n�ォ��o�Ă����Ȃ�\n�ォ�猩�₪���āI\,b,0,0,"You hypocrite monk! \nYou came out later so stop looking down on me!"
������ÂȂ��̊��\n���C�ɘc�߂Ă��I\,b,0,0,"I'll twist that calm face of yours off!"
,ClearBalloon,udonge#�����o������


#�S���t�F�C�X�P��
,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,�]1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,udonge		,
,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
�Ȃ񂾂����̂ł��傤�c�c\,a,0,0,"I wonder what that was�c�c."
,ClearBalloon,hijiri

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

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
,ImageDef,udonge,��1,0,0
,ImageDef,doremy2,�]1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,ichirin2,��1,0,0

,Show,udonge,-1280	,&#�t�F�C�X�\���J�n
,Show,hijiri,-1280	,#�t�F�C�X�\���J�n



,SetFocus,hijiri		,#�������L�������w��
,SetFocus,udonge		,
�悵�A�X�b�L������\n�y����������[\,a,0,0,"Ah, I feel refreshed. \nThat was fun."
,ClearBalloon,udonge

,SetFocus,hijiri		,#�������L�������w��
�Ȃ񂩃������������[\n�키�O�ɕςȎ�����ꂽ�悤��\,c,0,0,"I feel uneasy, like something strange was said before the fight."
,ClearBalloon,hijiri

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,doremy2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,doremy2		,#�������L�������w��
,ImageDef,doremy2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̐��E�̏Z�l��\n���󐫂��L���ł�\,a,0,0,"The Dream World dwellers are highly sensitive."
,ImageDef,doremy2,��2,0,0
���i�v���Ă��鎖�����{�ɂ�\n�������ĕ\������鎖������܂�\,a,0,0,"One's usual feelings can be expressed tenfold."
,ClearBalloon,doremy2

,SetFocus,hijiri		,#�������L�������w��
���i�v���Ă���̂�\,a,0,0,"Even though it's what they usually think."
,ClearBalloon,hijiri

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,udonge		,
,ImageDef,udonge,�]1,0,0
��[���A���͂������ˁI\,a,0,0,"All right, next is that one!"
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,doremy2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,ichirin2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
