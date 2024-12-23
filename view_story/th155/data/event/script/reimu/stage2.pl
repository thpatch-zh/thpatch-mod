#========================================================================
#	霊夢：ステージ2　試作　
#	場所：
#　 スレイブ：華扇　敵チーム：マミゾウ　妹紅
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#名前,ソースファイル名
,DefineObject,reimu,reimu,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"#名前,ソースファイル名
,DefineObject,kasen2,kasen,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou,mamizou,2p,1040,0,true

#2Pslave
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou2,mokou,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,mamizou_name,mamizou,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mamizou/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mokou/name2.pat",1#敵スレイブ肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#自陣を非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,mamizou,普1,0,0
,ImageDef,mokou2,普1,0,0

#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,110

,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,50#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,kasen2,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,kasen2		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
さっきの魔理沙で\n気付いたことがある\,a,0,0,"I noticed something with Marisa just now."
,ClearBalloon,kasen2#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#マスターに入れ替わる

,Show,reimu,-1280,
,SetFocus,reimu		,	
,ImageDef,reimu,普1,0,0
何？\,a,0,0,"What?"
,ClearBalloon,reimu#吹き出し消去

,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

#0１２３４５６７８９０１２３４
,SetFocus,kasen2		,	
,ImageDef,kasen2,普2,0,0
私達がやっているような\n合意の元で完全憑依を\n実行する以外に\,a,0,0,"Not only is there a consensual Perfect Possession, like what we do,"
,ImageDef,kasen2,決1,0,0
マスターが無自覚のまま\n完全憑依出来る場合もあると\n言うこと\,a,0,0,"But there are cases where Perfect Possession is possible \nwithout the Master's knowledge."
,ClearBalloon,kasen2#吹き出し消去

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#マスターに入れ替わる

#0１２３４５６７８９０１２３４
,SetFocus,reimu	
,ImageDef,reimu,汗1,0,0
そうね\n私が初めて完全憑依されたときも\n無自覚だったわ\,a,0,0,"That's true. \nThe first time I was Perfect Possessed, I had no idea."
,ClearBalloon,reimu#吹き出し消去

#=====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

,SetFocus,kasen2		,	
,ImageDef,kasen2,惑1,0,0
と言うことは悪用すると\n一方的に身体を乗っ取れる\nという事にも繋がるのでは……\,c,0,0,"If that's the case, \nit could be abused to one-sidedly possess someone's body……"
,ClearBalloon,kasen2#吹き出し消去

,Hide,kasen2,-1280,&
,Function,"::battle.team[0].current.Team_Change_Master(null)",		#マスターに入れ替わる

,SetFocus,reimu	
,ImageDef,reimu,惑1,0,0
それは……厄介な予想ねぇ\,a,0,0,"That……would be bad news."
,ClearBalloon,reimu#吹き出し消去

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,mamizou,-1280,&	#対象フェイス表示開始
,SetFocus,mamizou		,#発言中キャラを指定
おや\nお前さんが出てきたと言う事は\,a,0,0,"Oh dear. \nTo see the two of you here means"
,ClearBalloon,mamizou

,Function,"::battle.Show_EnemyName()",#敵ネームを表示

,SetFocus,mamizou		,#発言中キャラを指定
,ImageDef,mamizou,普2,0,0
早速調査を開始したって事かのう\,a,0,0,"you've already started your investigation."
,ClearBalloon,mamizou

,Hide,mamizou,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

#0１２３４５６７８９０１２３４

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,mokou2,-1280,&	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,普2,0,0
もっとこの異変を長く楽しんでも\n良いんじゃないか？\,a,0,0,"Why can't we keep enjoying this incident?"
,ImageDef,mokou2,嬉1,0,0
上手くすれば\n無尽蔵に暴れられるぜ\,a,0,0,"If you use it well, you can do anything you want."
,ClearBalloon,mokou2


#0１２３４５６７８９０１２３４
,SetFocus,reimu	
,ImageDef,reimu,呆1,0,0
さすがの嗅覚ね\,a,0,0,"Perceptive as always."
もう完全憑依を利用している\n奴らが居るとはね\,a,0,0,"I didn't think anyone would already be taking advantage of Perfect Possession."
,ClearBalloon,reimu#吹き出し消去

,Hide,mokou2,-1280,&
,Function,"::battle.team[1].current.Team_Change_Master(null)",		#マスターに入れ替わる

,SetFocus,mamizou		,#発言中キャラを指定
,ImageDef,mamizou,驚1,0,0
#0１２３４５６７８９０１２３４
ま、今更儂らを調べている\nところを見るに\,a,0,0,"Well, seeing you're investigating us now means"
,ImageDef,mamizou,余1,0,0
この異変について\n全く判っていないようじゃがな\,a,0,0,"you still no nothing about this incident."
,ClearBalloon,mamizou

,Hide,mamizou,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,決1,0,0
この異変\nもっと楽しませて貰うぞ！\,b,0,0,"I'm gonna enjoy this incident a bit longer!"
,ClearBalloon,mokou2

,Function,"::battle.team[1].current.Team_Change_Master(null)",		#マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mamizou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mokou2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(311)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

#,Function,"::battle.Battle_Ready()",# 対戦開始命令
,Function,"::battle.Lose()",

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,reimu,負1,0,0
,ImageDef,kasen2,負1,0,0
,ImageDef,mamizou,嬉1,0,0
,ImageDef,mokou2,余1,0,0

,Show,reimu,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,mamizou,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,mamizou
この完全憑依を\n上手く使うには\nコツがいるようじゃな\,a,0,0,"It seems you have some tricks to learn before mastering Perfect Possession."
,ClearBalloon,mamizou

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mamizou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mokou2,-1280,

,Sleep,30

#,Function,"::battle.Continue()",# ゲームオーバー画面へ
,Function,"::battle.Win()",

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#初期表情設定
,ImageDef,reimu,呆1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,mamizou,負1,0,0
,ImageDef,mokou2,負1,0,0

,Show,reimu,-1280	,&#フェイス表示開始
,Show,mamizou,-1280	,#フェイス表示開始
#,Show,mokou2,-1280	,#フェイス表示開始

,SetFocus,mamizou,
,SetFocus,reimu		,
完全憑依異変を\n既にもう悪用している奴が\nいたなんて\,a,0,0,"I can't believe we already have abusers of the Perfect Possession incident ."
,ClearBalloon,reimu

,SetFocus,mamizou
#0１２３４５６７８９０１２３４
何を言っている\nもうみんなに広まっているぞい\,a,0,0,"What are you saying. \nEveryone already knows."
ある手順を踏めば\n簡単に憑依できるとな\,a,0,0,"If follow a certain procedure, Possession is very easy."
,ClearBalloon,mamizou

#=====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

,Show,kasen2,-1280,	#対象フェイス表示開始
,SetFocus,kasen2		,	
ある手順……\nそれは瞑想ね\,a,0,0,"A certain step……. \nYou mean meditation."
,ClearBalloon,kasen2#吹き出し消去

,SetFocus,mamizou
それもそうじゃが……\,a,0,0,"That's one way but……"
マスター側が合意しているか\n油断しているかすれば\,a,0,0,"If either the Master agrees or is distracted,"
瞑想状態に入るだけで\n憑依できるんじゃ\,a,0,0,"one can possess by being in a meditative state."
簡単すぎるじゃろ？\,a,0,0,"Isn't it too easy?"
,ClearBalloon,mamizou

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#全員フェイス撤去
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&
,Hide,mamizou,-1280,&
,Hide,mokou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
