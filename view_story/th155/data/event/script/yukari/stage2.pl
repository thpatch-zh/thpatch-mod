#========================================================================
#	紫：ステージ1　試作
#	場所：
#　 スレイブ：霊夢　敵チーム：紫苑
#　双方マスタースレイブが反転、スレイブは戦線離脱してタイマン　会話シーンでは全員登場OK
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#名前,ソースファイル名
,DefineObject,reimu,reimu,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,jyoon,"data/event/pic/jyoon/face.pat"
,DefineObject,jyoon2,jyoon,1p,240,0,false

#2Pmaster紫苑
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion,shion,2p,1040,0,true

#2Pslave
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"#名前,ソースファイル名
,DefineObject,yukari2,yukari,2p,1040,0,true#名前,グループ名,x,y,反転

,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

#スペルカードを夢想封印に固定
,Function,"::battle.team[0].master.spellcard.Initialize(0,0,0);"
,Function,"::battle.gauge.SetCard(0,::battle.team[0].master_name,0);"

,LoadAnimationLocal,"data/actor/story_title/yukari/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/shion/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/jyoon/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

#,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機


,Function,"::battle.Jyoon_Ban_ShionMode()"#1Pスレイブ女苑　紫苑の使用を封印
,Function,"::battle.Ban_Slave()"#双方のスレイブシステムを停止


#開始カメラ演出
#,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.StopBGM(10);"
#,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,驚1,0,0
,ImageDef,yukari2,普1,0,0
,ImageDef,shion,普1,0,0
,ImageDef,jyoon2,驚1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
#,Function,"::battle.Show_StageTitle()"#タイトルコール出現
#,Sleep,150


#ホワイトイン。
#霊夢と紫苑が立っている。

,Show,shion,-1280,	#対象フェイス表示開始
,SetFocus,shion	,
,ImageDef,shion,嬉1,0,0
よし、取り憑いた！\nこれで女苑の勝ちは確定した！\,a,0,0,"Alright, possessed! \nNow Jyoon's win is set!"
,Hide,shion,-1280,	#対象フェイス表示開始
,Sleep,60

,Show,shion,-1280,	#対象フェイス表示開始
,SetFocus,shion	,

,ImageDef,shion,惑1,0,0
……あれ、女苑？\n何処に行ったの？\,c,0,0,"……huh, Jyoon? \nWhere did you go?"
,ClearBalloon,shion

,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始

,Show,reimu,-1280,	#対象フェイス表示開始
,SetFocus,reimu	,
,ImageDef,reimu,驚1,0,0
はー、こういうことね\,a,0,0,"Ohhh, so that's what happened."
,ImageDef,reimu,汗1,0,0
紫の説明じゃ何が起こるのか\nよく判らなかったけど\,a,0,0,"I didn't really understand from Yukari's explanation earlier ."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,驚1,0,0
#0１２３４５６７８９０１２３４
む、お前\n何故自由に動いている？\,a,0,0,"You… You… why can you move around freely?"
,ImageDef,shion,惑1,0,0
女苑のスレイブになって\n自由を奪われている筈なのに……\,a,0,0,"You should've become Jyoon's slave and lost control."
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,惑1,0,0
#0１２３４５６７８９０１２３４
あんたは誰かに取り憑いて\n必ず負けさせる事が出来る能力を\n持っているのね\,a,0,0,"So you have the ability to possess someone and make them lose."
#,ClearBalloon,reimu

,ImageDef,reimu,普2,0,0
#0１２３４５６７８９０１２３４
それに妹の疫病神は\nスレイブを交換する形であんたを\n強制的に憑依させる事が出来る\,a,0,0,"And your sister, \nthe Pestilence God, can switch slaves and force you to be possessed."
,ImageDef,reimu,余1,0,0
つまり、強制的に対戦相手を\n敗北させる事が出来るという訳ね\,a,0,0,"Basically, you can force the opponent to lose."
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,呆1,0,0
まさに、最凶最悪の二人ねぇ\,a,0,0,"What a cursed and evil duo."
,ImageDef,reimu,決1,0,0
でも、真に最強の二人には\n敵わなかったね\,a,0,0,"But, you were no match for the truly strongest duo."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,怒1,0,0
#0１２３４５６７８９０１２３４
女苑に憑いたお前は身体の自由が\n利かなくなるはず……\,c,0,0,"You should have lost control of your body \nwhen Jyoon possessed you though……"
なのになんで動いている？\,a,0,0,"But how are you moving?"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,余1,0,0
よく見て\nあんた、マスター側になってるよ\,a,0,0,"Look closely. \nYou're on the master side."
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,驚1,0,0
え？\,a,0,0,"Huh?"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,余1,0,0
そして私もマスターよ\n紫がマスターとスレイブの境界を\n逆にしてくれたの\,a,0,0,"And I'm a master too. \nYukari reversed the gap of master and slave."
,ImageDef,reimu,決1,0,0
だから入れ替わったスレイブは\n紫とあんたの妹\,a,0,0,"So the switched slaves were Yukari and your sister."
,ClearBalloon,reimu

,Hide,reimu,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Show,jyoon2,-1280,	#対象フェイス表示開始
,SetFocus,jyoon2	,
,ImageDef,jyoon2,驚1,0,0
しまった！\n嵌められたよ！\,a,0,0,"Oh no! We were set up!"
,ImageDef,jyoon2,惑1,0,0
#0１２３４５６７８９０１２３４
私が敵のスレイブに\nなっちゃった！\,a,0,0,"I became the enemy's slave!"
,ClearBalloon,jyoon2

,SetFocus,shion	,
,ImageDef,shion,驚1,0,0
なんて事\t[!?]\,a,0,0,"What the…!?"
,ImageDef,shion,汗1,0,0
私は紫に取り憑いていないの？\nと言うことは\n自分のスレイブにはまさか！\,b,0,0,"I'm not possessing Yukari? \nWhich means my slave is…!"
,ClearBalloon,shion

,Hide,shion,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,ImageDef,jyoon2,驚1,0,0

,Show,yukari2,-1280,	#対象フェイス表示開始
,SetFocus,yukari2	,
,ImageDef,yukari2,普2,0,0
ご名答\nこれでは疫病神の能力も\n貧乏神の能力も意味ないわね\,a,0,0,"Quite right. \nWith this the Pestilence God's abilities and the Poverty God's \nabilities are meaningless."
,ImageDef,yukari2,余1,0,0
#0１２３４５６７８９０１２３４
さ、霊夢\n私はこれ以上協力は出来ないので\nこの貧乏神をサクッと倒してね\,a,0,0,"Now, Reimu, I can't help anymore so quickly destroy the Poverty God."
,ClearBalloon,yukari2

,Hide,yukari2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,shion	,
,ImageDef,shion,汗1,0,0
#0１２３４５６７８９０１２３４
マスターとスレイブを\n入れ替えるなんて\nそんな事出来る奴がいるとは！\,a,0,0,"That there was someone who could reverse master and slave!"
,ClearBalloon,shion

,SetFocus,jyoon2	,
,ImageDef,jyoon2,驚1,0,0
ああ、もう駄目だー\n姉さん一人で勝てるはずがない\,c,0,0,"Ahhh, it's over. \nThere's no one way Shion can win on her own."
,ClearBalloon,jyoon2

,SetFocus,jyoon2	,
,ImageDef,jyoon2,怒1,0,0
#0１２３４５６７８９０１２３４
戦闘でも全く役立たずだし\n根暗で貧乏くさくてしみったれで\n自分では何もしようとしないし\,a,0,0,"She's useless in battle, gloomy, reeks of poverty, and stingy. \nShe doesn't try to do anything on her own."
,ImageDef,jyoon2,惑1,0,0
#0１２３４５６７８９０１２３４
文句ばっかり言ってて\n何一つ良いところのない\n姉さん一人なんてー\,a,0,0,"All she does is complain with no good points."
,ClearBalloon,jyoon2

,SetFocus,jyoon2	,
,ImageDef,jyoon2,呆1,0,0
#0１２３４５６７８９０１２３４
大体ねぇ\n一度も勝利の経験がない貧乏神が\,a,0,0,"In the first place, the poverty god whose never won once,"
,ImageDef,jyoon2,惑1,0,0
よりによって異変解決の巫女と\n一騎打ちなんてー\,a,0,0,"And of all days a one on one fight against the Incident resolving shrine maiden-"
,ImageDef,jyoon2,惑1,0,0
もう絶望的だー\n完全敗北だー！\,c,0,0,"There's no hope! \nIt's a complete defeat!"
,ClearBalloon,jyoon2

,Hide,jyoon2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,reimu	,
,ImageDef,reimu,汗1,0,0
#0１２３４５６７８９０１２３４
辛辣なお別れの挨拶はもういいね\,a,0,0,"Are you done with the sarcastic goodbye?"
,ImageDef,reimu,嬉1,0,0
さ、人を負けにする能力以外は\n完全に無能のザコ貧乏神を倒して\nサクッと異変解決しようっと\,a,0,0,"All right, let's destroy this completely useless Poverty God \nwhose only ability is to make others lose. \nAnd then quickly resolve this incident."
,ClearBalloon,reimu


,SetFocus,shion	,
,ImageDef,shion,怒1,0,0
女苑、お前達……\,c,0,0,"Jyoon and you two……."
みんな馬鹿にしやがって\nそんなに言う事ないじゃない！\,b,0,0,"Everyone's looking down on me. \nYou don't have to say that much!"
,ClearBalloon,shion

,Hide,shion,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu,-1280,

,Function,"::battle.team[1].current.Set_BerserkAura(null)",#紫苑からオーラ。
,Function,"::battle.team[0].current.Story_ReimuShock(null)",#紫苑からオーラ。


,Sleep,60

#驚く霊夢

,SetFocus,shion	,
,ImageDef,shion,決2,0,0
私の名は、依神紫苑\,a,0,0,"My name is Shion Yorigami."
泣く子も不幸にする貧乏神だ！\,a,0,0,"A Poverty god that can make anyone miserable!"
,ClearBalloon,shion
#0１２３４５６７８９０１２３４

,SetFocus,reimu	,
,ImageDef,reimu,驚1,0,0
す、凄い負のオーラ！\,a,0,0,"What a terrible negative aura!"
,ClearBalloon,reimu

,SetFocus,shion	,
今まで本気を\n出さなかったのには訳がある\,a,0,0,"There's a reason I never made a serious effort."
#,ImageDef,shion,決2,0,0
私が本気を出すと\n自分も含めて全ての者が\n不幸になるからだ！\,b,0,0,"Because if I actually tried, everyone including me will become unfortunate!"
,ClearBalloon,shion

#,ImageDef,shion,決1,0,0
#0１２３４５６７８９０１２３４
もういい\n勝ち負けなんて興味は無い\,a,0,0,"I'm done. \nI don't care about winning or losing."
#,ImageDef,shion,怒1,0,0
私が本気になった以上\nここにいる全員を負けさせてやる\,c,0,0,"If I'm going to be serious, I'll make everyone here lose."
巫女も私も、女苑、お前もだ！\,b,0,0,"The shrine maiden, me, Jyoon, even you!"
,ClearBalloon,shion

,SetFocus,reimu	,
,ImageDef,reimu,驚1,0,0
この負のオーラの強さは\n疫病神の比じゃないよ！\,c,0,0,"The Pestilence God is nothing  compared to the strength of this negative aura!"
,ImageDef,reimu,汗1,0,0
貧乏神を表舞台に出すこの作戦\n失敗だったんじゃない？\,a,0,0,"Maybe our plan to bring the Poverty God to the front stage was a mistake?"
,ClearBalloon,reimu

,SetFocus,shion	,
#0１２３４５６７８９０１２３４
#,ImageDef,shion,怒1,0,0
#,ImageDef,shion,余1,0,0
誰も得をしない\n誰も幸せにならない\,a,0,0,"No one will gain and no one will be happy."
#,ImageDef,shion,決1,0,0
全員が等しく\n不幸の世界を見せてやる！\,b,0,0,"I'll make an unfortunate world where everyone is equal!"
,ClearBalloon,shion

,Function,"::battle.team[0].current.EndtoFreeMove()",#霊夢立ちアニメへ

,SetFocus,reimu	,
,ImageDef,reimu,決1,0,0
これに飲み込まれたら\n訳も無く負ける！\,b,0,0,"Anyone would lose if they're caught in this!"
,ImageDef,reimu,決2,0,0
気をしっかり持て！\n私は異変解決の巫女よ！\,b,0,0,"Pull yourself together! \nI'm the incident resolving shrine maiden!"
,ClearBalloon,reimu

,SetFocus,shion	,
,ImageDef,shion,決2,0,0
#0１２３４５６７８９０１２３４
貧乏神と疫病神で\n最凶最悪の二人だって？\,a,0,0,"The Pestilence God and Poverty God are the cursed and evil duo?"
笑わせるな！\,b,0,0,"Don't make me laugh!"
最凶最悪は一人で十分\nそれこそが私\n貧乏神の依神紫苑だ！\,a,0,0,"The cursed and evil is enough with one person. \nThat is me, the Poverty god, Shion Yorigami!"
貧しさに怯えて死ね！\,b,0,0,"Be scared of poverty and die!"
,ClearBalloon,shion

#,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト
,Function,"::battle.team[1].current.EndtoFreeMove()",#霊夢立ちアニメへ

#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,yukari2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,shion,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,jyoon2,-1280,

#,Function,"::sound.PlayBGM(103)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#会話イベントなしでコンティニュー処理へ

,Function,"::battle.Continue()",# 対戦開始命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,驚1,0,0
,ImageDef,yukari2,普1,0,0
,ImageDef,shion,普1,0,0
,ImageDef,jyoon2,驚1,0,0

,Sleep,120

,Show,reimu,-1280	,&#フェイス表示開始
#,Show,shion,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,shion
,ImageDef,shion,驚1,0,0
うわー！\,b,0,0,"Aghh!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,驚1,0,0
何これ！\n急に空気が変わったわ！\,a,0,0,"What is this? Something in the air suddenly changed!"
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,汗1,0,0
……私の溜め込んだオーラが\nみんな出てしまう！\,c,0,0,"......The aura I was saving is escaping!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,汗1,0,0
負のオーラに紛れて\nこんな眩しいオーラを\n隠し持っていたのね！\,a,0,0,"You were hiding such a bright aura in your negative aura!"
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,決2,0,0
こうなりゃ破れかぶれだ！\n持てる限りのオーラを\n出し切ってやる！\,b,0,0,"I don't care anymore! I'll just use up all of the aura I have!"
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,決1,0,0
貴方のお陰で\n無限に力が湧いてくるわ！\,b,0,0,"Thanks to you, I'm gaining endless energy!"
,ClearBalloon,reimu

,SetFocus,reimu
,ImageDef,reimu,決2,0,0
もう負ける気がしない！\nやっぱり貴方は\n自らの能力で負けるのよ！\,b,0,0,"I feel like I won't lose! \nJust as I thought Shion, you lose from your own power!"
,ClearBalloon,reimu


#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,yukari2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,shion,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,jyoon2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦再開命令

,End

# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,reimu,驚1,0,0
,ImageDef,yukari2,普1,0,0
,ImageDef,shion,普1,0,0
,ImageDef,jyoon2,驚1,0,0

,Sleep,120

,Show,reimu,-1280	,&#フェイス表示開始
#,Show,shion,-1280	,&#フェイス表示開始

,SetFocus,reimu
,SetFocus,shion
,ImageDef,shion,驚1,0,0
うわー！\,b,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,驚1,0,0
何これ！\n急に空気が変わったわ！\,a,0,0
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,汗1,0,0
……私の溜め込んだオーラが\nみんな出てしまう！\,c,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,汗1,0,0
負のオーラに紛れて\nこんな眩しいオーラを\n隠し持っていたのね！\,a,0,0
,ClearBalloon,reimu

,SetFocus,shion
,ImageDef,shion,決2,0,0
こうなりゃ破れかぶれだ！\n持てる限りのオーラを\n出し切ってやる！\,b,0,0
,ClearBalloon,shion

,SetFocus,reimu
,ImageDef,reimu,決1,0,0
貴方のお陰で\n無限に力が湧いてくるわ！\,b,0,0
,ClearBalloon,reimu

,SetFocus,reimu
,ImageDef,reimu,決2,0,0
もう負ける気がしない！\nやっぱり貴方は\n自らの能力で負けるのよ！\,b,0,0
,ClearBalloon,reimu


#全員フェイス撤去
,Hide,reimu,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,yukari2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,shion,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,jyoon2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦再開命令

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
