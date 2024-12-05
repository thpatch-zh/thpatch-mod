#========================================================================
#	魔理沙：ステージ5　試作
#	場所：
#　 スレイブ：こいし　敵チーム：女苑
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
,LoadImageDef,jyoon,"data/event/pic/jyoon/face_r.pat"
,DefineObject,jyoon,jyoon,2p,1040,0,true

#2P紫苑
,LoadImageDef,shion,"data/event/pic/shion/face_r.pat"
,DefineObject,shion2,shion,2p,1040,0,true

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,jyoon_name,jyoon,name,920,0,false

#肩書データロード（肩書内容の指定がある場合、ここに描き込んでもらえれば対応します）
,DefineObject,shion_name,shion,name,920,0,false


,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,LoadAnimationLocal,"data/actor/story_title/marisa/title5.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/jyoon/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/shion/name2.pat",1#敵肩書画像読み込み
,GoSub,init				,# 初期化ルーチン呼び出し

,Function,"::battle.team[0].current.Wait_Outside()"#プレイヤーを非表示待機
,Function,"::battle.team[1].current.Wait_Outside()"#敵を非表示待機

#開始カメラ演出
,Function,"::battle.BeginCamera_Live()"#カメラ演出、ステージインを開始
,Sleep,2,#ウェイト命令
,Function,"::graphics.FadeIn(60)"#画面がフェードイン

,Function,"::sound.PlayBGM(408)",# 指定BGM再生開始

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,惑1,0,0
,ImageDef,koishi2,普1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,240

,Function,"::battle.team[0].current.StageIn_Dash()"#実行チームが画面上から出現
#,Function,"::battle.team[0].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,120

,Show,marisa,-1280,	#対象フェイス表示開始
#,Show,フェイス表示開始対象,表示開始時のX座標補正（ここをスタートに定位置へ移動してくる）,

,SetFocus,marisa		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
#0１２３４５６７８９０１２３４
もうすぐライブが始まるな……\,a,0,0,"Looks like the concert's gonna start soon……"
,ClearBalloon,marisa#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ
# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,嬉1,0,0
ライブ楽しみー！\n何の曲をやるのかな\,a,0,0,"Concert's are so fun! \nI wonder what they're going to play."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,汗1,0,0
#0１２３４５６７８９０１２３４
おいおい\nそれどころじゃ無いだろ\,a,0,0,"Hey, hey, we don't have time for that now."
,ImageDef,marisa,普1,0,0
ここに何が現れるのか\n監視してないと\,a,0,0,"We need to keep an eye out for anything that might show up."
,ClearBalloon,marisa#吹き出し消去

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,koishi2,-1280,	#対象フェイス表示開始
,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,惑1,0,0
#0１２３４５６７８９０１２３４
何がって、ここに現れるのは\nプリズムリバーウィズＨでしょ？\nライブは楽しまなきゃソンソン！\,a,0,0,"But we already know! \nIt's Prismriver with H, right? \nWe can't miss out on the concert!"
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,汗1,0,0
こいつと組んだのが間違いだった\,a,0,0,"Working with you was a mistake."
,ClearBalloon,marisa#吹き出し消去

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Function,"::battle.team[1].current.StageIn_Fall()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます


,Show,jyoon,-1280,&	#対象フェイス表示開始
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,嬉1,0,0
やったー！\nライブ、楽しみー！\nもうすぐ演奏が始まるねー！\,a,0,0,"Whoo! I'm excited for this concert! \nThe performance's going to start soon!"
,ClearBalloon,jyoon

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,普3,0,0
ねー、楽しみだねー！\,a,0,0,"Yeah, so exciting!"
,ClearBalloon,koishi2

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普2,0,0
観客が無心になる瞬間が\n訪れるわよー\,a,0,0,"The moment when the audience will be mindless is coming."
,ClearBalloon,jyoon

,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,普2,0,0
無心で楽しむわー\,a,0,0,"I'm going to enjoy this without a care in the world."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,惑1,0,0
お、おい\nお前は誰だ？\,a,0,0,"Wa…wait, who are you?"
,ClearBalloon,marisa#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,怒1,0,0
あ？　誰でも良いでしょ？\nザコは引っ込んでな\,a,0,0,"Huh? Who cares. \nGo away losers."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,怒1,0,0
何だと？\,a,0,0,"What'd you say?"
,ClearBalloon,marisa#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普1,0,0
あんた、完全憑依のことを\n調べてここまで辿り着いたのね\,a,0,0,"So you've been investigating Perfect Possession and got this far."
,ImageDef,jyoon,普2,0,0
それは褒めてあげる\,a,0,0,"I'll praise you for that."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,驚1,0,0
#0１２３４５６７８９０１２３４
と言うことは\n完全憑依はお前の仕業なんだな！\,a,0,0,"So you're the ones behind Perfect Possession!"
,ClearBalloon,marisa#吹き出し消去

,Function,"::battle.Show_EnemyName()",
,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,余1,0,0
いかにも\n私は\R[依神女苑|よりがみじょおん]、富をもたらす女神\,a,0,0,"For sure. I'm Jyoon Yorigami, a goddess that brings wealth."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,惑1,0,0
#0１２３４５６７８９０１２３４
富をもたらす、だと？\,a,0,0,"Brings wealth?
,ClearBalloon,marisa#吹き出し消去

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,驚1,0,0
あれ？\n何か良い奴っぽい\,a,0,0,"Huh? She doesn't seem bad."
,ClearBalloon,koishi2

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,普2,0,0
さーて、この観客から\n富を巻き上げるんだから\n邪魔しないでね\,a,0,0,"All right, I'm going to gain some wealth from this crowd so don't disturb me."
,ClearBalloon,jyoon

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,汗1,0,0
#0１２３４５６７８９０１２３４
もしかして、富をもたらすって\n自分にもたらす、って意味か？\,a,0,0,"You meant "bringing wealth" to yourself?
,ClearBalloon,marisa#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,惑1,0,0
そうに決まってるじゃない\n私は姉さんと違って\nお金を集めるのが得意なんだから\,a,0,0,"Of course. \nUnlike my sister, I'm good at collecting money."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,惑1,0,0
姉さん？\,a,0,0,"Sister?"
,ClearBalloon,marisa#吹き出し消去

,Hide,marisa,-1280,
,Hide,koishi2,-1280,
,Hide,jyoon,-1280,
,Sleep,40#スリープ命令　指定数値フレーム待ちます

#
#紫苑が登場する特殊演出が挿入されます
,Function,"::battle.team[1].current.shion.Shion_StageIn()"#紫苑登場
#

,Sleep,180#スリープ命令　指定数値フレーム待ちます

,Show,Shion,-1280,&	#対象フェイス表示開始
,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,普1,0,0
#0１２３４５６７８９０１２３４
女苑ー、その言い草酷いわー\n私だって好きで貧乏している\n訳じゃないのにー\,a,0,0,"Jyoon, so mean. \nIt's not like I'm poor because I want to."
,ClearBalloon,shion2

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,驚1,0
わあ、貧相な奴が出てきた\,a,0,0,"Wah, a poor looking person!"
,ClearBalloon,koishi2

,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,普2,0,0
私がいなければ\n完全憑依の罠は\n成り立たないのにさー\,a,0,0,"If I'm not here, the Perfect Possession trap won't be possible."
,ClearBalloon,shion2

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,汗1,0,0
それ以上近づかないで！\n姉さんといると貧乏が伝染る\,a,0,0,"Don't come any closer! \nWhen I'm with you, I'll be infected with poverty."
,ClearBalloon,jyoon

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,汗1,0,0
こいつら……\n一体何が目的だ？\,a,0,0,"These guys…… what's your deal?"
,ClearBalloon,marisa#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,呆1,0,0
次々と強制完全憑依をして\n大量の観客から富を奪うのよ\,a,0,0,"Enforced Perfect Possession and steal wealth from tons of spectators."
,ImageDef,jyoon,余1,0,0
特にライブの観客は\n精神的に無防備なんで楽勝だわ\,a,0,0,"Especially during a concert, \nthey're mentally defenseless so it's an easy win."
,ClearBalloon,jyoon

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,汗1,0,0
って、コソ泥するために\nこんな異変を起こしたのかよ\,a,0,0,"So you caused this incident just for some pickpocketing."
,ClearBalloon,marisa#吹き出し消去

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,呆1,0,0
コソ泥じゃあ、ないよ\n自然と富は私の元に\n集まって来るの\,a,0,0,"It's not pickpocketing. \nWealth just naturally comes to me."
,ClearBalloon,jyoon

,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,汗1,0,0
#0１２３４５６７８９０１２３４
女苑は\R[疫病神|やくびょうがみ]だからね\n妹に取り憑かれた人間は\n自分の意思で貢いでしまうのよ\,a,0,0,"Jyoon's the Pestilence God. \nHumans who are possessed by my sister will supply money by their own will."
,ClearBalloon,shion2


,Function,"::battle.Show_EnemySlaveName()",
,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,嬉1,0,0
#0１２３４５６７８９０１２３４
それで私は貧乏神の\R[紫苑|しおん]\n妹に完全憑依して\nその恩恵に与ろうと思ってるの\,a,0,0,"And I, the Poverty God, Shion, \nam thinking of taking that ability by Perfectly Possessing my sister." 
,ClearBalloon,shion2

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,驚2,0,0
貧乏神に疫病神の姉妹だと\t[!?]\nうわー、近寄りたくねー\,a,0,0,"The Poverty and Pestilence God sisters!? \nUhh, I'm not getting anywhere near that."
,ClearBalloon,marisa#吹き出し消去

# =====
,Hide,marisa,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,koishi2		,#発言中キャラを指定
,ImageDef,koishi2,普2,0
こりゃあ、まさに\n最凶最悪の二人だねぇ\,a,0,0,"Wow, this really is a cursed and evil duo."
,ClearBalloon,koishi2

# =====
,Hide,koishi2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,Function,"::sound.StopBGM(500);",# BGM停止

,SetFocus,marisa		,	#発言キャラを指定
,ImageDef,marisa,決1,0,0
乗りかかった船だ\nここでお前達の野望を\n打ち砕いてやる\,a,0,0,"We're past the point of no return. \nSo we're gonna crush your dreams here."
,ClearBalloon,marisa#吹き出し消去


#全員フェイス撤去
#,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
#,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
#,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
#,Hide,shion2,-1280,

,Function,"::sound.PlayBGM(319)",# 指定BGM再生開始
,Function,"::battle.Live_Start()",
,Sleep,60
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,
,Sleep,190

,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,怒1,0,0
演奏が始まってしまったわ\,a,0,0,"The performance started."
#0１２３４５６７８９０１２３４
,ImageDef,jyoon,惑1,0,0
このビッグチャンスを\n逃したくないんだけど\,a,0,0,"I don't want to lose this big chance."
,ClearBalloon,jyoon

,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,嬉1,0,0
曲が終わる前に\n片付けちゃいましょ\n楽勝よ、こんな無計画な奴ら\,a,0,0,"Let's finish this up before the song ends. \nIt's an easy win with these reckless ones."
,ClearBalloon,shion2


,SetFocus,jyoon		,#発言中キャラを指定
,ImageDef,jyoon,余1,0,0
そうだね！\n疫病神の私と\,a,0,0,"That's true! With me, the Pestilence God and"
#0１２３４５６７８９０１２３４
,ClearBalloon,jyoon

,SetFocus,shion2		,#発言中キャラを指定
,ImageDef,shion2,嬉1,0,0
貧乏神の私\,a,0,0,"Me, the Poverty God.
,ClearBalloon,shion2

,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます

#
#女苑と紫苑が同時にしゃべる特殊演出が挿入されます
#
,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
我らが何故最凶最悪の姉妹なのか\n身を以て知るが良い！\,e15x3,0,0,"Find out firsthand why we are the cursed and evil sisters!"
,ClearBalloon,jyoon

#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,60

,Function,"::battle.Begin_BattleDemo()",# 対戦開始命令

,End	#会話イベントを終了



# -------------------------------------------------------
# プレイヤー敗北
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#会話イベントなしでコンティニュー処理へ

,Function,"::battle.Continue()",# 対戦開始命令

,End
# -------------------------------------------------------
# 中間デモ1
# -------------------------------------------------------
:demo_1
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
#,ImageDef,設定対象,表情内容,表示座標補正X,表示座標補正Y
,ImageDef,marisa,惑1,0,0
,ImageDef,koishi2,普1,0,0
,ImageDef,jyoon,嬉1,0,0
,ImageDef,shion2,普1,0,0

,Show,marisa,-1280	,&#フェイス表示開始
,SetFocus,marisa

,Show,jyoon,-1280	,&#フェイス表示開始
,SetFocus,jyoon
,ImageDef,jyoon,余1,0,0
中々腕は立つねぇ\nだが……\,a,0,0,"Hmm, you're pretty talented. But......"
,ClearBalloon,jyoon

,SetFocus,marisa
,ImageDef,marisa,決1,0,0
負のオーラが出ているお前達に\n負ける気がしないぜ！\,a,0,0,"I don't think I'll lose against this misfortune team!"
,ClearBalloon,marisa

,SetFocus,jyoon	,
,ImageDef,jyoon,決1,0,0
#0１２３４５６７８９０１２３４
あははは、茶番は終わりだ！\n今まさに！\nお前達の負けは確定した！\,c,0,0,"Ahahaha, let's stop with the games! \nJust now! Your fate was sealed!"
,ClearBalloon,jyoon
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,　#　&でつながない場合、一人ずつフェイス画像が撤収していきます


,Sleep,30
,ImageDef,shion2,無1,0,0
,ImageDef,jyoon,決2,0,0
,SetFocus,jyoon		,#発言中キャラを指定
#0１２３４５６７８９０１２３４
憑依交換「\R[アブソリュートルーザー|完全な敗北者！]」\,e15x3,0,0,"Possession Exchange “Absolute Loser!”"
,ClearBalloon,jyoon



#全員フェイス撤去
,Hide,marisa,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,koishi2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,jyoon,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,shion2,-1280,

,Sleep,30

,Function,"::battle.Win()",# 対戦再開命令

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
