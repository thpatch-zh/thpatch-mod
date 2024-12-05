#========================================================================
#	女苑：ステージ2　試作　
#	場所：
#　 スレイブ：任意　敵チーム：マミゾウ　ドレミー
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
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou,mamizou,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,mamizou_name,mamizou,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title2.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mamizou/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン


,Function,"::sound.PlayBGM(405)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,普1,0,0
,ImageDef,shion2,普1,0,0
,ImageDef,mamizou,驚1,0,0
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
,Show,mamizou,-1280,	#対象フェイス表示開始
,SetFocus,mamizou	,
,ImageDef,mamizou,驚1,0,0
ほほう、儂が夢の住人じゃと\,a,0,0,"Ooh, I'm a dream dweller?"
,ClearBalloon,mamizou

,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,普1,0,0
噂になってたよ\n狸の大将がおかしくなったって\,a,0,0,"There was a rumor the Tanuki leader went crazy."
,ClearBalloon,jyoon

,SetFocus,mamizou	,
,ImageDef,mamizou,普1,0,0
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
よく判ったのう\nいかにも儂は夢の住人じゃ\,a,0,0,"You know well. \nIndeed I'm a dream dweller."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,怒1,0,0
#0１２３４５６７８９０１２３４
じゃが、おかしいことなんか\nあるもんか\,a,0,0,"But crazy? I think not."
,ImageDef,mamizou,余1,0,0
現の儂が、方々に気を使いすぎて\nいるだけじゃ\nおかしいのは現の儂じゃて\,a,0,0,"Myself in the Real World is overly attentive. \nShe's the crazy one."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,汗1,0,0
#0１２３４５６７８９０１２３４
大体な、こんな狭い世界の奴らに\n遠慮なんてする必要はないじゃろ\,a,0,0,"Anyways, there's no need to hold back in this small world."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,嬉1,0,0
儂に従う奴だけ残して\n理想の幻想郷にしてやろう\nって言ってるだけじゃ\,a,0,0,"I say, only keep those who obey me and create an ideal Gensokyo."
,ClearBalloon,mamizou

,SetFocus,shion2	,
,ImageDef,shion2,汗1,0,0
#0１２３４５６７８９０１２３４
いかにも\n夢の住人らしい言いぶり\n誠に有難うございますぅ\,a,0,0,"Really, spoken like a true dream dweller. \nThank you very much."
,ImageDef,shion2,呆1,0,0
どうして夢の住人は\nこうも根拠ない自信に\n満ちあふれているんだろ\,a,0,0,"Why are dream dwellers so full of false confidence?"
,ClearBalloon,shion2

,SetFocus,mamizou	,
,ImageDef,mamizou,余1,0,0
ふぉっふぉっふぉ\n根拠がないとな\,c,0,0,"Hohoho, false confidence you say."
,ClearBalloon,mamizou

,SetFocus,mamizou	,
,ImageDef,mamizou,普1,0,0
#0１２３４５６７８９０１２３４
根拠がないかどうか見せてやる\,a,0,0,"I'll show you if it's false or not."
,ImageDef,mamizou,決1,0,0
化け狸の頭領直々\n化かし殺してやろう！\,b,0,0,"I, the Leader of Tanuki, shall personally trick and kill you!"
,ClearBalloon,mamizou

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mamizou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(309)",# 指定BGM再生開始

,Sleep,60

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
,ImageDef,mamizou,決1,0,0
,ImageDef,doremy2,余1,0,0

,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,shion2,-1280	,&
,Show,mamizou,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,mamizou	,
,ImageDef,mamizou,決1,0,0
幻想郷は儂の別荘にしてやろう\nその次は、本当に欲しい\n本土を手に入れるぞい\,a,0,0,"I'll make the Gensokyo my vacation home. \nNext, I shall conquer the desired mainland."
,ClearBalloon,mamizou

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mamizou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,jyoon,余1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,mamizou,負1,0,0
,ImageDef,doremy2,負1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始

,SetFocus,mamizou	,
,SetFocus,jyoon	,
#0１２３４５６７８９０１２３４
はっ、何が理想の幻想郷よ\nその程度の腕なら\nお山のボスが精々ね\,a,0,0,"Hah. What do you mean the ideal Gensokyo. \nIf that's all you got, at best it's a mountain boss."
,ClearBalloon,jyoon

,SetFocus,mamizou	,
#0１２３４５６７８９０１２３４
くっ\n今日は寝不足だっただけじゃ\,c,0,0,"Grr, I was sleep deprived. \nThat's all."
,ClearBalloon,mamizou

,SetFocus,shion2,
,ImageDef,shion2,嬉1,0,0
#0１２３４５６７８９０１２３４
何はともあれ、夢の住人ゲット！\n順調順調！\,a,0,0,"Anyways, another dream dweller! \nSo far so good!"
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
姉さんと一緒なのに\n何故か順調ね\n夢みたいー\,a,0,0,"Even though I'm working with you, it's going smoothly today. \nIt's like a dream."
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,汗1,0,0
そんな嫌みを言う妹なんて\n欲しくなかったわ\,c,0,0,"I didn't want a sister who says such nasty words."
,ClearBalloon,shion2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,mamizou,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
