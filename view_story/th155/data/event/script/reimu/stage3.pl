#========================================================================
#	霊夢：ステージ3　試作　
#	場所：
#　 スレイブ：華扇　敵チーム：神子＆聖
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
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri2,hijiri,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1
,LoadAnimationLocal,"data/actor/story_title/reimu/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/hijiri/name2.pat",1#敵スレイブ肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(403)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,miko,普1,0,0
,ImageDef,hijiri2,普1,0,0

#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
Show,miko,-1280,&	#対象フェイス表示開始
,SetFocus,miko		,#発言中キャラを指定
なる程、お前も動き始めたか\,a,0,0,"I see you've made your move as well."
,ClearBalloon,miko

,Show,reimu,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,reimu		,	#発言キャラを指定
,ImageDef,reimu,普2,0,0
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
今のところ\n何の見当も付かないけどね\,a,0,0,"We haven't found anything yet though."
,ImageDef,reimu,汗1,0,0
まあ、そのうち\n何とかなるんじゃない？\,a,0,0,"Well, we'll figure it out at some point, right?
,ClearBalloon,reimu#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,miko,-1280,&
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,hijiri2,-1280,&	#対象フェイス表示開始
,SetFocus,hijiri2,	#発言中キャラを指定
,ImageDef,hijiri2,汗1,0,0
頼りにならない巫女ねぇ\,a,0,0,"What an unreliable shrine maiden."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280,&
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,普2,0,0
#0１２３４５６７８９０１２３４
我々もこの異変の調査に\nすでに動いておる\,a,0,0,"We have already been investigating this incident for a while."
,ImageDef,miko,余1,0,0
その為に今回コンビを組んだのだ\n我々の邪魔をしないでくれるか\,a,0,0,"For that reason, we've teamed up. So please don't get in our way."
,ClearBalloon,miko

,SetFocus,reimu		,	#発言キャラを指定
,ImageDef,reimu,怒1,0,0
そんなわけに行くもんか\,a,0,0,"Like that's going to happen."
,ImageDef,reimu,決1,0,0
行き当たりばったりでも\n異変は私が解決するよ！\,a,0,0,"Even if it's by chance, I'll resolve this incident!"
,ClearBalloon,reimu#


,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,hijiri2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(306)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,reimu,負1,0,0
,ImageDef,kasen2,負1,0,0
,ImageDef,miko,決1,0,0
,ImageDef,hijiri2,余1,0,0

,Show,reimu,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,miko,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,miko

,ImageDef,miko,決1,0,0
さて、いよいよ\n我ら最強異変調査隊の活動開始だ\,a,0,0,"Now, it's time for the strongest incident investigation team to begin its work!"
,ClearBalloon,miko


#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,hijiri2,-1280,

,Sleep,30

,Function,"::battle.Win()",# ゲームオーバー画面へ

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"if(::battle.team[0].current == ::battle.team[0].slave )::battle.team[0].current.Team_Change_Slave(null)",

#初期表情設定
,ImageDef,reimu,余1,0,0
,ImageDef,kasen2,余1,0,0
,ImageDef,miko,負1,0,0
,ImageDef,hijiri2,負1,0,0

,Show,reimu,-1280	,&#フェイス表示開始
,Show,miko,-1280	,#フェイス表示開始
#,Show,hijiri2,-1280	,#フェイス表示開始


,SetFocus,reimu
,SetFocus,miko
なる程\n完全憑依は使いこなすのに\nコツがいる様だな\,a,0,0,"I see, there are some tricks in mastering Perfect Possession.
,ClearBalloon,miko

,SetFocus,reimu		,
,ImageDef,reimu,余1,0,0
あんたら二人じゃ、我が強すぎて\n協調できてないんじゃない？\,a,0,0,"Aren't the two of you too egotistical to cooperate?
,ClearBalloon,reimu

,SetFocus,miko
それもあるな\n私一人でも良いのだが\,a,0,0,"That may be true. \nI would be fine by myself,"
この異変は完全憑依しないと\n調査は難しいと感じ\n仕方が無く組んでいるだけだ\,a,0,0,"but I felt investigating this incident would be difficult \nwithout using Perfect Possession. \nI had no choice but to form a team."
協調なんて無用である\,a,0,0,"Cooperation is unnecessary."
,ClearBalloon,miko

# =====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,kasen2		,
,ImageDef,kasen2,余2,0,0
いつも和を尊べ\nって言ってなかったっけ？\,a,0,0,"Did you not always say harmony is to be valued?"
,ClearBalloon,kasen2#吹き出し消去

,SetFocus,miko		,
それは\n我に逆らうなと言う意味だ\,a,0,0,"That means, do not oppose me."
,ClearBalloon,miko

,SetFocus,kasen2		,
,ImageDef,kasen2,汗1,0,0
ああ、そういう……\,c,0,0,"Oh, now I understand…."
,ClearBalloon,kasen2#吹き出し消去

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

#全員フェイス撤去
,Hide,reimu,-1280,&
,Hide,kasen2,-1280,&
,Hide,miko,-1280,&
,Hide,hijiri2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
