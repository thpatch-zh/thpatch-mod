#========================================================================
#	鈴仙：ステージ2　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：聖　一輪
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
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"
,DefineObject,hijiri,hijiri,2p,1040,0,true

#2Pslave
,LoadImageDef,ichirin,"data/event/pic/ichirin/face.pat"
,DefineObject,ichirin2,ichirin,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,hijiri_name,hijiri,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/hijiri/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(404)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,udonge,嬉1,0,0
,ImageDef,doremy2,普2,0,0
,ImageDef,hijiri,普1,0,0
,ImageDef,ichirin2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,udonge,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,udonge		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,udonge,嬉1,0,0
出ておいでー！\,a,0,0,"Come out, come out!"
,ClearBalloon,udonge#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,hijiri,-1280,&	#対象フェイス表示開始
,SetFocus,hijiri		,#発言中キャラを指定
あら、月の兎ね\,a,0,0,"Oh! It's the Moon Rabbit."
,ImageDef,hijiri,嬉1,0,0
あれから都市伝説異変の事も\n調べて調査結果が出たわ\,a,0,0,"I continued looking into the Urban Legend Incident, and I found something."
#0１２３４５６７８９０１２３４
,ImageDef,hijiri,惑1,0,0
異変を起こした張本人らしき人を\n見かけたという噂を聞いたの\,a,0,0,"There's a rumor someone's seen the person responsible for the Incident."
,ImageDef,hijiri,余1,0,0
それは確かに月の民でしたね\n永遠亭と都市伝説異変の関わりが\n明らかになって来たのですが\,a,0,0,"It was definitely a Lunarian. \nThe connection between Eientei and the Urban Legend Incident is clearer"
,ImageDef,hijiri,普1,0,0
それについてどう思っています？\,a,0,0,"But what do you think about this?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,余1,0,0
#0１２３４５６７８９０１２３４
そんな話はどうでも良いわ\,b,0,0,"I don't care about that."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,驚1,0,0
はい？\,a,0,0,"Yes?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,怒1,0,0
#0１２３４５６７８９０１２３４
潜在意識で私は貴方に\nイラついているらしい\,a,0,0,"I seem to be unconsciously annoyed with you."
このイラつきは戦わないと\n晴れないわ\,a,0,0,"I need to fight you or this irritation won't disappear."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,汗1,0,0
どうしたの？\n完全憑依戦をしたいの？\,a,0,0,"What's wrong? \nDo you want to do a Perfect Possession battle?"
,ClearBalloon,hijiri

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,嬉1,0,0
完全憑依\nそれには感謝しているよ\,a,0,0,"Perfect Possession. \nI'm so grateful for it."
それがなければ私が現の世界に\n出てこられなかったからね\,a,0,0,"If it wasn't for that, I wouldn't be here in the Real World."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,惑1,0,0
会話が成り立たない\nどうも別の世界の人と\n会話しているような\,c,0,0,"This conversation is impossible. \nI seem to be having a conversation with someone from a different world."
,ClearBalloon,hijiri

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,普2,0,0
#0１２３４５６７８９０１２３４
ご名答\nここにいるのは夢の世界の鈴仙\n貴方の知っている鈴仙ではないわ\,a,0,0,"Quite so. This is Reisen from the Dream World. \nNot the Reisen you know."
,ClearBalloon,doremy2

,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,普2,0,0
あら、完全憑依してたのね\n貴方は誰かしら？\,a,0,0,"Oh, so you were Perfect Possessing her. \nAnd who might you be?"
,ClearBalloon,hijiri

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,敵1,0,0
私はドレミースイート\n夢の世界の支配者です\n以後お見知りおきを\,a,0,0,"I am Doremy Sweet. The ruler of the Dream World. \nPleased to make your acquaintance." 
,ClearBalloon,doremy2

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(353)",# 指定BGM再生開始

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,余1,0,0
,ImageDef,hijiri,驚1,0,0
#0１２３４５６７８９０１２３４
さあ、もう良いわね\n折角の現の世界、普段は言えない\n事を言わせて貰うよ！\,a,0,0,"Are you done? \nNow that I'm in the Real World, I'd like to say a few things."
,ImageDef,udonge,決1,0,0
偽善珍走坊主め！\n後から出てきた癖に\n上から見やがって！\,b,0,0,"You hypocrite monk! \nYou came out later so stop looking down on me!"
いつも冷静なその顔を\n狂気に歪めてやる！\,b,0,0,"I'll twist that calm face of yours off!"
,ClearBalloon,udonge#吹き出し消去


#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

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
,ImageDef,hijiri,汗1,0,0
,ImageDef,ichirin2,余1,0,0

,Show,udonge,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,hijiri,-1280	,&#フェイス表示開始

,SetFocus,udonge		,
,SetFocus,hijiri		,#発言中キャラを指定
,ImageDef,hijiri,汗1,0,0
なんだったのでしょう……\,a,0,0,"I wonder what that was……."
,ClearBalloon,hijiri

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

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
,ImageDef,doremy2,余1,0,0
,ImageDef,hijiri,負1,0,0
,ImageDef,ichirin2,負1,0,0

,Show,udonge,-1280	,&#フェイス表示開始
,Show,hijiri,-1280	,#フェイス表示開始



,SetFocus,hijiri		,#発言中キャラを指定
,SetFocus,udonge		,
よし、スッキリした\n楽しかったわー\,a,0,0,"Ah, I feel refreshed. \nThat was fun."
,ClearBalloon,udonge

,SetFocus,hijiri		,#発言中キャラを指定
なんかモヤモヤするわー\n戦う前に変な事言われたような\,c,0,0,"I feel uneasy, like something strange was said before the fight."
,ClearBalloon,hijiri

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,普1,0,0
#0１２３４５６７８９０１２３４
夢の世界の住人は\n感受性が豊かです\,a,0,0,"The Dream World dwellers are highly sensitive."
,ImageDef,doremy2,普2,0,0
普段思っている事が何倍にも\n増幅して表現される事があります\,a,0,0,"One's usual feelings can be expressed tenfold."
,ClearBalloon,doremy2

,SetFocus,hijiri		,#発言中キャラを指定
普段思っているのね\,a,0,0,"Even though it's what they usually think."
,ClearBalloon,hijiri

# =====
,Hide,doremy2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,udonge		,
,ImageDef,udonge,余1,0,0
よーし、次はあいつだね！\,a,0,0,"All right, next is that one!"
,ClearBalloon,udonge

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,hijiri,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,ichirin2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
