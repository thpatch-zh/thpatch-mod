#========================================================================
#	鈴仙：ステージ3　試作　
#	場所：
#　 スレイブ：ドレミー　敵チーム：神子　布都
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
,LoadImageDef,miko,"data/event/pic/miko/face_r.pat"
,DefineObject,miko,miko,2p,1040,0,true

#2Pslave
,LoadImageDef,futo,"data/event/pic/futo/face.pat"
,DefineObject,futo2,futo,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,miko_name,miko,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/udonge/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/miko/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/futo/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(407)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普2,0,0
,ImageDef,doremy2,普1,0,0
,ImageDef,miko,余2,0,0
,ImageDef,futo2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,miko,-1280,&	#対象フェイス表示開始
,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,余2,0,0
ほほう\n正々堂々と勝負を挑みに来る者を\n邪険に扱えん\,a,0,0,"Aha, one who picks a fight fair and square cannot be treated lightly."
,ClearBalloon,miko

,Show,udonge,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,udonge		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
,ImageDef,udonge,普2,0,0
#0１２３４５６７８９０１２３４
その上から目線が\nいけ好かないのよね\,a,0,0,"I hate condescending attitudes."
,ImageDef,udonge,余1,0,0
威張っている割には\n何にも活躍してないし\,a,0,0,"You're so arrogant but you haven't done anything."
,ClearBalloon,udonge#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,驚1,0,0
な、なんだと\n言うようになったな\n気弱な月の兎よ\,a,0,0,"Wha.. What did you say, you weak Moon Rabbit?"
,ClearBalloon,miko

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,嬉1,0,0
事実を言ってるだけよ\,a,0,0,"I'm only speaking the truth."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,余2,0,0
#0１２３４５６７８９０１２３４
オドオドしているだけだと\n思っていたが一皮剥けたようだな\,a,0,0,"I thought you were only a nervous rabbit, but it seems that you've matured."
,ImageDef,miko,普2,0,0
では私も事実を言おう\n調査の結果、都市伝説異変の\n首謀者が判明した\,c,0,0,"Then I shall speak the truth as well. \nFrom the investigation results, \nthe ring leader of the Urban Legend incident has been identified." 
,ImageDef,miko,怒1,0,0
幻想郷が月の都の下らない騒乱に\n巻き込まれたんだな\,a,0,0,"Gensokyo was entangled in the Lunar Capital's ridiculous riot." 
,ImageDef,miko,決1,0,0
しかし、今は都市伝説異変を\n悪用した完全憑依異変の方が\n脅威である\,a,0,0,"However, now there's the threat of the Perfect Possession \nIncident which abuses the Urban Legend Incident."
,ImageDef,miko,汗1,0,0
話題になるのは遠くの戦争より\n身近な痴話げんかさ\,a,0,0,"Soon a nearby lover's quarrels will be news rather than a distant war."
,ImageDef,miko,余1,0,0
月の兎のお前には悔しい話\nかもしれんが\,a,0,0,"Though it may be disappointing for you, moon rabbit."
,ClearBalloon,miko

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,怒1,0,0
,ImageDef,miko,驚1,0,0
そんな話はどうでも良いよ！\,b,0,0,"I don't care about that!"
#0１２３４５６７８９０１２３４
,ImageDef,udonge,余1,0,0
私はただ、貴方をコテンパンに\nしたいだけよ\nイライラの解消のためにね！\,a,0,0,"I just want to beat you black and blue and relieve my irritation!"
,ClearBalloon,udonge#吹き出し消去

,Hide,udonge,-1280,
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,汗1,0,0
真に受けないで下さいね\,a,0,0,"Please do not take her seriously."
,ClearBalloon,doremy2

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,普1,0,0
ん？\nお前は誰だ？\,a,0,0,"Hm? \nWho are you?"
,ClearBalloon,miko

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,敵1,0,0
私はドレミースイート\n夢の世界の支配者です\n以後お見知りおきを\,a,0,0,"I am Doremy Sweet. \nThe ruler of the Dream World. \nPleased to make your acquaintance" 
,ImageDef,doremy2,普1,0,0
ここにいる鈴仙は\n夢の世界の鈴仙なのです\,a,0,0,"The Reisen here, is Reisen from the Dream World."
,ClearBalloon,doremy2

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,驚1,0,0
夢の世界の鈴仙だと？\n何を言っておる\,a,0,0,"Reisen from the Dream World? \nWhat are you saying."
,ClearBalloon,miko

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,普2,0,0
夢の世界の住人は\n感情豊かで素直なんですよ\,a,0,0,"Dream World dwellers are highly sensitive and honest."
,ClearBalloon,doremy2

,Hide,doremy2,-1280,
,Function,"::battle.team[0].current.Team_Change_Master(null)",#スレイブに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(351)",# 指定BGM再生開始

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,怒1,0,0
ゴチャゴチャうるさい\,a,0,0,"Ugh, so annoying."
,ImageDef,udonge,決1,0,0
口から生まれた邪仙よ\nさっさと戦うよ！\,b,0,0,"An evil hermit born from the mouth. \nLet's fight!"
この幻想郷はお前が消えれば\n喜ぶような奴らばかりだよ\n私は正義のヒーローさ！\,b,0,0,"Everyone will be happy, if you disappear from the Gensokyo. \nI'm the hero of justice!"
,ClearBalloon,udonge#吹き出し消去

,SetFocus,miko		,#発言中キャラを指定
,ImageDef,miko,決1,0,0
#0１２３４５６７８９０１２３４
人心を惑わす者に\n取り憑かれているようだな\,a,0,0,"She seems to be possessed by someone who deceives."
宜しい、目を覚まさせてやろう！\,b,0,0,"Very well, I shall wake you up!"
,ClearBalloon,miko


#全員フェイス撤去
,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,


,Sleep,60

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
,ImageDef,miko,惑1,0,0
,ImageDef,futo2,余1,0,0

,Show,udonge,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,miko,-1280	,&#フェイス表示開始

,SetFocus,udonge		,

,SetFocus,miko
狂気の兎が狂うとはな\,a,0,0,"To think a mad rabbit would go mad."
,ClearBalloon,miko

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,

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
,ImageDef,miko,負1,0,0
,ImageDef,futo2,負1,0,0

,Show,udonge,-1280	,&#フェイス表示開始
#,Show,futo2,-1280	,&#フェイス表示開始
,Show,miko,-1280	,


,SetFocus,miko
,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,嬉1,0,0
あー、すっきりした\nこれで目覚めはバッチリね\,a,0,0,"Ah, I feel refreshed. \nNow I'll wake up feeling great."
,ClearBalloon,udonge#吹き出し消去

,SetFocus,miko
夢の世界の鈴仙という話は\n本当なのか？\,a,0,0,"Is this story about the Reisen of the Dream World true?"
,ClearBalloon,miko

,SetFocus,udonge		,	#発言キャラを指定
,ImageDef,udonge,余1,0,0
#0１２３４５６７８９０１２３４
そうよ\n現の世界はやりたい放題で\n気持ちいいわー\,a,0,0,"Yup. \nI can do whatever I want in the Real World. \nIt's the best!"
,ClearBalloon,udonge#吹き出し消去

,SetFocus,miko
#0１２３４５６７８９０１２３４
こちらは完全憑依の真相を\n追うのに忙しいんだ\nお前の戯言には付き合ってられん\,a,0,0,"I'm busy pursuing the truth behind Perfect Possession. \nI don't have time to listen to your rubbish."
,ClearBalloon,miko

# =====
,Hide,udonge,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,doremy2,-1280,	#対象フェイス表示開始
,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,怒1,0,0
#0１２３４５６７８９０１２３４
その完全憑依なのですが……\,b,0,0,"About this Perfect Possession……"
,ImageDef,doremy2,怒1,0,0
それが、夢の世界に影響を\n与えているのです\,a,0,0,"It's affecting the Dream World."
,ClearBalloon,doremy2

,SetFocus,miko
ほほう\n話せ\,a,0,0,"Oh? Speak."
,ClearBalloon,miko

,SetFocus,doremy2		,#発言中キャラを指定
,ImageDef,doremy2,惑1,0,0
#0１２３４５６７８９０１２３４
完全憑依されている間\nパートナーは夢の世界に潜みます\,a,0,0,"While under Perfect Possession, the partner lays hidden in the Dream World."
,ImageDef,doremy2,普1,0,0
その影響で夢の住人が\n住処を追い出されてしまうのです\,a,0,0,"And because of that, the dream dweller is pushed out of their home." 
,ImageDef,doremy2,普2,0,0
目の前の鈴仙はその一人ですよ\,c,0,0,"The Reisen in front of you is one of those dwellers."
,ClearBalloon,doremy2

,SetFocus,miko
#0１２３４５６７８９０１２３４
なんと、夢の世界にも\n影響が及ぶとは……\,a,0,0,"To affect even the Dream World……"
それが本当なら\n一刻も早く完全憑依異変を\n解決させないとな\,a,0,0,"If that is true, I must resolve the Perfect Possession incident immediately."
,ClearBalloon,miko

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,udonge,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,doremy2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,miko,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,futo2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
