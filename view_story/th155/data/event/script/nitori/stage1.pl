#========================================================================
#	にとり：ステージ1　試作　
#	場所：
#　 スレイブ：こころ　敵チーム：布都　　　霊夢
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"#名前,ソースファイル名
,DefineObject,nitori,nitori,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"#名前,ソースファイル名
,DefineObject,kokoro2,kokoro,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo,futo,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,futo_name,futo,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/futo/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,futo,普1,0,0
,ImageDef,reimu2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
#,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,futo,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,futo		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
良いぞ。準備は万端じゃ\,a,0,0,"All is well. \nI am ready."
,ClearBalloon,futo#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,futo,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,reimu2,-1280,	#対象フェイス表示開始
,SetFocus,reimu2,	#発言中キャラを指定
,ImageDef,reimu2,余1,0,0
なんだ、河童が相手かー\n大して練習にもならないわ\,a,0,0,"Oh, so our opponent is the kappa- \nThis won't be much of a practice."
,ClearBalloon,reimu2

,Show,nitori,-1280,	#対象フェイス表示開始
,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,敵1,0,0
ほほう、珍しい組み合わせだな\nまあ良い、行くぞ！\,a,0,0,"What an interesting team. \nWhatever, let's fight!"
,ClearBalloon,nitori

,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,futo,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(305)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,nitori,負1,0,0
,ImageDef,kokoro2,負1,0,0
,ImageDef,futo,嬉1,0,0
,ImageDef,reimu2,余1,0,0

,Show,nitori,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,kokoro2,-1280	,
,Show,futo,-1280	,&#フェイス表示開始

,SetFocus,nitori
,SetFocus,futo
さて、完全憑依の調査を続けるぞ\,a,0,0,"Now, let's continue the Perfect Possession investigation."
,ClearBalloon,futo

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,futo,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
,ImageDef,nitori,嬉1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,futo,負1,0,0
,ImageDef,reimu2,負1,0,0

,Show,nitori,-1280	,&#フェイス表示開始
,Show,futo,-1280	,&#フェイス表示開始
#,Show,reimu2,-1280	,#フェイス表示開始


,SetFocus,futo		,
,SetFocus,nitori		,
よーし\n良いサンプルが手に入った\,a,0,0,"All right, I got a good sample."
,ClearBalloon,nitori

,SetFocus,futo		,
#0１２３４５６７８９０１２３４
悔しい\n別のスレイブで再挑戦したいぞ\,a,0,0,"How frustrating. \nI would like to challenge with a different slave."
,ClearBalloon,futo

,Hide,futo,-1280	,&#フェイス表示開始
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,reimu2,-1280	,&#フェイス表示開始
,SetFocus,reimu2		,
やっぱり、スレイブは苦手だなぁ\nもっと色んな相手で練習しないと\,a,0,0,"Like I thought, I'm not good at being a slave. \nI need to practice with other people."
,ClearBalloon,reimu2

,SetFocus,nitori		,
,ImageDef,nitori,惑1,0,0
どうだ？\n何か判ったか？\,a,0,0,"How was it? \nDid you find out anything?"
,ClearBalloon,nitori

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,普1,0,0
判ります\n二人は悔しいという感情が\nシンクロしています\,a,0,0,"I did. \nTheir emotions of frustration are synchronized."
,ClearBalloon,kokoro2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,futo,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
