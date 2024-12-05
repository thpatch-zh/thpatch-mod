#========================================================================
#	女苑：ステージ4　試作　
#	場所：
#　 スレイブ：任意　敵チーム：聖　ドレミー
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
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(404)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,怒1,0,0
,ImageDef,shion2,汗1,0,0
,ImageDef,hijiri,普2,0,0
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

#,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
#,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,hijiri,-1280,	#対象フェイス表示開始
,SetFocus,hijiri	,
,ImageDef,hijiri,普2,0,0
女苑\n庭の掃除は終わったのかしら\,a,0,0,"Jyoon, did you finish cleaning the yard?"
,ClearBalloon,hijiri

,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,怒1,0,0
べー！\nいつまでも寺の掃除なんか\nしみったれた事やってられっか！\,a,0,0,"Whatever! \nI can't keep cleaning this Temple forever!"
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,驚1,0,0
逃げるのですか？\nでは、貴方を消滅させます\,a,0,0,"Are you going to run away? \nThen I will destroy you."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,余1,0,0
はあ？　消滅？\n出来るもんならやってみろよ\,a,0,0,"Huh? Destroy? \nTry it if you can."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,嬉1,0,0
#0１２３４５６７８９０１２３４
気が付かなかったのですか？\n貴方の脳内には\R[消滅爆弾|・・・・]が\n埋め込まれているのです\,a,0,0,"Did you not realize? \nYour brain is embedded with an extinction bomb."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
ん？　消滅爆弾？\nなんじゃそりゃ\,c,0,0,"Wha…? An extinction bomb? \nWhat's that."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
,ImageDef,hijiri,余1,0,0
私の呪文で発動しますよ\n貴方が反抗する場合は、唱えます\,a,0,0,"It will trigger with my spell. \nIf you oppose, I will start chanting."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
え、そんな冗談をー\,a,0,0,"What kind of joke is that."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,汗1,0,0
嘘かどうか判らないわ\nどうする？\,a,0,0,"I can't tell if it's a lie. \nWhat do you wanna do?"
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,余1,0,0
決まってるじゃない！\,b,0,0,"Duh!"
,ImageDef,jyoon,決1,0,0
呪文を唱えさせないように\n攻め続けるまでよ！\,b,0,0,"Attack so she can't chant the spell!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(304)",# 指定BGM再生開始

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
,ImageDef,hijiri,嬉1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,shion2,-1280	,&
,Show,hijiri,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,hijiri	,
,ImageDef,hijiri,嬉1,0,0
なーんてね\n消滅爆弾なんてあれば\n楽なんだけどね\,a,0,0,"As if. \nIt would be easier if there was a extinction bomb though."
,ClearBalloon,hijiri

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,jyoon,汗1,0,0
,ImageDef,shion2,驚1,0,0
,ImageDef,hijiri,負1,0,0
,ImageDef,doremy2,負1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始
,Show,hijiri,-1280	,&#フェイス表示開始

,SetFocus,hijiri	,
,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
#0１２３４５６７８９０１２３４
なーんだ\nこいつも夢の住人じゃん\,a,0,0,"Huh, she was a dream dweller too."
,ImageDef,jyoon,余1,0,0
消滅爆弾って嘘でしょ？\nビビって損したー\,a,0,0,"The extinction bomb was a lie right? \nWhat a waste of time being scared."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
#0１２３４５６７８９０１２３４
バレちゃった\n嫌な奴を簡単に消滅できる\n呪文はないかなー、って思ったの\,a,0,0,"You're right. \nI wish there was a spell to easily destroy those I hate."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,驚1,0,0
#0１２３４５６７８９０１２３４
人には苦労を強いるくせに\n随分横着な考えを持ってるのねぇ\,a,0,0,"Even though you force work on others… \nyou sure have a lazy way of thinking."
,ClearBalloon,jyoon

,SetFocus,hijiri	,
#0１２３４５６７８９０１２３４
楽をするのは悪ではないわ\n修業しなくても悟れればそれに\n越したことはないじゃない\,a,0,0,"Living comfortably isn't a sin. \nIt's better to reach enlightenment without meditation."
ところで貴方、逃げないでね\,a,0,0,"By the way, don't run away."
弟子達に修業だというていで\n掃除、炊事、洗濯をやらせて\nるんだからね。私が楽するために\,a,0,0,"I have my disciples clean, cook, and wash \nunder the guise of meditation training to make my life easier."
,ClearBalloon,hijiri

,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
これがぐうたら坊主の本音かしら\,a,0,0,"This must be the true colors of the lazy monk."
,ImageDef,jyoon,汗1,0,0
……変ね\n何か急に親近感が湧いてきた\,a,0,0,"……strange. \nI suddenly feel close to her."
,ImageDef,jyoon,余1,0,0
もうちょっとお寺で\n居候してみようかな\,a,0,0,"Maybe I'll stay at the temple a little longer."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,驚1,0,0
じょ、女苑\T[!?]\,a,0,0,"Jyo, Jyoon!?"
,ClearBalloon,shion2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
