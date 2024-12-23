#========================================================================
#	紫：ステージ1　試作
#	場所：
#　 スレイブ：霊夢　敵チーム：女苑
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し
,Function,"::battle.Enable_Boss_exp(false)"#決着後爆発無し


#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"#名前,ソースファイル名
,DefineObject,yukari,yukari,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"#名前,ソースファイル名
,DefineObject,reimu2,reimu,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P紫苑
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,jyoon_name,jyoon,name,920,0,false

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/yukari/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#プレイヤーを非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera_Live()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,yukari,普1,0,0
,ImageDef,reimu2,普1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,惑1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,240

,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,120

#最初、紫達は出てこない


,Function,"::battle.Show_EnemyName()",
,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
今夜もライブ、楽しみねー！\n観客達から富を奪い放題よー\,a,0,0,"A concert again tonight. \nI'm excited! All you can steal from the audience-"
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Sleep,40#スリープ命令　指定数値フレーム待ちます

#紫苑が登場する特殊演出が挿入されます
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#紫苑登場
,Sleep,180#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",
,Show,shion2,-1280,	#対象フェイス表示開始
,SetFocus,shion2	,
,ImageDef,shion2,惑1,0,0
#0１２３４５６７８９０１２３４
ねえ女苑\nそろそろ私にもお金を分けてよー\,a,0,0,"Hey Jyoon, Give me some money too."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,呆1,0,0
#0１２３４５６７８９０１２３４
えー、姉さんに渡すと\nすぐに無くしちゃうじゃん\nお金は私に管理させてー\,a,0,0,"Ehh. You always lose it right away. \nLeave the money to me."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,怒1,0,0
#0１２３４５６７８９０１２３４
女苑はすぐに使っちゃうんだもん\n全然私に回って来ないじゃない\,a,0,0,"You use it up right away. \nThere's never any left for me."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,余1,0,0
#0１２３４５６７８９０１２３４
使い切れないくらい\n奪えば良いのよ\n金脈はこんなにあるんだもん\,a,0,0,"We just need to steal more than we can spend. \nLook at this mine in front of us."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,嬉1,0,0
まあそうね\nガッポガッポ稼ごうね\,a,0,0,"That's true. Let's earn a lot."
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,普1,0,0
あ、誰か来たわ\,a,0,0,"Ooh, someone came."
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Hide,shion2,-1280,
,Sleep,40#スリープ命令　指定数値フレーム待ちます

#紫登場

#,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

,Function,"::battle.team[0].current.StageIn_Special()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,yukari,-1280,	#対象フェイス表示開始
,SetFocus,yukari	,
,ImageDef,yukari,普2,0,0
そこまでよ\,a,0,0,"Stop there."
,ImageDef,yukari,普1,0,0
貧乏神の紫苑に、疫病神の女苑\n少し、おいたが過ぎたようね\,a,0,0,"Poverty God Shion and Pestilence God Jyoon, enough of your mischief."
,ClearBalloon,yukari

,SetFocus,jyoon	,
,ImageDef,jyoon,怒1,0,0
何なのよ？\nもうすぐライブが始まるから\n邪魔しないでよね\,a,0,0,"What do you want? \nThe concert's about to start so get out of our way."
,ClearBalloon,jyoon



,SetFocus,yukari	,
,ImageDef,yukari,嬉1,0,0
#0１２３４５６７８９０１２３４
うふふ、嬉しいわ\nやっとお前達を懲らしめる時が\n来たんだから\,a,0,0,"Aha, how delightful. \nThe day to punish you two has finally come."
,ClearBalloon,yukari


,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
#0１２３４５６７８９０１２３４
あー、もう何よ\nはいはい、私達が\n完全憑依異変の黒幕ですよ\,a,0,0,"Ugh, what is it. \nYes, yes we're the masterminds of the Perfect Possession incident."
私達には絶対勝てない\nって噂を聞いてないの？\,a,0,0,"Haven't you heard the rumor that you can't beat us?"
,ClearBalloon,jyoon

,SetFocus,yukari	,
#0１２３４５６７８９０１２３４
,ImageDef,yukari,余2,0,0
それはやってみないと\n判らないんじゃないかしら？\,a,0,0,"I won't know unless I try."
,ImageDef,yukari,普2,0,0
私は一人でも強いけど\n最強の助っ人も連れてきましたよ\,a,0,0,"I'm strong on my own, but I've brought the strongest assistant too."
,ImageDef,yukari,嬉2,0,0
そいつが出てきたら\n必ず異変は解決するのですから\,a,0,0,"When my assistant arrives, the incident will be resolved no matter what."
,ClearBalloon,yukari

,SetFocus,shion2	,
,ImageDef,shion2,余1,0,0
ねえ女苑\nザコが何か言ってるよ\n切ないねぇ、不幸だねぇ\,a,0,0,"Hey Jyoon, this loser is saying something. \nHow sad and miserable."
,ClearBalloon,shion2


,SetFocus,jyoon	,
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
哀れすぎて見てられないね\n私が吸い取る運すら\n持って無さそうね\,a,0,0,"It's so pitiful, I can't even watch. \nShe probably doesn't even have any fortune for me to soak up."
,ImageDef,jyoon,余1,0,0
,Function,"::sound.StopBGM(1000);",# BGM停止
ライブのドサクサに紛れて\n死んでしまった方が幸せかもね\,a,0,0,"She might be better off dying during the commotion of the concert."
,ClearBalloon,jyoon

,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,yukari,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,reimu2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,yukari	,
,ImageDef,yukari,普2,0,0
#0１２３４５６７８９０１２３４
はっ\nお前達の様な生粋の嫌われ者は\n本当の幸福を知らない\,a,0,0,"Hah. \nTruly hated people like you do not know real happiness."
,ImageDef,yukari,怒1,0,0
幸福を知らない者は\n性格がひん曲がってしまう\,a,0,0,"And those who do not know happiness have a twisted personality."
,ClearBalloon,yukari

,SetFocus,yukari	,
#0１２３４５６７８９０１２３４
,ImageDef,yukari,普2,0,0
しかし喜ぶがいい！\,a,0,0,"But you should be delighted!"
,ImageDef,yukari,余1,0,0
お前達に完全敗北という\n幸福をくれてやろう\,a,0,0,"I shall provide you the happiness of complete defeat."
,ImageDef,yukari,決1,0,0
歓喜せよ！\,b,0,0,"Rejoice!"
人生を変える\nスペシャルライブの始まりだ！\,b,0,0,"A special concert that will change lives is about the start!"
,ClearBalloon,yukari

#全員フェイス撤去
,Hide,yukari,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,reimu2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,yukari,負1,0,0
,ImageDef,reimu2,負1,0,0
,ImageDef,jyoon,汗1,0,0
,ImageDef,shion2,嬉1,0,0

,Show,yukari,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,reimu2,-1280	,&
,Show,jyoon,-1280	,&#フェイス表示開始

,SetFocus,yukari	,
,SetFocus,jyoon	,
哀れすぎて見てられない\,a,0,0,"It's so pitiful, I can't even watch."
,ClearBalloon,jyoon

,Hide,yukari,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,reimu2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦開始命令

,End

# -------------------------------------------------------
# プレイヤー勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,yukari,惑1,0,0
,ImageDef,reimu2,余1,0,0
,ImageDef,jyoon,普1,0,0
,ImageDef,shion2,負1,0,0

,Sleep,45
,Function,"::battle.team[0].current.TalkPosition(null)"#1Pを会話位置に移動
,Sleep,5
,Function,"::battle.team[1].current.TalkPosition(null)"#2Pを会話位置に移動
,Sleep,90

,Show,yukari,-1280	,&#フェイス表示開始
,Show,jyoon,-1280	,&#フェイス表示開始

,SetFocus,yukari	,
,SetFocus,jyoon	,
,ImageDef,jyoon,普1,0,0
#0１２３４５６７８９０１２３４
ふふふ\n言うだけあって腕が立つようねぇ\,a,0,0,"Hehehe. \nYou're not too bad."
,ImageDef,jyoon,余1,0,0
でも、そろそろ\n遊びは終わりにしようか！\,a,0,0,"But let's put an end to the fun and games!"
,ClearBalloon,jyoon

,SetFocus,yukari	,
,ImageDef,yukari,怒1,0,0
アレが来る……\n霊夢、準備は良い？\,d,0,0,"It will come…… Reimu, are you ready?"
,ClearBalloon,yukari

# =====
,Hide,yukari,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,reimu2,-1280	,#フェイス表示開始
,SetFocus,reimu2	,
,ImageDef,reimu2,決1,0,0
よく判らないけど、任せた！\,d,0,0,"I don't really get it, but leave it to me!"
,ClearBalloon,reimu2

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
#0１２３４５６７８９０１２３４
今まさに！\nお前達の負けは確定した！\,c,0,0,"Right now! \nYour defeat is set!"
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

#
#女苑と紫苑が同時にしゃべる特殊演出が挿入されます
#
,Function,"::battle.team[1].current.Master_Spell_3_DemoStart()",		# アブソリュートルーザーアクション

,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
憑依交換「アブソリュートルーザー」\,e15x3,0,0,"Possession Exchange Absolute Loser"
,ClearBalloon,jyoon

,Hide,yukari,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,reimu2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,


#＊ここで会話絵は消えて、デモに移行。
#女苑はスレイブ交換のスペルカードを発動する。
#途中で静止して、紫の会話。

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,yukari,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,reimu2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,60

,End
