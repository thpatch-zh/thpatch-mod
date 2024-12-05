#========================================================================
#	�����F�X�e�[�W5�@����@
#	�ꏊ�F
#�@ �X���C�u�F�C�Ӂ@�G�`�[���F�ؐ�@�h���~�[
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
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#�����f�[�^���[�h�i�������e�̎w�肪����ꍇ�A�����ɕ`������ł��炦��ΑΉ����܂��j
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@

#�J�n�J�������o
,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.PlayBGM(407)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,kasen,��1,0,0
,ImageDef,doremy2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,50#�X���[�v���߁@�w�萔�l�t���[���҂��܂�
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#�����o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,


,Function,"::battle.Show_EnemyName()",#�G�l�[����\��
,Show,kasen,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ŋ��ň��̓�l��\,a,0,0,"So this is the cursed and evil duo."
,ImageDef,kasen,��1,0,0
�f��������Ă���Ƃ�������\n���z����̌����҂ƌ����Ă�\n�ߌ�����Ȃ��l�C��\,a,0,0,"To be characterized in that way... \nYour popularity as the most hated in Gensokyo isn't an overstatement."
,ClearBalloon,kasen

,Show,jyoon,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�͂��͂��A���A�l�ł�\n���B�͂���Ȃ񂾂���\n������̂ɂ͊���Ă�����\,a,0,0,"Yes, yes. \nThanks to you. We're already like this, so we're using to being hated."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̖��߂ł���H\n�����ɂ��O�B�������̂�\,a,0,0,"You're under Yukari's orders, right? \nThe reason you came here."
,ClearBalloon,kasen

,ImageDef,jyoon,��1,0,0
,SetFocus,jyoon	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����A���z���̂���������\n���̏Z�l��������Č����Ă�\,a,0,0,"Yup, we were told dream dwellers are all over Gensokyo."
,ImageDef,jyoon,��1,0,0
�������S���߂܂�����\n���S�߈ˈٕς̌���\n�s��ɕt������\,a,0,0,"If we capture all of them, \nshe'll ignore the case of the Perfect Possession incident."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,�@1,0,0
����A�����s������Ă����\,c,0,0,"You're being deceived by Yukari."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,kasen,�{1,0,0
�ޓz�͑啨�����Ɉ̂Ԃ��Ă邯��\n�{���͍������S�҂�\n���S�͂������₩�ł͂Ȃ�\,a,0,0,"She acts high and mighty but is really a coward and always nervous."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�s�����q������Ēu�����Ƃ�\n�o���Ȃ����A���炪�����̂�\n�|���ďo���Ȃ��A���ēz�Ȃ�\,a,0,0,"She can't ignore the troublemakers \nbut is too scared to make a move herself."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
���̏Z�l�Ɛ키�̂���\,a,0,0,"She doesn't want to fight with the dream dwellers."
,ImageDef,kasen,�]1,0,0
���O�B�Ɛ키�̂���\,a,0,0,"Nor fight with you."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,kasen,�f1,0,0
���݂��ׂ������Ă���Ȃ����ȁ[\n���čl���Ĉ˗������񂶂�\n�Ȃ�����\,a,0,0,"She probably commissioned the both of you, in hopes you would ruin each other."
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,�f1,0,0
�����\n�m���ɂ��������߂����邯��\,c,0,0,"That might be true but�c"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(3000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g
,SetFocus,kasen	,
,ImageDef,kasen,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�˂��A�����ő��k�Ȃ񂾂���\,a,0,0,"So let's negotiate."
,Function,"::sound.PlayBGM(406)",# �w��BGM�Đ��J�n
���̏Z�l�Ǝ��g���\n���z�����x�z���Ȃ��H\,a,0,0,"How about joining forces with the dream dwellers and control the Gensokyo?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
���g�ނ�����\T[!?]\,a,0,0,"Join forces!?"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���S�߈ˈٕς������\n�M���B�͂����Ƌ����Ȃ��\n�ٕς��I��点�Ăܑ͖̂Ȃ���\,a,0,0,"With the Perfect Possession incident, you can be stronger. \nIt'd be a waste to end the Incident."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ٕς��I��点�Ȃ��悤��\n���B�A���̏Z�l�͑S�͂ŃT�|�[�g\n���Ă����邩��\,a,0,0,"With the Perfect Possession incident, you can be stronger. \nIt'd be a waste to end the Incident."
,ClearBalloon,kasen

,ImageDef,shion2,��1,0,0
,SetFocus,shion2	,
�x����Ȃ���\n�����́A���������̐��E��\n�o�������炻�������Ă��邾����\,a,0,0,"Don't be fooled. \nShe's saying this because she wants to go to the Real World."
,ImageDef,shion2,��1,0,0
���̏Z�l��\R[�s�U|���傤�䂤]��\n����݂��Ȃ��ŁI\,c,0,0,"Don't listen to dream dweller's deception."
,ClearBalloon,shion2

,ImageDef,jyoon,�f1,0,0
,SetFocus,jyoon	,
�o����Ɍ����Ȃ��Ă�\n�����Ă��I\n�ł��c�c\,a,0,0,"I don't have to be told by you. \nI know! But�c�c"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,�@1,0,0
���S�߈˂��������\n�ԈႢ�Ȃ��M���B�͍ŋ��ł���\n����Y��ł����\,a,0,0,"As long as there's Perfect Possession, you'll be the strongest without fail. \nWhat are you worried about?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
�m����\n���S�߈˂͎��B�ׂ̈�\n����悤�Ȃ��̂����ǁc�c\,a,0,0,"True, Perfect Possession is basically for us�c�c"
,ClearBalloon,jyoon


#,Function,"::sound.PlayBGM(408)",# �w��BGM�Đ��J�n
,SetFocus,jyoon	,
,ImageDef,jyoon,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����A�ߋ��̎������̂Ă�񂾁I\,a,0,0,"No, I've gotta abandon my past!"
,ImageDef,jyoon,�]1,0,0
�������l�̍���\n�����鐶�����̂Ă�\n�S�̖L���Ȑl���𑗂肽���I\,b,0,0,"I'm gonna stop living off others wealth and live peacefully!"
,ClearBalloon,jyoon

,ImageDef,shion2,��1,0,0
,SetFocus,shion2	,
�����[�B�����ǂ������́H\,a,0,0,"What?? What happened Jyoon?"
���͑��l�̍��ł�\n�ǂ����璅���肽����c�c\,a,0,0,"I want to live well even if it's off other peoples money."
,ClearBalloon,shion2

,ImageDef,jyoon,��1,0,0
,SetFocus,jyoon	,
�o����͖ق��Ă�\,a,0,0,"Shut up, Shion."
,ImageDef,jyoon,�f1,0,0
��������΂�\n����Ȃ��̉��ɂ��K���ɂ�\n���т��Ȃ�������\,a,0,0,"Money and jewels, this stuff didn't bring any happiness."
,Function,"::sound.StopBGM(3000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g
,ImageDef,jyoon,�]1,0,0
�^�̍K����͂ވׂ�\n�ߋ��̎����ƌ��ʂ���I\,b,0,0,"To gain real happiness, I'm leaving my past!"
,ClearBalloon,jyoon

,Function,"::sound.PlayBGM(313)",# �w��BGM�Đ��J�n

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���̏Z�l�߁I\n�����s�������Ƃ��Ă���̂�\n���O���[�I\,b,0,0,"You dream dweller! \nYou're the one trying to deceive me!"
,ClearBalloon,jyoon


,SetFocus,kasen	,
,ImageDef,kasen,�{1,0,0
�`�b�I\,a,0,0,"Tsk."
�����ŏC�Ƃ����Ă�\n���ĕ����Ă�����\n���ꂪ�ړI�������̂�\,a,0,0,"I heard you were training at the temple but I guess this was the goal."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
���Ⴀ�A���O�B�͗v��Ȃ���\n���z������i�v�Ǖ���I\,b,0,0,"Then I don't need you two. \nPermanent exile from Gensokyo!"
,ClearBalloon,kasen


#�S���t�F�C�X�P��
,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,


,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Function,"::battle.Lose()",# �ΐ�J�n����

,End	#��b�C�x���g���I��



# -------------------------------------------------------
# �v���C���[�s�k
# -------------------------------------------------------
:lose
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0
,ImageDef,kasen,��1,0,0
,ImageDef,doremy2,�]1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n(���݃t�F�C�X�̕\����SetFocus�ƕR�Â����Ă��邽�߁A��̓����o�����ł��Ȃ����߁A����Ή����܂�
#,Show,shion2,-1280	,&
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,jyoon	,
,SetFocus,kasen	,
���̏Z�l��\n���z�����x�z������͋߂�\,a,0,0,"The day for the dream dwellers to control the Gensokyo is near."
,ClearBalloon,kasen

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�J�n����

,End

# -------------------------------------------------------
# �v���C���[����
# -------------------------------------------------------
:win
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,�]1,0,0
,ImageDef,kasen,�f1,0,0
,ImageDef,doremy2,��1,0,0

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,Show,kasen,-1280	,&#�t�F�C�X�\���J�n
,Show,doremy,-1280	,#�t�F�C�X�\���J�n


,SetFocus,kasen,
,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
�������I\n���̏Z�l�Q�b�g�����[�I\,b,0,0,"I won! \nI got another one!"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,�f1,0,0
�˂�����\n�����������Ă��̂��Ė{���H\,a,0,0,"Hey Jyoon. \nWere you telling the truth?"
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
������\n�����ŏC�Ƃ��Ă�����Ȃ̂�\,a,0,0,"Maybe. \nSince I've been meditating at the temple."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���ƂȂ��������΂̂���߂���\n�������悤�Ɍ�������\,a,0,0,"Money and jewels don't sparkle so much anymore."
,ClearBalloon,jyoon

,SetFocus,kasen	,
���O�B�A���̏Z�l��\n�S�ĕ߂܂������Ȃ́H\,a,0,0,"The two of you are planning to capture all of the dream dwellers?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,��2,0,0
���̂��肾��\n�ł��ˁA����������I��肩��\,a,0,0,"That's the plan. \nBut this might be the end."
,ImageDef,jyoon,��1,0,0
���ɁA�M�����Ō�̖��̏Z�l����\n���ĕ����Ă邩���\,a,0,0,"Yukari said you might be the last dream resident."
,ImageDef,jyoon,�]2,0,0
����Ƃ��̋�s����\n�����������[\,a,0,0,"I'm finally free from this penance."
,ClearBalloon,jyoon

,SetFocus,kasen	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,kasen,��1,0,0
���ōŌゾ���āH\,a,0,0,"I'm the last one?"
,ImageDef,kasen,��2,0,0
����Ȃ��Ƃ͂Ȃ�\n���̐��E�ōŋ��ň��̖\���V��\n�c���Ă����\,a,0,0,"That's not true. \nThere's still the cursed and evil wild one in the Dream World."
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,�{1,0,0
�ŋ��ň������āH\,a,0,0,"Cursed and evil?"
���B�������u����\n���̏̍������̂�\n�C�ɂ���Ȃ��˂�\,a,0,0,"Other than us, I don't like someone using that name."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,�f1,0,0
���̍ŋ��ň��̖��̏Z�l��\n��ɍs�������H\,a,0,0,"Do you want to meet the Dream World's cursed and evil?
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
�ܘ_��I\,a,0,0,"Of course!"
����Ƃ����̂Ȃ�Ȃ��\n�����|������̂�\n�����ė~������I\,a,0,0,"If they do exist, I want to see them scared of me!"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����x���ˁI\,b,0,0,"Some nerve!"
,ImageDef,kasen,��1,0,0
�C�ɓ������A�����̎����M���B��\n�󂯓���闝�R����������\,a,0,0,"I like it. \nI can see why the real me accepted you." 
,ClearBalloon,kasen

,SetFocus,shion2	,
,ImageDef,shion2,��1,0,0
���̐��E�̍ŋ��ň���\n�����ɂ���H\,a,0,0,"Where is the Dream World's cursed and evil?"
,ClearBalloon,shion2

,SetFocus,kasen	,
,ImageDef,kasen,��1,0,0
�ŋ��ň���\R[��|����]�ɂ���I\n�߂܂�������Δ�ׁI\n�ʂĂ��Ȃ��V�̍��݂ɁI\,b,0,0,"The cursed and evil are in the sky! \nIf you want to catch them fly! \nTo the top of the Heavens!"
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,shion2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,kasen,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
