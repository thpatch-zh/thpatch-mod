#========================================================================
#	�����F�X�e�[�W6�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F�V�q�@�h���~�[
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,jyoon,jyoon,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,shion,"data/event/pic/shion/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,shion2,shion,1p,240,0,false#���O,�O���[�v��,x,y,���]

#2Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title6.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�������\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(409)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150


#�ŏ������͋��Ȃ��B

,Show,tenshi,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
���͂͂͂́I\,a,0,0,"Hahahahahaha!"
,ImageDef,tenshi,�f1,0,0
����Ǖ�����Ȃ��\n�����ȓz�炾\,a,0,0,"How foolish for exiling me."
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����|������Ȃ�ĂȂ��I\n����ȋ����őދ��ȓV�E�Ȃ�\n�݂�ȉ��Ă��܂��I\,a,0,0,"There's nothing I'm scared of! \nI'm going to destroy everyone and everything in this stupid and boring Heaven!"
,ClearBalloon,tenshi

,Hide,tenshi,-1280
,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,50#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#�����o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�N���H\,a,0,0,"Who are you?"
,ClearBalloon,tenshi

#�����̓o��B


,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���O��\n�ŋ��ň��̖��̖\���V��\,a,0,0,"Are you the cursed and evil Dream World troublemaker?"
,ClearBalloon,jyoon

,SetFocus,tenshi	,
,ImageDef,tenshi,�f1,0,0
��H\n�������O�B\,a,0,0,"Huh? \nWhat are you two?"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,�]1,0,0
���͈ː_����\n�����q���ق�u�a�_\,a,0,0,"I'm Jyoon Yorigami. \nA Pestilence God that can intimidate anyone."
,ClearBalloon,jyoon

,Show,shion,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
���͈ː_����\n�����q���n����n�R�_\,a,0,0,"I'm Shion Yorigami. \nThe Poverty God that can bring poverty on anyone."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,shion2,�]1,0,0
���S�߈ˈٕς�\n���B���N���������̂�\,a,0,0,"We started the Perfect Possession incident."
,ImageDef,shion2,��1,0,0
�M���͖��̏Z�l�ł���H\,a,0,0,"And aren't you a dream dweller?"
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
���S�߈ˈٕρA���ƁH\,a,0,0,"The Perfect Possession incident?"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�Ȃ���A���O�B��\n�������R�ɂ��Ă��ꂽ�̂�\n���ӂ��邼�I\,b,0,0,"I see. So you guys let me free. \nI'm grateful for that!"
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",
,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
���́A��ߖ����V�q\n�����q�����V����V�l���I\n�Ђꕚ�����I\,b,0,0,"I'm Tenshi Hinanawi. \nA Celestial that can ascend anyone to the Heavens! \nWorship me!"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A��΂�����\,c,0,0,"This one's really crazy."
�V�E��k�킷\n����ȏo�L�ڂȃp���[\n���܂Ŋ��������Ƃ��Ȃ���\,c,0,0,"I've never felt such intense power that shakes Heaven."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
���������ď���\n�}�����ꂽ���̃p���[��\n�\�����Ă��邾����\,a,0,0,"Calm down Jyoon. \nHer oppressed Dream power is just out of control."
�����͎����Ȃ�����\,a,0,0,"It shouldn't last long."
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,�]1,0,0
�ӂ��n����\n���͑S�l�ނ̋C���𗘗p�ł���\n���̃p���[�͖��s�����I\,a,0,0,"Hah. You idiots. \nI can access the traits of all human kind. \nIt's an unlimited power!"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���s�������Ă�I\n�ǂ�����́H\,c,0,0,"She said unlimited! \nWhat are we goanna do?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
�܂��������Ă�\n�{�C���o����������Ƃ͂�\,a,0,0,"To think I'd have to go all out again."
,ClearBalloon,shion2

,ImageDef,shion2,��2,0,0
���͕n�R�_\n�S�l�ނ̕s�K����g�ɔw������\n���̕��̃I�[�������s����\T[!!]\,b,0,0,"I, the poverty god, will carry all the misfortune of human kind alone. \nThis negative aura is unlimited!"
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̃I�[���H\n�ށA�m���ɂ����͍���\n��������c�c\,c,0,0,"Negative aura? \nHmm, this one's pretty bad. \nAwful�c�c."
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A�Ȃ�ĕs���Ȏo����\,c,0,0,"Sigh, what a pitiful sister."
,ImageDef,jyoon,��1,0,0
�ł�����ɂȂ��[�I\n�����A�ŋ��ň��͎o�����l��\n���܂肾��[�I\,a,0,0,"But also reliable! \nIt's settled. \nShion, you're the cursed and evilest all by yourself!"
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
�����̖\���V�l�I\n�o����̕s�^�ɓG���Ǝv���Ȃ�I\,a,0,0,"Hey you crazy Celestial! \nDon't think you're a match for my sister's bad luck!"
,ClearBalloon,jyoon

,SetFocus,tenshi	,
,ImageDef,tenshi,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�I舂ɋߊ���\n�s�^�̊����Y������炤����\n�m��Ȃ���\,a,0,0,"If I carelessly get to close, I might get tangled up this misfortune."
,ImageDef,tenshi,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�

�ӂ�A�Ȃ�΋߂Â����Ȃ���\n�|���܂ł��I\,b,0,0,"Hmph, then I must finish this without getting close!"
,ImageDef,tenshi,��1,0,0
,Function,"::sound.PlayBGM(354)",# �w��BGM�Đ��J�n
�V��ɏZ�ޓV�l�̐킢����\n�����Ă�낤�I\,b,0,0,"I'll show you how a Celestial from Heaven fights!"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,�{1,0,0
���O�B��|������\,a,0,0,"Once I destroy you two,"
,ImageDef,tenshi,��1,0,0
�V�E��łڂ�\,a,0,0,"I'll destroy Heaven."
�n���łڂ�\,a,0,0,"Destroy Earth."
,ImageDef,tenshi,�f1,0,0
�l�ނ�łڂ�\,a,0,0,"Destroy all human kind."
�n���Ȃ炵\,a,0,0,"Leveling the ground."
,ImageDef,tenshi,�]1,0,0
�������l�G�����\,a,0,0,"Create a beautiful four seasons."
�V���������𑢂�\,a,0,0,"Create new life."
,ImageDef,tenshi,��1,0,0
�߂��ގ��̂Ȃ��S��n��\,a,0,0,"Create souls that will never feel sorrow."
�n���鎖�̂Ȃ��Љ�����\,a,0,0,"Create a society that will never be poor."
,ImageDef,tenshi,��2,0,0
���̐��E�S�Ă�\n�n�蒼���Ă�낤�I\,a,0,0,"I'll recreate this world!"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
���ɕ���I�@�O���̐_�X��I\,b,0,0,"Rot, you Demon Gods!
,ClearBalloon,tenshi


#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Begin_BattleDemo()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,shion2,-1280	,&
,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,tenshi	,
,ImageDef,tenshi,��1,0,0
�����͂���\n�V���E���a�����邼�[�I\,a,0,0,"Ahahaha. \nA new world will be born!"
,ClearBalloon,tenshi

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,

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
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,tenshi,��1,0,0
,ImageDef,doremy2,��1,0,0

,Sleep,90

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,jyoon
,ImageDef,jyoon,��1,0,0
�������I\,a,0,0,"I did it!"
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\

,SetFocus,shion2
,ImageDef,shion2,��1,0,0
����Ŗ��̏Z�l��\n�S�Ă�������ˁI\,a,0,0,"Now we've caught all of the Dream Residents!"
,ClearBalloon,shion2
,Hide,shion2,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\

,SetFocus,jyoon
,ImageDef,jyoon,��1,0,0
�������ȓz���������ǁc�c\n�v�����قǂł͂Ȃ������˂�\,a,0,0,"She was strange...... but not as difficult as I was expecting."
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\


,Show,tenshi,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,tenshi
#,Hide,tenshi,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,ImageDef,tenshi,�]1,0,0
�ӂ��ӂ���\,c,0,0,"hehehe."
,ImageDef,tenshi,�{1,0,0
����ŏI������Ǝv���Ȃ�I\,a,0,0,"Don't think that this is over!"
,ImageDef,tenshi,��1,0,0
�V�l�Ȃ�ł͂̐킢����\n�����Ă�낤�I\,a,0,0,"I'll show you how a Celestial fights!"
,ImageDef,tenshi,��1,0,0
�n��̏펯�͎̂Ă�I\n�{���̋󒆐�������Ă��I\,a,0,0,"Who cares about Earth's rules! \nI'll show you a real battle in the sky."
,ImageDef,tenshi,��1,0,0
�n���̍��������������\n�����O�ꂽ�f�u���ƂȂ�I\n��l�̊O���_��I\,b,0,0,"Become floating debris freed from the chains of Earth, you demons!"
,ClearBalloon,tenshi


#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,tenshi,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

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
