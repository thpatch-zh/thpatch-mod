#========================================================================
#	�_�q�F�X�e�[�W3�@����@
#	�ꏊ�F
#�@ �X���C�u�F���@�G�`�[���F�V�q�@�@�@�j����
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
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#1Pguest1
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,ichirin,ichirin,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pguest2
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,futo,futo,1p,240,0,false#���O,�O���[�v��,x,y,���]

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title3.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[1].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,��2,0,0
,ImageDef,tenshi,��2,0,0
,ImageDef,sinmyoumaru2,�{1,0,0
,ImageDef,ichirin,�f1,0,0
,ImageDef,futo,�f1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Show,miko,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,miko		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ė�����\,a,0,0,"I can see it now."
,ImageDef,miko,��2,0,0
���ӊ��S�߈˂�\n�������S�߈˂̍�����\,a,0,0,"The difference between agreed Perfect Possession \nand enforced Perfect Possession."
,ImageDef,miko,�f1,0,0
������l���炢�����o�����\n�m�؂Ɏ���񂾂�\,a,0,0,"If I could experiment on one more subject, I could reach a conclusion."
,ClearBalloon,miko#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,hijiri2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri2		,#�������L�������w��
,ImageDef,hijiri2,��2,0,0
�����̏��Ȃ�\n�����l���Ă��Ȃ����낤����\n�����̂Ƃ��Ă̓s�b�^����\,a,0,0,"This lord probably isn't thinking anything. \nPerfect for our experiment."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��


,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,�]2,0,0
���l��\n�m���ɔ]�݂����������������\,a,0,0,"An inchling. \nTrue, since the brain seems small."
,ClearBalloon,miko#�����o������


,Hide,miko,-1280,
,Hide,hijiri2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,Function,"::battle.Show_EnemyName()",#�G�l�[����\��

,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,��2,0,0
�ˁ[�A�����N�[�H\,a,0,0,"Hey, Who is this?"
,ClearBalloon,tenshi

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,sinmyoumaru2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,sinmyoumaru2,#�������L�������w��
,ImageDef,sinmyoumaru2,�{1,0,0
���A�����͎����̂��Ƃ�\n���z���ōł��̑傾�Ǝv���Ă�\n�ʓ|�������z��\,a,0,0,"Ugh, She thinks she's the most important in Gensokyo. So annoying."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��


,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,�]1,0,0
�Ӂ[��\n�n��ɔ����L���Ă�z��Ȃ��\n�̑�����[���卷�������\,a,0,0,"Hmm.. \nGuys groveling on Earth, important or dead, what's the difference."
,ClearBalloon,tenshi

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,sinmyoumaru2		,#�������L�������w��
,ImageDef,sinmyoumaru2,��1,0,0
����I\n�������V�l�l�B����ɂȂ�[\,b,0,0,"Yes! \nGo Lady Tenshi. So dependable."
,ClearBalloon,sinmyoumaru2



,Show,ichirin,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin,	#�������L�������w��
,ImageDef,ichirin,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���l�͑ʖڂł��I\n���ɃX���C�u�ɂȂ��Ă���z�ɂ�\n�����߈˂ł��܂���\,a,0,0,"The Inchling won't work! \nYou can't enforce Perfect Possession on someone who's already a slave."
,ClearBalloon,ichirin
,Hide,ichirin,-1280,

,SetFocus,tenshi		,#�������L�������w��
,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��
,ImageDef,tenshi,�]1,0,0


,Show,futo,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,futo,	#�������L�������w��
,ImageDef,futo,�f1,0,0
���̓�̃}�X�^�[��\n�S���S�ɓ��荞�ތ��������ł��I\,a,0,0,"The mysterious master's mind seems impenetrable as well!"
,ClearBalloon,futo
,Hide,futo,-1280,

,SetFocus,miko		,	#�����L�������w��
,ImageDef,miko,��1,0,0
�c�c��������\,a,0,0,"�c�c I understand."
,ImageDef,miko,��2,0,0
�ł͋������S�߈ˎ����͒��~��\n���ʂ̐퓬���[�h�Ɉڍs����\,a,0,0,"Let us postpone the enforced Perfect Possession experiment \nand move forward with regular battle mode."
,ClearBalloon,miko#�����o������

,SetFocus,tenshi		,#�������L�������w��
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���A���̂��H\n���N�������퓬��\n�v���Ԃ肾�ˁI\,a,0,0,"Oh, so you want to fight? \nIt's been awhile since I've had a blood stirring battle!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

,Sleep,60

,Function,"::sound.PlayBGM(312)",# �w��BGM�Đ��J�n

,ImageDef,tenshi,��1,0,0
�n��ɔ����L���Ă钎�P����I\n���]������Ȃ�I\,b,0,0,"Hey you worthless crawling vermin! \nDon't disappoint me!"
,ClearBalloon,tenshi


#�S���t�F�C�X�P��
,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,ichirin,-1280,&
,Hide,futo,-1280,&
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

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
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,�]1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,hijiri2,-1280	,&
,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,miko
,SetFocus,tenshi
���S�߈˂�\n�n��͖ʔ������ɂȂ��Ă�˂�\,a,0,0,"With Perfect Possession, Earth sure is fun."
,ClearBalloon,tenshi

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,hijiri2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,sinmyoumaru2,-1280,

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
,ImageDef,miko,��1,0,0
,ImageDef,hijiri2,�]1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,sinmyoumaru2,��1,0,0

,Show,miko,-1280	,&#�t�F�C�X�\���J�n
,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
#,Show,sinmyoumaru2,-1280	,#�t�F�C�X�\���J�n


,SetFocus,tenshi,&
,SetFocus,miko		,
,ImageDef,miko,��1,0,0
����@�������ɂ͎シ����\n���]������\,a,0,0,"Your are much weaker than your big mouth. \nI'm disappointed."
,ClearBalloon,miko

,SetFocus,tenshi
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�܂����S�߈˂�\n����ĂȂ�������\,a,0,0,"I'm not used to Perfect Possession yet."
���K����Βn��̓z��Ȃǂ�\n�����锤�������I\,a,0,0,"If I practice, I won't lose to anyone on Earth!"
,ClearBalloon,tenshi

,SetFocus,miko		,
,ImageDef,miko,��1,0,0
�Ȃ�ΐ��i����\,a,0,0,"Then be diligent."
,ImageDef,miko,��1,0,0
�Ƃ����\n�������V�l���ƌ����Ă�����\n����͖{�����H\,a,0,0,"By the way, you mentioned you were a celestial. \nIs that true?"
,ClearBalloon,miko

,SetFocus,tenshi
������\,a,0,0,"Yup."
,ClearBalloon,tenshi

,SetFocus,miko		,
,ImageDef,miko,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������A�܂����Ǝv������\n�V�l�l�Ȃ�����Ƌ�������ׂ���\n������p���������Ȃ�\,a,0,0,"I see. I didn't believe it but if you are a celestial, you should be stronger. \nI don't want to see such pitifulness.
,ClearBalloon,miko

,SetFocus,tenshi
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������A���傢�Ɨ��K�����\n�ŋ��ɂȂ���Ă΁[\,a,0,0,"Like I said, if I practice, I'll be the most powerful!"
�܊p�A���Ƒ����̗ǂ�\n���l����������\,a,0,0,"And I found a compatible Inchling."
�����ɍŋ��̓�l�ɂȂ��I\n���Ă��I�@���P���ǂ��߁I\,b,0,0,"We'll be the strongest duo before you know it! \nJust you watch! You vermin!
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,tenshi,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
