#========================================================================
#	霊夢：ステージ1　試作　
#	場所：
#　 スレイブ：華扇　敵チーム：魔理沙＆こいし
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#名前,ソースファイル名
,DefineObject,reimu,reimu,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"#名前,ソースファイル名
,DefineObject,kasen2,kasen,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"
,DefineObject,koishi2,koishi,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/koishi/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()",#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)",#画面がフェードイン

,Function,"::sound.PlayBGM(401)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,marisa,普1,0,0
,ImageDef,koishi2,普1,0,0

#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます


,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,reimu,-1280,
,SetFocus,reimu		,
,ImageDef,reimu,普1,0,0
さてと\n何処から調査しようかしら\,a,0,0,"Let's see. \nWhere should we start investigating."
,ClearBalloon,reimu#吹き出し消去
,Hide,reimu,-1280, &

#0１２３４５６７８９０１２３４

,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,kasen2,-1280,
,SetFocus,kasen2		,
,ImageDef,kasen2,普1,0,0
誰がこんな噂を広めたのかを\n探るには内側に飛び込むしか\nないわね\,a,0,0,"To find out  who spread this rumor, \nwe have no choice but to dive into the heart of this incident."
,ImageDef,kasen2,普2,0,0
具体的には\n自ら完全憑依を行って戦う\,a,0,0,"Specifically to fight using Perfect Possession ourselves."
,ClearBalloon,kasen2#吹き出し消去
,Hide,kasen2,-1280,&


,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる
,ImageDef,reimu,汗1,0,0
,SetFocus,reimu
手掛かりが無いしそれしか無いね\,a,0,0,"We have no leads so I guess that's the only option."
,ImageDef,reimu,敵1,0,0
となるとやっぱり最初は……\,a,0,0,"Which means we should start with……"
,ClearBalloon,reimu#吹き出し消去

#1Pフェイス撤去
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&

#,Function,"::sound.PlaySE(800)",# 指定SE再生
#,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現

,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,marisa,-1280,&	#対象フェイス表示開始
,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,普2,0,0
よう\n暇だから一戦交えようぜー！\,a,0,0,"Hey, I'm bored so let's have a quick match!"
,ClearBalloon,marisa


,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,普2,0,0
良いところに来たわね\,a,0,0,"You came at the right time."
,ImageDef,reimu,普2,0,0
完全憑依調査の\n最初の被検体として相応しいわ\,a,0,0,"You're perfect as the first test subject of our Perfect Possession investigation."
,ClearBalloon,reimu

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,惑1,0,0
被検体？\n何の話だ？\,a,0,0,"Test Subject? \nWhat are you talking about?"
,ClearBalloon,marisa
,Hide,reimu,-1280,&

,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,kasen2		,#発言中キャラを指定
,ImageDef,kasen2,余1,0,0
悪いけど\n今日は二対一で行かせて貰うわ\,a,0,0,"I'm sorry but today we will fight two versus one."
,ClearBalloon,kasen2

,SetFocus,marisa,	#発言中キャラを指定
,ImageDef,marisa,驚1,0,0
わあ、入れ替わった！\n完全憑依だな？\,a,0,0,"Whoa, you swapped with her! \nSo that's Perfect Possession?"
,ClearBalloon,marisa

,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる

,SetFocus,reimu,	#発言中キャラを指定
,ImageDef,reimu,嬉1,0,0
実際に利用してみて\n真相を探る事にしたの！\,a,0,0,"We've decided to investigate the truth by actually using it!"
,ClearBalloon,reimu

,Hide,reimu,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,kasen2,	#発言中キャラを指定
,ImageDef,kasen2,驚1,0,0
ちょっと、待って\n魔理沙、既に……\,c,0,0,"Wait, Marisa… you are already……"
,ClearBalloon,kasen2

,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Hide,marisa,-1280,&

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,koishi,-1280,&
,SetFocus,koishi2		,
,ImageDef,koishi2,惑1,0,0
あら、ここは何処かしら？\,a,0,0,"Huh, where am I?"
,ClearBalloon,koishi2

,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,reimu,	#発言中キャラを指定
,ImageDef,reimu,驚1,0,0
あんたも既に\n完全憑依されてたー\t[!?]\,b,0,0,"You were already under Perfect Possession too!?"
,ClearBalloon,reimu

#,Function,"::battle.team[1].current.StageOut_Dash()"#実行チームが画面上から出現
#,Function,"::battle.team[1].current.StageOut_SlideUpper()"#実行チームが画面上から出現
#,Sleep,120#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる
,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,koishi2,-1280,

,Sleep,60

#,Function,"::sound.PlayBGM(301)",# 指定BGM再生開始

#,Sleep,60#スリープ命令　指定数値フレーム待ちます

#,Function,"::battle.Battle_Ready()",# 対戦開始命令
,Function,"::battle.Lose()",

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,reimu,負1,0,0
,ImageDef,kasen2,負1,0,0
,ImageDef,marisa,汗1,0,0
,ImageDef,koishi2,余1,0,0

,Show,reimu,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,marisa,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,marisa
,ImageDef,marisa,汗1,0,0
何で私が完全憑依されてたんだ？\,a,0,0,"Why was I perfect possessed?"
,ClearBalloon,marisa

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,koishi,-1280,

,Sleep,30

#,Function,"::sound.StopBGM(1500)",# BGM停止
#,Thread,"::battle.Continue();"#コンテニュー確認画面へ
#,Function,"::battle.Continue()",# 対戦開始命令
,Function,"::battle.Win()",

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#初期表情設定
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,余1,0,0
,ImageDef,marisa,負1,0,0
,ImageDef,koishi2,負1,0,0

,Show,reimu,-1280	,&#フェイス表示開始
#,Show,koishi2,-1280	,#フェイス表示開始
,Show,marisa,-1280	,&#フェイス表示開始

,SetFocus,reimu
#,SetFocus,koishi2		,
,SetFocus,marisa		,
おい、これは一体何なんだ？\n自分が別人と入れ替わったような\,a,0,0,"Hey, what's this? It feels like I swapped with someone else."
,ClearBalloon,marisa
#0１２３４５６７８９０１２３４
,SetFocus,reimu		,
,ImageDef,reimu,普1,0,0
あんたは気が付いて\nいなかったのね\,a,0,0,"So you didn't notice anything happened."
,ImageDef,reimu,普2,0,0
肉体も精神も入れ替わる\nこれが完全憑依と呼ばれる物よ\,a,0,0,"The body and mind switching places is called Perfect Possession.
,ClearBalloon,reimu

,SetFocus,marisa		,
完全憑依の噂は聞いていたが\nこんな簡単に入れ替われるのか\,a,0,0,"I've heard of this Perfect Possession rumor, \nbut I didn't think it was this easy.
これは面白……\nいや不思議な\,a,0,0,"This sounds fun……no, interesting."
,ClearBalloon,marisa

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,koishi2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
