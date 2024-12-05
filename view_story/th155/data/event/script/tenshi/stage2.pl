#========================================================================
#	天子：ステージ2　試作　
#	場所：
#　 スレイブ：針妙丸　敵チーム：こころ　ドレミー
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
,LoadImageDef,kokoro,"data/event/pic/kokoro/face.pat"
,DefineObject,kokoro,kokoro,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,kokoro_name,kokoro,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kokoro/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#非表示命令が機能しません
,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,tenshi,普1,0,0
,ImageDef,sinmyoumaru2,普1,0,0
,ImageDef,kokoro,普1,0,0
,ImageDef,doremy2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,tenshi,-1280,	#対象フェイス表示開始
,SetFocus,tenshi	,
,ImageDef,tenshi,普2,0,0
こいつは？\,a,0,0,"Who's this?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,普1,0,0
お面の妖怪\n私もよく判らないけど\n付喪神の一種よ\,a,0,0,"I don't really know about mask youkai but it's type of tsukumogami." 
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,余1,0,0
付喪神か\nこれまた下賤な奴だな\,a,0,0,"A tsukumogami. \nAnother lowly thing."
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,kokoro,-1280,	#対象フェイス表示開始
,SetFocus,kokoro	,
,ImageDef,kokoro,普1,0,0
誰？\,a,0,0,"Who's this?"
,ClearBalloon,kokoro

,Hide,kokoro,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2	,
,ImageDef,doremy2,惑1,0,0
#0１２３４５６７８９０１２３４
彼女は、天人です\n最近下らない理由で天界を\n謹慎、追放されました\,a,0,0,"She is a celestial. \nShe was recently confined and expelled from Heaven for a stupid reason."
,ClearBalloon,doremy2

,SetFocus,tenshi	,
,ImageDef,tenshi,驚2,0,0
な？\n何故そんなことを知っている？\,a,0,0,"Wha- How do you know that?"
,ClearBalloon,tenshi

,SetFocus,doremy2	,
,ImageDef,doremy2,嬉1,0,0
夢の世界の貴方が\n愚痴ってましたよ\,a,0,0,"Your Dream World self was complaining."
,ClearBalloon,doremy2

,SetFocus,tenshi	,
,ImageDef,tenshi,惑1,0,0
夢の世界だと？\nお前は一体……\,a,0,0,"Dream World? \nWho in the world are you……"
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,SetFocus,doremy2	,
,ImageDef,doremy2,敵1,0,0
私はドレミースイート\n夢の支配者です\,a,0,0,"I am Doremy Sweet, Ruler of Dreams."
,ImageDef,doremy2,普2,0,0
そしてこちらが\n夢の世界の秦こころ\,a,0,0,"And this is Hata no Kokoro from the Dream World."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,kokoro	,
,ImageDef,kokoro,怒1,0,0
この人、醜い感情だらけです\nとても天上の人とは思えません\,a,0,0,"This person is full of ugly emotions. \nI can't believe this is a celestial."
,ImageDef,kokoro,決1,0,0
この様な感情が醜い者の存在は\n受け付けません！\,a,0,0,"I can't accept the existence of someone with such ugliness."

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(310)",# 指定BGM再生開始

さっさと消えうせよ！\,b,0,0,"Get lost!"
,ClearBalloon,kokoro


#全員フェイス撤去
,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kokoro,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,


,Sleep,60

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
,ImageDef,kokoro,嬉1,0,0
,ImageDef,doremy2,余1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,kokoro,-1280	,&#フェイス表示開始

,SetFocus,tenshi	,
,SetFocus,kokoro	,
,ImageDef,kokoro,汗1,0,0
#0１２３４５６７８９０１２３４
甘やかされて育ったんでしょうね\n感情のコントロールが\n出来ていません\,a,0,0,"You must've been spoiled as a child. \nYou can't control your emotions at all."
,ClearBalloon,kokoro

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kokoro,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,余1,0,0
,ImageDef,kokoro,負1,0,0
,ImageDef,doremy2,普1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始
#,Show,kokoro,-1280	,&#フェイス表示開始
,Show,doremy2,-1280	,#フェイス表示開始

,SetFocus,doremy2	,
,SetFocus,tenshi	,

,Sleep,40
,Function,"::battle.team[1].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#0１２３４５６７８９０１２３４
夢の世界の連中だって？\n弱い奴ほどよく吠える\,a,0,0,"You said you're from the Dream World? \nThe weaker they are, the louder they bark."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,驚1,0,0
こいつ初めて見たー\n夢の支配者って、本当？\,a,0,0,"It's my first time seeing her. \nAre you really the ruler of dreams?"
,ClearBalloon,sinmyoumaru2

,SetFocus,doremy2	,
ええ、勿論です\,a,0,0,"Of course."
,ClearBalloon,doremy2

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,惑1,0,0
#0１２３４５６７８９０１２３４
じゃあ、さっき言ってた\n天界を追放されたってのは本当？\,a,0,0,"So what you said earlier about being exiled from Heaven is true?"
,ClearBalloon,sinmyoumaru2

,SetFocus,doremy2	,
,ImageDef,doremy2,普2,0,0
#0１２３４５６７８９０１２３４
本人がいるのですから\n聞いてみたら如何です？\,a,0,0,"The person in question is right there. \nWhy don't you ask her yourself?"
,ClearBalloon,doremy2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,汗1,0,0
#0１２３４５６７８９０１２３４
まあ、追放は本当だよ\nといっても理不尽な理由でさー\,a,0,0,"Well, it's true I was exiled. \nBut it was a ridiculous reason."
,ImageDef,tenshi,普2,0,0
私は生粋の天人で、生まれながら\n偉いからなんも仕事しなくても\n良いんだけどさー\,a,0,0,"I'm a pure celestial and I've been important since I was born, \nso I don't need to work."
,ImageDef,tenshi,惑1,0,0
暇だから美味しくもない催事用の\n\R[丹|たん]をつまみ食いしただけなのに\nみんな大騒ぎで\,a,0,0,"And I was bored so I took a taste of some beef tongue for a festival. \nIt didn't even taste good but everyone was so upset."
,ImageDef,tenshi,怒1,0,0
催事の準備の邪魔だって\n暫く地上に放り出されたの\n理不尽じゃない？\,a,0,0,"They said I was in the way of preparing for the festival, \nso I was kicked out to Earth for the time being. \nIsn't it ridiculous?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,汗1,0,0
あ、うん\nり、理不尽、なのかな？\,a,0,0,"Uh, yeah, err, it's ridiculous?"
,ClearBalloon,sinmyoumaru2

,Hide,doremy2,-1280, &
,Function,"::battle.team[1].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,kokoro	,
#0１２３４５６７８９０１２３４
理不尽だと思う理由が判らない\,a,0,0,"I don't understand why it's ridiculous."
,ClearBalloon,kokoro

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kokoro,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
