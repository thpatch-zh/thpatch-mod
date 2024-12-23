#========================================================================
#	神子：ステージ2　試作　
#	場所：
#　 スレイブ：聖　敵チーム：こころ　　布都
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face.pat"#名前,ソースファイル名
,DefineObject,miko,miko,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"#名前,ソースファイル名
,DefineObject,hijiri2,hijiri,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro,kokoro,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,kokoro_name,kokoro,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kokoro/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#敵肩書画像読み込み
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
,ImageDef,miko,普1,0,0
,ImageDef,hijiri2,普1,0,0
,ImageDef,kokoro,普1,0,0
,ImageDef,futo2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,miko,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,miko		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,miko,普2,0,0
精神的に油断していそうな奴を\n見つけたぞ\,a,0,0,"I found a fellow who looks mentally off guard."
,ImageDef,miko,決1,0,0
さあ、やれい！\,a,0,0,"Now go!"
,ClearBalloon,miko#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,kokoro,-1280,&	#対象フェイス表示開始
,SetFocus,kokoro		,#発言中キャラを指定
,ImageDef,kokoro,驚1,0,0
え？\nいきなり何？\,a,0,0,"Huh? \nWhat's this suddenly?"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,futo2,-1280,	#対象フェイス表示開始
,SetFocus,futo2,	#発言中キャラを指定
,ImageDef,futo2,嬉1,0,0
出来ました\n完全に憑依しました\,a,0,0,"Success. \nI perfectly possessed."
,ClearBalloon,futo2

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,普1,0,0
でかした\nそれでは、例の件の調査、頼むぞ\,a,0,0,"Well done. \nNow then, I'll leave the investigation of that matter in your hands."
,ClearBalloon,miko#対象の吹き出し消去

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,kokoro		,#発言中キャラを指定
,ImageDef,kokoro,惑1,0,0
え？\n何が起こっているの？\,a,0,0,"Huh? \nWhat's happening?"
,ClearBalloon,kokoro

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,怒1,0,0
今、貴方に悪霊が取り憑いたわ！\n抵抗しないと死んでしまうわ\,b,0,0,"Right now, an evil spirit is possessing you! \nYou must resist or you will die!"
,ClearBalloon,hijiri2

,SetFocus,kokoro		,#発言中キャラを指定
,ImageDef,kokoro,汗1,0,0
え？　え？\n何言ってるのかよく判らなーい\,a,0,0,"Wait, what? \nI don't get what you're saying."
,ClearBalloon,kokoro

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(310)",# 指定BGM再生開始

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,決1,0,0
我々を相手に思う存分暴れて\n悪霊を引き離して見せよ！\,b,0,0,"Let the enemy rage as its heart desires and let us unleash the evil spirit!"
,ClearBalloon,miko#対象の吹き出し消去


#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kokoro,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,miko,負1,0,0
,ImageDef,hijiri2,負1,0,0
,ImageDef,kokoro,嬉1,0,0
,ImageDef,futo2,余1,0,0

,Show,miko,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,hijiri2,-1280	,&
,Show,kokoro,-1280	,&#フェイス表示開始

,SetFocus,miko
,SetFocus,kokoro
,ImageDef,kokoro,汗1,0,0
勝っちゃった\nダブル宗教家の行動が\n意味不明すぎて怖い\,a,0,0,"I won. \nThese two zealots' actions are so mysterious, it's scary."
,ClearBalloon,kokoro

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kokoro,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,miko,普1,0,0
,ImageDef,hijiri2,余1,0,0
,ImageDef,kokoro,負1,0,0
,ImageDef,futo2,負1,0,0

,Show,miko,-1280	,&#フェイス表示開始
,Show,kokoro,-1280	,#フェイス表示開始

,SetFocus,kokoro		,
,SetFocus,miko		,
,ImageDef,miko,普1,0,0
調子はどうだ？\,a,0,0,"How are you feeling?"
,ClearBalloon,miko

#
#こころと布都が会話中に完全憑依する部分をコメントアウトしています
#

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,futo2,	#発言中キャラを指定
,ImageDef,futo2,余1,0,0
すこぶる快適です\,a,0,0,"Extremely comfortable." 
,ClearBalloon,futo2

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,kokoro
,ImageDef,kokoro,負1,0,0
#0１２３４５６７８９０１２３４
こっちは心地よくないよ！\nなんで勝手に完全憑依してるのよ\n出ていけったら！\,a,0,0,"Hey, I'm not comfortable! \nWhy are you perfect possessing me without asking! Get out!"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,futo2,	#発言中キャラを指定
,ImageDef,futo2,嬉1,0,0
#0１２３４５６７８９０１２３４
拒絶されても\nこれと言って変化無しです\,a,0,0,"Even if you refuse, there is no change."
,ClearBalloon,futo2

,SetFocus,miko		,
,ImageDef,miko,余1,0,0
なる程な\nよく判った\nこころ殿に協力感謝するぞ\,a,0,0,"I see. I understand. \nLady Kokoro, thank you for your cooperation"
,ClearBalloon,miko

,Hide,futo2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,kokoro
,ImageDef,kokoro,負1,0,0
説明していかないのー？\,a,0,0,"You're not going to even explain?"
,ClearBalloon,kokoro

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています

,Sleep,60

,End

# -------------------------------------------------------
