#========================================================================
#	���F�X�e�[�W1�@����
#	�ꏊ�F
#�@ �X���C�u�F�얲�@�G�`�[���F����
#�@�o���}�X�^�[�X���C�u�����]�A�X���C�u�͐�����E���ă^�C�}���@��b�V�[���ł͑S���o��OK
#	�X�e�[�W�^�C�g��
#	   �u�v
#========================================================================
:init
,SetDefaultBalloon,0,#���b�Z�[�W�ɕ��o���w������Ȃ��ꍇ�̃f�t�H���g���o����ݒ�

,Function,"::battle.Enable_win_demo(false)"#�����|�[�Y���o����

#�t�F�C�X�摜�Q�Ƃ̒�`
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,reimu,reimu,1p,240,0,false#���O,�O���[�v��,x,y,���]

#1Pslave
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"
,DefineObject,jyoon2,jyoon,1p,240,0,false

#2Pmaster����
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion,shion,2p,1040,0,true

#2Pslave
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"#���O,�\�[�X�t�@�C����
,DefineObject,yukari2,yukari,2p,1040,0,true#���O,�O���[�v��,x,y,���]

,Return
# =========================================================

# �{��
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

#�X�y���J�[�h�𖲑z����ɌŒ�
,Function,"::battle.team[0].master.spellcard.Initialize(0,0,0);"
,Function,"::battle.gauge.SetCard(0,::battle.team[0].master_name,0);"

,LoadAnimationLocal,"data/actor/story_title/yukari/title2.pat",1#�X�e�[�W�^�C�g���摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/shion/name.pat",1#�G�����摜�ǂݍ���
,LoadAnimationLocal,"data/actor/story_name/jyoon/name2.pat",1#�G�����摜�ǂݍ���
,GoSub,init				,# ���������[�`���Ăяo��

#,Function,"::battle.team[0].current.Wait_Outside()"#�G���\���ҋ@


,Function,"::battle.Jyoon_Ban_ShionMode()"#1P�X���C�u�����@�����̎g�p�𕕈�
,Function,"::battle.Ban_Slave()"#�o���̃X���C�u�V�X�e�����~


#�J�n�J�������o
#,Function,"::battle.BeginCamera()"#�J�������o�A�X�e�[�W�C�����J�n
,Sleep,2,#�E�F�C�g����
,Function,"::graphics.FadeIn(60)"#��ʂ��t�F�[�h�C��

,Function,"::sound.StopBGM(10);"
#,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,yukari2,��1,0,0
,ImageDef,shion,��1,0,0
,ImageDef,jyoon2,��1,0,0


#X�t���[���̑ҋ@�����isleep�ƈقȂ�X�L�b�v����Ŕ�΂��Ȃ��j
,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

#�^�C�g���R�[���o��(���ݖ�����)
#,Function,"::battle.Show_StageTitle()"#�^�C�g���R�[���o��
#,Sleep,150


#�z���C�g�C���B
#�얲�Ǝ����������Ă���B

,Show,shion,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion	,
,ImageDef,shion,��1,0,0
�悵�A���߂����I\n����ŏ����̏����͊m�肵���I\,a,0,0,"Alright, possessed! \nNow Jyoon's win is set!"
,Hide,shion,-1280,	#�Ώۃt�F�C�X�\���J�n
,Sleep,60

,Show,shion,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,shion	,

,ImageDef,shion,�f1,0,0
�c�c����A�����H\n�����ɍs�����́H\,c,0,0,"�c�chuh, Jyoon? \nWhere did you go?"
,ClearBalloon,shion

,Function,"::sound.PlayBGM(319)",# �w��BGM�Đ��J�n

,Show,reimu,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
�́[�A�����������Ƃ�\,a,0,0,"Ohhh, so that's what happened."
,ImageDef,reimu,��1,0,0
���̐������ች���N����̂�\n�悭����Ȃ���������\,a,0,0,"I didn't really understand from Yukari's explanation earlier ."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�ށA���O\n���̎��R�ɓ����Ă���H\,a,0,0,"You�c You�c why can you move around freely?"
,ImageDef,shion,�f1,0,0
�����̃X���C�u�ɂȂ���\n���R��D���Ă��锤�Ȃ̂Ɂc�c\,a,0,0,"You should've become Jyoon's slave and lost control."
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���񂽂͒N���Ɏ��߂���\n�K�����������鎖���o����\�͂�\n�����Ă���̂�\,a,0,0,"So you have the ability to possess someone and make them lose."
#,ClearBalloon,reimu

,ImageDef,reimu,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����ɖ��̉u�a�_��\n�X���C�u����������`�ł��񂽂�\n�����I�ɜ߈˂����鎖���o����\,a,0,0,"And your sister, \nthe Pestilence God, can switch slaves and force you to be possessed."
,ImageDef,reimu,�]1,0,0
�܂�A�����I�ɑΐ푊���\n�s�k�����鎖���o����Ƃ������\,a,0,0,"Basically, you can force the opponent to lose."
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
�܂��ɁA�ŋ��ň��̓�l�˂�\,a,0,0,"What a cursed and evil duo."
,ImageDef,reimu,��1,0,0
�ł��A�^�ɍŋ��̓�l�ɂ�\n�G��Ȃ�������\,a,0,0,"But, you were no match for the truly strongest duo."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����ɜ߂������O�͐g�̂̎��R��\n�����Ȃ��Ȃ�͂��c�c\,c,0,0,"You should have lost control of your body \nwhen Jyoon possessed you though�c�c"
�Ȃ̂ɂȂ�œ����Ă���H\,a,0,0,"But how are you moving?"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,�]1,0,0
�悭����\n���񂽁A�}�X�^�[���ɂȂ��Ă��\,a,0,0,"Look closely. \nYou're on the master side."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,��1,0,0
���H\,a,0,0,"Huh?"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,�]1,0,0
�����Ď����}�X�^�[��\n�����}�X�^�[�ƃX���C�u�̋��E��\n�t�ɂ��Ă��ꂽ��\,a,0,0,"And I'm a master too. \nYukari reversed the gap of master and slave."
,ImageDef,reimu,��1,0,0
���������ւ�����X���C�u��\n���Ƃ��񂽂̖�\,a,0,0,"So the switched slaves were Yukari and your sister."
,ClearBalloon,reimu

,Hide,reimu,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,Show,jyoon2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,jyoon2	,
,ImageDef,jyoon2,��1,0,0
���܂����I\n�Ƃ߂�ꂽ��I\,a,0,0,"Oh no! We were set up!"
,ImageDef,jyoon2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�����G�̃X���C�u��\n�Ȃ���������I\,a,0,0,"I became the enemy's slave!"
,ClearBalloon,jyoon2

,SetFocus,shion	,
,ImageDef,shion,��1,0,0
�Ȃ�Ď�\t[!?]\,a,0,0,"What the�c!?"
,ImageDef,shion,��1,0,0
���͎��Ɏ��߂��Ă��Ȃ��́H\n�ƌ������Ƃ�\n�����̃X���C�u�ɂ͂܂����I\,b,0,0,"I'm not possessing Yukari? \nWhich means my slave is�c!"
,ClearBalloon,shion

,Hide,shion,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#�X���C�u�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,ImageDef,jyoon2,��1,0,0

,Show,yukari2,-1280,	#�Ώۃt�F�C�X�\���J�n
,SetFocus,yukari2	,
,ImageDef,yukari2,��2,0,0
������\n����ł͉u�a�_�̔\�͂�\n�n�R�_�̔\�͂��Ӗ��Ȃ����\,a,0,0,"Quite right. \nWith this the Pestilence God's abilities and the Poverty God's \nabilities are meaningless."
,ImageDef,yukari2,�]1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
���A�얲\n���͂���ȏ㋦�͂͏o���Ȃ��̂�\n���̕n�R�_���T�N�b�Ɠ|���Ă�\,a,0,0,"Now, Reimu, I can't help anymore so quickly destroy the Poverty God."
,ClearBalloon,yukari2

,Hide,yukari2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,shion	,
,ImageDef,shion,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�}�X�^�[�ƃX���C�u��\n����ւ���Ȃ��\n����Ȏ��o����z������Ƃ́I\,a,0,0,"That there was someone who could reverse master and slave!"
,ClearBalloon,shion

,SetFocus,jyoon2	,
,ImageDef,jyoon2,��1,0,0
�����A�����ʖڂ��[\n�o�����l�ŏ��Ă�͂����Ȃ�\,c,0,0,"Ahhh, it's over. \nThere's no one way Shion can win on her own."
,ClearBalloon,jyoon2

,SetFocus,jyoon2	,
,ImageDef,jyoon2,�{1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�퓬�ł��S���𗧂�������\n���Âŕn�R�������Ă��݂������\n�����ł͉������悤�Ƃ��Ȃ���\,a,0,0,"She's useless in battle, gloomy, reeks of poverty, and stingy. \nShe doesn't try to do anything on her own."
,ImageDef,jyoon2,�f1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
����΂����茾���Ă�\n����ǂ��Ƃ���̂Ȃ�\n�o�����l�Ȃ�ā[\,a,0,0,"All she does is complain with no good points."
,ClearBalloon,jyoon2

,SetFocus,jyoon2	,
,ImageDef,jyoon2,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��̂˂�\n��x�������̌o�����Ȃ��n�R�_��\,a,0,0,"In the first place, the poverty god whose never won once,"
,ImageDef,jyoon2,�f1,0,0
���ɂ���Ĉٕω����̛ޏ���\n��R�ł��Ȃ�ā[\,a,0,0,"And of all days a one on one fight against the Incident resolving shrine maiden-"
,ImageDef,jyoon2,�f1,0,0
������]�I���[\n���S�s�k���[�I\,c,0,0,"There's no hope! \nIt's a complete defeat!"
,ClearBalloon,jyoon2

,Hide,jyoon2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#�}�X�^�[�ɓ���ւ��
,Sleep,30#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�h煂Ȃ��ʂ�̈��A�͂���������\,a,0,0,"Are you done with the sarcastic goodbye?"
,ImageDef,reimu,��1,0,0
���A�l�𕉂��ɂ���\�͈ȊO��\n���S�ɖ��\�̃U�R�n�R�_��|����\n�T�N�b�ƈٕω������悤����\,a,0,0,"All right, let's destroy this completely useless Poverty God \nwhose only ability is to make others lose. \nAnd then quickly resolve this incident."
,ClearBalloon,reimu


,SetFocus,shion	,
,ImageDef,shion,�{1,0,0
�����A���O�B�c�c\,c,0,0,"Jyoon and you two�c�c."
�݂�Ȕn���ɂ��₪����\n����ȂɌ������Ȃ�����Ȃ��I\,b,0,0,"Everyone's looking down on me. \nYou don't have to say that much!"
,ClearBalloon,shion

,Hide,shion,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,reimu,-1280,

,Function,"::battle.team[1].current.Set_BerserkAura(null)",#��������I�[���B
,Function,"::battle.team[0].current.Story_ReimuShock(null)",#��������I�[���B


,Sleep,60

#�����얲

,SetFocus,shion	,
,ImageDef,shion,��2,0,0
���̖��́A�ː_����\,a,0,0,"My name is Shion Yorigami."
�����q���s�K�ɂ���n�R�_���I\,a,0,0,"A Poverty god that can make anyone miserable!"
,ClearBalloon,shion
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S

,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
���A�������̃I�[���I\,a,0,0,"What a terrible negative aura!"
,ClearBalloon,reimu

,SetFocus,shion	,
���܂Ŗ{�C��\n�o���Ȃ������̂ɂ͖󂪂���\,a,0,0,"There's a reason I never made a serious effort."
#,ImageDef,shion,��2,0,0
�����{�C���o����\n�������܂߂đS�Ă̎҂�\n�s�K�ɂȂ邩�炾�I\,b,0,0,"Because if I actually tried, everyone including me will become unfortunate!"
,ClearBalloon,shion

#,ImageDef,shion,��1,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
��������\n���������Ȃ�ċ����͖���\,a,0,0,"I'm done. \nI don't care about winning or losing."
#,ImageDef,shion,�{1,0,0
�����{�C�ɂȂ����ȏ�\n�����ɂ���S���𕉂������Ă��\,c,0,0,"If I'm going to be serious, I'll make everyone here lose."
�ޏ��������A�����A���O�����I\,b,0,0,"The shrine maiden, me, Jyoon, even you!"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
���̕��̃I�[���̋�����\n�u�a�_�̔䂶��Ȃ���I\,c,0,0,"The Pestilence God is nothing  compared to the strength of this negative aura!"
,ImageDef,reimu,��1,0,0
�n�R�_��\����ɏo�����̍��\n���s�������񂶂�Ȃ��H\,a,0,0,"Maybe our plan to bring the Poverty God to the front stage was a mistake?"
,ClearBalloon,reimu

,SetFocus,shion	,
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
#,ImageDef,shion,�{1,0,0
#,ImageDef,shion,�]1,0,0
�N���������Ȃ�\n�N���K���ɂȂ�Ȃ�\,a,0,0,"No one will gain and no one will be happy."
#,ImageDef,shion,��1,0,0
�S����������\n�s�K�̐��E�������Ă��I\,b,0,0,"I'll make an unfortunate world where everyone is equal!"
,ClearBalloon,shion

,Function,"::battle.team[0].current.EndtoFreeMove()",#�얲�����A�j����

,SetFocus,reimu	,
,ImageDef,reimu,��1,0,0
����Ɉ��ݍ��܂ꂽ��\n�������������I\,b,0,0,"Anyone would lose if they're caught in this!"
,ImageDef,reimu,��2,0,0
�C���������莝�āI\n���͈ٕω����̛ޏ���I\,b,0,0,"Pull yourself together! \nI'm the incident resolving shrine maiden!"
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,��2,0,0
#0�P�Q�R�S�T�U�V�W�X�O�P�Q�R�S
�n�R�_�Ɖu�a�_��\n�ŋ��ň��̓�l�����āH\,a,0,0,"The Pestilence God and Poverty God are the cursed and evil duo?"
�΂킹��ȁI\,b,0,0,"Don't make me laugh!"
�ŋ��ň��͈�l�ŏ\��\n���ꂱ������\n�n�R�_�̈ː_�������I\,a,0,0,"The cursed and evil is enough with one person. \nThat is me, the Poverty god, Shion Yorigami!"
�n�����ɋ����Ď��ˁI\,b,0,0,"Be scared of poverty and die!"
,ClearBalloon,shion

#,Function,"::sound.StopBGM(1000)",# BGM��~ 1000=��b�|���ăt�F�[�h�A�E�g
,Function,"::battle.team[1].current.EndtoFreeMove()",#�얲�����A�j����

#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,yukari2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,shion,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,jyoon2,-1280,

#,Function,"::sound.PlayBGM(103)",# �w��BGM�Đ��J�n

,Sleep,60#�X���[�v���߁@�w�萔�l�t���[���҂��܂�

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
,ImageDef,reimu,��1,0,0
,ImageDef,yukari2,��1,0,0
,ImageDef,shion,��1,0,0
,ImageDef,jyoon2,��1,0,0

,Sleep,120

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
#,Show,shion,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,shion
,ImageDef,shion,��1,0,0
����[�I\,b,0,0,"Aghh!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
������I\n�}�ɋ�C���ς������I\,a,0,0,"What is this? Something in the air suddenly changed!"
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,��1,0,0
�c�c���̗��ߍ��񂾃I�[����\n�݂�ȏo�Ă��܂��I\,c,0,0,"......The aura I was saving is escaping!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
���̃I�[���ɕ����\n�����ῂ����I�[����\n�B�������Ă����̂ˁI\,a,0,0,"You were hiding such a bright aura in your negative aura!"
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,��2,0,0
�����Ȃ��j�ꂩ�Ԃꂾ�I\n���Ă����̃I�[����\n�o���؂��Ă��I\,b,0,0,"I don't care anymore! I'll just use up all of the aura I have!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
�M���̂��A��\n�����ɗ͂��N���Ă����I\,b,0,0,"Thanks to you, I'm gaining endless energy!"
,ClearBalloon,reimu

,SetFocus,reimu
,ImageDef,reimu,��2,0,0
����������C�����Ȃ��I\n����ς�M����\n����̔\�͂ŕ�����̂�I\,b,0,0,"I feel like I won't lose! \nJust as I thought Shion, you lose from your own power!"
,ClearBalloon,reimu


#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,yukari2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,shion,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,jyoon2,-1280,

,Sleep,30

,Function,"::battle.Win()",# �ΐ�ĊJ����

,End

# -------------------------------------------------------
# ���ԃf��1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# ���������[�`���Ăяo��

#�����\��ݒ�
#,ImageDef,�ݒ�Ώ�,�\����e,�\�����W�␳X,�\�����W�␳Y
,ImageDef,reimu,��1,0,0
,ImageDef,yukari2,��1,0,0
,ImageDef,shion,��1,0,0
,ImageDef,jyoon2,��1,0,0

,Sleep,120

,Show,reimu,-1280	,&#�t�F�C�X�\���J�n
#,Show,shion,-1280	,&#�t�F�C�X�\���J�n

,SetFocus,reimu
,SetFocus,shion
,ImageDef,shion,��1,0,0
����[�I\,b,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
������I\n�}�ɋ�C���ς������I\,a,0,0
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,��1,0,0
�c�c���̗��ߍ��񂾃I�[����\n�݂�ȏo�Ă��܂��I\,c,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
���̃I�[���ɕ����\n�����ῂ����I�[����\n�B�������Ă����̂ˁI\,a,0,0
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,��2,0,0
�����Ȃ��j�ꂩ�Ԃꂾ�I\n���Ă����̃I�[����\n�o���؂��Ă��I\,b,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,��1,0,0
�M���̂��A��\n�����ɗ͂��N���Ă����I\,b,0,0
,ClearBalloon,reimu

,SetFocus,reimu
,ImageDef,reimu,��2,0,0
����������C�����Ȃ��I\n����ς�M����\n����̔\�͂ŕ�����̂�I\,b,0,0
,ClearBalloon,reimu


#�S���t�F�C�X�P��
,Hide,reimu,-1280,&	#�@&�łȂ��Ɓu�������I�����玟�֐i�ށv�n�̖��߂𓯎��Ɏ��s�\
,Hide,yukari2,-1280,&�@#����͎l�l���̃t�F�C�X�摜�𓯎���1280�h�b�g�O�֌����ēP�������Ă��܂�
,Hide,shion,-1280,&�@#�@&�łȂ��Ȃ��ꍇ�A��l���t�F�C�X�摜���P�����Ă����܂�
,Hide,jyoon2,-1280,

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
