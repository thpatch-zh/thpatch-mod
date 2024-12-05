#========================================================================
#	�z�s�F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F��ց@�G�`�[���F���@�@�@�@�_�q
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,futo,futo,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,ichirin2,ichirin,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko2,miko,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/miko/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,miko2,�]2,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,hijiri,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,hijiri		,#�������L�������w��
��������J�l\n�����V�������͂���܂������H\,a,0,0,"Good job with the investigation. \nDid you find any new information?"
,ClearBalloon,hijiri

,Show,futo,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,
,SetFocus,futo		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
��ρA�L�Ӌ`�Ȓ����ł�����\,a,0,0,"It was a very productive investigation."
,ClearBalloon,futo#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
����͗ǂ������ł�\n�u�a�_�n�R�_�R���r�̍U����\n�菕���ɂȂ�ł��傤\,a,0,0,"I'm glad to hear that. \nIt should be helpful in capturing the Pestilence god and Poverty god."
,ClearBalloon,hijiri

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̘b�����c�c\,a,0,0,"About that�c�c"
,ClearBalloon,futo#�Ώۂ̐����o������

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,�G1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ŋ��̓G��|�����͉�X�����\n����A��点�Ă���Ȃ����낤��\,a,0,0,"We shall conquer the horrible enemy. \nNo, will you let us?"
,ClearBalloon,futo#�Ώۂ̐����o������

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,�f1,0,0
�͂��H\,c,0,0,"Hmm?"
,ClearBalloon,hijiri

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���X�̊��S�߈ː��\n�s���Ă��Ĕ��������Ƃ�����\,a,0,0,"I have learned something after several Perfect Possession battles."
,ImageDef,futo,�f1,0,0
��ϐ\���グ�ɂ����̂���\n����l�ł̓R���r�l�[�V������\n��肪����\,a,0,0,"It is very difficult for me to say this \nbut there is a problem with the combination between the two of you."
,ImageDef,futo,��1,0,0
�����A��X�Ȃ��\n�}�X�^�[�X���C�u�̘g��\n�����ʐ킢���o����I\,b,0,0,"However, Ichirin and I can fight without the constraints of Master and Slave."
,ClearBalloon,futo#�Ώۂ̐����o������

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Show_EnemySlaveName()",#�G�l�[����\��
,Show,miko2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,miko2,	#�������L�������w��
,ImageDef,miko2,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�قق�\n�ʔ���������������Ȃ���\,a,0,0,"Aha, you say something interesting"
,ImageDef,miko2,�]2,0,0
�܂�A��X���\n���O�B�̕��������ƌ����̂���\,a,0,0,"So you mean to say you are stronger than us." 
,ClearBalloon,miko2

,SetFocus,futo		,	#�����L�������w��
,ImageDef,futo,��1,0,0
���A���₻��\,a,0,0,"Oh, I did not..."
,ClearBalloon,futo#�Ώۂ̐����o������

,SetFocus,miko2,	#�������L�������w��
,ImageDef,miko2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����͂���\n�\��ʁA���\��\,b,0,0,"Hahaha. \nI don't mind. It's fine."
,ClearBalloon,miko2

,Hide,miko2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��ւ�\n���O�������v���Ă���̂���\,a,0,0,"Ichirin, is that what you think too?"
,ClearBalloon,hijiri

,Hide,futo,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,Show,ichirin2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,ichirin2		,#�������L�������w��
,ImageDef,ichirin2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A���Ă�Ǝv���܂��I\n���A�ܘ_\n�u�a�_�n�R�_�̃R���r�ɁA�ł���\,a,0,0,"Yes, I think we can win! \nOh, against the Pestilence god and Poverty god of course."
,ClearBalloon,ichirin2,

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��

,SetFocus,miko2,	#�������L�������w��
,ImageDef,miko2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����@���̂Ȃ�\n��X����Ɏ��H���Č�����\,a,0,0,"If you're going to brag, then practice on us."
,ImageDef,miko2,��1,0,0
�ǂ����낤�H�@�����@��\n���̗l�ȗ]���������Ȃ�\,a,0,0,"Isn't it fine? Hijiri Byakuren, \nthis kind of entertainment isn't bad either."
,ClearBalloon,miko2

,Hide,miko2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,SetFocus,hijiri		,#�������L�������w��
,ImageDef,hijiri,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���傤���Ȃ���˂�\n����Ŏ��M��t���߂��������\n�݂�����\,a,0,0,"It can't be helped. \nThey've become too confident from fighting."
,ImageDef,hijiri,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ł́A���̒�������\n���B����Ɍ������邪�ǂ��I\,a,0,0,"Well then, show us your investigation results by fighting us."
,ClearBalloon,hijiri

,Function,"::battle.team[0].current.Team_Change_Master(null)",#�X���C�u�ɓ���ւ��

,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g

#�S���t�F�C�X�P��
,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,miko2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(354)",# �w��BGM�Đ��J�n

,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,futo,��1,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,hijiri,�]1,0,0
,ImageDef,miko2,�]1,0,0

,Show,futo,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,ichirin2,-1280	,&
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,futo
,SetFocus,hijiri
,ImageDef,hijiri,�]1,0,0
�����A�����ɒ��q���񂾂���\,a,0,0,"You get carried away too quickly."
,ClearBalloon,hijiri

,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,miko2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End
# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,futo,��2,0,0
,ImageDef,ichirin2,��1,0,0
,ImageDef,hijiri,��1,0,0
,ImageDef,miko2,�]2,0,0

,Show,futo,-1280	,&#�t�F�C�X�\���J�n
,Show,hijiri,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,futo
,SetFocus,hijiri

,SetFocus,hijiri
,ImageDef,hijiri,��1,0,0
���O�B�A���X��邶��Ȃ�\,a,0,0,"You two are pretty good."
,ClearBalloon,hijiri

,SetFocus,futo
,ImageDef,futo,��1,0,0
�܂��܂��A�ʂ邢���I\,a,0,0,"You still have a long way to go!"
,ClearBalloon,futo


,SetFocus,hijiri
,ImageDef,hijiri,�f1,0,0
�����A�Y���ȁI\n遂�͔s�k�Ɍq����c�c\,a,0,0,"But don't forget! Arrogance leads to defeat....."
,ClearBalloon,hijiri

,SetFocus,hijiri
,ImageDef,hijiri,��1,0,0
��X���v���m�����悤�ɂˁI\,a,0,0,"As we have already learned!"
,ClearBalloon,hijiri

#�S���t�F�C�X�P��
,Hide,futo,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,ichirin2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,hijiri,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,miko2,-1280,

,Sleep,30

,Function,"::battle.Lose()",# �ΐ�ĊJ����

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

# -------------------------------------------------------
