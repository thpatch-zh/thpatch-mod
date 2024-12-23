#========================================================================
#	布都：ステージ5　試作　
#	場所：
#　 スレイブ：一輪　敵チーム：聖　　　　神子
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,futo,"data/event/pic/futo/face.pat"#名前,ソースファイル名
,DefineObject,futo,futo,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"#名前,ソースファイル名
,DefineObject,ichirin2,ichirin,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko2,miko,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/futo/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/miko/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
,ImageDef,ichirin2,決1,0,0
,ImageDef,hijiri,普1,0,0
,ImageDef,miko2,余2,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,hijiri,-1280,&	#対象フェイス表示開始
,SetFocus,hijiri		,#発言中キャラを指定
調査ご苦労様\n何か新しい情報はありましたか？\,a,0,0,"Good job with the investigation. \nDid you find any new information?"
,ClearBalloon,hijiri

,Show,futo,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,
,SetFocus,futo		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
大変、有意義な調査であった\,a,0,0,"It was a very productive investigation."
,ClearBalloon,futo#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,嬉1,0,0
それは良かったです\n疫病神貧乏神コンビの攻略の\n手助けになるでしょう\,a,0,0,"I'm glad to hear that. \nIt should be helpful in capturing the Pestilence god and Poverty god."
,ClearBalloon,hijiri

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,惑1,0,0
#0１２３４５６７８９０１２３４
その話だが……\,a,0,0,"About that……"
,ClearBalloon,futo#対象の吹き出し消去

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,敵1,0,0
#0１２３４５６７８９０１２３４
最凶の敵を倒す役は我々がやる\nいや、やらせてくれないだろうか\,a,0,0,"We shall conquer the horrible enemy. \nNo, will you let us?"
,ClearBalloon,futo#対象の吹き出し消去

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,惑1,0,0
はあ？\,c,0,0,"Hmm?"
,ClearBalloon,hijiri

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,普1,0,0
#0１２３４５６７８９０１２３４
数々の完全憑依戦を\n行ってきて判ったことがある\,a,0,0,"I have learned something after several Perfect Possession battles."
,ImageDef,futo,惑1,0,0
大変申し上げにくいのだが\nお二人ではコンビネーションに\n問題がある\,a,0,0,"It is very difficult for me to say this \nbut there is a problem with the combination between the two of you."
,ImageDef,futo,決1,0,0
だが、我々ならば\nマスタースレイブの枠に\n囚われぬ戦いが出来る！\,b,0,0,"However, Ichirin and I can fight without the constraints of Master and Slave."
,ClearBalloon,futo#対象の吹き出し消去

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,miko2,-1280,	#対象フェイス表示開始
,SetFocus,miko2,	#発言中キャラを指定
,ImageDef,miko2,余1,0,0
#0１２３４５６７８９０１２３４
ほほう\n面白い事を言うじゃないか\,a,0,0,"Aha, you say something interesting"
,ImageDef,miko2,余2,0,0
つまり、我々より\nお前達の方が強いと言うのだな\,a,0,0,"So you mean to say you are stronger than us." 
,ClearBalloon,miko2

,SetFocus,futo		,	#発言キャラを指定
,ImageDef,futo,汗1,0,0
あ、いやその\,a,0,0,"Oh, I did not..."
,ClearBalloon,futo#対象の吹き出し消去

,SetFocus,miko2,	#発言中キャラを指定
,ImageDef,miko2,嬉1,0,0
#0１２３４５６７８９０１２３４
わっはっは\n構わぬ、結構だ\,b,0,0,"Hahaha. \nI don't mind. It's fine."
,ClearBalloon,miko2

,Hide,miko2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,惑1,0,0
#0１２３４５６７８９０１２３４
一輪や\nお前もそう思っているのかい\,a,0,0,"Ichirin, is that what you think too?"
,ClearBalloon,hijiri

,Hide,futo,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,ichirin2,-1280,	#対象フェイス表示開始
,SetFocus,ichirin2		,#発言中キャラを指定
,ImageDef,ichirin2,決1,0,0
#0１２３４５６７８９０１２３４
ええ、勝てると思います！\nあ、勿論\n疫病神貧乏神のコンビに、ですよ\,a,0,0,"Yes, I think we can win! \nOh, against the Pestilence god and Poverty god of course."
,ClearBalloon,ichirin2,

,Hide,hijiri,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,SetFocus,miko2,	#発言中キャラを指定
,ImageDef,miko2,決1,0,0
#0１２３４５６７８９０１２３４
大口叩くのなら\n我々相手に実践して見せよ\,a,0,0,"If you're going to brag, then practice on us."
,ImageDef,miko2,嬉1,0,0
良いだろう？　聖白蓮よ\nこの様な余興も悪くない\,a,0,0,"Isn't it fine? Hijiri Byakuren, \nthis kind of entertainment isn't bad either."
,ClearBalloon,miko2

,Hide,miko2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,汗1,0,0
#0１２３４５６７８９０１２３４
しょうがないわねぇ\n実戦で自信を付け過ぎちゃった\nみたいね\,a,0,0,"It can't be helped. \nThey've become too confident from fighting."
,ImageDef,hijiri,決1,0,0
#0１２３４５６７８９０１２３４
では、その調査結果\n私達相手に見せつけるが良い！\,a,0,0,"Well then, show us your investigation results by fighting us."
,ClearBalloon,hijiri

,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,miko2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(354)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,futo,負1,0,0
,ImageDef,ichirin2,負1,0,0
,ImageDef,hijiri,余1,0,0
,ImageDef,miko2,余1,0,0

,Show,futo,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,ichirin2,-1280	,&
,Show,hijiri,-1280	,&#フェイス表示開始

,SetFocus,futo
,SetFocus,hijiri
,ImageDef,hijiri,余1,0,0
もう、すぐに調子乗るんだから\,a,0,0,"You get carried away too quickly."
,ClearBalloon,hijiri

,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,miko2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,futo,普2,0,0
,ImageDef,ichirin2,決1,0,0
,ImageDef,hijiri,普1,0,0
,ImageDef,miko2,余2,0,0

,Show,futo,-1280	,&#フェイス表示開始
,Show,hijiri,-1280	,&#フェイス表示開始
,SetFocus,futo
,SetFocus,hijiri

,SetFocus,hijiri
,ImageDef,hijiri,驚1,0,0
お前達、中々やるじゃない\,a,0,0,"You two are pretty good."
,ClearBalloon,hijiri

,SetFocus,futo
,ImageDef,futo,決1,0,0
まだまだ、ぬるいぞ！\,a,0,0,"You still have a long way to go!"
,ClearBalloon,futo


,SetFocus,hijiri
,ImageDef,hijiri,惑1,0,0
だが、忘れるな！\n驕りは敗北に繋がる……\,a,0,0,"But don't forget! Arrogance leads to defeat....."
,ClearBalloon,hijiri

,SetFocus,hijiri
,ImageDef,hijiri,決1,0,0
我々が思い知ったようにね！\,a,0,0,"As we have already learned!"
,ClearBalloon,hijiri

#全員フェイス撤去
,Hide,futo,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,ichirin2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,miko2,-1280,

,Sleep,30

,Function,"::battle.Lose()",# 対戦再開命令

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
