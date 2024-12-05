#========================================================================
#	魔理沙：ステージ4　試作
#	場所：
#　 スレイブ：こいし　敵チーム：紫
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
,LoadImageDef,yukari,"data/event/pic/yukari/face.pat"
,DefineObject,yukari,yukari,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,yukari_name,yukari,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/yukari/name.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機
,Function,"::battle.Enable_BossKo_StandUp()"#敵が爆発しない+会話デモで起き上がりを許可

#開始カメラ演出
,Function,"::battle.BeginCamera()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(406)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,普2,0,0
,ImageDef,koishi2,惑1,0,0
,ImageDef,yukari,普2,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,marisa,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,普2,0,0
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
ライブステージか\,a,0,0,"A live concert…"
,ImageDef,marisa,惑1,0,0
今夜はプリズムリバーのライブが\nあると聞いているが……\,a,0,0,"I heard tonight is Prismriver's concert but……"
,ImageDef,marisa,驚1,0,0
まさか黒幕は……！\,b,0,0,"Don't tell me the mastermind is……!"
,ClearBalloon,marisa#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,惑1,0,0
まさか？\,a,0,0,"Is...?"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa
,ImageDef,marisa,汗1,0,0
いや、さすがに\nそんな筈は無いと思うが……\,a,0,0,"No……. There's no way……"
,ClearBalloon,marisa#吹き出し消去

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Sleep,60#スリープ命令　指定数値フレーム待ちます
,Function,"::battle.team[1].current.StageIn_Special()"#実行チームが特殊演出で登場
,Sleep,120#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",
,Show,yukari,-1280,&	#対象フェイス表示開始
,SetFocus,yukari		,#発言中キャラを指定
あらこんなところで\,a,0,0,"Oh, why hello."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,普1,0,0
#0１２３４５６７８９０１２３４
\R[紫|おまえ]か……\n確かに、異変の真相に\n近づいているように見えるぜ\,a,0,0,"Yukari (you)…… \nIt looks like we're getting closer to the truth."
,ClearBalloon,marisa#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普2,0,0
#0１２３４５６７８９０１２３４
ここに辿り着いたって事は\n完全憑依の調査をしているのね\,a,0,0,"Arriving this far means you're investigating Perfect Possession too."
,ImageDef,yukari,余1,0,0
ところで、憑依を得意とする種族\nって何だと思う？\,a,0,0,"By the way, what species do you think is skilled at possessing?"
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,惑1,0,0
#0１２３４５６７８９０１２３４
肉体を持たない\n例えば幽霊のような種族……\,c,0,0,"A species without a physical body... like a ghost……"
,ImageDef,marisa,驚2,0,0
はっ！　そんなまさか！\nあのチンドン三姉妹は騒霊だが！\,b,0,0,"Gasp! No way! The Prismriver sisters are poltergeists…!"
,ClearBalloon,marisa#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,嬉1,0,0
うふふ、それだったら\n一瞬で解決できたんだけどねぇ\n勿論違うわ\,a,0,0,"Haha, that would make for an instant resolution but of course not."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,嬉1,0,0
だよなー\nふう、何故かホッとしちゃったぜ\,a,0,0,"True... Whew, I'm kinda relieved."
,ClearBalloon,marisa#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
それはさておき\,a,0,0,"That aside."
,ImageDef,yukari,普2,0,0
今、貴方は\n重大な選択を迫られています\,a,0,0,"Now, you need to make an important choice."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,惑1,0,0
ああ？　選択だと？\,a,0,0,"Huh? A choice?"
,ClearBalloon,marisa#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
ここで引き返すか\n自ら真相を味わうか\,a,0,0,"To turn back or find out the truth yourself."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,決1,0,0
#0１２３４５６７８９０１２３４
相変わらず無意味な選択肢だな\nここまで来て誰が引き返すんだよ\,a,0,0,"A meaningless option as always. \nWho would turn back after getting this far."
,ClearBalloon,marisa#吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,決1,0,0
#0１２３４５６７８９０１２３４
もう一つ、私に負けて今の話を\n聞かなかったことにするか\nさあ、二人で決めなさい！\,b,0,0,"One more thing. If you lose, you didn't hear any of this. \nNow, decide together!"
,ClearBalloon,yukari


#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,


,Sleep,60

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
,ImageDef,yukari,汗1,0,0

,Show,marisa,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,koishi2,-1280	,&
,Show,yukari,-1280	,#フェイス表示開始

,SetFocus,marisa
,SetFocus,yukari
,ImageDef,yukari,汗1,0,0
わざと負けるつもりだったのに\n作戦失敗ですわ\,a,0,0,"I was planning to lose on purpose. A failed plan."
,ClearBalloon,yukari

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,

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
,ImageDef,marisa,惑1,0,0
,ImageDef,koishi2,嬉1,0,0
,ImageDef,yukari,嬉1,0,0

,Show,yukari,-1280	,&#フェイス表示開始
,Show,marisa,-1280	,&#フェイス表示開始

,SetFocus,marisa,&
,SetFocus,yukari
あら、負けちゃった\,a,0,0,"Oh no, I lost."
,ClearBalloon,yukari

,SetFocus,marisa
,ImageDef,marisa,惑1,0,0
#0１２３４５６７８９０１２３４
みんな完全憑依を使っている中で\nお前だけ一人なんだな\,a,0,0,"Everyone else's using Perfect Possession, \nbut you're the only one on your own."
,ClearBalloon,marisa#吹き出し消去

,SetFocus,yukari
,ImageDef,yukari,惑1,0,0
なんでだか判るかしら？\,a,0,0,"Do you know why?"
,ClearBalloon,yukari

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,普2,0,0
判る判るー\n友達がいないからでしょ？\nせつなーい\,a,0,0,"I know I know! \nBecause you have no friends, right? How sad."
,ClearBalloon,koishi2

,SetFocus,yukari
,ImageDef,yukari,余1,0,0
#0１２３４５６７８９０１２３４
理由はすぐに判るでしょう\nそろそろプリズムリバー達の\nライブが始まります\,a,0,0,"You will soon find out the reason. \nPrismriver's concert will begin soon."
観客を狙って\n最凶の二人が現れますよ\n貴方達も鑑賞してみたら？\,a,0,0,"The cursed duo will appear targeting the audience. \nWhy don't the two of you watch?"
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,

,Sleep,60

,End
