#========================================================================
#	女苑：ステージ6　試作　
#	場所：
#　 スレイブ：任意　敵チーム：天子　ドレミー
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
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"
,DefineObject,tenshi,tenshi,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,tenshi_name,tenshi,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title6.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/tenshi/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#味方を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(409)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,普1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,doremy2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150


#最初女苑は居ない。

,Show,tenshi,-1280,	#対象フェイス表示開始
,SetFocus,tenshi	,
,ImageDef,tenshi,普2,0,0
あはははは！\,a,0,0,"Hahahahahaha!"
,ImageDef,tenshi,惑1,0,0
私を追放するなんて\n愚かな奴らだ\,a,0,0,"How foolish for exiling me."
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
#0１２３４５６７８９０１２３４
もう怖いもんなんてない！\nこんな愚かで退屈な天界なんか\nみんな壊れてしまえ！\,a,0,0,"There's nothing I'm scared of! \nI'm going to destroy everyone and everything in this stupid and boring Heaven!"
,ClearBalloon,tenshi

,Hide,tenshi,-1280
,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,50#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.team[0].current.shion.Shion_StageIn()"#紫苑登場
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,SetFocus,tenshi	,
,ImageDef,tenshi,驚1,0,0
誰だ？\,a,0,0,"Who are you?"
,ClearBalloon,tenshi

#女苑の登場。


,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,普1,0,0
お前か\n最凶最悪の夢の暴れん坊は\,a,0,0,"Are you the cursed and evil Dream World troublemaker?"
,ClearBalloon,jyoon

,SetFocus,tenshi	,
,ImageDef,tenshi,惑1,0,0
ん？\n何だお前達\,a,0,0,"Huh? \nWhat are you two?"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,余1,0,0
私は依神女苑\n泣く子も黙る疫病神\,a,0,0,"I'm Jyoon Yorigami. \nA Pestilence God that can intimidate anyone."
,ClearBalloon,jyoon

,Show,shion,-1280,	#対象フェイス表示開始
,SetFocus,shion2	,
,ImageDef,shion2,嬉1,0,0
私は依神紫苑\n泣く子も貧する貧乏神\,a,0,0,"I'm Shion Yorigami. \nThe Poverty God that can bring poverty on anyone."
#0１２３４５６７８９０１２３４
,ImageDef,shion2,余1,0,0
完全憑依異変は\n私達が起こしたものよ\,a,0,0,"We started the Perfect Possession incident."
,ImageDef,shion2,普1,0,0
貴方は夢の住人でしょ？\,a,0,0,"And aren't you a dream dweller?"
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,驚2,0,0
完全憑依異変、だと？\,a,0,0,"The Perfect Possession incident?"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,普2,0,0
#0１２３４５６７８９０１２３４
なる程、お前達が\n私を自由にしてくれたのか\n感謝するぞ！\,b,0,0,"I see. So you guys let me free. \nI'm grateful for that!"
,ClearBalloon,tenshi

,Function,"::battle.Show_EnemyName()",
,SetFocus,tenshi	,
,ImageDef,tenshi,決1,0,0
私は、比那名居天子\n泣く子も昇天する天人だ！\nひれ伏せい！\,b,0,0,"I'm Tenshi Hinanawi. \nA Celestial that can ascend anyone to the Heavens! \nWorship me!"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
#0１２３４５６７８９０１２３４
こいつ、やばすぎる\,c,0,0,"This one's really crazy."
天界を震わす\nこんな出鱈目なパワー\n今まで感じたことがないわ\,c,0,0,"I've never felt such intense power that shakes Heaven."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,決1,0,0
落ち着いて女苑\n抑圧された夢のパワーが\n暴走しているだけよ\,a,0,0,"Calm down Jyoon. \nHer oppressed Dream power is just out of control."
長くは持たない筈よ\,a,0,0,"It shouldn't last long."
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,余1,0,0
ふっ馬鹿め\n私は全人類の気質を利用できる\nそのパワーは無尽蔵だ！\,a,0,0,"Hah. You idiots. \nI can access the traits of all human kind. \nIt's an unlimited power!"
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
#0１２３４５６７８９０１２３４
無尽蔵だってよ！\nどうするの？\,c,0,0,"She said unlimited! \nWhat are we goanna do?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,決1,0,0
まさか私が再び\n本気を出す時が来るとはね\,a,0,0,"To think I'd have to go all out again."
,ClearBalloon,shion2

,ImageDef,shion2,決2,0,0
私は貧乏神\n全人類の不幸を一身に背負うわ\nその負のオーラも無尽蔵だ\T[!!]\,b,0,0,"I, the poverty god, will carry all the misfortune of human kind alone. \nThis negative aura is unlimited!"
,ClearBalloon,shion2

,SetFocus,tenshi	,
,ImageDef,tenshi,汗1,0,0
#0１２３４５６７８９０１２３４
負のオーラ？\nむ、確かにこいつは酷い\n酷すぎる……\,c,0,0,"Negative aura? \nHmm, this one's pretty bad. \nAwful……."
,ClearBalloon,tenshi

,SetFocus,jyoon	,
,ImageDef,jyoon,汗1,0,0
#0１２３４５６７８９０１２３４
ああ、なんて不憫な姉さん\,c,0,0,"Sigh, what a pitiful sister."
,ImageDef,jyoon,嬉1,0,0
でも頼りになるわー！\nもう、最凶最悪は姉さん一人で\n決まりだわー！\,a,0,0,"But also reliable! \nIt's settled. \nShion, you're the cursed and evilest all by yourself!"
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
そこの暴走天人！\n姉さんの不運に敵うと思うなよ！\,a,0,0,"Hey you crazy Celestial! \nDon't think you're a match for my sister's bad luck!"
,ClearBalloon,jyoon

,SetFocus,tenshi	,
,ImageDef,tenshi,惑1,0,0
#0１２３４５６７８９０１２３４
迂闊に近寄ると\n不運の巻き添えを喰らうかも\n知れないな\,a,0,0,"If I carelessly get to close, I might get tangled up this misfortune."
,ImageDef,tenshi,余1,0,0
#0１２３４５６７８９０１２３４
,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています

ふん、ならば近づかせないで\n倒すまでだ！\,b,0,0,"Hmph, then I must finish this without getting close!"
,ImageDef,tenshi,嬉1,0,0
,Function,"::sound.PlayBGM(354)",# 指定BGM再生開始
天空に住む天人の戦い方を\n見せてやろう！\,b,0,0,"I'll show you how a Celestial from Heaven fights!"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,怒1,0,0
お前達を倒したら\,a,0,0,"Once I destroy you two,"
,ImageDef,tenshi,普1,0,0
天界を滅ぼし\,a,0,0,"I'll destroy Heaven."
地上を滅ぼし\,a,0,0,"Destroy Earth."
,ImageDef,tenshi,惑1,0,0
人類を滅ぼし\,a,0,0,"Destroy all human kind."
地をならし\,a,0,0,"Leveling the ground."
,ImageDef,tenshi,余1,0,0
美しい四季を作り\,a,0,0,"Create a beautiful four seasons."
新しい生命を造り\,a,0,0,"Create new life."
,ImageDef,tenshi,嬉1,0,0
悲しむ事のない心を創り\,a,0,0,"Create souls that will never feel sorrow."
貧する事のない社会を作り\,a,0,0,"Create a society that will never be poor."
,ImageDef,tenshi,普2,0,0
この世界全てを\n創り直してやろう！\,a,0,0,"I'll recreate this world!"
,ClearBalloon,tenshi

,SetFocus,tenshi	,
,ImageDef,tenshi,決1,0,0
死に腐れ！　外道の神々よ！\,b,0,0,"Rot, you Demon Gods!
,ClearBalloon,tenshi


#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,


,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,jyoon,負1,0,0
,ImageDef,shion2,負1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,shion2,-1280	,&
,Show,tenshi,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
あっはっは\n新世界が誕生するぞー！\,a,0,0,"Ahahaha. \nA new world will be born!"
,ClearBalloon,tenshi

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy,-1280,

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
,ImageDef,jyoon,普1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,tenshi,嬉1,0,0
,ImageDef,doremy2,普1,0,0

,Sleep,90

,Show,jyoon,-1280	,&#フェイス表示開始
,SetFocus,jyoon
,ImageDef,jyoon,普1,0,0
やったわ！\,a,0,0,"I did it!"
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能

,SetFocus,shion2
,ImageDef,shion2,普1,0,0
これで夢の住人は\n全てやっつけたね！\,a,0,0,"Now we've caught all of the Dream Residents!"
,ClearBalloon,shion2
,Hide,shion2,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能

,SetFocus,jyoon
,ImageDef,jyoon,普1,0,0
おかしな奴だったけど……\n思ったほどではなかったねぇ\,a,0,0,"She was strange...... but not as difficult as I was expecting."
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能


,Show,tenshi,-1280	,&#フェイス表示開始
,SetFocus,tenshi
#,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,ImageDef,tenshi,余1,0,0
ふっふっふ\,c,0,0,"hehehe."
,ImageDef,tenshi,怒1,0,0
これで終わったと思うなよ！\,a,0,0,"Don't think that this is over!"
,ImageDef,tenshi,嬉1,0,0
天人ならではの戦い方を\n見せてやろう！\,a,0,0,"I'll show you how a Celestial fights!"
,ImageDef,tenshi,決1,0,0
地上の常識は捨てよ！\n本当の空中戦を見せてやる！\,a,0,0,"Who cares about Earth's rules! \nI'll show you a real battle in the sky."
,ImageDef,tenshi,決1,0,0
地球の鎖から解き放たれ\n道を外れたデブリとなれ！\n二人の外道神よ！\,b,0,0,"Become floating debris freed from the chains of Earth, you demons!"
,ClearBalloon,tenshi


#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,tenshi,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

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
