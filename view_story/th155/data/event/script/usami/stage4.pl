#========================================================================
#	董子：ステージ4　試作
#	場所：
#   スレイブ：ドレミー　敵チーム：紫
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"#名前,ソースファイル名
,DefineObject,usami,usami,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#名前,ソースファイル名
,DefineObject,doremy2,doremy,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,usami,普1,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,yukari,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,usami,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,usami		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,usami,汗1,0,0
あいたたた\n誰かに掴まれたような\,c,0,0,"Ow ow ow. \nI feel like someone grabbed me."
,ClearBalloon,usami#対象の吹き出し消去

# =====
,Hide,usami,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,驚1,0,0
ここは、現の世界ね\n強制的に夢の中から\n引っ張り出されたようね\,a,0,0,"This is the Real World. \nIt looks like you were pulled out of the dream by force."
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,驚1,0,0
え？　いつもの幻想郷？\nやったあ\,a,0,0,"Huh? The usual Gensokyo? \nYay."
,ClearBalloon,usami#吹き出し消去

,Hide,usami,-1280,
,Hide,doremy2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,yukari,-1280,&	#対象フェイス表示開始
,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普2,0,0
こんにちは\,a,0,0,"Hello."
,ClearBalloon,yukari

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,普1,0,0
こんばんは\n貴方は？\,a,0,0,"Good evening, and you are...?"
,ClearBalloon,usami#吹き出し消去

,Function,"::battle.Show_EnemyName()",
,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
私は八雲紫\n貴方に救いの手を\n差しのばしに来ました\,a,0,0,"I'm Yukari Yakumo. \nI came to lend you a hand."
,ClearBalloon,yukari

,SetFocus,usami,	#発言中キャラを指定
,ImageDef,usami,嬉1,0,0
不思議の世界から\n連れ出してくれたのね\n助かったわー、ありがとねー\,a,0,0,"You took me out of a strange world. \nThank you for saving me."
,ClearBalloon,usami

,Hide,usami,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,doremy2,	#発言中キャラを指定
,ImageDef,doremy2,怒1,0,0
#0１２３４５６７８９０１２３４
困ります\n夢の世界に無断で干渉するなんて\nルール違反です\,a,0,0,"That's a problem. \nInterfering without permission in the Dream World is against the rules.
,ClearBalloon,doremy2

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,怒1,0,0
あら、夢の住人が幻想郷で暴れる\nのはルール違反じゃなくて？\,a,0,0,"Oh so out of control dream dwellers isn't against the rules?"
,ImageDef,yukari,余1,0,0
夢の世界の菫子が\nこちらで大暴れしていたのにねぇ\,a,0,0,"The Dream World Sumireko was creating a big mess over here."
,ClearBalloon,yukari

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,余1,0,0
私は、この暴れん坊を\n外の世界に送り返す為に\n夢の世界から連れ出したのよ\,a,0,0,"I brought this naughty one out of the Dream World \nto send back to the Outside World."
,ClearBalloon,yukari

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,汗1,0,0
ええ？　外の世界に？\n折角幻想郷に戻って来たのにー\,a,0,0,"What?? To the Outside World? \nBut I finally got back to the Gensokyo."
,ClearBalloon,usami#吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 指定BGM再生開始

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,決1,0,0
問答無用！\nさっさと消えよ！\,b,0,0,"No arguing! \nQuickly get lost!"
,ClearBalloon,yukari


#全員フェイス撤去
,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,usami,負1,0,0
,ImageDef,doremy2,負1,0,0
,ImageDef,yukari,普1,0,0

,Show,usami,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,yukari,-1280	,&#フェイス表示開始
,SetFocus,usami

,SetFocus,yukari
夢の世界の菫子なら\n外の世界に送り返したわ\,a,0,0,"I sent the Dream World Sumireko back to the Outside World."
,ClearBalloon,yukari

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"if(::battle.team[0].current == ::battle.team[0].master )::battle.team[0].current.Team_Change_Slave(null)",

#初期表情設定
,ImageDef,usami,嬉1,0,0
,ImageDef,doremy2,余1,0,0
,ImageDef,yukari,普1,0,0

,Show,usami,-1280	,&#フェイス表示開始
,Show,yukari,-1280	,&#フェイス表示開始
#,Show,koishi,-1280	,#フェイス表示開始

# =====
,Hide,usami,-1280, &

,SetFocus,yukari
,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,怒1,0,0
#0１２３４５６７８９０１２３４
どのような理由であれ\n夢の世界に干渉されるのは\n困ります\,a,0,0,"Whatever the reason, interfering with the Dream World is a problem."
,ImageDef,doremy2,普1,0,0
夢の菫子の暴走も\n大元は現の住人が原因です\,a,0,0,"The main reason Dream Sumireko \nwas out of control is because of the Real Sumireko."
,ImageDef,doremy2,怒1,0,0
そっちを処理するのが\n先じゃないですか\,a,0,0,"Shouldn't we take care of that first?"
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,驚1,0,0
え？それは\nどういう意味です？\,a,0,0,"Hm? \nWhat do you mean by that?"
,ClearBalloon,yukari

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,惑1,0,0
夢の住人の暴走は\n完全憑依異変が原因なのです\,a,0,0,"The recklessness of the dream dwellers \nis because of the Perfect Possession incident."
#0１２３４５６７８９０１２３４
,ImageDef,doremy2,普2,0,0
それを解決しない限り\n夢の世界は現の世界に\n影響を及ぼし続けるでしょう\,a,0,0,"Unless we resolve that, the Dream World will continue to affect the Real World."
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,惑1,0,0
その話詳しく教えて下さい\,a,0,0,"Please explain to me in detail."
,ClearBalloon,yukari

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,敵1,0,0
#0１２３４５６７８９０１２３４
完全憑依している間\nマスターの夢を追いだして\nスレイブが夢の世界に留まります\,a,0,0,"While using Perfect Possession, \nthe master's dream is pushed out and the slave is stuck in the Dream World."
追い出された夢の住人が\n現の世界で暴走するのです\,a,0,0,"And the dream dweller forced out will run wild in the Real World."
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,普2,0,0
#0１２３４５６７８９０１２３４
完全憑依にそんな副作用が……\n大変勉強になりました\,c,0,0,"Perfect Possession has such side effects……\nThat was very helpful."
,ClearBalloon,yukari

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,汗1,0,0
しかし\R[菫子|このこ]の状況は\n殊更に複雑な様です\,a,0,0,"But Sumireko's (this girl's) situation, is especially complicated."
,ImageDef,doremy2,惑1,0,0
完全憑依異変だけでなく\nある都市伝説も影響して\nいるようです\,a,0,0,"Not only the Perfect Possession Incident \nbut a certain Urban Legend incident is involved too."
,ImageDef,doremy2,決1,0,0
丁度良いです\n夢の世界の菫子は\n何処にいるか判りますか？\,a,0,0,"Actually this is good. \nDo you know where the Dream World Sumireko is?"
,ClearBalloon,doremy2

,SetFocus,yukari
,ImageDef,yukari,嬉1,0,0
それなら……\,a,0,0,"Oh, she's……"
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,60

,End
