#========================================================================
#	天子：ステージ1　試作　
#	場所：
#　 スレイブ：針妙丸　敵チーム：一輪　にとり
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"#名前,ソースファイル名
,DefineObject,tenshi,tenshi,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"#名前,ソースファイル名
,DefineObject,sinmyoumaru2,sinmyoumaru,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin,ichirin,2p,1040,0,true

#2Pslave
,LoadImageDef,nitori,"data/event/pic/nitori/face.pat"
,DefineObject,nitori2,nitori,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,ichirin_name,ichirin,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/nitori/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#非表示命令が機能しません
,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.team[1].current.Wait_Outside()"

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(404)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,tenshi,普1,0,0
,ImageDef,sinmyoumaru2,普2,0,0
,ImageDef,ichirin,驚1,0,0
,ImageDef,nitori2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,tenshi,-1280,	#対象フェイス表示開始
,SetFocus,tenshi	,
,ImageDef,tenshi,普1,0,0
こいつは誰？\,a,0,0,"Who's this?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,普2,0,0
お寺の修行僧だよ\n入道と仲良しの妖怪僧侶\,a,0,0,"A trainee monk at the temple. \nThe youkai monk who's friends with a nyudou."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,驚1,0,0
入道？\nああ、あの雲虫の事か\,a,0,0,"A Nyudou? \nOhh, that cloud bug."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,惑1,0,0
雲虫？\,a,0,0,"Cloud bug?"
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
天界では\n入道なんて虫ケラ扱いよ\,a,0,0,"In heaven, nyudou are like useless bugs."
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,ichirin,-1280,	#対象フェイス表示開始
,SetFocus,ichirin	,
,ImageDef,ichirin,驚1,0,0
あ、貴方はどっかで……\,a,0,0,"You...I've seen you somewhere……"
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,普2,0,0
ん？\n会ったことあったっけ？\,a,0,0,"Hmm? We've met?"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,普2,1,0,0
聖様と戦っているのを見ました\n天人様ですよね\,a,0,0,"I've seen you fighting with Lady Hijiri. \nYou're the celestial."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
いかにも！\nあんたらなんて\n足下にも及ばない高貴な人間よ！\,a,0,0,"Of course! \nYou guys are no match for a noble like me!"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,嬉1,0,0
聖様も神子様も言ってましたよ\nあの不良天人は出来損ないだって\,a,0,0,"Both Lady Hijiri and Lady Miko said that you're a delinquent Celestial."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,汗1,0,0
あー？\,a,0,0,"What?"
,ClearBalloon,tenshi

,SetFocus,ichirin	,
,ImageDef,ichirin,余1,0,0
#0１２３４５６７８９０１２３４
本物の天人は\n思いやりがあって\n戦闘にも長けていると\,a,0,0,"A real celestial is thoughtful and tactful in battle."
,ClearBalloon,ichirin

,SetFocus,tenshi	,
,ImageDef,tenshi,汗1,0,0
ほほう、言うねぇ\n地面に這い蹲っているだけの\nやろうどもが\,a,0,0,"Hoho, well said for a fool groveling on the ground."
#0１２３４５６７８９０１２３４
,ImageDef,tenshi,余1,0,0
丁度良い\nその天人の戦闘を見せてやろう！\,b,0,0,"Alright, let me show you a Celestial's battle!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,nitori2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(317)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,tenshi,負1,0,0
,ImageDef,sinmyoumaru2,負1,0,0
,ImageDef,ichirin,惑1,0,0
,ImageDef,nitori2,余1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,ichirin,-1280	,&#フェイス表示開始

,SetFocus,tenshi	,
,SetFocus,ichirin	,
,ImageDef,ichirin,惑1,0,0
#0１２３４５６７８９０１２３４
弱いわねぇ、こんなのが\n天上に住んでいるなんて\nがっかりだわ\,a,0,0,"You're weak. \nIt's disappointing something like this lives in Heaven."
,ClearBalloon,ichirin

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,nitori2,-1280,

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
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,余1,0,0
,ImageDef,ichirin,負1,0,0
,ImageDef,nitori2,負1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始
,Show,ichirin,-1280	,&#フェイス表示開始

,SetFocus,ichirin	,
,SetFocus,tenshi	,
#0１２３４５６７８９０１２３４
ふん\n入道と河童の組み合わせなんかに\n勝って当然だわ\,a,0,0,"Hmph, of course I'll win against a nyudou and a kappa."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,余1,0,0
#0１２３４５６７８９０１２３４
だいぶ慣れてきたねー\nうちらが最強コンビで\n間違いないね！\,a,0,0,"We've gotten pretty good. \nNo doubt we're the strongest duo now!"
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,余1,0,0
#0１２３４５６７８９０１２３４
ふっふっふ\n小人と言えば、元を辿れば\n高貴で知力に長けた種族\,a,0,0,"Hehehe. \nIf you trace back the origins of Inchlings, \nthey are a noble and intellectual species." 
,ImageDef,tenshi,嬉1,0,0
私に相応しい良いパートナーに\n出会えて嬉しいよ\,a,0,0,"I'm happy I met a partner worthy of me."
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,ichirin,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,nitori2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
