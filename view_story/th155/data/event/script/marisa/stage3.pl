#========================================================================
#	魔理沙：ステージ3　試作　
#	場所：
#　 スレイブ：こいし　敵チーム：霊夢　　華扇
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,marisa,"data/event/pic/marisa/face.pat"#名前,ソースファイル名
,DefineObject,marisa,marisa,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,koishi,"data/event/pic/koishi/face.pat"#名前,ソースファイル名
,DefineObject,koishi2,koishi,1p,240,0,false#名前,グループ名,x,y,反転

#2Pmaster
,LoadImageDef,reimu,"data/event/pic/reimu/face.pat"
,DefineObject,reimu,reimu,2p,1040,0,true

#2Pslave
,LoadImageDef,kasen,"data/event/pic/kasen/face.pat"
,DefineObject,kasen2,kasen,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,reimu_name,reimu,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title3.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/reimu/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/kasen/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(401)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,惑1,0,0
,ImageDef,koishi2,普1,0,0
,ImageDef,reimu,普1,0,0
,ImageDef,kasen2,普2,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,marisa,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,惑1,0,0
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
同時多発的に\n完全憑依が広まっているぜ\,a,0,0,"Perfect Possession sure is spreading quickly."
これはうかうかしてられないな\,a,0,0,"I can't just sit around all day."
,ClearBalloon,marisa#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

,Hide,marisa,-1280,
,Function,"::battle.team[1].current.StageIn_Dash()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",
,Show,reimu,-1280,&	#対象フェイス表示開始
,SetFocus,reimu		,#発言中キャラを指定
あら、また来たの\,a,0,0,"Oh, so you came again."
,ClearBalloon,reimu

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,普2,0,0
異変の調査は\nどの位進んでいるか？\,a,0,0,"How's the incident investigation going?"
,ClearBalloon,marisa

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,汗1,0,0
あー、それねぇ\nちょっと問題が起きていてねぇ\,a,0,0,"Ohh, that. \nThere's been a slight problem."
,ClearBalloon,reimu

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,惑1,0,0
問題って何だ？\,a,0,0,"What kind of problem?"
,ClearBalloon,marisa

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,普2,0,0
今は討伐作戦中なの\,a,0,0,"I'm in suppress mission right now."
,ClearBalloon,reimu

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,驚1,0,0
討伐……と言うことは\n黒幕が判ったのか、早いな\,a,0,0,"A plan……so you figured out the mastermind. \nThat was quick."
,ClearBalloon,marisa

,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,惑1,0,0
いやー……何というか\n完全憑依異変の解決は\n一筋縄ではいかないかも\,a,0,0,"Well…… It's … \nIt just looks like this Perfect Possession incident resolution will be tricky."
,ClearBalloon,reimu

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,惑1,0,0
歯切れが悪いな\n何か隠しているのがバレバレだぜ\,a,0,0,"What's with being so vague. \nIt's obvious you're hiding something."
,ClearBalloon,marisa

,Hide,reimu,-1280,
,Function,"::battle.team[1].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Function,"::battle.Show_EnemySlaveName()",#敵ネームを表示
,Show,kasen2,-1280,	#対象フェイス表示開始
,SetFocus,kasen2,	#発言中キャラを指定
,ImageDef,kasen2,普2,0,0
#0１２３４５６７８９０１２３４
貴方の用事は、完全憑依を使った\n決闘を楽しむ事かしら？\,a,0,0,"Is your purpose is to enjoy a duel using Perfect Possession?"
,ImageDef,kasen2,余1,0,0
ならば相手になるわよ\,a,0,0,"Then I will entertain you."
,ClearBalloon,kasen2

,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,汗1,0,0
あ、う、うん\nそんなに\R[茨華仙|おまえ]が積極的だと\n何か調子狂うなぁ\,c,0,0,"Uh…er... Sure. \nIf Kasen's (you're) so aggressive, something must be off."
,ClearBalloon,marisa

,SetFocus,kasen2,	#発言中キャラを指定
,ImageDef,kasen2,決1,0,0
全力でかかってきなさい！\,a,0,0,"Show me what you've got!"
,ClearBalloon,kasen2

,Function,"::battle.team[1].current.Team_Change_Master(null)",#マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kasen2,-1280,

,Sleep,60

,Function,"::sound.PlayBGM(301)",# 指定BGM再生開始

,Sleep,60#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,負1,0,0
,ImageDef,koishi2,負1,0,0
,ImageDef,reimu,敵1,0,0
,ImageDef,kasen2,余1,0,0

,Show,marisa,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,koishi2,-1280	,&
,Show,reimu,-1280	,&#フェイス表示開始

,SetFocus,marisa,&
,SetFocus,reimu
,ImageDef,reimu,敵1,0,0
完全勝利の為には魔理沙に\n人柱になって貰うしかない\,a,0,0,"For perfect victory, I'll need Marisa to be a human sacrifice."
,ClearBalloon,reimu

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kasen2,-1280,

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
,ImageDef,marisa,嬉1,0,0
,ImageDef,koishi2,普1,0,0
,ImageDef,reimu,負1,0,0
,ImageDef,kasen2,負1,0,0

,Show,marisa,-1280	,&#フェイス表示開始
,Show,reimu,-1280	,&#フェイス表示開始
#,Show,kasen2,-1280	,#フェイス表示開始

,SetFocus,reimu		,
,SetFocus,marisa		,
よっしゃあ、勝った！\n最強は私だ！\,a,0,0,"Yes, I won! \nI'm the most powerful!"
,ClearBalloon,marisa

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",#スレイブに入れ替わる

,Show,Koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2,	#発言中キャラを指定
,ImageDef,koishi2,普1,0,0
私達、だ！\,a,0,0,"We are!"
,ClearBalloon,koishi2

,Show,reimu,-1280,&	#対象フェイス表示開始
,SetFocus,reimu		,#発言中キャラを指定
負けちゃったー\,a,0,0,"We lost…"
しょうがない\n真相を教えてあげるわ\,a,0,0,"It can't be helped. I'll tell you the truth."
,ClearBalloon,reimu

,SetFocus,koishi2,	#発言中キャラを指定
,ImageDef,koishi2,嬉1,0,0
わーい\nこれから面白い事が\n起こる筈よー！\,a,0,0,"Yay, now something fun will definitely happen!"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",#マスターに入れ替わる

,Show,marisa,-1280,
,SetFocus,marisa		,
,ImageDef,marisa,汗1,0,0
#0１２３４５６７８９０１２３４
なんだか調子の狂う展開だなぁ\,c,0,0,"Looks like things might go out of tune."
,ClearBalloon,marisa

,SetFocus,reimu		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
早く太陽のライブステージに\n向かうと良いわ\,a,0,0,"Quickly head to the Sun Concert Stage."
もうそこで何かが\n起こり始めているかも\n知れないよ\,a,0,0,"Something may have already begun."
,ClearBalloon,reimu

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,reimu,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,kasen2,-1280,

,Sleep,60

,End

# -------------------------------------------------------
