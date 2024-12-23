#========================================================================
#	マミゾウ：ステージ1　試作　
#	場所：
#　 スレイブ：妹紅　敵チーム：魔理沙　　霊夢
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(404)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
,ImageDef,mokou2,普1,0,0
,ImageDef,marisa,普1,0,0
,ImageDef,reimu2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

#,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
#,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,marisa,-1280,&	#対象フェイス表示開始
,SetFocus,marisa		,#発言中キャラを指定
なんか用か？\,a,0,0,"What do you want?"
,ClearBalloon,marisa

,Show,mamizou,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,mamizou		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
完全憑依戦の\n練習相手になってくれんかの\,a,0,0,"Will you be my practicing partner for Perfect Possession?"
,ClearBalloon,mamizou#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

#0１２３４５６７８９０１２３４

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,驚1,0,0
最近それが多いな\nみんな強さを追求するのに\n余念が無いのな\,a,0,0,"I hear that a lot lately.\nEveryone's devoted to becoming stronger."
,ImageDef,marisa,余1,0,0
まあ、構わんよ\,a,0,0,"Well, I don't mind."
,ClearBalloon,marisa

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,嬉1,0,0
いやあ、理解があって助かるよ\nそれでは早速\,a,0,0,"Thanks for understanding.\nNow let's begin."
,ClearBalloon,mamizou#吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(302)",# 指定BGM再生開始

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
,ImageDef,marisa,決1,0,0
,ImageDef,reimu2,余1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,mokou2,-1280	,&
,Show,marisa,-1280	,&#フェイス表示開始

,SetFocus,mamizou
,SetFocus,marisa
だいぶ慣れてきたぜ\n最強の完全憑依使いは私だな\,a,0,0,"I'm getting good at this.\nIt looks like I'm the strongest user of Perfect Posession."
,ClearBalloon,marisa

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,mamizou,嬉1,0,0
,ImageDef,mokou2,嬉1,0,0
,ImageDef,marisa,負1,0,0
,ImageDef,reimu2,負1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始
,Show,marisa,-1280	,&#フェイス表示開始
,Show,reimu,-1280	,#フェイス表示開始

,SetFocus,marisa		,&#発言中キャラを指定
,SetFocus,mamizou		,
練習相手、ありがとさん\,a,0,0,"Thank you practicing partner."
,ClearBalloon,mamizou

,SetFocus,marisa		,#発言中キャラを指定
あいててて……\nそんなに練習して\nどうするつもりだ？\,a,0,0,"oww…… \nWhat are you planning to do practicing that much?"
,ClearBalloon,marisa


,SetFocus,mamizou		,
,ImageDef,mamizou,余1,0,0
何事を成すにも\n強くある必要があるじゃろ\,a,0,0,"To achieve anything, strength is necessary."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280,&	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,嬉1,0,0
新しい刺激が欲しいからさ\,a,0,0,"And I want to feel something new."
,ClearBalloon,mokou2

,SetFocus,marisa		,#発言中キャラを指定
二人の意見が\n異なっているようだが\n大丈夫なのか\,a,0,0,"Your opinions are different. \nAre you going to be ok?"
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
