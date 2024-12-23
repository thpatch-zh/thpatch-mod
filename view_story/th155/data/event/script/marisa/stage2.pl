#========================================================================
#	魔理沙：ステージ2　試作　
#	場所：
#　 スレイブ：こいし　敵チーム：にとり＆こころ
#	ステージタイトル
#	   「河童の野望」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#名前,ソースファイル名
,DefineObject,marisa,marisa,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#名前,ソースファイル名
,DefineObject,koishi2,koishi,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"
,DefineObject,nitori,nitori,2p,1040,0,true

#2Pslave
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro2,kokoro,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,nitori_name,nitori,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/nitori/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kokoro/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,普1,0,0
,ImageDef,koishi2,普2,0,0
,ImageDef,nitori,敵1,0,0
,ImageDef,kokoro2,嬉1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,marisa,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,marisa		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
思ったより完全憑依って\n簡単なんだな\,a,0,0,"Perfect Possession's much easier than I thought."
,ImageDef,marisa,汗1,0,0
てっきり、こいつの能力が\n関係しているのかと思ったけど\,a,0,0,"I was sure your ability had something to do with it."
,ClearBalloon,marisa#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,普2,0,0
私もそう思ってたー\n私、強くなったなぁ、と\n思ってたのに\,a,0,0,"Me too. \nI thought I got stronger…"
,ClearBalloon,koishi2


# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,
,ImageDef,marisa,汗1,0,0
#0１２３４５６７８９０１２３４
誰とでも簡単に組めるんなら\nこんな扱いにくい奴じゃなくて\n別の奴と組み替えても良いかも\,a,0,0,"If you can partner up with anyone, \nI should work with someone who isn't so hard to deal with.."
,ClearBalloon,marisa#吹き出し消去

,Hide,marisa,-1280,&
,Hide,koishi2,-1280,
,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",
,Show,nitori,-1280,&	#対象フェイス表示開始
,ImageDef,nitori,敵1,0,0
,SetFocus,nitori		,#発言中キャラを指定
おい、そこのお前\n完全憑依しているな？\,a,0,0,"Hey, you there. \nYou're using Perfect Possession?"
,ClearBalloon,nitori

,SetFocus,marisa		,
,ImageDef,marisa,普2,0,0
おお、河童も知っているのか\n完全憑依の噂\,a,0,0,"Ooh, so the Kappa's heard about the Perfect Possession rumor too."
,ClearBalloon,marisa

,Show,nitori,-1280,&	#対象フェイス表示開始
,SetFocus,nitori		,#発言中キャラを指定
,ImageDef,nitori,決1,0,0
#0１２３４５６７８９０１２３４
自らに完全憑依して絶賛解析中だ\nお前も実験に付き合ってもらうぞ\,a,0,0,"I'm personally analyzing Perfect Possession. \nI'll have you help with my experiment too." 
,ClearBalloon,nitori

,Hide,nitori,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,kokoro2,-1280,&	#対象フェイス表示開始
,SetFocus,kokoro2,	#発言中キャラを指定
,ImageDef,kokoro2,嬉1,0,0
実験楽しいよ！\n憑依も楽しいよ！\,a,0,0,"Experiments are fun! \nPossession is fun too!"
,ClearBalloon,kokoro2

,SetFocus,marisa		,
,ImageDef,marisa,驚1,0,0
……\,a,0,0,"……"
,ImageDef,marisa,汗1,0,0
この二人に組み替えるのも\n嫌だなぁ\,a,0,0,"I don't want to work with these two either."
取り敢えず\nコンビ改編は保留にしておくか\,a,0,0,"I guess for now I'll wait on the partner reassessment."
,ClearBalloon,marisa


,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる
,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,nitori,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kokoro2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(307)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,負1,0,0
,ImageDef,koishi2,負1,0,0
,ImageDef,nitori,嬉1,0,0
,ImageDef,kokoro2,余1,0,0

,Show,marisa,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,koishi2,-1280	,&
,Show,nitori,-1280	,&#フェイス表示開始
,SetFocus,marisa		,&

,SetFocus,nitori
解析は順調だ！\n完全憑依の条件は噂通りだな\,a,0,0,"Analysis is going smoothly! \nThe conditions for Perfect Possession are just as the rumors said."
,ClearBalloon,nitori

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,nitori,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kokoro2,-1280,

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
,ImageDef,marisa,普1,0,0
,ImageDef,koishi2,余1,0,0
,ImageDef,nitori,負1,0,0
,ImageDef,kokoro2,負1,0,0


,Show,nitori,-1280	,&#フェイス表示開始
#,Show,kokoro2,-1280	,#フェイス表示開始
,Show,marisa,-1280	,&#フェイス表示開始
,SetFocus,marisa		,

,SetFocus,nitori
負けてしまったが\n良い実験結果は取れた\,a,0,0,"We lost but I collected some good test results."
,ClearBalloon,nitori

,Show,marisa,-1280	,&#フェイス表示開始
,SetFocus,marisa		,
,ImageDef,marisa,普1,0,0
実験って何だ？\,a,0,0,"What's the experiment?"
,ClearBalloon,marisa

,SetFocus,nitori
#0１２３４５６７８９０１２３４
この完全憑依は\n都市伝説異変の影響である事は\n明らかである\,a,0,0,"So far it's clear this Perfect Possession is due \nto a consequence of the Urban Legend incident."
つまり都市伝説異変が収束すれば\n完全憑依も終わってしまう\nと言う事になる\,a,0,0,"And once the Urban Legend Incident is settled, \nPerfect Possession will end too."
,ClearBalloon,nitori

,SetFocus,marisa		,
,ImageDef,marisa,怒1,0,0
まさか、お前……\,a,0,0,"Don't tell me you're……"
,ClearBalloon,marisa

,SetFocus,nitori
,ImageDef,nitori,負1,0,0
#0１２３４５６７８９０１２３４
ふっふっふ\n異変が収まるその前に\n人工完全憑依を完成させる！\,a,0,0,"Hehehe. \nBefore the incident is settled, \nI'm going to perfect artificial Perfect Possession!"
,ClearBalloon,nitori

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,nitori,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kokoro2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
