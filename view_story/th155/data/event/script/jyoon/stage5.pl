#========================================================================
#	女苑：ステージ5　試作　
#	場所：
#　 スレイブ：任意　敵チーム：華扇　ドレミー
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
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,呆1,0,0
,ImageDef,shion2,普1,0,0
,ImageDef,kasen,嬉1,0,0
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


#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,


,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,kasen,-1280,	#対象フェイス表示開始
,SetFocus,kasen	,
,ImageDef,kasen,普1,0,0
#0１２３４５６７８９０１２３４
最凶最悪の二人か\,a,0,0,"So this is the cursed and evil duo."
,ImageDef,kasen,嬉1,0,0
素性が割れてからというもの\n幻想郷一の嫌われ者と言っても\n過言じゃない人気ね\,a,0,0,"To be characterized in that way... \nYour popularity as the most hated in Gensokyo isn't an overstatement."
,ClearBalloon,kasen

,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,呆1,0,0
#0１２３４５６７８９０１２３４
はいはい、お陰様でね\n私達はこんなんだから\n嫌われるのには慣れているわよ\,a,0,0,"Yes, yes. \nThanks to you. We're already like this, so we're using to being hated."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,普1,0,0
#0１２３４５６７８９０１２３４
紫の命令でしょ？\nここにお前達が来たのは\,a,0,0,"You're under Yukari's orders, right? \nThe reason you came here."
,ClearBalloon,kasen

,ImageDef,jyoon,普1,0,0
,SetFocus,jyoon	,
#0１２３４５６７８９０１２３４
そう、幻想郷のあちこちに\n夢の住人がいるって言われてね\,a,0,0,"Yup, we were told dream dwellers are all over Gensokyo."
,ImageDef,jyoon,呆1,0,0
そいつらを全部捕まえたら\n完全憑依異変の件は\n不問に付すって\,a,0,0,"If we capture all of them, \nshe'll ignore the case of the Perfect Possession incident."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,諭1,0,0
それ、紫に誑かされているよ\,c,0,0,"You're being deceived by Yukari."
#0１２３４５６７８９０１２３４
,ImageDef,kasen,怒1,0,0
彼奴は大物そうに偉ぶってるけど\n本当は酷く小心者で\n内心はいつも穏やかではない\,a,0,0,"She acts high and mighty but is really a coward and always nervous."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,惑1,0,0
#0１２３４５６７８９０１２３４
不穏分子を放って置くことも\n出来ないし、自らが動くのも\n怖くて出来ない、って奴なの\,a,0,0,"She can't ignore the troublemakers \nbut is too scared to make a move herself."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,普1,0,0
夢の住人と戦うのも嫌\,a,0,0,"She doesn't want to fight with the dream dwellers."
,ImageDef,kasen,余1,0,0
お前達と戦うのも嫌\,a,0,0,"Nor fight with you."
#0１２３４５６７８９０１２３４
,ImageDef,kasen,惑1,0,0
お互い潰し合ってくれないかなー\nって考えて依頼したんじゃ\nないかな\,a,0,0,"She probably commissioned the both of you, in hopes you would ruin each other."
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
それは\n確かにそういう節があるけど\,c,0,0,"That might be true but…"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(3000)",# BGM停止 1000=一秒掛けてフェードアウト
,SetFocus,kasen	,
,ImageDef,kasen,普2,0,0
#0１２３４５６７８９０１２３４
ねえ、そこで相談なんだけど\,a,0,0,"So let's negotiate."
,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始
夢の住人と手を組んで\n幻想郷を支配しない？\,a,0,0,"How about joining forces with the dream dwellers and control the Gensokyo?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,驚1,0,0
手を組むだって\T[!?]\,a,0,0,"Join forces!?"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,惑1,0,0
#0１２３４５６７８９０１２３４
完全憑依異変があれば\n貴方達はもっと強くなれる\n異変を終わらせては勿体ないわ\,a,0,0,"With the Perfect Possession incident, you can be stronger. \nIt'd be a waste to end the Incident."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,嬉1,0,0
#0１２３４５６７８９０１２３４
異変を終わらせないように\n私達、夢の住人は全力でサポート\nしてあげるから\,a,0,0,"With the Perfect Possession incident, you can be stronger. \nIt'd be a waste to end the Incident."
,ClearBalloon,kasen

,ImageDef,shion2,驚1,0,0
,SetFocus,shion2	,
騙されないで\nこいつは、自分が現の世界に\n出たいからそう言っているだけよ\,a,0,0,"Don't be fooled. \nShe's saying this because she wants to go to the Real World."
,ImageDef,shion2,決1,0,0
夢の住人の\R[誑誘|きょうゆう]に\n耳を貸さないで！\,c,0,0,"Don't listen to dream dweller's deception."
,ClearBalloon,shion2

,ImageDef,jyoon,惑1,0,0
,SetFocus,jyoon	,
姉さんに言われなくても\n判ってるよ！\nでも……\,a,0,0,"I don't have to be told by you. \nI know! But……"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,諭1,0,0
完全憑依さえあれば\n間違いなく貴方達は最強ですよ\n何を悩んでいるの\,a,0,0,"As long as there's Perfect Possession, you'll be the strongest without fail. \nWhat are you worried about?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
確かに\n完全憑依は私達の為に\nあるようなものだけど……\,a,0,0,"True, Perfect Possession is basically for us……"
,ClearBalloon,jyoon


#,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始
,SetFocus,jyoon	,
,ImageDef,jyoon,怒1,0,0
#0１２３４５６７８９０１２３４
いや、過去の自分を捨てるんだ！\,a,0,0,"No, I've gotta abandon my past!"
,ImageDef,jyoon,余1,0,0
もう他人の財で\n着飾る生活を捨てて\n心の豊かな人生を送りたい！\,b,0,0,"I'm gonna stop living off others wealth and live peacefully!"
,ClearBalloon,jyoon

,ImageDef,shion2,汗1,0,0
,SetFocus,shion2	,
ええー。女苑どうしたの？\,a,0,0,"What?? What happened Jyoon?"
私は他人の財でも\n良いから着飾りたいわ……\,a,0,0,"I want to live well even if it's off other peoples money."
,ClearBalloon,shion2

,ImageDef,jyoon,呆1,0,0
,SetFocus,jyoon	,
姉さんは黙ってて\,a,0,0,"Shut up, Shion."
,ImageDef,jyoon,惑1,0,0
お金も宝石も\nこんなもの何にも幸せには\n結びつかなかったわ\,a,0,0,"Money and jewels, this stuff didn't bring any happiness."
,Function,"::sound.StopBGM(3000)",# BGM停止 1000=一秒掛けてフェードアウト
,ImageDef,jyoon,余1,0,0
真の幸せを掴む為に\n過去の自分と決別する！\,b,0,0,"To gain real happiness, I'm leaving my past!"
,ClearBalloon,jyoon

,Function,"::sound.PlayBGM(313)",# 指定BGM再生開始

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
#0１２３４５６７８９０１２３４
夢の住人め！\n私を誑かそうとしているのは\nお前だー！\,b,0,0,"You dream dweller! \nYou're the one trying to deceive me!"
,ClearBalloon,jyoon


,SetFocus,kasen	,
,ImageDef,kasen,怒1,0,0
チッ！\,a,0,0,"Tsk."
お寺で修業させてる\nって聞いてたけど\nこれが目的だったのね\,a,0,0,"I heard you were training at the temple but I guess this was the goal."
,ClearBalloon,kasen

,SetFocus,kasen	,
,ImageDef,kasen,決1,0,0
じゃあ、お前達は要らないわ\n幻想郷から永久追放よ！\,b,0,0,"Then I don't need you two. \nPermanent exile from Gensokyo!"
,ClearBalloon,kasen


#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,


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
,ImageDef,kasen,決1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,shion2,-1280	,&
,Show,kasen,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,kasen	,
夢の住人が\n幻想郷を支配する日は近い\,a,0,0,"The day for the dream dwellers to control the Gensokyo is near."
,ClearBalloon,kasen

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,kasen,惑1,0,0
,ImageDef,doremy2,負1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始
,Show,kasen,-1280	,&#フェイス表示開始
,Show,doremy,-1280	,#フェイス表示開始


,SetFocus,kasen,
,SetFocus,jyoon	,
,ImageDef,jyoon,嬉1,0,0
勝った！\n夢の住人ゲットだぜー！\,b,0,0,"I won! \nI got another one!"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,惑1,0,0
ねえ女苑\nさっき言ってたのって本音？\,a,0,0,"Hey Jyoon. \nWere you telling the truth?"
,ClearBalloon,shion2

,SetFocus,jyoon	,
,ImageDef,jyoon,呆1,0,0
さあね\nお寺で修業してたからなのか\,a,0,0,"Maybe. \nSince I've been meditating at the temple."
#0１２３４５６７８９０１２３４
何となくお金や宝石のきらめきが\n減ったように見えたの\,a,0,0,"Money and jewels don't sparkle so much anymore."
,ClearBalloon,jyoon

,SetFocus,kasen	,
お前達、夢の住人を\n全て捕まえるつもりなの？\,a,0,0,"The two of you are planning to capture all of the dream dwellers?"
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,普2,0,0
そのつもりだわ\nでもね、それももう終わりかな\,a,0,0,"That's the plan. \nBut this might be the end."
,ImageDef,jyoon,嬉1,0,0
紫に、貴方が最後の夢の住人かも\nって聞いてるからね\,a,0,0,"Yukari said you might be the last dream resident."
,ImageDef,jyoon,余2,0,0
やっとこの苦行から\n抜けだせるわー\,a,0,0,"I'm finally free from this penance."
,ClearBalloon,jyoon

,SetFocus,kasen	,
#0１２３４５６７８９０１２３４
,ImageDef,kasen,驚1,0,0
私で最後だって？\,a,0,0,"I'm the last one?"
,ImageDef,kasen,普2,0,0
そんなことはない\n夢の世界で最凶最悪の暴れん坊が\n残っているよ\,a,0,0,"That's not true. \nThere's still the cursed and evil wild one in the Dream World."
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,怒1,0,0
最凶最悪だって？\,a,0,0,"Cursed and evil?"
私達を差し置いて\nその称号を語るのは\n気にくわないねぇ\,a,0,0,"Other than us, I don't like someone using that name."
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,惑1,0,0
その最凶最悪の夢の住人に\n会いに行きたい？\,a,0,0,"Do you want to meet the Dream World's cursed and evil?
,ClearBalloon,kasen

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
勿論よ！\,a,0,0,"Of course!"
あるというのならならば\n私が怖がるものを\n見せて欲しいわ！\,a,0,0,"If they do exist, I want to see them scared of me!"
,ClearBalloon,jyoon

,SetFocus,kasen	,
,ImageDef,kasen,余1,0,0
#0１２３４５６７８９０１２３４
いい度胸ね！\,b,0,0,"Some nerve!"
,ImageDef,kasen,嬉1,0,0
気に入った、現実の私が貴方達を\n受け入れる理由が判ったわ\,a,0,0,"I like it. \nI can see why the real me accepted you." 
,ClearBalloon,kasen

,SetFocus,shion2	,
,ImageDef,shion2,決1,0,0
夢の世界の最凶最悪は\n何処にいる？\,a,0,0,"Where is the Dream World's cursed and evil?"
,ClearBalloon,shion2

,SetFocus,kasen	,
,ImageDef,kasen,決1,0,0
最凶最悪は\R[宙|そら]にいる！\n捕まえたければ飛べ！\n果てしない天の高みに！\,b,0,0,"The cursed and evil are in the sky! \nIf you want to catch them fly! \nTo the top of the Heavens!"
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
