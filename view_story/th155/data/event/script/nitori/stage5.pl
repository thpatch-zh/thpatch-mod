#========================================================================
#	にとり：ステージ5　試作　
#	場所：
#　 スレイブ：こころ　敵チーム：天子　　　針妙丸
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
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/nitori/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Team_SetFront_Slave()",#戦闘開始前にスレイブに入れ替わる
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(405)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,惑1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,nitori,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,nitori		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
,ImageDef,nitori,惑1,0,0
完全憑依は\n夢の世界を支配する、か\,a,0,0,"So Perfect Possession controls the Dream World."
,ImageDef,nitori,普2,0,0
なる程、入れ替わっている時は\n何処に居るのか不明だったが\,a,0,0,"I see, I couldn't figure out where one went when they're replaced."
,ImageDef,nitori,普1,0,0
夢の世界にいると考えれば\n不思議は無い\,a,0,0,"If I think that they go to the Dream World, it makes sense."
,ClearBalloon,nitori#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,普1,0,0
#0１２３４５６７８９０１２３４
感情が共有化されるのも\nそこに秘密がありそうです\,a,0,0,"It seems like the secret to sharing emotions will be there too."
,ImageDef,kokoro2,驚1,0,0
夢の中で怖い思いをすれば\n目覚めても怖いですし\,a,0,0,"If you have a scary experience in a dream, \nit's still scary after waking up too."
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,敵1,0,0
#0１２３４５６７８９０１２３４
ほほう、確かに全てが繋がったな\nこれで、人工完全憑依の実現に\nなんの障壁もなくなった\,a,0,0,"True, everything is connecting. \nNow there are no barriers to realizing artificial Perfect Possession."
,ClearBalloon,nitori#吹き出し消去

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,汗1,0,0
#0１２３４５６７８９０１２３４
夢の支配者の警告は\n無視して良いんです？\,a,0,0,"Is it ok to ignore the Dream Ruler's warning?"
,ClearBalloon,kokoro2

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,決1,0,0
#0１２３４５６７８９０１２３４
犠牲なき進歩などない！\nただ前進あるのみだ！\n夢の世界など知った事か\,a,0,0,"There's no progress without sacrifice! \nWe gotta march forward! \nI don't care about the Dream World!"
,ClearBalloon,nitori#吹き出し消去

,Hide,nitori,-1280,
,Hide,kokoro2,-1280,


,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,sinmyoumaru2,-1280,&	#対象フェイス表示開始
,SetFocus,sinmyoumaru2,	#発言中キャラを指定
,ImageDef,sinmyoumaru2,普1,0,0
#0１２３４５６７８９０１２３４
お、いたいた\nこいつらなら\n練習相手にピッタリよ\,a,0,0,"Oh, there they are. \nThe perfect practice opponent."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,Show,tenshi,-1280,&	#対象フェイス表示開始
,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,汗1,0,0
#0１２３４５６７８９０１２３４
崖の下とは\nこれはまた惨めな場所に\n住んでいるねぇ\,a,0,0,"And under a cliff. \nWhat a miserable place to live."
,ImageDef,tenshi,普1,0,0
よーし、サクッとやっちゃおう\,a,0,0,"Alright, let's get this over with."
,ClearBalloon,tenshi

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,惑1,0,0
なんだお前ら\,a,0,0,"What the hell."
,ClearBalloon,nitori#吹き出し消去

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2,	#発言中キャラを指定
,ImageDef,sinmyoumaru2,嬉1,0,0
お前達と戦った後\n最強の相棒を見つけたよ！\,a,0,0,"After fighting with you guys, I found the strongest partner!"
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(409)",# 指定BGM再生開始

,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる


,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,余1,0,0
私は比那名居天子\n高貴な高貴な天人だよ\,a,0,0,"I'm Tenshi Hinanawi. \nA nobly noble celestial."
,ImageDef,tenshi,余1,0,0
#0１２３４５６７８９０１２３４
河童風情が、私の戦闘練習相手に\nなれる事を誇りに思えー\,a,0,0,"The likes of a Kappa should be honored to practice fighting with me."
,ClearBalloon,tenshi

,SetFocus,nitori		,	#発言キャラを指定
,ImageDef,nitori,怒1,0,0
あー天人だと？\nなんとも不愉快な奴だな\,a,0,0,"Huh? A celestial? \nWhat an unpleasant guy."
,ClearBalloon,nitori#吹き出し消去

# =====
,Hide,nitori,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,kokoro2,-1280,	#対象フェイス表示開始
,SetFocus,kokoro2		,#発言中キャラを指定
,ImageDef,kokoro2,驚1,0,0
判りました\,a,0,0,"I understand."
,ImageDef,kokoro2,余1,0,0
この二人は\n脳みそ空っぽ気持ちいいぃぃ\nという感情で結びついています\,a,0,0,"These two are bound by the emotion of "an empty brain is comfortable~""
,ClearBalloon,kokoro2

,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,決1,0,0
#0１２３４５６７８９０１２３４
生まれつきの天才だけど\n驕らずにちゃんと練習する\n謙虚さも持っている\,a,0,0,"I'm a born genius but I'm properly practicing first. \nI have modesty too."
この私に敵う者など無し！\nさあ、さっさと練習相手になれ！\,a,0,0,"But no one is a match for me! \nNow be my practice opponent!"
,ClearBalloon,tenshi

# =====
,Hide,kokoro2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,nitori,	#発言中キャラを指定
,ImageDef,nitori,汗1,0,0
笑わせんな\n何処が謙虚なんだよ\,a,0,0,"Don't make me laugh. \nWhat modesty?"
,ImageDef,nitori,決1,0,0
まあいい、さっくりと倒して\n天人の開きにしてやるぞ！\,a,0,0,"Well, whatever. \nLet's quickly finish this and I'll put you out to dry."
,ClearBalloon,nitori

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(354)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#会話イベントなしでコンティニュー処理へ

,Function,"::battle.Continue()",# 対戦開始命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,nitori,怒1,0,0
,ImageDef,kokoro2,普1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,普1,0,0

,Show,nitori,-1280	,&#フェイス表示開始

,Show,tenshi,-1280	,&#フェイス表示開始
,SetFocus,nitori
,SetFocus,tenshi
,ImageDef,tenshi,嬉1,0,0
これが完全憑依！\nなる程、楽しいぞー！\,a,0,0,"So this is Perfect Possession! So fun!"
,ClearBalloon,tenshi

,SetFocus,nitori
,ImageDef,nitori,惑1,0,0
馬鹿な……\n何処からこの\R[弾幕|エネルギー]が\n湧いてくるんだ？\,a,0,0,"No way...... where is this energy coming from?"
,ClearBalloon,nitori

,SetFocus,tenshi
,ImageDef,tenshi,決1,0,0
これが生きとし生けるもの\n全てが持つ力だ！\nひれ伏せい！下等妖怪よ！\,b,0,0,"This is the power all those living and alive possess! \nWorship me! Low level youkai!"
,ClearBalloon,tenshi


#全員フェイス撤去
,Hide,nitori,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,kokoro2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,

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


# -------------------------------------------------------
