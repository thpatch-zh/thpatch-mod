#========================================================================
#	女苑：ステージ1　試作　
#	場所：
#　 スレイブ：任意　敵チーム：魔理沙　ドレミー
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
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"
,DefineObject,marisa,marisa,2p,1040,0,true

#2Pslave
,LoadImageDef,doremy,"data/event/pic/doremy/face.pat"
,DefineObject,doremy2,doremy,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,marisa_name,marisa,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/jyoon/title.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/marisa/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/doremy/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(401)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,jyoon,惑1,0,0
,ImageDef,shion2,余1,0,0
,ImageDef,marisa,普1,0,0
,ImageDef,doremy2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,jyoon,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
完全憑依が\n夢の世界に干渉するなんて\n姉さん知ってたの？\,a,0,0,"Shion, did you know that Perfect Possession interferes with the Dream World?"
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,余1,0,0
まあ、気付いていたわよ\,a,0,0,"I noticed."
#0１２３４５６７８９０１２３４
,ImageDef,shion2,普1,0,0
私が取り憑くときは\n普段から夢の世界を介してたもん\,a,0,0,"When I possess, it's always through the Dream World."
#0１２３４５６７８９０１２３４
,ImageDef,shion2,嬉1,0,0
完全憑依も同じ方法\nみたいだからねぇ\,a,0,0,"It looks like Perfect Possession uses the same method."
,ClearBalloon,shion2

,Show,shion2,-1280,	#対象フェイス表示開始
,SetFocus,jyoon	,
,ImageDef,jyoon,呆1,0,0
それ、早く言ってよー\,c,0,0,"You should've told me that earlier."
,ImageDef,jyoon,呆1,0,0
そのせいで面倒なことに\nなっちゃったじゃない\,a,0,0,"Now it's become so troublesome."
,ClearBalloon,jyoon

,Hide,jyoon,-1280,
,Hide,shion2,-1280,

,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,SetFocus,marisa	,
,ImageDef,marisa,怒1,0,0
#0１２３４５６７８９０１２３４
見つけたぜ！\,b,0,0,"I found 'em!"
,ImageDef,marisa,決1,0,0
お前達！\nよくもやってくれたな！\,a,0,0,"Hey you! How dare you!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,驚1,0,0
魔法使いの人間……\nあんたは\R[どっち|・・・]だ？\,a,0,0,"A human witch……Which one are you?
,ClearBalloon,jyoon

,SetFocus,shion2	,
,ImageDef,shion2,惑1,0,0
#0１２３４５６７８９０１２３４
うーん\nまだ\R[どっち|・・・]か判らないわね\,a,0,0,"Hmm. \nWe still can't tell which is which?
,ClearBalloon,shion2

,SetFocus,marisa	,
,ImageDef,marisa,惑1,0,0
どっち、って何だよ\,a,0,0,"Whaddya mean which?"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,普2,0,0
あんたは\R[現|うつつ]の住人か\n夢の世界の住人かって事よ\,a,0,0,"If you're from the Real World or the Dream World."
,ClearBalloon,jyoon

,SetFocus,jyoon	,
,ImageDef,jyoon,惑1,0,0
#0１２３４５６７８９０１２３４
私達はね、暴走した\n夢の世界の住人を捕まえろ\nって言われてるの\,a,0,0,"We were told to capture the reckless Dream World dwellers."
,ImageDef,jyoon,汗1,0,0
#0１２３４５６７８９０１２３４
見た目は全く同じだけど\n夢の住人は本音丸出しで\n情緒が不安定だって……\,a,0,0,"They look exactly the same \nbut it's said Dream dwellers show their true self and are emotionally unstable…"
,ClearBalloon,jyoon

,SetFocus,marisa	,
,ImageDef,marisa,驚1,0,0
ほほう、夢の住人を捕まえろ、か\,a,0,0,"Ohh, capture the Dream dwellers."
,ImageDef,marisa,怒1,0,0
霊夢か紫の差し金だな？\n彼奴はいつも私より\n主人公っぽくて目障りなんだよ\,a,0,0,"So Reimu is under Yukari's influence? \nShe's always more of the hero than me. What an eyesore.
,ClearBalloon,marisa

,SetFocus,marisa	,
,ImageDef,marisa,余1,0,0
#0１２３４５６７８９０１２３４
,ImageDef,jyoon,驚1,0,0
折角、現の世界で暴れられる\nというのに、お前達なんかに\n捕まってたまるか！\,b,0,0,"Now that I can go crazy in the Real World, \nthere's no way am I gonna be captured by you!
,ClearBalloon,marisa

,SetFocus,marisa	,
,ImageDef,marisa,決1,0,0
思う存分\n暴走魔法を試してやるぜー！\,b,0,0,"I'm gonna try as much reckless magic as I want!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
見つけたぞ！　殺せー！\nこいつは夢の世界の魔理沙だー！\,b,0,0,"I found her! Kill her! \nThis is the Marisa from the Dream World!"
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(302)",# 指定BGM再生開始

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
,ImageDef,marisa,嬉1,0,0
,ImageDef,doremy2,余1,0,0

#,Show,shion2,-1280	,&
,Show,jyoon,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,marisa,-1280	,&#フェイス表示開始

,SetFocus,jyoon	,
,SetFocus,marisa	,
,ImageDef,marisa,怒1,0,0
#0１２３４５６７８９０１２３４
貧弱な奴め\n現実の私はこんな奴らに\n勝てなかったのか\,a,0,0,"You weaklings. \nMy real self couldn't win to these guys?"
,ClearBalloon,marisa

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
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
,ImageDef,marisa,負1,0,0
,ImageDef,doremy2,負1,0,0

,Show,marisa,-1280	,&#フェイス表示開始
,Show,jyoon,-1280	,&#フェイス表示開始
,SetFocus,marisa	,
,SetFocus,jyoon	,
,ImageDef,jyoon,嬉1,0,0
#0１２３４５６７８９０１２３４
まずは一人ゲット！\nこいつを紫に引き渡せば\n良いんだよね\,a,0,0,"Got our first one! \nWe just deliver her to Yukari, right?"
,ClearBalloon,jyoon

,SetFocus,marisa	,
くそー、もっと暴れたかったぜー\,a,0,0,"Damn it, I wanted to create more trouble."
,ClearBalloon,marisa

,SetFocus,shion2	,
,ImageDef,shion2,嬉2,0,0
この調子で、暴走した夢の住人を\n探して行こうねー\,a,0,0,"Let's keep this up and find all of the crazy dream dwellers."
,ClearBalloon,jyoon

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,jyoon,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,shion2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,marisa,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,doremy2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
