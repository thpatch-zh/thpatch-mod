#========================================================================
#	魔理沙：ステージ1　試作　
#	場所：
#　 スレイブ：こいし　敵チーム：一輪　　布都
#	ステージタイトル
#	   「楽しい完全憑依戦」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#名前,ソースファイル名
,DefineObject,marisa,marisa,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#名前,ソースファイル名
,DefineObject,koishi2,koishi,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可


#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(405)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,普2,0,0
,ImageDef,koishi2,驚1,0,0
,ImageDef,ichirin,普2,0,0
,ImageDef,futo2,決1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,marisa,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,marisa		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,marisa,普2,0,0
おーいいるかー？\n一戦しようぜー！\,a,0,0,"Hey, You there? \nLet's fight!"
,ClearBalloon,marisa#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,marisa,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,ichirin,-1280,&	#対象フェイス表示開始
,SetFocus,ichirin		,#発言中キャラを指定
,ImageDef,ichirin,嬉1,0,0
ふっふっふ、いいよー\,a,0,0,"Hehehe, sure thing!"
,ClearBalloon,ichirin

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,嬉1,0,0
ふっふっふ\n少し反則かも知れないが\n面白い力を手に入れたんだ\,a,0,0,"Hehehe, \nI might be breaking the rules \nbut I've got an interesting new power."
,ImageDef,marisa,余1,0,0
慣れるまであんた相手に\n試させて貰うぜ\,a,0,0,"Until I get used to it, let me try it out on you!"
,ClearBalloon,marisa

,SetFocus,ichirin		,#発言中キャラを指定
,ImageDef,ichirin,驚1,0,0
あら奇遇ね\n私も新しい力を\n試したかったところなの\,a,0,0,"Oh, what a coincidence. \nI wanted to test a new power too."
,ClearBalloon,ichirin

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,汗1,0,0
……というと？\,c,0,0,"…… what do you mean?"
,ClearBalloon,marisa

,Hide,ichirin,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,futo2,-1280,	#対象フェイス表示開始
,SetFocus,futo2,	#発言中キャラを指定
,ImageDef,futo2,余1,0,0
少し反則かもしれんがね……\,a,0,0,"It may be violating the rules……"
,ImageDef,futo2,決1,0,0
二人がかりで行かせて貰うよ\,a,0,0,"But we shall be fighting together."
,ClearBalloon,futo2

,Hide,marisa,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,驚1,0,0
あー、なんだー\n貴方達も完全憑依してるのかー\,a,0,0,"Boo, you guys are using Perfect Possession too?"
,ImageDef,koishi2,惑1,0,0
二対一で一方的に\nボコりたかったのになー！\,a,0,0,"I really wanted to beat you up two against one."
,ClearBalloon,koishi2

,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる
,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(303)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,負1,0,0
,ImageDef,koishi2,負1,0,0
,ImageDef,ichirin,惑1,0,0
,ImageDef,futo2,余1,0,0

,Show,marisa,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,koishi2,-1280	,&
,Show,ichirin,-1280	,&#フェイス表示開始
#Show,futo2,-1280	,

,SetFocus,marisa		,
,SetFocus,ichirin
,ImageDef,ichirin,惑1,0,0
二人の心がバラバラじゃん\n何でそのコンビなの？\,a,0,0,"Your minds are disconnected. \nWhy did you team up?"
,ClearBalloon,ichirin

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,

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
,ImageDef,marisa,嬉1,0,0
,ImageDef,koishi2,余1,0,0
,ImageDef,ichirin,負1,0,0
,ImageDef,futo2,負1,0,0

#,Show,marisa,-1280	,&#フェイス表示開始
#,Show,futo2,-1280	,&#フェイス表示開始
,Show,ichirin,-1280	,#フェイス表示開始
,Show,marisa,-1280	,
,SetFocus,marisa		,

,SetFocus,ichirin		,#発言中キャラを指定
あららららー\n負けちゃった\,a,0,0,"Oh my, we lost."
,ClearBalloon,ichirin

,SetFocus,marisa		,
,ImageDef,marisa,嬉1,0,0
まだコンビ戦に慣れないけど\n何とか勝てたな\,a,0,0,"I'm still not used to fighting with someone but we managed."
,ImageDef,marisa,汗1,0,0
しかし、お前達も完全憑依を\n使うとはなぁ\,a,0,0,"But, I didn't think you two would be using Perfect Possession too."
,ClearBalloon,marisa

,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,futo2,-1280	,&#フェイス表示開始
,SetFocus,futo2,	#発言中キャラを指定
,ImageDef,futo2,負1,0,0
よーし\n今度はうちがマスターだぞ\,a,0,0,"All right, this time I shall be Master."
,ClearBalloon,futo2

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,Show,ichirin,-1280	,#フェイス表示開始
,SetFocus,ichirin
,ImageDef,ichirin,負1,0,0
えー、まぁしょうがないなぁ\n約束だからね\,a,0,0,"What? Well nothing I can do. \nIt was a promise."
,ClearBalloon,ichirin

,SetFocus,marisa		,
,ImageDef,marisa,驚1,0,0
へえ、そんなに簡単に\nマスターを切り替えたり\n出来るのか\,a,0,0,"Huh, you can switch the Master that easily?"
,ClearBalloon,marisa#吹き出し消去

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
