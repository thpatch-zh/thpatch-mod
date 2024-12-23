#========================================================================
#	にとり：ステージ2　試作　
#	場所：
#　 スレイブ：こころ　敵チーム：一輪　　　魔理沙
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
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa2,marisa,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(403)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,ichirin,普1,0,0
,ImageDef,marisa2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
#,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,ichirin,-1280,	#対象フェイス表示開始
,SetFocus,ichirin		,#発言中キャラを指定
,ImageDef,ichirin,嬉1,0,0
完全憑依戦の練習ね\n望むところよ！\,a,0,0,"A Perfect Possession practice battle. \nJust what I was hoping for!"
,ClearBalloon,ichirin

,Show,nitori,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,普2,0,0
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
みんなノリが良くて助かるぜ\,a,0,0,"Everyone's so helpful."
,ClearBalloon,nitori#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,ichirin,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,marisa2,-1280,	#対象フェイス表示開始
,SetFocus,marisa2,	#発言中キャラを指定
,ImageDef,marisa2,惑1,0,0
こいつは、人工完全憑依を\n研究しているような外道だぜ\n気を付けた方が良い\,a,0,0,"This one's a demon researching artificial Perfect Possession. \nBe careful."
,ClearBalloon,marisa2

,Hide,marisa2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,ichirin		,#発言中キャラを指定
,ImageDef,ichirin,驚1,0,0
人工？\n河童なのに？\,a,0,0,"Artificial? \nEven though she's a kappa?"
,ClearBalloon,ichirin

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,余1,0,0
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
そうだ\,a,0,0,"Yup."
間もなくテクノロジーが\n解明するはずだ\nお前達もサンプルの一つとなれ！\,a,0,0,"The technology should determine something soon. \nI'll use you two as samples too!"
,ClearBalloon,nitori#対象の吹き出し消去


,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,marisa2,-1280,

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
,ImageDef,nitori,負1,0,0
,ImageDef,kokoro2,負1,0,0
,ImageDef,ichirin,嬉1,0,0
,ImageDef,marisa2,余1,0,0

,Show,nitori,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,kokoro2,-1280	,&
,Show,ichirin,-1280	,&#フェイス表示開始

,SetFocus,nitori
,SetFocus,ichirin
聖様の為にも練習しないとね\,a,0,0,"We must practice for Lady Hijiri too."
,ClearBalloon,ichirin

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,marisa2,-1280,

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
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,ichirin,負1,0,0
,ImageDef,marisa2,負1,0,0

#敵スレイブから会話が開始するため仮挿入
,Sleep,35
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,marisa2,-1280	,#フェイス表示開始

,SetFocus,marisa2,	#発言中キャラを指定
#0１２３４５６７８９０１２３４
うーん上手くいかないぜ\,a,0,0,"Hmm.. It's not going well."
一輪と組んだら\n入道と合わせて三人になる\,a,0,0,"Working with Ichirin, we become three with the Nyudou."
そのイレギュラーが何か突破口に\nなるかも知れないのに\n勝てないんじゃあ話にならない\,a,0,0,"I thought that irregularity might be some kind of breakthrough, \nbut if we can't even win, there's no point.
,ClearBalloon,marisa2

,Hide,marisa2,-1280	,#フェイス表示開始
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# スレイブに入れ替わる

,Show,ichirin,-1280	,#フェイス表示開始
,SetFocus,ichirin
#0１２３４５６７８９０１２３４
もしかして\n最凶の二人の話をしている？\,a,0,0,"Are you talking about the cursed duo?
私も、その攻略の為に\n努力しているのよ\,a,0,0,"I'm making an effort to capture them too."
,ClearBalloon,ichirin

,Hide,ichirin,-1280	,#フェイス表示開始
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# マスターに入れ替わる

,Show,marisa2,-1280	,#フェイス表示開始
,SetFocus,marisa2,	#発言中キャラを指定
なんだと、お前もか\n情報を共有したいぜ\,a,0,0,"What? You too? \nThen let's share information."
,ClearBalloon,marisa2

,Show,nitori,-1280	,&#フェイス表示開始
,Show,nitori,-1280	,&#フェイス表示開始
,SetFocus,nitori,	#発言中キャラを指定
,ImageDef,nitori,惑1,0,0
どうだ？\,a,0,0,"How was it?"
,ClearBalloon,nitori#吹き出し消去

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2,	#発言中キャラを指定
,ImageDef,kokoro2,普1,0,0
勝負に負けたことで\n逆に連帯感が生まれています\,a,0,0,"By losing, they seemed to have formed a sense of solidarity."
,ClearBalloon,kokoro2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,marisa2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
