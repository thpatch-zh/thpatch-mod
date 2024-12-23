#========================================================================
#	にとり：ステージ3　試作　
#	場所：
#　 スレイブ：こころ　敵チーム：針妙丸　　マミゾウ
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
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru,sinmyoumaru,2p,1040,0,true

#2Pslave
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou2,mamizou,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,sinmyoumaru_name,sinmyoumaru,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mamizou/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,sinmyoumaru,普1,0,0
,ImageDef,mamizou2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,nitori,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,nitori		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,nitori,敵1,0,0
#0１２３４５６７８９０１２３４
やはり、完全憑依を行うと\n一部の感情が共有化される\,a,0,0,"As I thought, with Perfect Possession some emotions are shared."
,ImageDef,nitori,普1,0,0
これは精神の一部共有が\n行われていると思われる\,a,0,0,"It looks like a partial sharing of the spirit."
,ImageDef,nitori,余1,0,0
これも、あんたの感情眼に\n目を付けた私が凄い\,a,0,0,"I'm also amazing for thinking of attaching an eye to your emotion sight."
,ClearBalloon,nitori#対象の吹き出し消去

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる


#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,嬉1,0,0
#0１２３４５６７８９０１２３４
感情を論理的に覚えた結果\n他人の感情が読めるように\nなったわ\,a,0,0,"After logically memorizing emotions, now I can read the emotions of others."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,普2,0,0
#0１２３４５６７８９０１２３４
感情を操るあんたの力が\n完全憑依解析の肝となる\,a,0,0,"Your ability to control emotions is the crux of this Perfect Possession analysis."
,ClearBalloon,nitori#吹き出し消去

,Hide,nitori,-1280,
,Hide,kokoro2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,sinmyoumaru,-1280,&	#対象フェイス表示開始
,SetFocus,sinmyoumaru		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
良いところに練習相手がいるぞ\n完全憑依で戦おうぜー\,a,0,0,"Hey I found a practice opponent. \nLet's fight with Perfect Possession."
,ClearBalloon,sinmyoumaru

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,驚1,0,0
#0１２３４５６７８９０１２３４
みんな、新しい力を使いたくて\nうずうずしているな\,a,0,0,"Hmm, looks like everyone's itching to try this new power."
,ImageDef,nitori,嬉1,0,0
実験が簡単過ぎて\n笑いが止まらないな\,a,0,0,"This experiment is so easy, I can't help but laugh."
,ClearBalloon,nitori#吹き出し消去

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,余1,0,0
あはははは\,a,0,0,"Ahahahaha"
,ClearBalloon,kokoro2

,SetFocus,sinmyoumaru		,#発言中キャラを指定
,ImageDef,sinmyoumaru,決1,0,0
#0１２３４５６７８９０１２３４
もう勝ったつもりか？\n今日は最強の助っ人を\nスレイブにした！\,a,0,0,"You think you already won? \nI made the strongest helper my slave!"
負ける気がしない\,b,0,0,"I won't lose."
,ClearBalloon,sinmyoumaru

,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(312)",# 指定BGM再生開始

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
,ImageDef,sinmyoumaru,惑1,0,0
,ImageDef,mamizou2,余1,0,0

,Show,nitori,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,kokoro2,-1280	,&
,Show,sinmyoumaru,-1280	,&#フェイス表示開始

,SetFocus,nitori
,SetFocus,sinmyoumaru		,
,ImageDef,sinmyoumaru,惑1,0,0
勝てたけど\nどうもしっくりこないなぁ\,a,0,0,"I won but it doesn't feel like it."
,ClearBalloon,sinmyoumaru

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,

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
,ImageDef,nitori,普1,0,0
,ImageDef,kokoro2,余1,0,0
,ImageDef,sinmyoumaru,負1,0,0
,ImageDef,mamizou2,負1,0,0

,Show,nitori,-1280	,&#フェイス表示開始
,Show,sinmyoumaru,-1280	,&#フェイス表示開始

,SetFocus,nitori		,
,SetFocus,sinmyoumaru		,
#0１２３４５６７８９０１２３４
狸とは相性良さそうだったけど\n案外しっくりこないなぁ\,a,0,0,"I seem compatible with the tanuki but something feels off."
,ClearBalloon,sinmyoumaru

,Hide,sinmyoumaru,-1280	,&#フェイス表示開始
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mamizou2,-1280	,#フェイス表示開始
,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,SetFocus,mamizou2		,
#0１２３４５６７８９０１２３４
そうじゃのう\nもっと強くなれそうじゃったが\n期待外れじゃな\,a,0,0,"That's true. \nI thought we would be stronger, but it was a disappointment."
これでは最凶の二人には\n到底敵いそうにないのう\,a,0,0,"At this rate, we won't be a match for the cursed duo."
,ClearBalloon,mamizou2

,Hide,mamizou2,-1280	,#フェイス表示開始
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Show,sinmyoumaru,-1280	,#フェイス表示開始
,SetFocus,sinmyoumaru		,
#0１２３４５６７８９０１２３４
私をもっと引き立たせる\n組み合わせがある筈だ！\n一足す一が二じゃ勿体ないよ\,a,0,0,"There must be a pairing that makes me look better. \nOne plus one equals two isn't enough."
,ClearBalloon,sinmyoumaru

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,普1,0,0
#0１２３４５６７８９０１２３４
二人は強欲さで結びついています\,a,0,0,"Those two are bound by greed."
,ImageDef,kokoro2,余1,0,0
この場合は、感情の共有が\n完全憑依を脆弱な物にしています\,a,0,0,"In this case, their shared emotions have turned Perfect Possession \ninto something fragile." 
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Show,nitori,-1280	,&#フェイス表示開始
,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,汗1,0,0
#0１２３４５６７８９０１２３４
なるほどな\n感情の共有が徒となる事もあると\,a,0,0,"I see. \nShared emotions can be in vain too."
,ClearBalloon,nitori#吹き出し消去

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
