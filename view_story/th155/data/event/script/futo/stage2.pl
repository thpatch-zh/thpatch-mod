#========================================================================
#	布都：ステージ2　試作　
#	場所：
#　 スレイブ：布都　敵チーム：妹紅　　　鈴仙
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#名前,ソースファイル名
,DefineObject,ichirin,ichirin,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#名前,ソースファイル名
,DefineObject,futo2,futo,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou,mokou,2p,1040,0,true

#2Pslave
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"
,DefineObject,udonge2,udonge,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,mokou_name,mokou,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mokou/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/udonge/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(405)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,ichirin,嬉1,0,0
,ImageDef,futo2,普1,0,0
,ImageDef,mokou,余1,0,0
,ImageDef,udonge2,惑1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,ichirin,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,ichirin		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,ichirin,嬉1,0,0
よーし、次は私がマスターよー！\nそこのお前！\n完全憑依戦で勝負しよう！\,a,0,0,"All right,  I'm the Master next! You there! \nLet's fight with a Perfect Possession Battle! 
,ClearBalloon,ichirin#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,ichirin,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,mokou,-1280,&	#対象フェイス表示開始
,SetFocus,mokou		,#発言中キャラを指定
,ImageDef,mokou,余1,0,0
丁度良いところに来た\n私もマスター側の\n練習したかったところだ\,a,0,0,"Good timing. \nI wanted to practice being a Master too. 
,ClearBalloon,mokou

,Hide,mokou,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,udonge2,-1280,&	#対象フェイス表示開始
,SetFocus,udonge2,	#発言中キャラを指定
,ImageDef,udonge2,惑1,0,0
僧侶と仙人の二人……\nライバル同士かと思ったけど\nコンビを組むとは意外ね\,a,0,0,"A monk and hermit duo…… \nI thought you were rivals but working together is unexpected.
,ClearBalloon,udonge2

,SetFocus,ichirin		,	#発言キャラを指定
,ImageDef,ichirin,普1,0,0
聖様の作戦です\n二人で完全憑依の調査を行えと\,a,0,0,"It's Lady Hijiri's strategy. \nShe said to investigate Perfect Possession together."
,ClearBalloon,ichirin#対象の吹き出し消去

,Hide,udonge2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,mokou		,#発言中キャラを指定
,ImageDef,mokou,決1,0,0
何でも良い\n弱くなければな！\,b,0,0,"I don't care. \nAs long as you're not weak. 
,ClearBalloon,mokou


,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,futo2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,udonge2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(311)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,ichirin,負1,0,0
,ImageDef,futo2,負1,0,0
,ImageDef,mokou,汗1,0,0
,ImageDef,udonge2,余1,0,0

,Show,ichirin,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,mokou,-1280	,&#フェイス表示開始

,SetFocus,ichirin
,SetFocus,mokou
,ImageDef,mokou,汗1,0,0
やっぱりマスター側は\nしっくりこないな\,a,0,0,"Like I thought, being the Master doesn't suit me."
,ClearBalloon,mokou

,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,futo2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,udonge2,-1280,

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
,ImageDef,ichirin,余1,0,0
,ImageDef,futo2,余1,0,0
,ImageDef,mokou,負1,0,0
,ImageDef,udonge2,負1,0,0

,Show,ichirin,-1280	,&#フェイス表示開始
,Show,mokou,-1280	,&#フェイス表示開始
#,Show,udonge2,-1280	,#フェイス表示開始

,SetFocus,mokou		,
,SetFocus,ichirin	
,ImageDef,ichirin,余1,0,0	,
#0１２３４５６７８９０１２３４
組み慣れてないのはバレバレよ\,a,0,0,"It's obvious you're not used to working together." 
,ClearBalloon,ichirin

,SetFocus,mokou		,
個人的にはスレイブの方が良いな\n自分の出番だけ暴れられれば良い\,a,0,0,"Personally I prefer being a slave. \nI just like going wild when it's my turn."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,普1,0,0		,
#0１２３４５６７８９０１２３４
そういうもんなんですかねぇ\nみんな主導権を握れるマスターを\n好むと思ってましたが\,a,0,0,"Is that how it is? \nI thought everyone liked being the Master who has control."
,ClearBalloon,ichirin

,SetFocus,mokou		,
切替のタイミングは\n人に任せた方が楽だ\n戦闘に専念できるだろ？\,a,0,0,"It's easier to leave the changeover timing to someone else. \nThen I can concentrate on the battle."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,普2,0,0	,
スレイブが良ければ\n強制完全憑依という手段も\nありますよ\,a,0,0,"If you prefer being the Slave, \nthere's the method of enforced Perfect Possession too."
,ClearBalloon,ichirin

,SetFocus,mokou		,
強い瞑想状態に入れば\n油断している人間に\n憑依できるというアレだな\,a,0,0,"Oh, when you can possess someone off guard \nby going into a deep meditative state."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,惑1,a,0,0
#0１２３４５６７８９０１２３４
そうです\nおっと、そろそろマスター交代の\n時間だけど……\,a,0,0,"Yes. \nOh, it's about time to change Master……"
,ImageDef,ichirin,惑1,a,0,0
布都から連絡がないわねぇ\nどうしたのかしら？\,c,0,0,"There's no word from Futo yet. \nI wonder what happened?"
,ClearBalloon,ichirin

,SetFocus,mokou		,
交互にマスターをやっているのか\n面白い奴らだ\,a,0,0,"You're alternating the Master? \nHow interesting."
,ClearBalloon,mokou

,SetFocus,ichirin		,
,ImageDef,ichirin,汗1,0,0	,
どっちがマスターかで\n大喧嘩しましたので……\,a,0,0,"Well, we had a big fight over who should be the Master……"

,ImageDef,ichirin,嬉1,a,0,0
そうだ、布都から連絡無いから\n実験がてら強制完全憑依して\nみようかしら\,a,0,0,"I know, since there's no word from Futo, \nmaybe I'll test enforced Perfect Possession."
,ClearBalloon,ichirin

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,udonge2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,60

,End

# -------------------------------------------------------
