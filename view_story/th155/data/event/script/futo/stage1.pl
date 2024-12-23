#========================================================================
#	布都：ステージ1　試作　
#	場所：
#　 スレイブ：一輪　敵チーム：針妙丸　　こいし
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
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru,sinmyoumaru,2p,1040,0,true

#2Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi2,koishi,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,sinmyoumaru_name,sinmyoumaru,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/koishi/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(401)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
,ImageDef,ichirin2,普1,0,0
,ImageDef,sinmyoumaru,普1,0,0
,ImageDef,koishi2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,futo,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,futo		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
やあやあ、完全憑依戦で勝負せい\,a,0,0,"Well well, properly fight in a Perfect Possession Battle."
,ClearBalloon,futo#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,futo,-1280,

,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,sinmyoumaru,-1280,&	#対象フェイス表示開始
,SetFocus,sinmyoumaru		,#発言中キャラを指定
,ImageDef,sinmyoumaru,普1,0,0
#0１２３４５６７８９０１２３４
いいよー\nじゃあ、憑依先を見つけてくる\nからちょっと待ってねー\,a,0,0,"Ok! I'll go find someone to possess, so wait here."
,ClearBalloon,sinmyoumaru

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,惑1,0,0
いや、お主はもう\n憑依されてるじゃないか\,a,0,0,"No. You are already possessed."
,ClearBalloon,futo#吹き出し消去

,SetFocus,sinmyoumaru		,#発言中キャラを指定
,ImageDef,sinmyoumaru,普2,0,0
え？\,a,0,0,"Huh?"
,ClearBalloon,sinmyoumaru

,Hide,sinmyoumaru,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,koishi2,-1280,&	#対象フェイス表示開始
,SetFocus,koishi2,	#発言中キャラを指定
,ImageDef,koishi2,普1,0,0
じゃーん\n行き当たりばったり憑依\n大・成・功！\,a,0,0,"Tada! Random possession SUCCESS!"
,ClearBalloon,koishi2

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,嬉1,0,0
強制完全憑依だったか\nまあいい、勝負だ！\,a,0,0,"Forced perfect possession. \nI shall let it slide. Let's fight!" 
,ClearBalloon,futo#吹き出し消去

,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

#全員フェイス撤去
,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,koishi2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(312)",# 指定BGM再生開始

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
,ImageDef,sinmyoumaru,汗1,0,0
,ImageDef,koishi2,余1,0,0

,Show,futo,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,sinmyoumaru,-1280	,&#フェイス表示開始

,SetFocus,futo
,SetFocus,sinmyoumaru
,ImageDef,sinmyoumaru,汗1,0,0
怖！\nいつの間にか憑依されてたぞ\,a,0,0,"Scary! \nPossessed before I knew it." 
,ClearBalloon,sinmyoumaru

,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,koishi2,-1280,

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
,ImageDef,ichirin2,嬉1,0,0
,ImageDef,sinmyoumaru,負1,0,0
,ImageDef,koishi2,負1,0,0

,Show,sinmyoumaru,-1280	,&#フェイス表示開始
#,Show,koishi2,-1280	,#フェイス表示開始

,SetFocus,sinmyoumaru		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
負ーけーたー\nよく判らない奴に完全憑依されて\nその上で負けるとはなんたる屈辱\,a,0,0,"I lost. \nI was Perfect Possessed by someone \nI don't know and lost on top of that. So humiliating."
,ClearBalloon,sinmyoumaru

,Show,futo,-1280	,&#フェイス表示開始
,SetFocus,futo		,	#発言キャラを指定
#0１２３４５６７８９０１２３４
コンビネーション最悪だったぞ\n精進せい\,a,0,0,"Your fighting was appalling. \nMake an effort."
,ClearBalloon,futo#吹き出し消去

,SetFocus,sinmyoumaru		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
組みたくない奴と組まされて\nその上で説教されるとは\nこの上ない屈辱\,a,0,0,"I was teamed up with someone I don't want and lectured on top of that. \nSo humiliating. 
,ClearBalloon,sinmyoumaru

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,ichirin2,-1280,&	#対象フェイス表示開始
,SetFocus,ichirin2,	#発言中キャラを指定
,ImageDef,ichirin2,嬉1,0,0
おーい、そろそろ交代の約束よー\,a,0,0,"Hey, It's about time to change!
,ClearBalloon,ichirin2

,Hide,ichirin2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# スレイブに入れ替わる

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,驚1,0,0
#0１２３４５６７８９０１２３４
お、そうか\n済まんの\,a,0,0,Futo "Oh, is that so. My apologies."
,ClearBalloon,futo#吹き出し消去

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,&

,Sleep,60

,End

# -------------------------------------------------------
