#========================================================================
#	鈴仙：ステージ1　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：魔理沙　　霊夢
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa2,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(402)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普1,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,reimu,惑1,0,0
,ImageDef,marisa2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,udonge,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,udonge		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
……波長が良くないな\,a,0,0,"These wavelengths are no good."
,ClearBalloon,udonge#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,普2,0,0
今夜の月は\n一段と狂気の光を放っている\,a,0,0,"Tonight's moon is emitting a particularly insane light.
,ClearBalloon,udonge#吹き出し消去

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,汗1,0,0
こんな日は\n悪い事が起こるんだよねぇ\,a,0,0,"I have a bad feeling something's going to happen on these kind of days."
,ClearBalloon,udonge#吹き出し消去

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示

,Show,reimu,-1280,&	#対象フェイス表示開始
,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,惑1,0,0
やっぱりあんたね？\,a,0,0,"So it was you."
,ClearBalloon,reimu

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,普1,0,0
竹林で狂気の兎が\n暴れているって聞いたけど\,a,0,0,"I heard a mad rabbit was causing trouble in the bamboo forest."
,ClearBalloon,reimu

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,惑1,0,0
げー\n予感的中の予感\,a,0,0,"Ugh, just as I predicted."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,余1,0,0
狂気って言ったらあんただもん\,a,0,0,"If we're talking about insane, that'd be you."
,ClearBalloon,reimu

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,驚1,0,0
はいはい\n暴れていたつもりはないけど\,a,0,0,"Yes, yes. \nI didn't mean to create a scene."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,惑1,0,0
あれー？\nあんた、なんかいつもと違う？\,a,0,0,"Hmm... \nSomething seems different about you today."
,ClearBalloon,reimu
,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,驚1,0,0
ほほう\,c,0,0,"Aha."
,Function,"::sound.PlayBGM(352)",# 指定BGM再生開始
,ImageDef,udonge,普1,0,0
流石は巫女、よく判ったねぇ\,a,0,0,"As expected of the Shrine Maiden. \nYou noticed well."
#0１２３４５６７８９０１２３４
,ImageDef,udonge,嬉1,0,0
私は夢の世界の\n鈴仙・優曇華院・イナバ\,a,0,0,"I'm Reisen Udongein Inaba from the Dream World."
,ImageDef,udonge,決1,0,0
貴方の知っている鈴仙とは異なる\nもう一人の鈴仙だ！\,a,0,0,"Different from the Reisen you know- I'm the other Reisen!"
,ClearBalloon,udonge#吹き出し消去

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,汗1,0,0
そのつまらない冗談……\nいつもの鈴仙かもしれない\,a,0,0,"What a bad joke…… maybe it is the usual Reisen."
,ClearBalloon,reimu

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,余1,0,0
冗談かどうか、勝負してみる？\,a,0,0,"Do you want to fight and see if it's a joke?"
,ClearBalloon,udonge#吹き出し消去


#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa2,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu,-1280,


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,udonge,負1,0,0
,ImageDef,doremy2,負1,0,0
,ImageDef,marisa2,惑1,0,0
,ImageDef,reimu,余1,0,0

,Show,udonge,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,reimu,-1280	,&#フェイス表示開始

,SetFocus,udonge		,
,SetFocus,reimu		,
,ImageDef,reimu,惑1,0,0
なんか変な鈴仙だったわねぇ\,a,0,0,"What a strange Reisen."
,ClearBalloon,reimu

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa2,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu,-1280,

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
,ImageDef,udonge,嬉1,0,0
,ImageDef,doremy2,普2,0,0
,ImageDef,marisa2,負1,0,0
,ImageDef,reimu,負1,0,0

#,Show,marisa2,-1280	,&#フェイス表示開始
,Show,reimu,-1280	,#フェイス表示開始

,SetFocus,reimu		,
#0１２３４５６７８９０１２３４
夢の支配者とコンビを\n組んでいるなんて\nどうして……\,c,0,0,"Why are you working with the Dream Ruler……."
,ClearBalloon,reimu

,Hide,reisen,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,doremy2,-1280,&	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,普1,0,0
#0１２３４５６７８９０１２３４
ここにいる鈴仙は\n貴方の知っている鈴仙では\nありません\,a,0,0,"The Reisen you see here, is not the Reisen you know."
,ImageDef,doremy2,普2,0,0
本当に夢の世界から\n出てきた鈴仙なのです\,a,0,0,"She is the Reisen from the Dream World."
,ClearBalloon,doremy2

,SetFocus,reimu		,
ふーん\n全然意味がわからないけど\,a,0,0,"Hmm I don't understand at all but"
あんたが出てきたって事は\n満更でもないのか\,a,0,0,"Seeing you here must means it's not all bad."
,ClearBalloon,reimu

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,惑1,0,0
完全憑依には副作用がある\,a,0,0,"Perfect Possession has side effects."
,ImageDef,doremy2,余1,0,0
と言う事です\n貴方も気に留めておいて\,a,0,0,"Please keep this in mind."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる

,Show,udonge,-1280	,&#フェイス表示開始
,SetFocus,udonge		,
,ImageDef,udonge,嬉1,0,0
#0１２３４５６７８９０１２３４
ふっふっふ、初めての現の世界よ\n何が待ち受けているのか楽しみね\,b,0,0,"Hehehe, it's my first time in the Real World. \nI'm excited to see what's to come."
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa2,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu,-1280,

,Sleep,60

,End

# -------------------------------------------------------
