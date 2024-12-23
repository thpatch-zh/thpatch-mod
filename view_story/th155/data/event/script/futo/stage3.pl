#========================================================================
#	布都：ステージ3　試作　
#	場所：
#　 スレイブ：一輪　敵チーム：ドレミー　菫子
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#名前,ソースファイル名
,DefineObject,futo,futo,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#名前,ソースファイル名
,DefineObject,ichirin2,ichirin,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy,doremy,2p,1040,0,true

#2Pslave
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami2,usami,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,doremy_name,doremy,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/usami/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,futo,怒1,0,0
,ImageDef,ichirin2,驚1,0,0
,ImageDef,doremy,驚1,0,0
,ImageDef,usami2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,futo,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,futo		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,futo,怒1,0,0
ふむ、けったいな場所だな\,a,0,0,"Hmm, a strange place this is." 
,ClearBalloon,futo#対象の吹き出し消去

# =====
,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Show,ichirin2,-1280,	#対象フェイス表示開始
,SetFocus,ichirin2		,#発言中キャラを指定
,ImageDef,ichirin2,驚1,0,0
強制完全憑依は成功した\nみたいだけど……\,a,0,0,"It seems like forced Perfect Possession succeeded but……."
,ImageDef,ichirin2,惑1,0,0
あんた、ここは何処なのよ\,a,0,0,"Futo, where is this place?"
,ClearBalloon,ichirin2

# =====
,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# スレイブに入れ替わる

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,惑1,0,0
全く判らん\n気が付いたらこんなところに\,c,0,0,"I do not know. \nWhen I came to, I was here."
,ClearBalloon,futo#吹き出し消去

,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,doremy,-1280,&	#対象フェイス表示開始
,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,驚1,0,0
これは驚いた\,a,0,0,"This is surprising."
,ImageDef,doremy,普1,0,0
夢の世界にいる人に\n完全憑依が成立したのね\,a,0,0,"It seems Perfect Possession is achievable on those in the Dream World."
,ClearBalloon,doremy

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,驚1,0,0
夢の世界、だと？\,a,0,0,"The Dream World you say?"
,ClearBalloon,futo#吹き出し消去

,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,普2,0,0
#0１２３４５６７８９０１２３４
通常、夢の世界にいる人間に\n完全憑依することは出来ない\,a,0,0,"Usually, Perfect Possession is not possible on humans in the Dream World."
,ImageDef,doremy,余1,0,0
だけど貴方達は\nマスターが同意する形で\n完全憑依した\,a,0,0,"But the two of you were able to use Perfect Possession with the Master's consent."
,ImageDef,doremy,驚1,0,0
マスターが寝ぼけながら\n完全憑依に同意したという\n極めて珍しいケースだわ\,a,0,0,"The Master agreeing to Perfect Possession while half asleep is a very rare case."
,ClearBalloon,doremy

# =====
,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,ichirin2		,#発言中キャラを指定
,ImageDef,ichirin2,汗1,0,0
ってことは、あんた寝てたの？\,a,0,0,"So you were asleep?"
,ClearBalloon,ichirin2

# =====
,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# スレイブに入れ替わる

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,汗1,0,0
え、いや\nどうだったかな\,a,0,0,"Hm, I wonder."
,ImageDef,futo,怒1,0,0
それより、調査続けるぞ\nほら、目の前のこいつ\n完全憑依している\,a,0,0,"More importantly, let us continue investigating. \nLook, this fellow in front of us is under perfect possession."
,ImageDef,futo,決1,0,0
完全憑依戦の実戦調査だ\,a,0,0,"This will be a battle investigation of Perfect Possession."
,ClearBalloon,futo#吹き出し消去

,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,嬉1,0,0
戦うのですね\,a,0,0,"So you would like to fight."
,ImageDef,doremy,普2,0,0
#0１２３４５６７８９０１２３４
但し、私は完全憑依している\nわけではありません\,a,0,0,"But it doesn't mean I'm under Perfect Possession."
,ImageDef,doremy,決1,0,0
彷徨える夢魂を保護していたに\n過ぎないのですが\nそれでも良ければ\,c,0,0,"I was only protecting a wandering dream soul. \nBut if that's okay with you..."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(316)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,futo,負1,0,0
,ImageDef,ichirin2,負1,0,0
,ImageDef,doremy,余1,0,0
,ImageDef,usami2,余1,0,0

,Show,futo,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,doremy,-1280	,&#フェイス表示開始

,SetFocus,futo
,SetFocus,doremy
,ImageDef,doremy,余1,0,0
夢の中での敗北は\nリベンジ出来ない屈辱でしょう\,a,0,0,"It must be embarrassing you can't get revenge after losing in a dream."
,ClearBalloon,doremy

,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&
,Hide,doremy,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",	


#初期表情設定
,ImageDef,futo,嬉1,0,0
,ImageDef,ichirin2,余1,0,0
,ImageDef,doremy,普1,0,0
,ImageDef,usami2,負1,0,0

,Show,futo,-1280	,&#フェイス表示開始
,Show,doremy,-1280	,&#フェイス表示開始
#,Show,usami,-1280	,#フェイス表示開始

,SetFocus,doremy
,SetFocus,futo		,	#発言キャラを指定
#0１２３４５６７８９０１２３４
勝った！\,a,0,0,"Victory!"
,ImageDef,futo,惑1,0,0
しかし、見た事のない\n不思議な攻撃ばかりだな\nお主は何者だ？\,a,0,0,"Although there were many mysterious attacks I've never seen. \nWho are you?
,ClearBalloon,futo#吹き出し消去

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,SetFocus,doremy
,ImageDef,doremy,敵1,0,0
私はドレミー・スイート\n夢の支配者です\,a,0,0,"I am Doremy Sweet, ruler of the Dream World."
,ClearBalloon,doremy

,SetFocus,doremy
,ImageDef,doremy,普1,0,0
完全憑依とは\n夢の世界の自分を乗っ取る事で\n行われます\,a,0,0,"Perfect possession occurs by taking over your dream self."
,ImageDef,doremy,怒1,0,0
#0１２３４５６７８９０１２３４
夢の国を奪う悪魔の所業\nと言う事を覚えておいて下さい\,a,0,0,"Please remember stealing the Dream World is the deed of the devil.
,ClearBalloon,doremy

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,惑1,0,0
どういうことじゃ？\,a,0,0,"What do you mean?
,ClearBalloon,futo#吹き出し消去

,SetFocus,doremy
,ImageDef,doremy,驚1,0,0
#0１２３４５６７８９０１２３４
完全憑依されていると\n夢を見られなくなります\,a,0,0,"During Perfect Possession, you will not be able to see dreams."
,ImageDef,doremy,惑1,0,0
その間の夢は、一体何処へ消えて\nしまうのでしょう\,a,0,0,"The dreams during that time, just where do they disappear...?"
,ClearBalloon,doremy

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,汗1,0,0
む、何を言っているのか判らない\,c,0,0,"Hm, I do not understand."
意識が飛ぶ……\,c,0,0,"Starting to lose consciousness…"
,ClearBalloon,futo#吹き出し消去

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.StageOut_SlideUpper()"#自チームが画面上へジャンプ離脱

,SetFocus,doremy
,ImageDef,doremy,普1,0,0
#0１２３４５６７８９０１２３４
マスターが目を覚ましたようね\,a,0,0,"The Master seems to have awoken."
,ImageDef,doremy,怒1,0,0
このままでは\n肉体から追い出された夢の世界の\n者達が暴走してしまう\,a,0,0,"If this continues, \nthose in the Dream World who were driven out of their body, will lose control."
,ImageDef,doremy,普2,0,0
恐ろしいことが始まる前に\n完全憑依異変を解決して\nほしいものね\,a,0,0,"Before something horrible happens, \nI hope the Perfect Possession incident is resolved."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy,-1280,

,Sleep,60

,End

# -------------------------------------------------------
