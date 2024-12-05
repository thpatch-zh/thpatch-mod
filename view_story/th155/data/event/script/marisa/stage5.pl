#========================================================================
#	�������F�X�e�[�W5�@����
#	�ꏊ�F
#�@ �X���C�u�F�������@�G�`�[���F����
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

,LoadAnimationLocal,"data/actor/story_title/marisa/title5.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
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
,ImageDef,marisa,�f1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Dash()"#���s�`�[������ʏォ��o��
#,Function,"::battle.team[0].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,120

,Show,marisa,-1280,	#�Ώۃt�F�C�X�\���J�n
#,Show,�t�F�C�X�\���J�n�Ώ�,�\���J�n����X���W�␳�i�������X�^�[�g�ɒ�ʒu�ֈړ����Ă���j,

,SetFocus,marisa		,	#�����L�������w��
#��b�e�L�X�g�A\n�ŉ��s�A����\�ŃL�[���͂�҂��܂�\,�����o���w��,�\�����W�␳X,�\�����W�␳Y
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����������C�u���n�܂�ȁc�c\,a,0,0,"Looks like the concert's gonna start soon�c�c"
,ClearBalloon,marisa#�Ώۂ̐����o������

#�����ł����������o���~�����A�Ƃ�����������������K���K���{���ɒ��ߕ�����ł�������
#�\�Ȍ���Ή����܂���
# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��1,0,0
���C�u�y���݁[�I\n���̋Ȃ����̂���\,a,0,0,"Concert's are so fun! \nI wonder what they're going to play."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������\n����ǂ��낶�ᖳ������\,a,0,0,"Hey, hey, we don't have time for that now."
,ImageDef,marisa,��1,0,0
�����ɉ��������̂�\n�Ď����ĂȂ���\,a,0,0,"We need to keep an eye out for anything that might show up."
,ClearBalloon,marisa#�����o������

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,Show,koishi2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�������āA�����Ɍ����̂�\n�v���Y�����o�[�E�B�Y�g�ł���H\n���C�u�͊y���܂Ȃ���\���\���I\,a,0,0,"But we already know! \nIt's Prismriver with H, right? \nWe can't miss out on the concert!"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
�����Ƒg�񂾂̂��ԈႢ������\,a,0,0,"Working with you was a mistake."
,ClearBalloon,marisa#�����o������

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Function,"::battle.team[1].current.StageIn_Fall()"#���s�`�[������ʏォ��o��
,Sleep,90#�X���[�v���߁@�w�萔�l�t���[���҂��܂�


,Show,jyoon,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
������[�I\n���C�u�A�y���݁[�I\n�����������t���n�܂�ˁ[�I\,a,0,0,"Whoo! I'm excited for this concert! \nThe performance's going to start soon!"
,ClearBalloon,jyoon

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��3,0,0
�ˁ[�A�y���݂��ˁ[�I\,a,0,0,"Yeah, so exciting!"
,ClearBalloon,koishi2

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��2,0,0
�ϋq�����S�ɂȂ�u�Ԃ�\n�K�����[\,a,0,0,"The moment when the audience will be mindless is coming."
,ClearBalloon,jyoon

,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��2,0,0
���S�Ŋy���ނ�[\,a,0,0,"I'm going to enjoy this without a care in the world."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,�f1,0,0
���A����\n���O�͒N���H\,a,0,0,"Wa�cwait, who are you?"
,ClearBalloon,marisa#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�{1,0,0
���H�@�N�ł��ǂ��ł���H\n�U�R�͈�������ł�\,a,0,0,"Huh? Who cares. \nGo away losers."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,�{1,0,0
�����ƁH\,a,0,0,"What'd you say?"
,ClearBalloon,marisa#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
���񂽁A���S�߈˂̂��Ƃ�\n���ׂĂ����܂ŒH�蒅�����̂�\,a,0,0,"So you've been investigating Perfect Possession and got this far."
,ImageDef,jyoon,��2,0,0
����͖J�߂Ă�����\,a,0,0,"I'll praise you for that."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ƌ������Ƃ�\n���S�߈˂͂��O�̎d�ƂȂ񂾂ȁI\,a,0,0,"So you're the ones behind Perfect Possession!"
,ClearBalloon,marisa#�����o������

,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�]1,0,0
�����ɂ�\n����\R[�ː_����|��肪�݂��储��]�A�x�������炷���_\,a,0,0,"For sure. I'm Jyoon Yorigami, a goddess that brings wealth."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�x�������炷�A���ƁH\,a,0,0,"Brings wealth?
,ClearBalloon,marisa#�����o������

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��1,0,0
����H\n�����ǂ��z���ۂ�\,a,0,0,"Huh? She doesn't seem bad."
,ClearBalloon,koishi2

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��2,0,0
���[�āA���̊ϋq����\n�x�������グ��񂾂���\n�ז����Ȃ��ł�\,a,0,0,"All right, I'm going to gain some wealth from this crowd so don't disturb me."
,ClearBalloon,jyoon

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���������āA�x�������炷����\n�����ɂ����炷�A���ĈӖ����H\,a,0,0,"You meant "bringing wealth" to yourself?
,ClearBalloon,marisa#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�f1,0,0
�����Ɍ��܂��Ă邶��Ȃ�\n���͎o����ƈ����\n�������W�߂�̂����ӂȂ񂾂���\,a,0,0,"Of course. \nUnlike my sister, I'm good at collecting money."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,�f1,0,0
�o����H\,a,0,0,"Sister?"
,ClearBalloon,marisa#�����o������

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Hide,jyoon,-1280,
,Sleep,40#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#
#�������o�ꂷ����ꉉ�o���}������܂�
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#�����o��
#

,Sleep,180#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,Shion,-1280,&	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����[�A���̌�����������[\n�������čD���ŕn�R���Ă���\n�󂶂�Ȃ��̂Ɂ[\,a,0,0,"Jyoon, so mean. \nIt's not like I'm poor because I want to."
,ClearBalloon,shion2

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��1,0
�킠�A�n���ȓz���o�Ă���\,a,0,0,"Wah, a poor looking person!"
,ClearBalloon,koishi2

,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��2,0,0
�������Ȃ����\n���S�߈˂�㩂�\n���藧���Ȃ��̂ɂ��[\,a,0,0,"If I'm not here, the Perfect Possession trap won't be possible."
,ClearBalloon,shion2

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
����ȏ�߂Â��Ȃ��ŁI\n�o����Ƃ���ƕn�R���`����\,a,0,0,"Don't come any closer! \nWhen I'm with you, I'll be infected with poverty."
,ClearBalloon,jyoon

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
������c�c\n��̉����ړI���H\,a,0,0,"These guys�c�c what's your deal?"
,ClearBalloon,marisa#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
���X�Ƌ������S�߈˂�����\n��ʂ̊ϋq����x��D���̂�\,a,0,0,"Enforced Perfect Possession and steal wealth from tons of spectators."
,ImageDef,jyoon,�]1,0,0
���Ƀ��C�u�̊ϋq��\n���_�I�ɖ��h���Ȃ�Ŋy������\,a,0,0,"Especially during a concert, \nthey're mentally defenseless so it's an easy win."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
���āA�R�\�D���邽�߂�\n����Ȉٕς��N�������̂���\,a,0,0,"So you caused this incident just for some pickpocketing."
,ClearBalloon,marisa#�����o������

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,��1,0,0
�R�\�D���Ⴀ�A�Ȃ���\n���R�ƕx�͎��̌���\n�W�܂��ė����\,a,0,0,"It's not pickpocketing. \nWealth just naturally comes to me."
,ClearBalloon,jyoon

,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
������\R[�u�a�_|�₭�т傤����]�������\n���Ɏ��߂��ꂽ�l�Ԃ�\n�����̈ӎv�ōv���ł��܂��̂�\,a,0,0,"Jyoon's the Pestilence God. \nHumans who are possessed by my sister will supply money by their own will."
,ClearBalloon,shion2


,Function,"::battle.Show_EnemySlaveName()",
,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����Ŏ��͕n�R�_��\R[����|������]\n���Ɋ��S�߈˂���\n���̉��b�ɗ^�낤�Ǝv���Ă��\,a,0,0,"And I, the Poverty God, Shion, \nam thinking of taking that ability by Perfectly Possessing my sister." 
,ClearBalloon,shion2

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��2,0,0
�n�R�_�ɉu�a�_�̎o������\t[!?]\n����[�A�ߊ�肽���ˁ[\,a,0,0,"The Poverty and Pestilence God sisters!? \nUhh, I'm not getting anywhere near that."
,ClearBalloon,marisa#�����o������

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# �X���C�u�ɓ���ւ��

,SetFocus,koishi2		,#�������L�������w��
,ImageDef,koishi2,��2,0
����Ⴀ�A�܂���\n�ŋ��ň��̓�l���˂�\,a,0,0,"Wow, this really is a cursed and evil duo."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# �}�X�^�[�ɓ���ւ��

,Function,"::sound.StopBGM(500);",# BGM��~

,SetFocus,marisa		,	#�����L�������w��
,ImageDef,marisa,��1,0,0
��肩�������D��\n�����ł��O�B�̖�]��\n�ł��ӂ��Ă��\,a,0,0,"We're past the point of no return. \nSo we're gonna crush your dreams here."
,ClearBalloon,marisa#�����o������


#�S���t�F�C�X�P��
#,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
#,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
#,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
#,Hide,shion2,-1280,

,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�{1,0,0
���t���n�܂��Ă��܂�����\,a,0,0,"The performance started."
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ImageDef,jyoon,�f1,0,0
���̃r�b�O�`�����X��\n���������Ȃ��񂾂���\,a,0,0,"I don't want to lose this big chance."
,ClearBalloon,jyoon

,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
�Ȃ��I���O��\n�Еt�����Ⴂ�܂���\n�y����A����Ȗ��v��ȓz��\,a,0,0,"Let's finish this up before the song ends. \nIt's an easy win with these reckless ones."
,ClearBalloon,shion2


,SetFocus,jyoon		,#�������L�������w��
,ImageDef,jyoon,�]1,0,0
�������ˁI\n�u�a�_�̎���\,a,0,0,"That's true! With me, the Pestilence God and"
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
,ClearBalloon,jyoon

,SetFocus,shion2		,#�������L�������w��
,ImageDef,shion2,��1,0,0
�n�R�_�̎�\,a,0,0,"Me, the Poverty God.
,ClearBalloon,shion2

,Hide,jyoon,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,shion2,-1280,�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�

#
#�����Ǝ����������ɂ���ׂ���ꉉ�o���}������܂�
#
,Sleep,30
,ImageDef,shion2,��1,0,0
,ImageDef,jyoon,��2,0,0
,SetFocus,jyoon		,#�������L�������w��
��炪���̍ŋ��ň��̎o���Ȃ̂�\n�g���ȂĒm�邪�ǂ��I\,e15x3,0,0,"Find out firsthand why we are the cursed and evil sisters!"
,ClearBalloon,jyoon

#�S���t�F�C�X�P��
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
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
,ImageDef,marisa,�f1,0,0
,ImageDef,koishi2,��1,0,0
,ImageDef,jyoon,��1,0,0
,ImageDef,shion2,��1,0,0

,Show,marisa,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,marisa

,Show,jyoon,-1280	,&#�t�F�C�X�\���J�n
,SetFocus,jyoon
,ImageDef,jyoon,�]1,0,0
���X�r�͗��˂�\n�����c�c\,a,0,0,"Hmm, you're pretty talented. But......"
,ClearBalloon,jyoon

,SetFocus,marisa
,ImageDef,marisa,��1,0,0
���̃I�[�����o�Ă��邨�O�B��\n������C�����Ȃ����I\,a,0,0,"I don't think I'll lose against this misfortune team!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���͂͂́A���Ԃ͏I��肾�I\n���܂��ɁI\n���O�B�̕����͊m�肵���I\,c,0,0,"Ahahaha, let's stop with the games! \nJust now! Your fate was sealed!"
,ClearBalloon,jyoon
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
,Hide,marisa,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,koishi2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
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
