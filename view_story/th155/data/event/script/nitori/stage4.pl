#========================================================================
#	にとり：ステージ4　試作　
#	場所：
#　 スレイブ：こころ　敵チーム：菫子　　　ドレミー
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"#名前,ソースファイル名
,DefineObject,nitori,nitori,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"#名前,ソースファイル名
,DefineObject,kokoro2,kokoro,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"
,DefineObject,usami,usami,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,usami_name,usami,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/usami/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,usami,普1,0,0
,ImageDef,doremy2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,usami,-1280,&	#対象フェイス表示開始
,SetFocus,usami		,#発言中キャラを指定
貴方は河童？\,a,0,0,"Are you a kappa?"
,ClearBalloon,usami

,Show,nitori,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,nitori		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,nitori,惑1,0,0
#0１２３４５６７８９０１２３４
ああ、外来人か\,a,0,0,"Oh, an Outsider."
さすがに外の世界まで\n完全憑依の噂は広がって\nいないよな\,a,0,0,"I hope the Perfect Possession rumor hasn't spread to the Outside World."
,ClearBalloon,nitori#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,SetFocus,usami		,#発言中キャラを指定
,ImageDef,usami,普2,0,0
完全憑依って何？\,a,0,0,"What's Perfect Possession?"
,ClearBalloon,usami

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,普1,0,0
こうやって\,a,0,0,"Like this"
,ClearBalloon,kokoro2

,Hide,kokoro2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,嬉1,0,0
こうする遊びだよ\,a,0,0,"and like this, you play."
,ClearBalloon,nitori

,SetFocus,usami		,#発言中キャラを指定
,ImageDef,usami,驚1,0,0
わあ、一瞬別人になった！\n変身能力？\,c,0,0,"Wow! You became someone else for a second! \nTransformation?"
,ClearBalloon,usami

,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,敵1,0,0
完全憑依という現象だ\n通常の憑依は精神のみだが\n完全憑依は肉体ごと乗り移れる\,a,0,0,"It's a phenomenon called Perfect Possession. \nTypically, possession is only the spirit. \nBut Perfect Possession can change the entire body."
,ClearBalloon,nitori

,SetFocus,usami		,#発言中キャラを指定
,ImageDef,usami,嬉1,0,0
肉体ごと憑依するって\nテレポーテーションって事かしら\,a,0,0,"Possessing the entire body… does that mean teleportation?"
もう一回見せてー\,a,0,0,"Show me one more time."
,ClearBalloon,usami

,Hide,nitori,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,嬉1,0,0
はーい\,a,0,0,"Ok~"
,ClearBalloon,kokoro2

,Hide,kokoro2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,余1,0,0
こんな感じだな\n興味があるようなら、お前も……\,a,0,0,"Like this. \nIf you're interested, why don't you……"


,ImageDef,nitori,驚1,0,0
って、お前、既に\n何かに完全憑依されていないか？\,a,0,0,"Wait. \nYou're already Perfect Possessed, aren't you?"
,ClearBalloon,nitori


,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::sound.PlayBGM(314)",# 指定BGM再生開始

,SetFocus,usami		,#発言中キャラを指定
,ImageDef,usami,余1,0,0
#0１２３４５６７８９０１２３４
ふっふっふ\n異変に気が付いたか……\,a,0,0,"Hehehe, you noticed the abnormality……"
,ImageDef,usami,余1,0,0
しかし、完全憑依では無い\,a,0,0,"But it's not Perfect Possession."
,ImageDef,usami,決1,0,0
我は完全憑依で夢の世界から\n追い出されたもう一人の菫子\,a,0,0,"I'm the other Sumireko who was kicked out of the Dream World \nby Perfect Possession."
ドリーム菫子だ！\,b,0,0,"Dream Sumireko!"
,ClearBalloon,usami


#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,usami,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了


# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,nitori,負1,0,0
,ImageDef,kokoro2,負1,0,0
,ImageDef,usami,怒1,0,0
,ImageDef,doremy2,余1,0,0

,Show,nitori,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,kokoro2,-1280	,&
,Show,usami,-1280	,&#フェイス表示開始

,SetFocus,nitori
,SetFocus,usami
,ImageDef,usami,怒1,0,0
完全憑依は、夢の世界を抑制する\,a,0,0,"Perfect Possession will control the Dream World."

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,usami,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

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
,ImageDef,nitori,汗1,0,0
,ImageDef,kokoro2,余1,0,0
,ImageDef,usami,負1,0,0
,ImageDef,doremy2,普1,0,0

,Show,nitori,-1280	,&#フェイス表示開始
,Show,usami,-1280	,&#フェイス表示開始

,SetFocus,usami		,#発言中キャラを指定
,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,汗1,0,0
夢の世界の菫子？\n何言ってるんだ？\,a,0,0,"Sumireko from the Dream World? \nWhat do you mean?"
,ClearBalloon,nitori

,Hide,usami,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,doremy2,-1280	,#フェイス表示開始
,SetFocus,doremy2		,
,ImageDef,doremy2,惑1,0,0
そのままの意味よ\,a,0,0,"It means exactly that."
#0１２３４５６７８９０１２３４
完全憑依は夢の世界を\n支配して行われています\,a,0,0,"Perfect Possession has power over the Dream World."
完全憑依を続けると\n抑圧されたもう一人の自分\n夢の世界の自分が暴走しかねない\,a,0,0,"By continuing Perfect Possession, your suppressed other self, \nyour Dream World self will lose control."
,ClearBalloon,doremy2

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,驚1,0,0
#0１２３４５６７８９０１２３４
大変です\nこの人の感情が読めません\,a,0,0,"This is bad. \nI can't read her emotions."
,ImageDef,kokoro2,惑1,0,0
シンクロした感情が\n存在しない可能性があります\,a,0,0,"There's a possibility this emotion doesn't exist in my database."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,惑1,0,0
お前は一体何者だ？\,a,0,0,"Who the hell are you?"
,ClearBalloon,nitori

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,SetFocus,doremy2		,
,ImageDef,doremy2,敵1,0,0
#0１２３４５６７８９０１２３４
私はドレミースイート\n夢の支配者です\,a,0,0,"I am Doremy Sweet. \nThe ruler of Dreams."
,ImageDef,doremy2,惑1,0,0
完全憑依の乱用は\n夢の世界からみて控えた方が\n良いと思いますよ\,a,0,0,"As the ruler of the Dream World, \nyou should refrain from abusing Perfect Possession." 
,ClearBalloon,doremy2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,usami,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
