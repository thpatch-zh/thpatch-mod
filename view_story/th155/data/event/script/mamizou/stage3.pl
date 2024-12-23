#========================================================================
#	マミゾウ：ステージ3　試作　
#	場所：
#　 スレイブ：妹紅　敵チーム：鈴仙　　　針妙丸
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
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"
,DefineObject,udonge,udonge,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,udonge_name,udonge,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/mamizou/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/udonge/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.team[0].current.Team_SetFront_Slave()",#戦闘開始前にスレイブに入れ替わる
,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,普1,0,0
,ImageDef,mokou2,普1,0,0
,ImageDef,udonge,普1,0,0
,ImageDef,sinmyoumaru2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,udonge,-1280,&	#対象フェイス表示開始
,SetFocus,udonge		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
完全憑依の練習試合？\n良いけど、一匹狼の貴方が\nコンビを組むなんて珍しいわね\,a,0,0,"A Perfect Possession Training Match?\nAll right, but to see a lone wolf like you work with someone is rare."
,ClearBalloon,udonge

,Show,mokou2,-1280,	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,普2,0,0
#0１２３４５６７８９０１２３４
永く生きてきたけど\nこんなのは初めてで楽しいんだ\,a,0,0,"I've lived a long time, but something this fun is the first."
,ImageDef,mokou2,嬉1,0,0
人に取り憑くって面白いんだな\,a,0,0,"Possessing people is pretty fun."
,ClearBalloon,mokou2

,SetFocus,udonge		,#発言中キャラを指定
,ImageDef,udonge,驚1,0,0
えっ、貴方はスレイブ側なの？\nマスターは誰？\,a,0,0,"Huh, you're the Slave?\nWho's the Master?"
,ClearBalloon,udonge

,Hide,mokou2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Show,mamizou,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,mamizou		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,mamizou,余1,0,0
#0１２３４５６７８９０１２３４
儂がマスターじゃ\n利害が一致してこうなった\,a,0,0,"I'm the Master.\nIt was a mutual interest that led to this."
,ClearBalloon,mamizou#対象の吹き出し消去

,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,sinmyoumaru2,-1280,&	#対象フェイス表示開始
,SetFocus,sinmyoumaru2,	#発言中キャラを指定
,ImageDef,sinmyoumaru2,余1,0,0
#0１２３４５６７８９０１２３４
利害が一致！\nうちと同じだねー！\,b,0,0,"A mutual interest!\nThe same as us!"
,ClearBalloon,sinmyoumaru2


#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,驚1,0,0
#0１２３４５６７８９０１２３４
ほう\nこのちっこいのと組んだのか\,a,0,0,"Oh? So you teamed up with this small one."
,ClearBalloon,mokou2


,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,udonge		,#発言中キャラを指定
,ImageDef,udonge,汗1,0,0
#0１２３４５６７８９０１２３４
利害は一致してないわ！\,a,0,0,"We don't have mutual interests!"
この子が無理矢理憑依してきた\nだけだもん\,a,0,0,"This kid suddenly possessed me by force."
,ImageDef,udonge,惑1,0,0
私はもっと頼りになる奴と\n組みたかったのに\,c,0,0,"I wanted to work with someone more reliable."

,ClearBalloon,udonge


,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Hide,udonge,-1280,
,SetFocus,sinmyoumaru2,	#発言中キャラを指定
,ImageDef,sinmyoumaru2,怒1,0,0
#0１２３４５６７８９０１２３４
子供扱いするなよ！\n私が憑けば百人力だ！\,b,0,0,"Don't treat me like a kid!\nWhen I possess, it's tremendous."
,ImageDef,sinmyoumaru2,余1,0,0
油断している兎がいたから\n憑依してやったんだから\nもっと喜べ！\,a,0,0,"I possessed because there was a distracted rabbit.\nBe happy!"
#0１２３４５６７８９０１２３４
,ImageDef,sinmyoumaru2,決1,0,0
さあ試合、始めるよー！\,a,0,0,"Now let's start the match!"
,ClearBalloon,sinmyoumaru2

,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる
,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる
,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,udonge,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(315)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,mamizou,負1,0,0
,ImageDef,mokou2,負1,0,0
,ImageDef,udonge,嬉1,0,0
,ImageDef,sinmyoumaru2,余1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,mokou2,-1280	,&
,Show,udonge,-1280	,&#フェイス表示開始

,SetFocus,mamizou
,SetFocus,udonge
完全憑依ねぇ\n使いこなせたら面白そうね\,a,0,0,"Perfect Possession…\nSeems fun if you can handle it."
,ClearBalloon,udonge

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,udonge,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,

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
,ImageDef,mamizou,惑1,0,0
,ImageDef,mokou2,余1,0,0
,ImageDef,udonge,負1,0,0
,ImageDef,sinmyoumaru2,負1,0,0

,Show,udonge,-1280	,&#フェイス表示開始
,SetFocus,mamizou		,	#発言キャラを指定
,SetFocus,udonge
うわー、負けたー\,a,0,0,"Ahh, I lost."
,ClearBalloon,udonge

,Hide,udonge,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280	,#フェイス表示開始
,SetFocus,sinmyoumaru2,	#発言中キャラを指定
,ImageDef,sinmyoumaru2,負1,0,0
この兎、弱い！\nもっと強い奴探して憑依しよ\,a,0,0,"What a weak rabbit!\nI should find a strong guy to possess."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,udonge
,ImageDef,udonge,負1,0,0
弱いのはどっちよ！\nもう……\,a,0,0,"Who's the weak one!\nSigh…"
,ClearBalloon,udonge

,Show,mamizou,-1280	,&#フェイス表示開始
,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,驚1,0,0
#0１２３４５６７８９０１２３４
噂通りマスターが油断していれば\n一方的に憑依できるようじゃな\,a,0,0,"As the rumors say,\nif the Master is distracted, possession can be one-sided."
,ImageDef,mamizou,惑1,0,0
じゃが、生殺与奪の権は\nマスターにあるからのう\,a,0,0,"But the Master has the power of life or death."
,ImageDef,mamizou,普1,0,0
好き好んでスレイブを選ぶ奴は\n少数だと思うんじゃが……\,a,0,0,"I'm sure there are few who choose to be the Slave but……"
,ImageDef,mamizou,汗1,0,0
なんでこんな仕組みが噂に\n組み込まれてるんじゃろうか\,a,0,0,"I wonder why this kind of device is included in the rumor."
,ImageDef,mamizou,驚1,0,0
……のう、兎よ\,a,0,0,"……Hey, rabbit."
,ImageDef,mamizou,余1,0,0
ここ最近で人が集まる\nイベントとか知らないか？\,a,0,0,"Do you know of any events where people will gather?"
,ClearBalloon,mamizou#対象の吹き出し消去

,SetFocus,udonge
,ImageDef,udonge,負1,0,0
えっ？イベント？\nそうねぇ、確か……\,a,0,0,"What? Event?\nHmm, I think……"
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,udonge,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
