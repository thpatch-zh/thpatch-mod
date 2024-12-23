#========================================================================
#	董子：ステージ3　試作　
#	場所：
#　 スレイブ：ドレミー　　敵チーム：ドレミー　天子
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,usami,"data/event/pic/usami/face.pat"#名前,ソースファイル名
,DefineObject,usami,usami,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"#名前,ソースファイル名
,DefineObject,doremy2,doremy,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy,doremy,2p,1040,0,true

#2Pslave
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi2,tenshi,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,doremy_name,doremy,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/usami/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/tenshi2/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(405)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,usami,汗1,0,0
,ImageDef,doremy2,普2,0,0
,ImageDef,doremy,普1,0,0
,ImageDef,tenshi2,普1,0,0

#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,usami,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,usami		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,usami,汗1,0,0
ここは夢の世界だってー？\,a,0,0,"This is the Dream World?"
,ImageDef,usami,惑1,0,0
私の夢の世界は\n幻想郷の事じゃないのー？\,a,0,0,"My Dream World isn't the Gensokyo?"
,ClearBalloon,usami#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,usami,-1280,

#,Function,"::battle.team[1].current.StageIn_Fall()"
,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,doremy,-1280,&	#対象フェイス表示開始
,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,普2,0,0
説明しましょう\,a,0,0,"Let me explain."
,ClearBalloon,doremy

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,驚1,0,0
うわあ、何か出てきた\,a,0,0,"Woah, something appeared."
,ImageDef,usami,普1,0,0
ってあれ？\n貴方は何処かで見た様な\,a,0,0,"Wait. \nI think I've seen you somewhere."
,ClearBalloon,usami#吹き出し消去

,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,普1,0,0
#0１２３４５６７８９０１２３４
さっきからずっと\n貴方に完全憑依しています\,a,0,0,"I've been Perfect Possessing you since the beginning."
,ImageDef,doremy,惑1,0,0
#0１２３４５６７８９０１２３４
盧生や荘子のように\n現の人間が夢の世界に紛れ込むと\n皆、我を失いがちです\,a,0,0,"As Lusheng and Zhuangzi said, \nwhen real humans find themselves in the Dream World, they tend to lose themselves."
,ImageDef,doremy,余1,0,0
私は貴方がそうならないように\n完全憑依して監視していました\,a,0,0,"I Perfect Possessed and monitored you so that wouldn't happen."
,ClearBalloon,doremy

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,惑1,0,0
完全憑依……？\n何それ\,a,0,0,"Perfect Possession……? \nWhat's that."
,ClearBalloon,usami#吹き出し消去

,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,驚1,0,0
#0１２３４５６７８９０１２３４
完全憑依とは、精神、肉体全てを\n乗っ取る行為です\,a,0,0,"Perfect Possession is an action where both the mind and body is possessed."
,ClearBalloon,doremy

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,汗1,0,0
#0１２３４５６７８９０１２３４
つまり私に取り憑いているの？\n貴方が？\,a,0,0,"So I'm possessed? \nAnd you did it?" 
,ClearBalloon,usami#吹き出し消去

,SetFocus,doremy		,#発言中キャラを指定
,ImageDef,doremy,決1,0,0
そうです\,a,0,0,"Exactly."
,ClearBalloon,doremy

,SetFocus,usami		,	#発言キャラを指定
,ImageDef,usami,怒1,0,0
やだやだやだ！\n今すぐに私の身体から出ていけ！\,a,0,0,"No, no no no! \nGet out of me right now!"
,ClearBalloon,usami#吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,doremy,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy3,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(316)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,usami,負1,0,0
,ImageDef,doremy2,負1,0,0
,ImageDef,doremy,普1,0,0
,ImageDef,tenshi2,余1,0,0

,Show,usami,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,doremy,-1280	,&#フェイス表示開始
,SetFocus,usami

,SetFocus,doremy
,ImageDef,doremy,普2,0,0
さて\n夢の住人の暴走を止めなくちゃね\,a,0,0,"Now I need to stop the reckless dream dwellers."
,ClearBalloon,doremy

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,doremy,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,tenshi2,-1280,

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
,ImageDef,usami,惑1,0,0
,ImageDef,doremy2,決1,0,0
,ImageDef,doremy,普1,0,0
,ImageDef,tenshi2,負1,0,0

,Show,usami,-1280	,&#フェイス表示開始,Show,doremy,-1280	,&#フェイス表示開始

,SetFocus,usami		,
,SetFocus,doremy
私を倒しても\n何も変わりませんよ\,a,0,0,"Even if you defeat me, nothing will change."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,惑1,0,0
貴方は一体\,c,0,0,"Just who are you?"
,ClearBalloon,usami

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,SetFocus,doremy
,ImageDef,doremy,敵1,0,0
私はドレミースイート\n夢の支配者です\,a,0,0,"I am Doremy Sweet. \nThe ruler of Dreams."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,驚1,0,0
夢の支配者ですって……？\n夢の世界というのは本当なのか\,a,0,0,"The ruler of Dreams……? \nSo the Dream World really does exist."
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,普2,0,0
貴方は、夢を見る度に\n幻想郷に来訪していました\,a,0,0,"Each time you dream, you have been visiting the Gensokyo."
#0１２３４５６７８９０１２３４
,ImageDef,doremy,普1,0,0
それは普段から\n夢の世界の貴方を追い出して\n現の貴方が乗っ取っていたのです\,a,0,0,"All this time, \nthe real you forced out and took over the Dream World you."
,ImageDef,doremy,惑1,0,0
夢の世界では貴方は\nイレギュラーな存在なのですよ\,a,0,0,"In the Dream World, you are an irregular presence."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,汗1,0,0
うーむ\nよく判らない\n結局私はどういう状況なのかしら\,a,0,0,"Hmm. \nI don't really understand. So what kind of situation am I in?"
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,怒1,0,0
#0１２３４５６７８９０１２３４
抑圧され続けた夢の世界の貴方が\n暴走しています\,a,0,0,"The Dream World you who was continuously oppressed is now out of control."
,ImageDef,doremy,普1,0,0
彼女は現の世界に行き\n貴方の代わりに暴れていますよ\,a,0,0,"She has gone to the Real World, and is causing trouble in your stead."
,ImageDef,doremy,嬉1,0,0
#0１２３４５６７８９０１２３４
今まで抑圧されていた分\n派手に暴れているでしょうね\,a,0,0,"For the amount she's been oppressed so far, \nshe's probably causing quite a scene."
,ImageDef,doremy,余1,0,0
その間、貴方は夢の世界から\n出ることは出来ないでしょう\,a,0,0,"During that time, you cannot leave the Dream World."
,ClearBalloon,doremy

,SetFocus,usami		,
,ImageDef,usami,驚1,0,0
夢の世界から出られないって\nそれは困るー\,a,0,0,"I can't leave the Dream World? \nThat's a problem."
,ImageDef,usami,惑1,0,0
何とかする方法は無いの？\,a,0,0,"Isn't there something I can do?"
,ClearBalloon,usami

,SetFocus,doremy
,ImageDef,doremy,嬉1,0,0
#0１２３４５６７８９０１２３４
貴方が夢の世界の貴方に\nしてきた事を思えば\nこのくらい我慢するべきでしょう\,a,0,0,"If you think about what you've done to your Dream World self so far, \nyou should endure this much."
,ImageDef,doremy,決1,0,0
当然、何とも手段はありません\,a,0,0,"And of course, there's no method."
,ClearBalloon,doremy

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Hide,futo,-1280, &
,Function,"::battle.team[0].current.StageOut_SlideUpper()"#自チームが画面上へジャンプ離脱
,Sleep,100,#ウェイト命令
#
#菫子が消える演出が必要と思います
#

,SetFocus,doremy
,ImageDef,doremy,驚1,0,0
ええ？消えてしまった\,a,0,0,"What? She disappeared."
#0１２３４５６７８９０１２３４
,ImageDef,doremy,惑1,0,0
おかしいわねぇ\n夢の彼女に何かあったのかしら\,a,0,0,"That's strange. \nMaybe something happened to the Dream Sumireko."
,ImageDef,doremy,怒1,0,0
まあ、引き続き分身に\n完全憑依させて\n追跡を続けましょう\,a,0,0,"Well, let's continue this investigation by Perfect Possessing my other self."
,ClearBalloon,doremy

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,usami,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,doremy,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,tenshi2,-1280,

,Sleep,60

,End


# -------------------------------------------------------
