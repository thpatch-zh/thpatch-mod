#========================================================================
#	マミゾウ：ステージ4　試作
#	場所：
#　 スレイブ：妹紅　敵チーム：紫
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,mamizou,"data/event/pic/mamizou/face.pat"#名前,ソースファイル名
,DefineObject,mamizou,mamizou,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,mokou,"data/event/pic/mokou/face.pat"#名前,ソースファイル名
,DefineObject,mokou2,mokou,1p,240,0,false#名前,グループ名,x,y,反転

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

,LoadAnimationLocal,"data/actor/story_title/mamizou/title4.pat",1#ステージタイトル画像読み込み
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
,ImageDef,mamizou,驚1,0,0
,ImageDef,mokou2,普2,0,0
,ImageDef,yukari,嬉1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

,Show,mamizou,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,mamizou		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
これからここで\nライブっちゅうのをやるのか\,a,0,0,"So something called the Concert will be here now."
そのライブ中は\n人間が沢山集まる、と\,a,0,0,"In this Concert, I heard many people will gather."
,ClearBalloon,mamizou#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280,	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,普2,0,0
どうした？\n次は何奴と戦うつもりだ？\,a,0,0,"What's wrong? \nWho do you plan on fighting next?"
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,普1,0,0
誰になるか、不明だが\nもしかしたら見た事も無い奴が\n出てくるかもしれんぞ\,a,0,0,"We don't know yet but maybe someone we've never seen before."
,ImageDef,mamizou,汗1,0,0
完全憑依の噂が仕組まれたもの\nじゃったらの話じゃがな\,a,0,0,"That is, if it has to do with the Perfect Possession rumor. 
,ClearBalloon,mamizou#吹き出し消去

,Hide,mamizou,-1280,
,Hide,mokou2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Function,"::battle.Show_EnemyName()",
,Show,yukari,-1280,&	#対象フェイス表示開始
,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,嬉1,0,0
#0１２３４５６７８９０１２３４
わー\nプリズムリバー楽団のライブ\n楽しみだわー\,a,0,0,"A Prisimriver Concert! How exciting"
,ImageDef,yukari,普1,0,0
あら、貴方達も\nライブを見に来たのね\,a,0,0,"Oh, you two came to see the concert too?"
,ClearBalloon,yukari

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,惑1,0,0
さほど興味は無いぞい\,a,0,0,"I'm not really interested."
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,惑1,0,0
と言うことは、アレなのね\n見るからにアレですもんねぇ\,a,0,0,"So this means it's about that.\nIt's obviously about that."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,驚1,0,0
#0１２３４５６７８９０１２３４
アレ？　やっぱりお前さんが\nライブに興味あるなんて\nおかしいと思った\,a,0,0,"That? \nI thought it was strange you would have an interest in the Concert."
#0１２３４５６７８９０１２３４
,ImageDef,mamizou,余1,0,0
完全憑依の噂を流した奴が\nここに現れるかもしれんと\n踏んでるのじゃが……\,a,0,0,"I figured the one who spread the Perfect Possession rumor would appear here."
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,驚1,0,0
完全憑依？\nいやだあ、アレって、アレですよ\,a,0,0,"Perfect Possession?\nNo, I mean that… that thing."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,驚1,0,0
何じゃ？\,a,0,0,"What?"
,ClearBalloon,mamizou#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,嬉1,0,0
ダフ屋ですよ\nどう見たって貴方\nダフ屋に見えるじゃない\,a,0,0,"Scalpers.\nObviously, you look like scalpers."
,ClearBalloon,yukari

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,怒1,0,0
ダ、ダフ屋だと\t[!?]\nしらばっくれおって\,a,0,0,"Sca…scalpers!?\nDon't act innocent."
,ClearBalloon,mamizou#吹き出し消去


# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

#0１２３４５６７８９０１２３４
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,怒1,0,0
おい、狸の旦那\nこいつは幻想郷きっての\n要注意人物だ\,a,0,0,"Hey, Master Tanuki, this one's on Gensokyo's black list."
こいつが出てきたって事は\n大抵悪い事しか起きない\,a,0,0,"When she appears, only bad things occur."
,ClearBalloon,mokou2

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,	#発言キャラを指定
,ImageDef,mamizou,嬉1,0,0
#0１２３４５６７８９０１２３４
聞いておる\,a,0,0,"I've heard."
,ImageDef,mamizou,普1,0,0
いいか、妹紅殿\nこれからは練習試合ではないぞ\,a,0,0,"Alright Lady Mokou, this won't be a practice match."
,ImageDef,mamizou,普2,0,0
完全憑依戦の実践編の始まりじゃ\n気を抜くな\,a,0,0,"This is the start of a true Perfect Possession battle.\nStay focused."
,ClearBalloon,mamizou#吹き出し消去

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,mokou2,	#発言中キャラを指定
,ImageDef,mokou2,決1,0,0
#0１２３４５６７８９０１２３４
待ってたよ！\nこの命、何度でも捨ててやる！\,a,0,0,"I've been waiting for this!\nI'll throw away this life a million times!"
,ClearBalloon,mokou2

,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,60

,Function,"::sound.PlayBGM(318)",# 指定BGM再生開始

,Sleep,60

,Function,"::battle.Lose()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,mamizou,負1,0,0
,ImageDef,mokou2,負1,0,0
,ImageDef,yukari,余1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,mokou2,-1280	,&
,Show,yukari,-1280	,&#フェイス表示開始

,SetFocus,mamizou
,SetFocus,yukari
それぞれ一人ずつの方が\n強かったんじゃない？\,a,0,0,"Maybe you're each stronger on your own?"
,ClearBalloon,yukari

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

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
,ImageDef,mamizou,驚1,0,0
,ImageDef,mokou2,余1,0,0
,ImageDef,yukari,汗1,0,0

,Show,mamizou,-1280	,&#フェイス表示開始
,Show,yukari,-1280	,&#フェイス表示開始
,SetFocus,mamizou		,
,SetFocus,yukari		,#発言中キャラを指定
二対一なんて卑怯だわー\,a,0,0,"Two against one is unfair."
,ClearBalloon,yukari

,Show,mamizou,-1280	,&#フェイス表示開始
,SetFocus,mamizou		,
,ImageDef,mamizou,余1,0,0
#0１２３４５６７８９０１２３４
お前さん\nただライブを見に来た\nなんて事はないじゃろ\,a,0,0,"You didn't come just to see the Concert."
,ClearBalloon,mamizou

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
#0１２３４５６７８９０１２３４
そうねぇ\n貴方達なら問題ないよね\,a,0,0,"That's true.\nI suppose if it's the two of you, there won't be any problems."
,ClearBalloon,yukari

,SetFocus,mamizou		,
,ImageDef,mamizou,普1,0,0
というと？\,a,0,0,"Which means?"
,ClearBalloon,mamizou

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普2,0,0
#0１２３４５６７８９０１２３４
完全憑依異変の黒幕について\n話しましょう\n貴方達の狙いはこれでしょ？\,a,0,0,"Let me tell you of the mastermind behind the Perfect Possession Incident.\nThat's your aim, isn't it?
,ClearBalloon,yukari

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,mokou2,-1280,	#対象フェイス表示開始
,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,普1,0,0
やっぱり関わっていたか\,a,0,0,"So you are involved."
,ClearBalloon,mokou2

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,驚1,0,0
関わってなんていない\,a,0,0,"I'm not involved."
むしろ余りの傍若無人ぶりに\n手を焼いているのよ\,a,0,0,"Rather I'm having trouble with their arrogance."
,ClearBalloon,yukari

,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,汗1,0,0
お前にそこまで言わせるとは\,a,0,0,"For you to even say that…"
,ImageDef,mokou2,決1,0,0
楽しみだな！\,a,0,0,"I'm looking forward to it!"
,ClearBalloon,mokou2


,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
#0１２３４５６７８９０１２３４
奴らはこのライブ会場に現れる\,a,0,0,"They will appear at this concert hall."
,ImageDef,yukari,普2,0,0
そして、無心で楽しむ観客全員に\n憑依しようとしている\,a,0,0,"And they will be trying to possess \nthe entire audience mindlessly enjoying the show."
,ClearBalloon,yukari

# =====
,Hide,mokou2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,mamizou		,
,ImageDef,mamizou,惑1,0,0
#0１２３４５６７８９０１２３４
な、なんじゃて\n全員に憑依じゃと？\,b,0,0,"Wha… what?\nPossess everyone?"
,ImageDef,mamizou,嬉1,0,0
なるほどそれで、お前さんは\n阻止しようとここに張っていた\n訳じゃな\,a,0,0,"I see, so you were waiting to prevent it."
,ClearBalloon,mamizou

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,惑1,0,0
#0１２３４５６７８９０１２３４
そうだったら\n良いんですけどねぇ\,c,0,0,"If that were the case..."
,ClearBalloon,yukari

,SetFocus,mamizou		,
,ImageDef,mamizou,余1,0,0
？\nま、安心しておれ、その役は\n儂等最強のコンビがやってやろう\,a,0,0,"? Well, don't worry.\nWe, the strongest duo will take care of it."
,ClearBalloon,mamizou

# =====
,Hide,mamizou,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,mokou2		,#発言中キャラを指定
,ImageDef,mokou2,余1,0,0
もうじき、観客がやってくるぞ\n腕が鳴るな\,a,0,0,"The audience will come soon.\nMy arm's burning with excitement. "
,ClearBalloon,mokou2

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,mamizou,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,mokou2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

,Sleep,60

,End
