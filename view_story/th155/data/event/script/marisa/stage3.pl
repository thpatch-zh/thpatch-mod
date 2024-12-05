#========================================================================
#	�������F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F�������@�G�`�[���F�얲�@�@�ؐ�
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
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#2Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen2,kasen,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,reimu_name,reimu,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kasen/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(401)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,marisa,�f1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��2,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,marisa,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,�f1,0,0
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
���������I��\n���S�߈˂��L�܂��Ă��邺\,a,0,0,"Perfect Possession sure is spreading quickly."
����͂����������Ă��Ȃ���\,a,0,0,"I can't just sit around all day."
,ClearBalloon,marisa#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,Hide,marisa,-1280,
,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",
,Show,reimu,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu		,#�������L�������w��
����A�܂�������\,a,0,0,"Oh, so you came again."
,ClearBalloon,reimu

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��2,0,0
�ٕς̒�����\n�ǂ̈ʐi��ł��邩�H\,a,0,0,"How's the incident investigation going?"
,ClearBalloon,marisa

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��1,0,0
���[�A����˂�\n������Ɩ�肪�N���Ă��Ă˂�\,a,0,0,"Ohh, that. \nThere's been a slight problem."
,ClearBalloon,reimu

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,�f1,0,0
�����ĉ����H\,a,0,0,"What kind of problem?"
,ClearBalloon,marisa

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,��2,0,0
���͓�����풆�Ȃ�\,a,0,0,"I'm in suppress mission right now."
,ClearBalloon,reimu

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��1,0,0
�����c�c�ƌ������Ƃ�\n�������������̂��A������\,a,0,0,"A plan�c�cso you figured out the mastermind. \nThat was quick."
,ClearBalloon,marisa

,SetFocus,reimu		,#�������L�������w��
,ImageDef,reimu,�f1,0,0
����[�c�c���Ƃ�����\n���S�߈ˈٕς̉�����\n��ؓ�ł͂����Ȃ�����\,a,0,0,"Well�c�c It's �c \nIt just looks like this Perfect Possession incident resolution will be tricky."
,ClearBalloon,reimu

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,�f1,0,0
���؂ꂪ������\n�����B���Ă���̂��o���o������\,a,0,0,"What's with being so vague. \nIt's obvious you're hiding something."
,ClearBalloon,marisa

,Hide,reimu,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,kasen2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen2,	#�������L�������w��
,ImageDef,kasen2,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�M���̗p���́A���S�߈˂��g����\n�������y���ގ�������H\,a,0,0,"Is your purpose is to enjoy a duel using Perfect Possession?"
,ImageDef,kasen2,�]1,0,0
�Ȃ�Α���ɂȂ���\,a,0,0,"Then I will entertain you."
,ClearBalloon,kasen2

,SetFocus,marisa		,#�������L�������w��
,ImageDef,marisa,��1,0,0
���A���A����\n����Ȃ�\R[��ؐ�|���܂�]���ϋɓI����\n�������q�����Ȃ�\,c,0,0,"Uh�cer... Sure. \nIf Kasen's (you're) so aggressive, something must be off."
,ClearBalloon,marisa

,SetFocus,kasen2,	#�������L�������w��
,ImageDef,kasen2,��1,0,0
�S�͂ł������Ă��Ȃ����I\,a,0,0,"Show me what you've got!"
,ClearBalloon,kasen2

,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kasen2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(301)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

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
,ImageDef,reimu,�G1,0,0
,ImageDef,kasen2,�]1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,koishi2,-1280	,&
,Show,reimu,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,marisa,&
,SetFocus,reimu
,ImageDef,reimu,�G1,0,0
���S�����ׂ̈ɂ͖�������\n�l���ɂȂ��ĖႤ�����Ȃ�\,a,0,0,"For perfect victory, I'll need Marisa to be a human sacrifice."
,ClearBalloon,reimu

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kasen2,-1280,

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
,ImageDef,marisa,��1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,reimu,��1,0,0
,ImageDef,kasen2,��1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
#,Show,kasen2,-1280	,#�t�F�C�X�\���J�n

,SetFocus,reimu		,
,SetFocus,marisa		,
������Ⴀ�A�������I\n�ŋ��͎����I\,a,0,0,"Yes, I won! \nI'm the most powerful!"
,ClearBalloon,marisa

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,Koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2,	#�������L�������w��
,ImageDef,koishi2,��1,0,0
���B�A���I\,a,0,0,"We are!"
,ClearBalloon,koishi2

,Show,reimu,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu		,#�������L�������w��
������������[\,a,0,0,"We lost�c"
���傤���Ȃ�\n�^���������Ă������\,a,0,0,"It can't be helped. I'll tell you the truth."
,ClearBalloon,reimu

,SetFocus,koishi2,	#�������L�������w��
,ImageDef,koishi2,��1,0,0
��[��\n���ꂩ��ʔ�������\n�N���锤��[�I\,a,0,0,"Yay, now something fun will definitely happen!"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��

,Show,marisa,-1280,
,SetFocus,marisa		,
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ񂾂����q�̋����W�J���Ȃ�\,c,0,0,"Looks like things might go out of tune."
,ClearBalloon,marisa

,SetFocus,reimu		,#�������L�������w��
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������z�̃��C�u�X�e�[�W��\n�������Ɨǂ���\,a,0,0,"Quickly head to the Sun Concert Stage."
���������ŉ�����\n�N����n�߂Ă��邩��\n�m��Ȃ���\,a,0,0,"Something may have already begun."
,ClearBalloon,reimu

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,reimu,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,kasen2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
