#========================================================================
#	神子：ステージ5　試作　
#	場所：
#　 スレイブ：聖　敵チーム：女苑
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

,LoadAnimationLocal,"data/actor/story_title/miko/title5.pat",1#ステージタイトル画像読み込み
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
,ImageDef,miko,惑1,0,0
,ImageDef,hijiri2,普1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,120

,Show,miko,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,miko		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,miko,惑1,0,0
黒幕はライブ開演中に現れる\nだと？\,a,0,0,"So the mastermind will appear during the concert?"
,ClearBalloon,miko#対象の吹き出し消去

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普1,0,0
もうすぐ始まるみたいだけど\nちょうど良かったというか\,a,0,0,"It seems like it'll begin soon. \nI guess we had good timing."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,怒1,0,0
いやしかし、これは不味いぞ\n黒幕の目的が判ってしまった！\,a,0,0,"No, this seems troublesome. \nI think I figured out the mastermind's intention!"
,ClearBalloon,miko#吹き出し消去

,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます


#0１２３４５６７８９０１２３４
,Show,jyoon,-1280,&	#対象フェイス表示開始
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,嬉1,0,0
やったー！\nライブ、楽しみー！\,a,0,0,"Yay! \nA concert, how fun!"
,ImageDef,jyoon,普1,0,0
観客が心を奪われる\n瞬間が訪れるねー！\,a,0,0,"The moment when the audience is captivated is coming!"
,ClearBalloon,jyoon

,Show,miko,-1280,	#対象フェイス表示開始
,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,余1,0,0
そこまでだ\n完全憑依異変の尻尾を掴んだぞ！\,a,0,0,"Stop there. \nWe've caught the tail of the Perfect Possession incident!"
,ClearBalloon,miko#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,驚1,0,0
む、誰だ？\,a,0,0,"Hmm, who's that?"
,ImageDef,jyoon,怒1,0,0
お前は最近よく見る\n口うるさい聖人じゃん\,a,0,0,"You're that annoying saint I see lately."
それに、善人気取りの僧侶まで\,a,0,0,"And the pretentious monk."
,ClearBalloon,jyoon

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,普1,0,0
お前は何者だ\n名を名乗れ\,a,0,0,"Who are you? \nTell me your name."
,ClearBalloon,miko#吹き出し消去

,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,余1,0,0
私は\R[依神女苑|よりがみじょおん]\n富をもたらす女神よ\,a,0,0,"I'm Jyoon Yorigami. \nA goddess that brings wealth."
,ClearBalloon,jyoon

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,惑1,0,0
富をもたらすだって？\nとんだ嘘だわ、貴方から\n強烈な負のオーラしか感じない\,a,0,0,"Brings wealth? \nWhat a terrible lie. \nI only sense an intense negative aura."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,余2,0,0
#0１２３４５６７８９０１２３４
お前の目的は判っておる\,a,0,0,"I've discovered your intention."
ライブに夢中の観客に\n強制完全憑依する\,a,0,0,"Enforced Perfect Possession of an audience preoccupied by a concert."
,ImageDef,miko,余1,0,0
そして何をするのか……だが\nその派手な出で立ちを見るに\n金品を奪っているんじゃないか？\,a,0,0,"And what will happen after…… \nfrom the looks of your fancy dress, it's to steal valuables, is it not?"
,ClearBalloon,miko#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,驚1,0,0
#0１２３４５６７８９０１２３４
へー、よくそこまで判ったわね\,a,0,0,"Wow, Well to figure out that much."
,ImageDef,jyoon,嬉1,0,0
その通りよ\n夢中な観客なら憑依し放題だもん\,a,0,0,"That's exactly right. \nA preoccupied audience is possessing as much as I like."
,ClearBalloon,jyoon

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,怒1,0,0
人の物を盗むなど\n外道中の外道である！\,b,0,0,"To steal another's possessions, is a demon within a demon!
,ClearBalloon,miko#吹き出し消去

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,怒1,0,0
\R[不楡盗戒|ぬすむべからず]\nこんな浅ましいコソ泥が異変を\n起こすなんて、世も末ね\,a,0,0,"Thou shall not steal. \nThat a pitiful thief would cause such an incident, it's the end of the world."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,決1,0,0
#0１２３４５６７８９０１２３４
もっともだ\nこんな下らん外道\nこの世から消してやろう\,a,0,0,"Quite right. \nSuch a foolish demon should be demolished."
,ClearBalloon,miko#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,呆1,0,0
#0１２３４５６７８９０１２３４
あっはっは\n下らん奴はあんた達さ！\n私に勝てると思ってるの？\,a,0,0,"Hahaha. \nYou're the foolish ones! \nYou think you can win against me?"
,ImageDef,jyoon,余1,0,0
外道？　浅ましい？　結構結構\n私にとっては褒め言葉だわー\,b,0,0,"Demon? Pitiful? That's ok. \nI take is a compliment~"
,ClearBalloon,jyoon

#
#紫苑が登場する特殊演出が挿入されます
,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Hide,jyoon,-1280,
,Sleep,40#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.team[1].current.shion.Shion_StageIn()"#紫苑登場
,Sleep,180#スリープ命令　指定数値フレーム待ちます

,Show,shion2,-1280,&	#対象フェイス表示開始
,SetFocus,shion2		,#発言中キャラを指定
ねえ女苑\nこいつら何とかしないと\nライブ始まっちゃうよ\,a,0,0,"Hey Jyoon. \nWe need to do something about them or the concert will start."
,ClearBalloon,shion2

,Show,miko,-1280,	#対象フェイス表示開始
,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,驚1,0,0
なんだと、外道も二人組か\,a,0,0,"It's a pair of demons?"
,ClearBalloon,miko#吹き出し消去

#演奏開始
,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普2,0,0
私は最凶最悪の\R[疫病神|やくびょうがみ]\nそして\,a,0,0,"I'm the cursed and evil Pestilence God, and"
,ClearBalloon,jyoon

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,&	#対象フェイス表示開始
,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,普1,0,0
#0１２３４５６７８９０１２３４
私が姉の\R[依神紫苑|よりがみしおん]\n最凶最悪の貧乏神よ\,a,0,0,"I'm the sister Shion Yorigami, the cursed and evil Poverty God."
個人的には不本意だけど\n私達に勝つ手段は無いわ\,a,0,0,"Personally there's no choice, but there's no way to win against us."
,ClearBalloon,shion2

#
#女苑と紫苑が同時にしゃべる特殊演出が挿入されます
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
我らが何故最凶最悪の姉妹なのか\n身を以て知るが良い！\,e15x3,0,0,"You should experience yourselves why we are the cursed and evil sisters!"
,ClearBalloon,jyoon

#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,60

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
,ImageDef,miko,惑1,0,0
,ImageDef,hijiri2,普1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0

,Show,miko,-1280	,&#フェイス表示開始
,SetFocus,miko
,Show,jyoon,-1280	,&#フェイス表示開始
,SetFocus,jyoon

,SetFocus,miko
,ImageDef,miko,余1,0,0
王道が外道に負ける道理はない\nさっさと消え失せろ\,a,0,0,"There is no reason for the righteous to lose to evil. Get lost."
,ClearBalloon,miko

,SetFocus,shion2
,ImageDef,shion2,嬉1,0,0
ああ眩しい、眩しいねぇ\nお前達が輝いてくれるほど\n嬉しいわー\,a,0,0,"Oh, so bright, so bright. \nThe more you shine, the more I'm happy."
,ClearBalloon,shion2

,SetFocus,miko
,ImageDef,miko,惑1,0,0
何だと？\,a,0,0,"What do you mean?"
,ClearBalloon,miko

,SetFocus,shion2,
,ImageDef,shion2,決1,0,0
#0１２３４５６７８９０１２３４
輝くほどに、悔しがる姿を\n見られるからね！\,c,0,0,"Because I'll get to see you that much frustrated soon!"
,ClearBalloon,shion2

,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます


,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
憑依交換「\R[アブソリュートルーザー|完全な敗北者！]」\,e15x3,0,0,"Possession Exchange “Absolute Loser!”"
,ClearBalloon,jyoon

#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
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
