#========================================================================
#	マミゾウ：ステージ5　試作
#	場所：
#　 スレイブ：妹紅　敵チーム：女苑
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
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P紫苑
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,jyoon_name,jyoon,name,920,0,false

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#プレイヤーを非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera_Live()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
,ImageDef,mokou2,余1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,120


,Show,mamizou,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,mamizou		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
ほほう、満員御礼じゃな\nプリズムリバー楽団っちゅうのは\nこんなに人気なんじゃな\,a,0,0,"Ooh, it's a full house.\nThis Prismriver band is quite popular."
,ClearBalloon,mamizou#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ



# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280,	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,余1,0,0
アップテンポながら\nニヒルな死生観のある曲が\n売りなのさ\,a,0,0,"Their up-tempo but nihilistic life or death songs are the selling point."
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,嬉1,0,0
詳しいな\nさてはファンじゃな？\,a,0,0,"You know a lot. Are you a fan?"
,ClearBalloon,mamizou#吹き出し消去

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,汗1,0,0
そ、それはともかく\nもうすぐ開演だぞ……\,c,0,0,"That… that's beside the point.\nThe concert will begin……"
,ClearBalloon,mokou2


,Hide,mamizou,-1280,
,Hide,mokou2,-1280,

,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます


,Show,jyoon,-1280,&	#対象フェイス表示開始
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,嬉1,0,0
やったー！\nライブ、楽しみー！\nもうすぐ演奏が始まるねー！\,a,0,0,"Yay! I'm excited for the concert!\nThe performance's going to start soon!"
,ImageDef,jyoon,普2,0,0
観客が無心になる瞬間が\n訪れるわよー\,a,0,0,"The moment when the crowd will be mindless is coming soon."
,ClearBalloon,jyoon

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,余1,0,0
待ってたぞい\,a,0,0,"I was waiting for you."
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,怒1,0,0
誰よ？\n楽しいライブを邪魔する奴は\,a,0,0,"Who are you, getting in the way of a fun concert."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,嬉1,0,0
儂は化け狸の二ッ岩マミゾウ\n我らは最強の\n完全憑依の使い手じゃ\,a,0,0,"I'm the bake-danuki, Mamizou Futatsuiwa.\nWe're the strongest experts of Perfect Possession."
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普2,0,0
完全憑依の使い手\nははーん、ほほーん\,a,0,0,"Experts of Perfect Possession.\nHahaha hohoho."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,驚1,0,0
#0１２３４５６７８９０１２３４
完全憑依異変を起こした奴が\nここに現れると踏んでいたのだが\nお前の事じゃろ？\,a,0,0,"We predicted the culprits of the Perfect Possession incident would appear here.\nThat's you, isn't it?
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普1,0,0
そうよ\nよくここまで辿り着いたわね\,a,0,0,"Yup, Good job getting all the way here."
,ClearBalloon,jyoon

,SetFocus,mamizou		,	#発言キャラを指定
#0１２３４５６７８９０１２３４
,ImageDef,mamizou,普1,0,0
ライブに心を奪われている\n観客に憑依するために\n完全憑依の噂を流す\,a,0,0,"You started a rumor about Perfect Possession to possess \nan audience captivated by the concert."
,ImageDef,mamizou,余1,0,0
中々の案だが\n派手にやり過ぎたな\,a,0,0,"A pretty good plan but overdone."
,ImageDef,mamizou,汗1,0,0
儂等がそれを利用して\n強く成り過ぎたぞい\,a,0,0,"We utilized Perfect Possession to become stronger."
,ImageDef,mamizou,決1,0,0
さあ、いざ勝負せよ！\,a,0,0,"Now, let the fight begin!"
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普2,0,0
ぷぷー、お前ら馬鹿だろ\,a,0,0,"hahaha, how stupid."
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
確かに完全憑依異変の\n動機はその通りだよ\n観客に憑依するためさ\,a,0,0,"True, the motive for the Perfect Possession Incident was just that.\nTo possess the audience."
,ImageDef,jyoon,余1,0,0
だけどねぇ\n派手に噂をばらまいたのは\nわざとに決まってるじゃない！\,b,0,0,"But the rumor was obviously spread on purpose!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,惑1,0,0
なんじゃと？\,a,0,0,"What did you say?"
,ClearBalloon,mamizou#吹き出し消去


,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,
,Sleep,190



,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,余1,0,0
私は\R[依神女苑|よりがみじょおん]\n最凶最悪の\R[疫病神|やくびょうがみ]\nそして\,a,0,0,"I'm Jyoon Yorigami, the cursed and evil Pestilence God. And…"
,ClearBalloon,jyoon

,Hide,jyoon,-1280,&

#
#紫苑が登場する特殊演出が挿入されます
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#紫苑登場
#

,Sleep,180#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,&	#対象フェイス表示開始
,SetFocus,shion2		,#発言中キャラを指定
私が\R[依神紫苑|よりがみ　しおん]\n最凶最悪の貧乏神よ\,a,0,0,"I'm Shion Yorigami, the cursed and evil Poverty God."
,ClearBalloon,shion2

,Show,mamizou,-1280,	#対象フェイス表示開始
,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,驚1,0,0
疫病神に貧乏神じゃと\t[!?]\,a,0,0,"A Pestilence God and Poverty God!?"
,ClearBalloon,mamizou#吹き出し消去

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280, &	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,決1,0,0
#0１２３４５６７８９０１２３４
相手も二人か\n手加減する理由は無いな！\,b,0,0,"Two opponents... There's no need to go easy on them!"
,ClearBalloon,mokou2


#
#女苑と紫苑が同時にしゃべる特殊演出が挿入されます
#
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
#
#女苑と紫苑が同時にしゃべる特殊演出が挿入されます
#
#,Sleep,30
#,Show,jyoon,-1280,	#対象フェイス表示開始
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
我らが何故最凶最悪の姉妹なのか\n身を以て知るが良い！\,e15x3,0,0,"You should experience yourselves why we are the cursed and evil sisters!"
,ClearBalloon,jyoon


#,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

# =====
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる


,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#会話イベントなしでコンティニュー処理へ

,Sleep,30

,Function,"::battle.Continue()",# 対戦開始命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普2,0,0
,ImageDef,mokou2,余1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始
,Show,jyoon,-1280	,&#フェイス表示開始

,SetFocus,jyoon
,SetFocus,mokou2
,ImageDef,mokou2,余1,0,0
物足りないぞ！\nこんなものなのか？\,a,0,0,"I think something is missing! Is this really it?"
,ClearBalloon,mokou2

,SetFocus,jyoon
,ImageDef,jyoon,嬉1,0,0
あはははは\,a,0,0,"Ahahaha."
,ClearBalloon,jyoon

,SetFocus,mamizou
,ImageDef,mamizou,普2,0,0
こいつ……\n何で笑っていられるんじゃ？\,a,0,0,"You...... why are you laughing?"
,ClearBalloon,mamizou

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
#0１２３４５６７８９０１２３４
こんな単純な暴力は\n本物の暴力の前では\n無意味だからだよ！\,c,0,0,"Because your simple throws are nothing against real violence!"
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
憑依交換「\R[アブソリュートルーザー|完全な敗北者！]」\,e15x3,0,0,"Possession Exchange ”Absolute Loser!”"
,ClearBalloon,jyoon


#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦再開命令

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
