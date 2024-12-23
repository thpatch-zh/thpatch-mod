#========================================================================
#	神子：ステージ1　試作　
#	場所：
#　 スレイブ：聖　敵チーム：こいし　　一輪
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
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi,koishi,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,koishi_name,koishi,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/koishi/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(401)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,miko,普2,0,0
,ImageDef,hijiri2,普1,0,0
,ImageDef,koishi,惑1,0,0
,ImageDef,ichirin2,驚1,0,0


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
お前には怨みは無いが\n実験台になって貰うぞ\,a,0,0,"I have no resentment against you but I will use you as my guinea pig."
,ClearBalloon,miko#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,koishi,-1280,&	#対象フェイス表示開始
,SetFocus,koishi		,#発言中キャラを指定
,ImageDef,koishi,惑1,0,0
実験台？\,a,0,0,"A guinea pig?"
,ClearBalloon,koishi

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普1,0,0
一輪、今ですよ\,a,0,0,"Ichirin, Now is the time."
,ClearBalloon,hijiri2

,Hide,koishi,-1280,
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,ichirin2,-1280,	#対象フェイス表示開始
,SetFocus,ichirin2,	#発言中キャラを指定
,ImageDef,ichirin2,驚1,0,0
承知しました！\nこれでいいのかな？\,a,0,0,"Understood! \nIs this ok?"
,ClearBalloon,ichirin2

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,嬉1,0,0
よろしい、強制完全憑依は\n成功したわ\,a,0,0,"Good, enforced Perfect Possession succeeded."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko,	#発言中キャラを指定
,ImageDef,miko,余2,0,0
簡単だったな\n何も考えていなそうな\n奴だったからか\,a,0,0,"It was quite easy. \nSince it was a thoughtless looking fellow."
,ClearBalloon,miko

,Hide,ichirin2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,koishi		,#発言中キャラを指定
,ImageDef,koishi,驚1,0,0
あれ、今なんか\n誰かに完全憑依された？\,a,0,0,"Wait, did someone just Perfect Possess me?"
,ClearBalloon,koishi

,SetFocus,miko,	#発言中キャラを指定
,ImageDef,miko,普1,0,0
#0１２３４５６７８９０１２３４
ほう、一丁前に完全憑依の事を\n知っているんだな\,a,0,0,"Hm, so you've heard of Perfect Possession."
,ImageDef,miko,決1,0,0
ならば話は早い\n完全憑依に付いて\n色々調べさせて貰うぞ！\,b,0,0,"This will save us time. \nWe're going to investigate Perfect Possession!"
,ClearBalloon,miko

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,koishi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(308)",# 指定BGM再生開始

,Sleep,60

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
,ImageDef,koishi,嬉1,0,0
,ImageDef,ichirin2,余1,0,0

,Show,miko,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,koishi,-1280	,&#フェイス表示開始

,SetFocus,miko
,SetFocus,koishi
やったー、勝っちゃった\,a,0,0,"Yay, we won!"
,ClearBalloon,koishi
,Hide,koishi,-1280,

,Show,ichirin2,-1280,	#対象フェイス表示開始
,SetFocus,ichirin2,	#発言中キャラを指定
,ImageDef,ichirin2,汗1,0,0
すみません\n調子に乗ってしまいました\,a,0,0,"I'm sorry. \nI got carried away.
,ClearBalloon,ichirin2

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,koishi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,miko,余1,0,0
,ImageDef,hijiri2,汗1,0,0
,ImageDef,koishi,負1,0,0
,ImageDef,ichirin2,負1,0,0

,Show,miko,-1280	,&#フェイス表示開始
,Show,koishi,-1280	,&#フェイス表示開始
#,Show,ichirin,-1280	,#フェイス表示開始


,SetFocus,koishi
,SetFocus,miko		,
,ImageDef,miko,余1,0,0
#0１２３４５６７８９０１２３４
お互い同意の上の場合と\n強制的に完全憑依した場合に\nその後に大きな差異は無しか\,a,0,0,"Whether by mutual agreement or enforced Perfect Possession, \nthere's little difference after."
,ClearBalloon,miko

,SetFocus,koishi
あれー\nいつの間にか憑依されてたけど\nこれは一体何の実験？\,a,0,0,"Huh? \nI was possessed suddenly but what kind of experiment is this?
,ClearBalloon,koishi

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,汗1,0,0
#0１２３４５６７８９０１２３４
驚かしてごめんなさいね\n強制完全憑依の調査は\nサプライズでしか遂行出来ないの\,a,0,0,"I'm sorry to frighten you. \nEnhanced Perfect Possession Investigation can only be executed by surprise."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,
#0１２３４５６７８９０１２３４
,ImageDef,miko,普1,0,0
双方同意しているなら\n容易に完全憑依できる\,a,0,0,"If both parties agree, Perfect Possession is simple." 
,ImageDef,miko,惑1,0,0
精神的に油断している相手だと\n強制的に完全憑依できる\,a,0,0,"If the partner is mentally off guard, Perfect Possession can be enforced."
,ImageDef,miko,普2,0,0
黒幕は何の為に後者の条件を\n広めたのか……\,a,0,0,"What is the reason for the mastermind to create the latter condition……"
,ClearBalloon,miko

,SetFocus,koishi
あー、それで無意識の内に\n私があちこちに\n憑依したりしてたのね\,a,0,0,"Ohh, so that's why I was unconsciously possessed here and there."
,ClearBalloon,koishi

,SetFocus,miko		,
,ImageDef,miko,驚1,0,0
強制完全憑依の経験者だったのか\n色々話を聞かせておくれ\,a,0,0,"So you've experienced enhanced Perfect Possession before. \nTell us more."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,koishi,-1280,

,Sleep,60

,End

# -------------------------------------------------------
