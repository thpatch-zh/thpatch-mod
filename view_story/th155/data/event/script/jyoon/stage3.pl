#========================================================================
#	女苑：ステージ2　試作　
#	場所：
#　 スレイブ：任意　敵チーム：神子　ドレミー
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"#名前,ソースファイル名
,DefineObject,jyoon,jyoon,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,shion,"data/event/pic/shion/face.pat"#名前,ソースファイル名
,DefineObject,shion2,shion,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(403)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,怒1,0,0
,ImageDef,shion2,普2,0,0
,ImageDef,miko,普2,0,0
,ImageDef,doremy2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,50#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#紫苑登場
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,miko,-1280,	#対象フェイス表示開始
,SetFocus,miko	,
,ImageDef,miko,普2,0,0
ほう、お前達\n自ら死にに来たのだな\n安楽死など決してさせぬぞ\,a,0,0,"Ah, you came to die by your own will. \nDon't expect a mercy killing."
,ClearBalloon,miko

,SetFocus,jyoon	,
,ImageDef,jyoon,怒1,0,0
いきなり乱暴だなぁ\,a,0,0,"So rude."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,普2,0,0
でもこれだけじゃ\n夢の住人か判らないわねぇ\,a,0,0,"It's not enough to tell if it's a dream dweller."
,ClearBalloon,shion2

,SetFocus,shion2	,
,ImageDef,shion2,汗1,0,0
いつもこういう奴かもしれない\,a,0,0,"She might always be like this."
,ClearBalloon,shion2

,SetFocus,miko	,
,ImageDef,miko,怒1,0,0
#0１２３４５６７８９０１２３４
貧すれば鈍する\nお前達の存在は\nこの世の害悪である\,a,0,0,"A light purse makes a heavy heart. \nYour existence is an evil to this world."
,ImageDef,miko,余1,0,0
いまここで消滅させてやろう\,a,0,0,"Let me eliminate you now."
,ClearBalloon,miko

,SetFocus,jyoon	,
,ImageDef,jyoon,驚1,0,0
#0１２３４５６７８９０１２３４
排他的な奴だなー\n和を以て貴しとなすんじゃ\nなかったのかよ\,a,0,0,"So snooty. \nWasn't it harmony is the greatest of virtues?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,怒1,0,0
#0１２３４５６７８９０１２３４
夢の住人だろうが違おうが\nこんなやつ構わないよ\,a,0,0,"I don't care if she's a dream dweller or not."
,ImageDef,shion2,決1,0,0
やっつけちゃえ！\,b,0,0,"Get her!"
,ClearBalloon,shion2

,SetFocus,miko	,
,ImageDef,miko,決1,0,0
#0１２３４５６７８９０１２３４
お前達みたいな\n心の底から貧しい奴らを\n認める和など持ち合わせていない\,a,0,0,"I have no peace for those who are poor from the bottom of the heart like you."
即刻この世界から消え失せよ！\,b,0,0,"Leave this world at once!"
,ClearBalloon,miko

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(306)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,jyoon,負1,0,0
,ImageDef,shion2,負1,0,0
,ImageDef,miko,余1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,shion2,-1280	,&#フェイス表示開始
,Show,miko,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,miko	,
,ImageDef,miko,余1,0,0
現実の私は甘いな\nもっと力を見せつければ\n良いのに\,a,0,0,"My Real World self is too soft. \nI should show off more of my power."
,ClearBalloon,miko

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,miko,負1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始
,Show,miko,-1280	,&#フェイス表示開始

,SetFocus,miko	,
,SetFocus,jyoon	,
#0１２３４５６７８９０１２３４
やっぱり夢の住人だったねー\nよーし、ゲットだー\,a,0,0,"A dream dweller just like I thought. \nAll right, we got her!"
,ClearBalloon,jyoon

,SetFocus,miko	,
#0１２３４５６７８９０１２３４
悔しいな\n現の私ならお前達を\n活かそうとするだろう\,a,0,0,"How frustrating. \nMy Real World self would probably let you live."
,ClearBalloon,miko

,SetFocus,miko	,
ここでこの世の悪を滅せないのが\n無念である\nそれが口惜しい\,a,0,0,"It's unfortunate evil in this world cannot be destroyed. \nAnd disappointing."
,ClearBalloon,miko

,SetFocus,shion2	,
,ImageDef,shion2,汗1,0,0
#0１２３４５６７８９０１２３４
はいはい\nあんたは本気で私達の事を\n嫌っているんだね\,a,0,0,"Ok ok, you really hate us, don't you?"
,ImageDef,shion2,余1,0,0
もう慣れっこよ\,a,0,0,"We're used to it."
,ClearBalloon,shion2

,SetFocus,miko	,
#0１２３４５６７８９０１２３４
嫌っているのではない\nこの世から消さなければいけない\n使命に駆られているのだ\,c,0,0,"I do not hate you. \nI am driven by a mission to destroy those who must be from ridden from this world."
それが幻想郷の和である\,a,0,0,"That is the peace of Gensokyo."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
