#========================================================================
#	鈴仙：ステージ4　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：妹紅　霊夢
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,udonge,"data/event/pic/udonge/face.pat"#名前,ソースファイル名
,DefineObject,udonge,udonge,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#名前,ソースファイル名
,DefineObject,doremy2,doremy,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"
,DefineObject,mokou,mokou,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,mokou_name,mokou,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mokou/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普2,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,mokou,普2,0,0
,ImageDef,reimu2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,敵1,0,0
タイムリミット\n夢の世界に戻る時間です\,a,0,0,"Time's up. \nIt's time to return to the Dream World."
,ClearBalloon,doremy2


# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Show,udonge,-1280,	#対象フェイス表示開始
,SetFocus,udonge		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普2,0,0
えー、まだ暴れ足りないわ\,a,0,0,"But I'm not done."
,ClearBalloon,udonge#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#0１２３４５６７８９０１２３４
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,普2,0,0
暴走を防ぐために\n現で発散する事も大切ですが\,a,0,0,"To prevent recklessness, venting in the Real World is important..."
,ImageDef,doremy2,普1,0,0
現の世界の滞在が\n長くなり過ぎても\nバランスを失います\,a,0,0,"But staying in the Real World for too long will throw off the balance too."
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,汗1,0,0
あと一戦だけいいでしょう？\n折角の現なんだから\,a,0,0,"Can I fight one more time? \nI'm finally in the Real World."
,ClearBalloon,udonge#対象の吹き出し消去

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,惑1,0,0
#0１２３４５６７８９０１２３４
うーん\n危険は危険だけど……\,a,0,0,"Hmm… It is dangerous but……"
,ImageDef,doremy2,嬉1,0,0
貴方を見ていると\n苦労しているようだし……\,a,0,0,"Watching you, I can see you're struggling……."
,ImageDef,doremy2,決1,0,0
判りました\n次を最後の一戦とします\,a,0,0,"All right.\nThis is the last fight."

,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,嬉1,0,0
やったあ！\n話がわかるー\,a,0,0,"Yay! \nSo understanding."
,ClearBalloon,udonge#対象の吹き出し消去

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,mokou,-1280,&	#対象フェイス表示開始
,SetFocus,mokou		,#発言中キャラを指定
,ImageDef,mokou,普2,0,0
見つけたぞ\nお前が噂の変な鈴仙だな\,a,0,0,"I found you. \nYou're the rumored strange Reisen."
,ClearBalloon,mokou

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,余1,0,0
#0１２３４５６７８９０１２３４
丁度良い\n最後の相手は貴方、不死人で\n決まりよ！\,a,0,0,"Perfect timing. \nMy last opponent will be you - an immortal!"
さあ、勝負だ！\,b,0,0,"Now, let's fight!"
,ClearBalloon,udonge#対象の吹き出し消去

,SetFocus,mokou		,#発言中キャラを指定
,ImageDef,mokou,嬉1,0,0
嬉しいな\n鈴仙ちゃんの方から\n勝負を挑んでくるなんて\,a,0,0,"I'm so happy. \nReisen-chan challenging me to a fight."
,ClearBalloon,mokou

,SetFocus,udonge		,	#発言キャラを指定
#0１２３４５６７８９０１２３４
,ImageDef,udonge,余1,0,0
ふふふ\n前々から不満が溜まっていたのよ\,a,0,0,"Hehehe I've been dissatisfied for awhile now."
,ImageDef,udonge,決1,0,0
貴方の様な不穏分子を\n竹林に放置している事が！\,b,0,0,"That a troublemaker like you has been left alone in the bamboo forest!"
,ClearBalloon,udonge#対象の吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(354)",# 指定BGM再生開始

,SetFocus,mokou		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
,ImageDef,mokou,普1,0,0
思えば、霊夢と入れ替わり\nお前と戦ったのが\n完全憑依異変の始まりだった\,a,0,0,"If I think about it, \nswitching with Reimu and fighting with you \nwas the beginning of the Perfect Possession incident."
,ImageDef,mokou,嬉1,0,0
その時とは見違えるように\n成長したな\,a,0,0,"You've matured since then that I hardly recognize you."
,ImageDef,mokou,余1,0,0
私は完全憑依を使いこなし\nあれから何倍も強くなったが\nお前はどうだ？\,b,0,0,"I've mastered Perfect Possession and now I'm a million times stronger. \nHow about you?"
,ImageDef,mokou,決1,0,0
威勢の良さは口だけではないか\n実際に見せてみよ！\,b,0,0,"Show me that your spirit isn't all talk!"
,ClearBalloon,mokou


#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,


,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,udonge,負1,0,0
,ImageDef,doremy2,負1,0,0
,ImageDef,mokou,余1,0,0
,ImageDef,reimu2,余1,0,0

,Show,udonge,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,mokou,-1280	,&#フェイス表示開始

,SetFocus,udonge		,
,SetFocus,mokou
口だけだったか\,a,0,0,"It was all talk."
,ClearBalloon,mokou

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
,ImageDef,udonge,普2,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,mokou,普2,0,0
,ImageDef,reimu2,普1,0,0

,Show,udonge,-1280	,&#フェイス表示開始
,Show,mokou,-1280	,&#フェイス表示開始
,SetFocus,udonge
,SetFocus,mokou
,ImageDef,mokou,普2,0,0
なるほど、口だけでは\n無さそうだな\,a,0,0,"I see, I guess she wasn't all words"
,ClearBalloon,mokou

,SetFocus,udonge
,ImageDef,udonge,決1,0,0
もう時間が無いの！\n本気でかかってこい！\,b,0,0,"There's no time! Come at me with all you got!"
,ClearBalloon,udonge

,SetFocus,mokou
,ImageDef,mokou,決1,0,0
良いだろう！\n一発で決めてやる！\,a,0,0,"Alright! I'll take care of it in one shot!"
,ClearBalloon,mokou

,SetFocus,mokou
,ImageDef,mokou,決1,0,0
無限に焼かれろ！\n\R[生命|いのち]の炎でな！\,b,0,0,"Burn forever! From the flame of life!"
,ClearBalloon,mokou




#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦再開命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普2,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,mokou,普2,0,0
,ImageDef,reimu2,普1,0,0

,Show,udonge,-1280	,&#フェイス表示開始
,Show,mokou,-1280	,&#フェイス表示開始
,SetFocus,udonge
,SetFocus,mokou
,ImageDef,mokou,普2,0,0
なるほど、口だけでは\n無さそうだな\,a,0,0
,ClearBalloon,mokou

,SetFocus,udonge
,ImageDef,udonge,決1,0,0
もう時間が無いの！\n本気でかかってこい！\,b,0,0
,ClearBalloon,udonge

,SetFocus,mokou
,ImageDef,mokou,決1,0,0
良いだろう！\n一発で決めてやる！\,a,0,0
,ClearBalloon,mokou

,SetFocus,mokou
,ImageDef,mokou,決1,0,0
無限に焼かれろ！\n\R[生命|いのち]の炎でな！\,b,0,0
,ClearBalloon,mokou




#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mokou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
