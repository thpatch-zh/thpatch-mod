#========================================================================
#	天子：ステージ4　試作　
#	場所：
#　 スレイブ：針妙丸　敵チーム：華扇　マミゾウ
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
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen,kasen,2p,1040,0,true

#2Pslave
,LoadImageDef,mamizou,"data/event/pic/mamizou/face_r.pat"
,DefineObject,mamizou2,mamizou,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,kasen_name,kasen,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/tenshi/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kasen/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/mamizou/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"
,Function,"::battle.team[1].current.Wait_Outside()"

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,普2,0,0
,ImageDef,kasen,普1,0,0
,ImageDef,mamizou2,驚1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",#敵ネームを表示
,Show,kasen,-1280,	#対象フェイス表示開始
,SetFocus,kasen	,
,ImageDef,kasen,普1,0,0
貴方が噂の天人様ですか\,a,0,0,"Are you the rumored Celestial?"
,ClearBalloon,kasen

,Show,tenshi,-1280,	#対象フェイス表示開始
,SetFocus,tenshi	,
,ImageDef,tenshi,嬉1,0,0
そうよ！\nひれ伏すが良い\,a,0,0,"Yup! Bow before me."
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,sinmyoumaru2,-1280,	#対象フェイス表示開始
,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,普2,0,0
こいつは、山に住む仙人よ\n寂しいのか神社によくいるの\,a,0,0,"This one's a hermit that lives in the mountains. \nMaybe she's lonely, but she comes down to the shrine a lot."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,普1,0,0
仙人か、日々精進しているかね\,a,0,0,"A hermit. \nAre you devoting yourself everyday?"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,諭1,0,0
ええ\n言われなくてもしております\,a,0,0,"Yes, I do so without being told."
,ClearBalloon,kasen

,Hide,kasen,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,mamizou2,-1280,	#対象フェイス表示開始
,SetFocus,mamizou2	,
,ImageDef,mamizou2,驚1,0,0
#0１２３４５６７８９０１２３４
なんじゃ、これが天人なのか？\nちっちゃそうな奴が\nちっちゃい奴と組んでいるな\,a,0,0,"Is this the Inchling? \nA little one working with an even smaller one."
,ClearBalloon,mamizou2

,Hide,mamizou2,-1280,

,Function,"::battle.team[1].current.Team_Change_Master(null)",#スレイブに入れ替わる
,Sleep,30#スリープ命令　指定数値フレーム待ちます

,SetFocus,kasen	,
,ImageDef,kasen,惑1,0,0
#0１２３４５６７８９０１２３４
こんなんでも\n一応天人なんですよね\,a,0,0,"Even though she's like this, it seems she's still a celestial."
,ImageDef,kasen,余1,0,0
いずれ、私がその座を奪う事に\nなると思いますが\,a,0,0,"Though one day, I believe I will take that spot."
,ClearBalloon,kasen

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(313)",# 指定BGM再生開始

,SetFocus,tenshi	,
,ImageDef,tenshi,余1,0,0
#0１２３４５６７８９０１２３４
ふん\n何が日々精進しているんだか\,a,0,0,"Hmph, what do you mean you are devoted everyday."
全身から奢りが溢れ出ているよ\,a,0,0,"Your whole body is flowing with pride"
,ImageDef,tenshi,決1,0,0
天人として忠告してやろう！\nその光を\R[和|やわら]げ、塵に同ぜよ！\,a,0,0,"Let me caution you as a celestial! \nBlend with the light and become one with the dust!"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,嬉1,0,0
あっはっは\nこれ程響かない\n天人の忠告もないわ！\,a,0,0,"Hahaha, a Celestial warning that doesn't resonate at all!"
,ImageDef,kasen,決1,0,0
その言葉\n貴方にそっくり返すわ！\,a,0,0,"I shall return those words right back to you!"
,ImageDef,kasen,決1,0,0
天の光を捨てて\R[芥|あくた]に還れ！\,b,0,0,"Abandon the Heaven's light and return to the dirt!"
,ClearBalloon,kasen


#全員フェイス撤去
,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,


,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,tenshi,負1,0,0
,ImageDef,sinmyoumaru2,負1,0,0
,ImageDef,kasen,余1,0,0
,ImageDef,mamizou2,余1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
,Show,kasen,-1280	,&#フェイス表示開始

,SetFocus,tenshi	,
,SetFocus,kasen	,
こんな俗っぽい天人もいるのねぇ\,a,0,0,"It seems that vulgar celestials exist too."
,ClearBalloon,kasen

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,

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
,ImageDef,tenshi,嬉1,0,0
,ImageDef,sinmyoumaru2,余1,0,0
,ImageDef,kasen,負1,0,0
,ImageDef,mamizou2,負1,0,0

,Show,tenshi,-1280	,&#フェイス表示開始
,Show,kasen,-1280	,&#フェイス表示開始


,SetFocus,kasen	,
,SetFocus,tenshi	,
#0１２３４５６７８９０１２３４
弱い！　弱すぎる！\nそんなんで天に昇れると\n思うなよ！\,a,0,0,"Weak! Too weak! \nDon't think you'll reach Heaven with that!"
,ClearBalloon,tenshi

,SetFocus,kasen	,
,ImageDef,kasen,負1,0,0
#0１２３４５６７８９０１２３４
腐っても天人……か\n私の精進が足りなかったのは\n本当ね\,a,0,0,"Once a Celestial, always a Celestial…...It's true that I still lack diligence."
,ClearBalloon,kasen

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,嬉1,0,0
えっへっへ、上手くいきやしたね\,c,0,0,"Hehehe, it sure went well."
,ImageDef,sinmyoumaru2,余1,0,0
この仙人と化け狸は\n幻想郷でも指折りの実力者\,a,0,0,"This hermit and bake-tanuki are the most distinguished in Gensokyo."
もう、我々が最強と言っても\n過言では無いですな\,a,0,0,"Now, it won't be an overstatement to say we're the strongest."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,汗1,0,0
#0１２３４５６７８９０１２３４
なんかお前……\n出会った頃と口調変わってない？\,a,0,0,"Hey….\nYou sound different from when we first met?"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,驚1,0,0
#0１２３４５６７８９０１２３４
うい？\nそんなことはー\n無いと思いますがねぇ\,a,0,0,"Um? No way. \nI sure don't think so."
,ClearBalloon,sinmyoumaru2

# =====
,Hide,sinmyoumaru2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,tenshi	,
,ImageDef,tenshi,普1,0,0
#0１２３４５６７８９０１２３４
ま、いっか\,a,0,0,"Well whatever."
,ImageDef,tenshi,余1,0,0
でも地上で最強になるなんて\n当然だからなぁ\,a,0,0,"And of course we'll become the most powerful on Earth."
,ImageDef,tenshi,嬉1,0,0
よーし、天界に帰れるまでに\n地上を支配するか！\,a,0,0,"All right, until I can go back to Heaven, I guess I'll rule the Earth!"
,ClearBalloon,tenshi

# =====
,Hide,tenshi,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,sinmyoumaru2	,
,ImageDef,sinmyoumaru2,余1,0,0
良いっすねぇ\nさすが天人様\,a,0,0,"Nice, very nice Lady Tenshi."
,ImageDef,sinmyoumaru2,嬉1,0,0
考える事のスケールが\n違いますねぇ\,a,0,0,"Your way of thinking is on a different level."
,ClearBalloon,sinmyoumaru2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,tenshi,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,sinmyoumaru2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,kasen,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,mamizou2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
