#========================================================================
#	董子：ステージ2　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：魔理沙　ドレミー
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy3,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy3/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,usami,汗1,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,marisa,普1,0,0
,ImageDef,doremy3,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,usami,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,
,SetFocus,usami		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,usami,汗1,0,0
#0１２３４５６７８９０１２３４
おかしい、知っている場所に\n移動出来ない\,a,0,0,"That's strange. \nI can't move to the usual places."
この不気味な世界から\nどうやっても抜け出せないわ\,a,0,0,"I can't seem to escape this creepy world."
,ClearBalloon,usami#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,usami,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,marisa,-1280,&	#対象フェイス表示開始
,SetFocus,marisa		,#発言中キャラを指定
迷っているな\,a,0,0,"You're lost."
,ClearBalloon,marisa

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,嬉1,0,0
ああ、マリサっちー！\,c,0,0,"Oh Marisa!"
,ImageDef,usami,汗1,0,0
助かったわ\nここから抜け出せなくてー\,a,0,0,"I'm saved. \nI can't get out of here-"
,ClearBalloon,usami#対象の吹き出し消去

,Function,"::sound.StopBGM(2000)",# BGM停止 1000=一秒掛けてフェードアウト

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,決1,0,0
#0１２３４５６７８９０１２３４
ふふふ、抜け出せないか\,a,0,0,"Hehehehe, you can't escape?"
,Function,"::sound.PlayBGM(351)",# 指定BGM再生開始
こんな自由の世界なのにな！\,a,0,0,"But it's such a free world!"
,ClearBalloon,marisa#対象の吹き出し消去

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,惑1,0,0
え？\n一体何をー！\,a,0,0,"Huh? \nWhat are you saying!"
,ClearBalloon,usami#対象の吹き出し消去


#全員フェイス撤去
,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy3,-1280,


,Sleep,60

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
,ImageDef,marisa,怒1,0,0
,ImageDef,doremy3,余1,0,0

,Show,usami,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,marisa,-1280	,&#フェイス表示開始
,SetFocus,usami

,SetFocus,marisa
,ImageDef,marisa,怒1,0,0
完全憑依の所為で\n自由になる時間が減っているぜ\,a,0,0,"There's less time to be free because of this Perfect Possession."
,ClearBalloon,marisa

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy3,-1280,

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
,ImageDef,usami,怒1,0,0
,ImageDef,doremy2,余1,0,0
,ImageDef,marisa,余1,0,0
,ImageDef,doremy3,負1,0,0

,Show,usami,-1280	,&#フェイス表示開始
,Show,marisa,-1280	,&#フェイス表示開始
#,Show,doremy2,-1280	,#フェイス表示開始


,SetFocus,marisa
,SetFocus,usami		,
,ImageDef,usami,怒1,0,0
違う！\n貴方はマリサじゃない！\,a,0,0,"No! \nYou're not Marisa!"
,ClearBalloon,usami

,SetFocus,marisa
あっはっは\n私は魔理沙だ。間違いない\,a,0,0,"Ahahaha. \nI'm Marisa. No doubt about it."
,ClearBalloon,marisa

,SetFocus,usami		,
#0１２３４５６７８９０１２３４
,ImageDef,usami,惑1,0,0
さっきのレイムもおかしかったわ\,a,0,0,"The Reimu just now was strange too."
,ImageDef,usami,惑1,0,0
見た目はそのままなのに\n中身だけ入れ替わっているみたい\,a,0,0,"She looks the same, \nbut it's like she was a different person on the inside."
,ImageDef,usami,驚1,0,0
もしかして私が変な世界に\n迷い込んだの？\nパラレルワールドかしら！\,a,0,0,"Maybe I wandered into a strange world? \nA parallel world?"
,ClearBalloon,usami

,SetFocus,marisa
,ImageDef,marisa,嬉1,0,0
勘が良いのか悪いのか\,a,0,0,"I can't tell if you're quick or slow…"
,ImageDef,marisa,余1,0,0
ここは夢の世界だ\nお前は眠っているんだよ\,a,0,0,"This is the Dream World. \nYou're sleeping right now."
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy3,-1280,

,Sleep,60

,End

# -------------------------------------------------------
