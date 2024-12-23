#========================================================================
#	布都：ステージ4　試作　
#	場所：
#　 スレイブ：布都　敵チーム：華扇　　　霊夢
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
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(404)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,ichirin,驚1,0,0
,ImageDef,futo2,惑1,0,0
,ImageDef,kasen,普2,0,0
,ImageDef,reimu2,汗1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,ichirin,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,ichirin		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,ichirin,驚1,0,0
あれ？\nさっきまでの世界は夢？\,a,0,0,"Huh? Where did the Dream World go?"
,ClearBalloon,ichirin#対象の吹き出し消去

# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# マスターに入れ替わる

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Show,futo2,-1280,	#対象フェイス表示開始
,SetFocus,futo2		,#発言中キャラを指定
,ImageDef,futo2,惑1,0,0
何だか頭がぼーっとする\n変な夢を見ていた気がするぞ\,c,0,0,"My head feels light. \nI think I saw a strange dream."
,ClearBalloon,futo2

# =====
,Hide,futo2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,ichirin		,	#発言キャラを指定
,ImageDef,ichirin,惑1,0,0
#0１２３４５６７８９０１２３４
あんたもそうなのね\nもう内容忘れちゃったけど……\,a,0,0,"You too? \nI already forgot the dream though……."
,ImageDef,ichirin,普1,0,0
ま、いっか\n完全憑依の調査を再開しましょ\,a,0,0,"Oh well. \nLet's continue the Perfect Possession investigation."
,ClearBalloon,ichirin#対象の吹き出し消去

,Hide,ichirin,-1280,
,Hide,futo2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,kasen,-1280,&	#対象フェイス表示開始
,SetFocus,kasen		,#発言中キャラを指定
,ImageDef,kasen,普2,0,0
どう、スレイブ側に慣れた？\,a,0,0,"How is it? \nAre you used to being a slave now?"
,ClearBalloon,kasen

,Hide,kasen,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,reimu2,-1280,&	#対象フェイス表示開始
,SetFocus,reimu2,	#発言中キャラを指定
,ImageDef,reimu2,惑1,0,0
#0１２３４５６７８９０１２３４
うーん\nどうにも自由が利かないわねぇ\,a,0,0,"Hmm… I feel paralyzed."
,ImageDef,reimu2,汗1,0,0
自分に主導権がないのは\nしょうに合わないわー\,a,0,0,"Not having control doesn't suit me."
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,Show,kasen,-1280,&	#対象フェイス表示開始
,SetFocus,kasen		,#発言中キャラを指定
,ImageDef,kasen,諭1,0,0
#0１２３４５６７８９０１２３４
貴方には、協調するという心が\n足りないんだわ\,a,0,0,"You lack in coordination."
,ImageDef,kasen,驚1,0,0
あら、お客さん？\,a,0,0,"Oh, a customer?"
,ClearBalloon,kasen

,SetFocus,ichirin		,	#発言キャラを指定
,ImageDef,ichirin,普2,0,0
どうもー\n完全憑依の調査に来ました\,a,0,0,"Hello, I came to investigate Perfect Possession."
,ImageDef,ichirin,余1,0,0
そちらも調査をしている\nみたいですね\,a,0,0,"It looks like you're investigating too."
,ClearBalloon,ichirin#対象の吹き出し消去

,Show,kasen,-1280,&	#対象フェイス表示開始
,SetFocus,kasen		,#発言中キャラを指定
,ImageDef,kasen,普1,0,0
聞いたわよ\n貴方達の親分も協力して\n調査をしているけど\,a,0,0,"I heard. \nYour boss is also assisting in the investigation."
#0１２３４５６７８９０１２３４
,ImageDef,kasen,余1,0,0
まだまだ異変解決まで\n漕ぎ着けていないとか\,a,0,0,"But you're still far from arriving at a resolution."
,ClearBalloon,kasen

,SetFocus,ichirin		,	#発言キャラを指定
,ImageDef,ichirin,普1,0,0
#0１２３４５６７８９０１２３４
解決は時間の問題でしょう\nその時間を少しでも減らそうと\n調査に協力しているのです\,a,0,0,"A resolution is just a matter of time. \nWe are helping to decrease the time as much as possible."
,ClearBalloon,ichirin#対象の吹き出し消去

,Show,kasen,-1280,&	#対象フェイス表示開始
,SetFocus,kasen		,#発言中キャラを指定
,ImageDef,kasen,決1,0,0
まあ、丁度良かったわ\nこっちの異変解決人も特訓中よ\,a,0,0,"Well, good timing. \nThis incident resolver is also in intensive training."
スレイブに慣れさせているの\n一戦しましょう！本気でね\,a,0,0,"She is adjusting to being a Slave so let's battle! \nPlease take it seriously."
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,futo2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(301)",# 指定BGM再生開始

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
,ImageDef,kasen,余1,0,0
,ImageDef,reimu2,余1,0,0

,Show,ichirin,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,kasen,-1280	,&#フェイス表示開始

,SetFocus,ichirin	,
,SetFocus,kasen		,
,ImageDef,kasen,余1,0,0
相手が弱すぎて\n練習にならなかったわね\,a,0,0,"The opponent was too weak. It wasn't a good practice."
,ClearBalloon,kasen

,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,futo2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
,ImageDef,ichirin,普2,0,0
,ImageDef,futo2,嬉1,0,0
,ImageDef,kasen,負1,0,0
,ImageDef,reimu2,負1,0,0

,Show,ichirin,-1280	,&#フェイス表示開始
,Show,kasen,-1280	,&#フェイス表示開始
#,Show,reimu2,-1280	,#フェイス表示開始


,SetFocus,kasen		,
,SetFocus,ichirin		,
,ImageDef,ichirin,普2,0,0
#0１２３４５６７８９０１２３４
よし勝った！\nもしかして私達最強じゃない？\,a,0,0,"Yes, we won! Maybe we're the strongest?"
,ClearBalloon,ichirin

# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,futo2,-1280,	#対象フェイス表示開始
,SetFocus,futo2		,#発言中キャラを指定
,ImageDef,futo2,嬉1,0,0
#0１２３４５６７８９０１２３４
悪くなさそうじゃな\n仙人と巫女の組み合わせにも\n勝てたし\,a,0,0,"We seem to be alright. \nWe were even able to win against a hermit and shrine maiden."
,ImageDef,futo2,決1,0,0
なんだか誰にも負けない\n気がしてきたぞ\,a,0,0,"I am starting to feel as though we will never lose."
,ClearBalloon,futo2


,SetFocus,kasen	,
#0１２３４５６７８９０１２３４
ただ強いだけでは\n最強の二人にはなれない\,c,0,0,"You cannot become the strongest duo only by being strong."
貴方達の親分はきっと\nそう言うでしょうね\,a,0,0,"I'm sure that is what your boss will say too."
,ClearBalloon,kasen



# =====
,Hide,futo2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# スレイブに入れ替わる

,SetFocus,ichirin		,
,ImageDef,ichirin,嬉1,0,0
やーい、負け惜しみー\,a,0,0,"Hey, you sore loser!"
,ClearBalloon,ichirin



# =====
,Hide,ichirin,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,futo2		,#発言中キャラを指定
,ImageDef,futo2,余1,0,0
負け惜しみー\,a,0,0,"Sore loser!"
,ClearBalloon,futo2


,Hide,kasen,-1280, &
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,reimu2,-1280	,&#フェイス表示開始

,SetFocus,reimu2,	#発言中キャラを指定
,ImageDef,reimu2,負1,0,0
言わせておきましょう\n最後に勝利するのは\nどうせ私なんだから\,a,0,0,"Let me say this. \nI'll be the one to win in the end anyways."
,ClearBalloon,reimu2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,ichirin,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,futo2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
