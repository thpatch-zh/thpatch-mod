#========================================================================
#	神子：ステージ3　試作　
#	場所：
#　 スレイブ：聖　敵チーム：天子　　　針妙丸
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
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"
,DefineObject,sinmyoumaru2,sinmyoumaru,2p,1040,0,true

#1Pguest1
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#名前,ソースファイル名
,DefineObject,ichirin,ichirin,1p,240,0,false#名前,グループ名,x,y,反転

#1Pguest2
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#名前,ソースファイル名
,DefineObject,futo,futo,1p,240,0,false#名前,グループ名,x,y,反転

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/miko/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/sinmyoumaru/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,miko,普1,0,0
,ImageDef,hijiri2,普2,0,0
,ImageDef,tenshi,普2,0,0
,ImageDef,sinmyoumaru2,怒1,0,0
,ImageDef,ichirin,惑1,0,0
,ImageDef,futo,惑1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,miko,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,miko		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
見えて来たぞ\,a,0,0,"I can see it now."
,ImageDef,miko,普2,0,0
同意完全憑依と\n強制完全憑依の差がな\,a,0,0,"The difference between agreed Perfect Possession \nand enforced Perfect Possession."
,ImageDef,miko,惑1,0,0
もう一人くらい実験出来ると\n確証に至るんだが\,a,0,0,"If I could experiment on one more subject, I could reach a conclusion."
,ClearBalloon,miko#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普2,0,0
ここの城主なんか\n何も考えていないだろうから\n実験体としてはピッタリよ\,a,0,0,"This lord probably isn't thinking anything. \nPerfect for our experiment."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる


,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,余2,0,0
小人か\n確かに脳みそ小さそうだからな\,a,0,0,"An inchling. \nTrue, since the brain seems small."
,ClearBalloon,miko#吹き出し消去


,Hide,miko,-1280,
,Hide,hijiri2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,tenshi,-1280,	#対象フェイス表示開始
,Function,"::battle.Show_EnemyName()",#敵ネームを表示

,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,普2,0,0
ねー、こいつ誰ー？\,a,0,0,"Hey, Who is this?"
,ClearBalloon,tenshi

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2,#発言中キャラを指定
,ImageDef,sinmyoumaru2,怒1,0,0
げ、こいつは自分のことを\n幻想郷で最も偉大だと思ってる\n面倒くさい奴だ\,a,0,0,"Ugh, She thinks she's the most important in Gensokyo. So annoying."
,ClearBalloon,sinmyoumaru2

,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる


,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,余1,0,0
ふーん\n地上に這い蹲ってる奴らなんて\n偉大も死骸も大差あるもんか\,a,0,0,"Hmm.. \nGuys groveling on Earth, important or dead, what's the difference."
,ClearBalloon,tenshi

,Hide,tenshi,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,sinmyoumaru2		,#発言中キャラを指定
,ImageDef,sinmyoumaru2,嬉1,0,0
よっ！\nさすが天人様。頼りになるー\,b,0,0,"Yes! \nGo Lady Tenshi. So dependable."
,ClearBalloon,sinmyoumaru2



,Show,ichirin,-1280,	#対象フェイス表示開始
,SetFocus,ichirin,	#発言中キャラを指定
,ImageDef,ichirin,怒1,0,0
#0１２３４５６７８９０１２３４
小人は駄目です！\n既にスレイブになっている奴には\n強制憑依できません\,a,0,0,"The Inchling won't work! \nYou can't enforce Perfect Possession on someone who's already a slave."
,ClearBalloon,ichirin
,Hide,ichirin,-1280,

,SetFocus,tenshi		,#発言中キャラを指定
,Hide,sinmyoumaru2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる
,ImageDef,tenshi,余1,0,0


,Show,futo,-1280,	#対象フェイス表示開始
,SetFocus,futo,	#発言中キャラを指定
,ImageDef,futo,惑1,0,0
あの謎のマスターも\n全く心に入り込む隙が無いです！\,a,0,0,"The mysterious master's mind seems impenetrable as well!"
,ClearBalloon,futo
,Hide,futo,-1280,

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,驚1,0,0
……了解した\,a,0,0,"…… I understand."
,ImageDef,miko,普2,0,0
では強制完全憑依実験は中止し\n普通の戦闘モードに移行する\,a,0,0,"Let us postpone the enforced Perfect Possession experiment \nand move forward with regular battle mode."
,ClearBalloon,miko#吹き出し消去

,SetFocus,tenshi		,#発言中キャラを指定
,ImageDef,tenshi,嬉1,0,0
#0１２３４５６７８９０１２３４
お、やるのか？\n血湧き肉躍る戦闘は\n久しぶりだね！\,a,0,0,"Oh, so you want to fight? \nIt's been awhile since I've had a blood stirring battle!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(312)",# 指定BGM再生開始

,ImageDef,tenshi,決1,0,0
地上に這い蹲ってる虫ケラよ！\n失望させるなよ！\,b,0,0,"Hey you worthless crawling vermin! \nDon't disappoint me!"
,ClearBalloon,tenshi


#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&
,Hide,futo,-1280,&
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,sinmyoumaru2,-1280,


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,miko,負1,0,0
,ImageDef,hijiri2,負1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,余1,0,0

,Show,miko,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,hijiri2,-1280	,&
,Show,tenshi,-1280	,&#フェイス表示開始

,SetFocus,miko
,SetFocus,tenshi
完全憑依か\n地上は面白い事になってるねぇ\,a,0,0,"With Perfect Possession, Earth sure is fun."
,ClearBalloon,tenshi

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,miko,驚1,0,0
,ImageDef,hijiri2,余1,0,0
,ImageDef,tenshi,負1,0,0
,ImageDef,sinmyoumaru2,負1,0,0

,Show,miko,-1280	,&#フェイス表示開始
,Show,tenshi,-1280	,&#フェイス表示開始
#,Show,sinmyoumaru2,-1280	,#フェイス表示開始


,SetFocus,tenshi,&
,SetFocus,miko		,
,ImageDef,miko,驚1,0,0
大口叩いた割には弱すぎる\n失望したぞ\,a,0,0,"Your are much weaker than your big mouth. \nI'm disappointed."
,ClearBalloon,miko

,SetFocus,tenshi
#0１２３４５６７８９０１２３４
まだ完全憑依が\n慣れてないだけよ\,a,0,0,"I'm not used to Perfect Possession yet."
練習すれば地上の奴らなどに\n負ける筈が無い！\,a,0,0,"If I practice, I won't lose to anyone on Earth!"
,ClearBalloon,tenshi

,SetFocus,miko		,
,ImageDef,miko,汗1,0,0
ならば精進せい\,a,0,0,"Then be diligent."
,ImageDef,miko,普1,0,0
ところで\nさっき天人だと言っていたが\nそれは本当か？\,a,0,0,"By the way, you mentioned you were a celestial. \nIs that true?"
,ClearBalloon,miko

,SetFocus,tenshi
そうよ\,a,0,0,"Yup."
,ClearBalloon,tenshi

,SetFocus,miko		,
,ImageDef,miko,惑1,0,0
#0１２３４５６７８９０１２３４
そうか、まさかと思ったが\n天人様ならもっと強くあるべきだ\n情け無い姿を見たくない\,a,0,0,"I see. I didn't believe it but if you are a celestial, you should be stronger. \nI don't want to see such pitifulness.
,ClearBalloon,miko

,SetFocus,tenshi
#0１２３４５６７８９０１２３４
だから、ちょいと練習すれば\n最強になるってばー\,a,0,0,"Like I said, if I practice, I'll be the most powerful!"
折角、私と相性の良い\n小人を見つけたんだ\,a,0,0,"And I found a compatible Inchling."
すぐに最強の二人になるよ！\n見てろよ！　虫ケラどもめ！\,b,0,0,"We'll be the strongest duo before you know it! \nJust you watch! You vermin!
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,tenshi,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,sinmyoumaru2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
