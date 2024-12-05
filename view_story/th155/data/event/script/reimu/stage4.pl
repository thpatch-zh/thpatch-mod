#========================================================================
#	霊夢：ステージ4　試作
#	場所：
#   スレイブ：華扇　敵チーム：紫
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
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,GoSub,init				,# 初期化ルーチン呼び出し
,LoadAnimationLocal,"data/actor/story_title/reimu/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#敵肩書画像読み込み
,Function,"::battle.team[1].current.Wait_Outside()"#2Pを非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,yukari,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,kasen2,-1280,	#対象フェイス表示開始
,SetFocus,kasen2		,#発言中キャラを指定
,ImageDef,kasen2,普1,0,0
みんな完全憑依の噂に\n振り回されているようね\,a,0,0,"It seems everyone is swayed by the Perfect Possession rumor." 
,ClearBalloon,kasen2

# =====
,Hide,kasen2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Show,reimu,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,reimu		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,reimu,呆1,0,0
今日の調査では\n大したことは判らなかったわ\,a,0,0,"We didn't learn much from today's investigation."
調査は長期に及びそうね\,a,0,0,"It looks like this will be a long one."
,ClearBalloon,reimu#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,kasen2		,#発言中キャラを指定
,ImageDef,kasen2,惑1,0,0
いや……\nまだ今日は終わらないみたいよ\,a,0,0,"No…… \nIt seems today is not over yet."
,ClearBalloon,kasen2

#1Pフェイス撤去
,Hide,reimu,-1280,&	
,Hide,kasen2,-1280,&


,Sleep,60#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.team[1].current.StageIn_Special()"#実行チームが特殊演出で登場
,Sleep,120#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,yukari,-1280,&	#対象フェイス表示開始
,SetFocus,yukari		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
完全憑依を利用しての調査……\,a,0,0,"An investigation using Perfect Possession……"
,ImageDef,yukari,普2,0,0
それは悪意で仕組まれた\n最悪の選択の一つよ\,a,0,0,"That is one of the worst choices set with evil intentions."
,ClearBalloon,yukari


# =====


,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 指定BGM再生開始

,Hide,reimu,-1280,&
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,驚1,0,0
\R[紫|あんた]……！\,c,0,0,"Yukari (you)……!"
,ImageDef,reimu,怒1,0,0
#0１２３４５６７８９０１２３４
このタイミングで出てくる\nと言う事は\nまた、あんたが絡んでいるのね！\,b,0,0,"To come out at this timing must mean you're involved!"
,ClearBalloon,reimu

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
#0１２３４５６７８９０１２３４
強制的に身体を乗っ取れるように\nするなんて、悪魔の所業……\,a,0,0,"To forcibly possess one's body is the deed of the devil……."
,ImageDef,yukari,余1,0,0
いや、邪道の極みだわ\nこの私がそんな事をするように\n見えるのかしら\,a,0,0,"No, the ultimate evil. \nDo I look like someone who would commit such an act?"
,ClearBalloon,yukari

,SetFocus,reimu,	#発言中キャラを指定
,ImageDef,reimu,怒1,0,0
#0１２３４５６７８９０１２３４
見えるよ！\n見えすぎる！\,a,0,0,"You do! \nYou look like just like it!"
,ImageDef,reimu,決1,0,0
異変に関係しているとしか\n考えられないわ！\,a,0,0,"I can only think that you're somehow involved with this Incident!"
,ClearBalloon,reimu



#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,reimu,負1,0,0
,ImageDef,yukari,嬉1,0,0

,Show,reimu,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,yukari,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,yukari
,ImageDef,yukari,惑1,0,0
今のままでは\n黒幕に勝つ手段は見えてこない\n状況は最悪ね\,a,0,0,"At this rate, there is no method to beat the mastermind. \nThis is a horrible situation."
,ClearBalloon,yukari

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,30

#,Function,"::sound.StopBGM(1500)",# コンテニュー待ちへはBGM止めずに続行
,Function,"::battle.Win()",# ゲームオーバー画面へ

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普1,0,0
,ImageDef,yukari,惑1,0,0

,Show,reimu,-1280	,&#フェイス表示開始

,SetFocus,reimu
,ImageDef,reimu,惑1,0,0
まるで手応えがない……\,a,0,0,"It's like there's no effect on her......"
,ClearBalloon,reimu


,Show,yukari,-1280	,&#フェイス表示開始
,SetFocus,yukari
,ImageDef,yukari,惑1,0,0
愚かな……完全憑依の危険が\n貴方達には判らないのね\,a,0,0,"How foolish......\nThe two of you don't understand the dangers of Perfect Possession."
,ImageDef,yukari,決1,0,0
ならば、\R[憑坐|よりまし]は\R[悪意|だんまく]で学べ！\n弾幕馬鹿達よ！\,b,0,0,"Then learn from malice! You shooting idiots!"
,ClearBalloon,yukari

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kasen2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます


,Sleep,30

,Function,"::battle.Lose()",# 対戦再開命令

,End
# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::sound.StopBGM(1500);"
,Sleep,60#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.Go_Ending();"

,End
