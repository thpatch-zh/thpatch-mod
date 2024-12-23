#========================================================================
#	董子：ステージ1　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：霊夢　ドレミー
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
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy3,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,reimu_name,reimu,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,usami,驚1,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,reimu,驚1,0,0
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
,ImageDef,usami,驚1,0,0
おや？\nいつものように居眠りしたのに\nここは一体？\,a,0,0,"Huh? I was just taking a nap as usual. \nWhere am I?"
,ClearBalloon,usami#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,usami,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,reimu,-1280,&	#対象フェイス表示開始
,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,余1,0,0
#0１２３４５６７８９０１２３４
菫子じゃない\n\R[こんな|・・・]ところで会うのは珍しいね\,a,0,0,"Isn't it Sumireko. \nIt's rare to see you here."
,ClearBalloon,reimu

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,嬉1,0,0
あらレイムっち\nあんたがいるって事は\nここは幻想郷なのね\,a,0,0,"Oh, hi Reimu. \nSince you're here, I guess this is the Gensokyo."
,ClearBalloon,usami#吹き出し消去

,Function,"::sound.StopBGM(3000)",# BGM停止 1000=一秒掛けてフェードアウト

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,普2,0,0
幻想郷に見える？\,a,0,0,"Does it look like the Gensokyo?"
,ClearBalloon,reimu

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,惑1,0,0
？\,a,0,0,"?"
,ClearBalloon,usami#吹き出し消去


,Function,"::sound.PlayBGM(314)",# 指定BGM再生開始

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,決1,0,0
#0１２３４５６７８９０１２３４
あんたは\R[現|うつつ]の菫子なのよ\nここに居るべき人間じゃあないわ\,a,0,0,"You're the real Sumireko. \nYou're someone who shouldn't be here."
目を覚ませよ！\,b,0,0,"Wake up!"
,ClearBalloon,reimu


#全員フェイス撤去
,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,reimu,呆1,0,0
,ImageDef,doremy3,余1,0,0

,Show,usami,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,reimu,-1280	,&#フェイス表示開始

,SetFocus,usami
,SetFocus,reimu
,ImageDef,reimu,呆1,0,0
ここには外の世界も幻想郷も無い\,a,0,0,"There's no Outside World or Gensokyo here."
,ClearBalloon,reimu

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,usami,1,0,0
,ImageDef,doremy2,余1,0,0
,ImageDef,reimu,余1,0,0
,ImageDef,doremy3,負1,0,0


,Show,reimu,-1280	,&#フェイス表示開始
,Show,usami,-1280	,&#フェイス表示開始
,SetFocus,usami		,
,SetFocus,reimu
あはは、あんた迷子に\nなったみたいね\,a,0,0,"Hahaha, It looks like you're lost."
,ClearBalloon,reimu

,SetFocus,usami		,
,ImageDef,usami,惑1,0,0
なんか変なレイムね\n今日は香霖堂に\n行きたいんだけどー\,a,0,0,"What a weird Reimu. \nI want to go to the Kourindou today-"
,ClearBalloon,usami

,SetFocus,reimu
,ImageDef,reimu,普1,0,0
ここから抜け出すには\nもう一人の菫子を探す事ね\,a,0,0,"To escape from here, you'll have to find the other Sumireko."
,ClearBalloon,reimu

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy3,-1280,

,Sleep,60

,End

# -------------------------------------------------------
