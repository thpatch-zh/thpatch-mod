#========================================================================
#	マミゾウ：ステージ2　試作　
#	場所：
#　 スレイブ：妹紅　敵チーム：白蓮　　　一輪
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face.pat"#名前,ソースファイル名
,DefineObject,mamizou,mamizou,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"#名前,ソースファイル名
,DefineObject,mokou2,mokou,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(403)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
,ImageDef,mokou2,普1,0,0
,ImageDef,hijiri,普1,0,0
,ImageDef,ichirin2,普2,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,hijiri,-1280,&	#対象フェイス表示開始
,SetFocus,hijiri		,#発言中キャラを指定
良いでしょう\n練習試合ですね\,a,0,0,"A practice match? \nWhy not."
,ClearBalloon,hijiri

,Show,mamizou,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,mamizou		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
#0１２３４５６７８９０１２３４
,ImageDef,mamizou,普2,0,0
みんな理解があるねぇ\,a,0,0,"Everyone's so understanding."
,ImageDef,mamizou,惑1,0,0
じゃが、こっちだけ\n二人じゃあ不平等だから\nそっちも完全憑依をするといい\,a,0,0,"But it's unfair if there's two of us.\nYou should also use Perfect Possession."
,ImageDef,mamizou,嬉1,0,0
やり方を教えてやろうか？\,a,0,0,"Should I teach you?"
,ClearBalloon,mamizou#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,ichirin2,-1280,&	#対象フェイス表示開始
,SetFocus,ichirin2,	#発言中キャラを指定
,ImageDef,ichirin2,普2,0,0
必要ないわ\nやり方なら熟知しているよ\,a,0,0,"No need.\nI'm well aware of the method."
,ImageDef,ichirin2,普1,0,0
マスターの同意があれば\n問題なく出来る\,a,0,0,"If the master is in agreement, there is no problem."
,ImageDef,ichirin2,余1,0,0
マスターが油断しているなら\n同意も無く強制的に憑依出来る\,a,0,0,"If the master isn't paying attention,\nforced Perfect Possession is possible without consent."
,ClearBalloon,ichirin2

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,惑1,0,0
ほう、もう完全憑依しているのか\nそれに儂より詳しいねぇ\,a,0,0,"Ah, so you're already practicing Perfect Possession too.\nAnd more familiar than me."
,ClearBalloon,mamizou#吹き出し消去

,Hide,ichirin2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,決1,0,0
研究しているのは\n貴方だけでは無いのです\nいざ、勝負！\,a,0,0,"You aren't the only one researching.\nNow, let's fight!"
,ClearBalloon,hijiri

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(304)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,mamizou,負1,0,0
,ImageDef,mokou2,負1,0,0
,ImageDef,hijiri,嬉1,0,0
,ImageDef,ichirin2,余1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,mokou2,-1280	,&
,Show,hijiri,-1280	,&#フェイス表示開始

,SetFocus,mamizou
,SetFocus,hijiri
そんな即席コンビに\n負ける気がしません\,a,0,0,"I didn't think I would lose to an improvised duo like you."

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

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
,ImageDef,mamizou,嬉1,0,0
,ImageDef,mokou2,嬉1,0,0
,ImageDef,hijiri,負1,0,0
,ImageDef,ichirin2,負1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始
,Show,hijiri,-1280	,&#フェイス表示開始
#,Show,ichirin2,-1280	,#フェイス表示開始

,SetFocus,hijiri		,#発言中キャラを指定

,SetFocus,mamizou		,
だいぶ馴染んできたねぇ\,a,0,0,"I'm getting used to this."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280,&	#対象フェイス表示開始
,SetFocus,mokou2,	#発言中キャラを指定
良い憑依感だ\,a,0,0,"It was a good possession."
#0１２３４５６７８９０１２３４
,ImageDef,mokou2,決1,0,0
やっぱりお前\nただの狸じゃないな\,a,0,0,"You're no simple Tanuki after all, are you?"
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,
,ImageDef,mamizou,余1,0,0
#0１２３４５６７８９０１２３４
何を言う\nお主のパワーと捨て身感が\n勝利を呼んでいるのじゃ\,a,0,0,"What do you mean?\nYour power and desperation brought us victory."
,ClearBalloon,mamizou

,Show,hijiri,-1280,&	#対象フェイス表示開始
,SetFocus,hijiri		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
随分使いこなしてるのですね\,a,0,0,"You've mastered it quite a bit."
私も負けていられないわ\nもっと強い人と組まないと\nいけないわね！\,b,0,0,"I can't lose either.\nI need to work with someone stronger!"
,ClearBalloon,hijiri

,Hide,hijiri,-1280, &
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,ichirin2,-1280,&	#対象フェイス表示開始
,SetFocus,ichirin2,	#発言中キャラを指定
,ImageDef,ichirin2,負1,0,0
えっ？\,c,0,0,"What?"
,ClearBalloon,ichirin2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
