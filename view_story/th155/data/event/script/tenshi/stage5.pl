#========================================================================
#	天子：ステージ5　試作　
#	場所：
#　 スレイブ：針妙丸　敵チーム：紫　霊夢
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,tenshi,"data/event/pic/tenshi/face.pat"#名前,ソースファイル名
,DefineObject,tenshi,tenshi,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,sinmyoumaru,"data/event/pic/sinmyoumaru/face.pat"#名前,ソースファイル名
,DefineObject,sinmyoumaru2,sinmyoumaru,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#2Pslave
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu2,reimu,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,tenshi,驚1,0,0
,ImageDef,sinmyoumaru2,驚1,0,0
,ImageDef,yukari,余1,0,0
,ImageDef,reimu2,汗1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150


#最初天子は登場せず。
,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,yukari,-1280,	#対象フェイス表示開始
,SetFocus,yukari	,
,ImageDef,yukari,余1,0,0
スレイブには慣れたかしら？\,a,0,0,"Have you become used to being a slave?"
,ClearBalloon,yukari

,Hide,yukari,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,reimu2,-1280,	#対象フェイス表示開始
,SetFocus,reimu2	,
,ImageDef,reimu2,汗1,0,0
まあ何とかね\,a,0,0,"Somewhat."
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,yukari	,
,ImageDef,yukari,普1,0,0
#0１２３４５６７８９０１２３４
貧乏疫病コンビ攻略作戦の命運は\n貴方の練習量にかかっているの\nただ……\,a,0,0,"The fate of capturing the  Poverty and Pestilence Duo will come down \nto your training but……"
,ClearBalloon,yukari

,Hide,yukari,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,reimu2	,
,ImageDef,reimu2,普1,0,0
ただ？\,a,0,0,"But?"
,ClearBalloon,reimu2

,Hide,reimu2,-1280,
,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,yukari	,
,ImageDef,yukari,惑1,0,0
#0１２３４５６７８９０１２３４
あともう一つ\n完全にする為には\n何かが足りない気がして\,a,0,0,"I feel something is missing to make it perfect."
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Hide,yukari,-1280,
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::sound.PlayBGM(409)",# 指定BGM再生開始

#天子現る
,Show,tenshi,-1280,	#対象フェイス表示開始
,SetFocus,tenshi	,
,ImageDef,tenshi,驚2,0,0
ん？\nこいつはあの時の妖怪！\,a,0,0,"Eh? It's that youkai from before!"
,ClearBalloon,tenshi

,SetFocus,yukari	,
,ImageDef,yukari,驚1,0,0
あら？\nなんで貴方が地上に？\,a,0,0,"Oh dear. \nWhy are you on Earth?"
,ClearBalloon,yukari

,SetFocus,tenshi	,
,ImageDef,tenshi,怒1,0,0
#0１２３４５６７８９０１２３４
そういえば\n地上にはこいつが残ってたな\,a,0,0,"I forgot, this one was still left."
,ImageDef,tenshi,決1,0,0
こいつを倒さなければ\n地上は支配できない！\,b,0,0,"I need to beat her or I can't rule the Earth!"
,ClearBalloon,tenshi

,SetFocus,yukari	,
,ImageDef,yukari,怒1,0,0
#0１２３４５６７８９０１２３４
なんでこんなタイミングに\n現れるのかしら\,a,0,0,"Why do you have to appear at this moment?"
貴方には興味ないから\nさっさと去れ\,b,0,0,"I don't have any interest so please go away."
,ClearBalloon,yukari

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,驚1,0,0
#0１２３４５６７８９０１２３４
こいつは、反則技のオンパレード\nで有名な妖怪だ\n気を抜くなよー\,a,0,0,"This one's a youkai famous for never-ending foul play. \nPay attention!"
,ClearBalloon,sinmyoumaru2

,SetFocus,yukari	,
,ImageDef,yukari,驚1,0,0
#0１２３４５６７８９０１２３４
あれ？\nそこの小人は……\nいつもの小人じゃないわね\,a,0,0,"Oh? This Inchling…… it's not the usual little one."
,ClearBalloon,yukari

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,余1,0,0
うへへー、よく判ったねぇ\nそうさ、自分は\n夢の世界の針妙丸さ！\,a,0,0,"Hehehe, you noticed well. \nYup, I'm Sinmyoumaru from the Dream World!"
ドサクサに紛れて\n強制的に取り憑いてやったよ\,c,0,0,"When everyone was confused, I forced possession."
,ClearBalloon,sinmyoumaru2


,ImageDef,yukari,普1,0,0
# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,驚1,0,0
#0１２３４５６７８９０１２３４
なんだって？\nあんたは針妙丸じゃないの？\,a,0,0,"What did you say? \nYou're not Sinmyoumaru?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,嬉1,0,0
針妙丸は針妙丸だけど\n夢の世界の針妙丸だ\,a,0,0,"I am Sinmyoumaru, but Sinmyoumaru from the Dream World."
,ImageDef,sinmyoumaru2,余1,0,0
こっちの方が面白そうだったから\nさっきの戦いの時に\n入れ替わってやったのさ\,a,0,0,"This side seemed more fun so I switched places during the last battle."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
#0１２３４５６７８９０１２３４
へえー、そんなこと出来るんだ！\nまあ私としては強ければ\nどっちでもいいや\,a,0,0,"Huh, so you can do something like that! \nWell, as long as we're strong, I don't really care."
,ClearBalloon,tenshi


,SetFocus,yukari	,
,ImageDef,yukari,驚1,0,0
戦いの途中で\nスレイブを入れ替えただって？\nそれは疫病神の能力と同じ……\,a,0,0,"Switched slaves during battle? \nThe same power as the Pestilence God…"
,ClearBalloon,yukari

,SetFocus,yukari	,
,ImageDef,yukari,決1,0,0
#0１２３４５６７８９０１２３４
なる程、そういうことか！\n\R[疫病神|あいつ]の能力の仕組みが見えた！\,a,0,0,"I see, now I understand! \nI can see how the Pestilence God's ability works!"
,ClearBalloon,yukari

,SetFocus,tenshi	,
,ImageDef,tenshi,決1,0,0
#0１２３４５６７８９０１２３４
ぶつくさ言ってないで\nさっさと戦うよ！\n幻想郷の支配者は私がやる！\,b,0,0,"Stop grumbling and let's fight! \nI'm going to become the ruler of Gensokyo!"
,ClearBalloon,tenshi

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,tenshi,負1,0,0
,ImageDef,sinmyoumaru2,負1,0,0
,ImageDef,yukari,決1,0,0
,ImageDef,reimu2,余1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,yukari,-1280	,&#フェイス表示開始

,SetFocus,tenshi	,
,SetFocus,yukari	,
,ImageDef,yukari,決1,0,0
思わぬ情報を手に入れたわ\nこれで勝てる\,a,0,0,"I've gained some unexpected information. \nWith this we can win."
,ClearBalloon,yukari

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
,ImageDef,tenshi,惑1,0,0
,ImageDef,sinmyoumaru2,驚1,0,0
,ImageDef,yukari,普1,0,0
,ImageDef,reimu2,汗1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始
,Show,yukari,-1280	,&#フェイス表示開始

,SetFocus,yukari
,SetFocus,tenshi
,ImageDef,tenshi,惑1,0,0
心ここにあらずだな\nお前は誰と戦っている？\,a,0,0,"Present in body but absent in spirit. Who are you fighting against?"
,ClearBalloon,tenshi

,SetFocus,yukari
,ImageDef,yukari,余1,0,0
お前達のお陰で\nあの二人を攻略できそうよ\,a,0,0,"Thanks to the two of you, it looks like Jyoon & Shion will be captured."
,ClearBalloon,yukari

,Show,yukari,-1280	,&#フェイス表示開始
,ImageDef,yukari,決1,0,0
完全憑依は見切ったわ！\nもう\R[奴隷|スレイブ]は自由だ！\,a,0,0,"I have figured out Perfect Possession! Now slaves are free!"
,ClearBalloon,yukari

#全員フェイス撤去
,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,reimu2,-1280,

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
