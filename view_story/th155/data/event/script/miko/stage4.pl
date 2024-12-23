#========================================================================
#	神子：ステージ4　試作　
#	場所：
#　 スレイブ：聖　敵チーム：紫
#	ステージタイトル
#	   「」
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

,Function,"::battle.Enable_win_demo(false)"#勝利ポーズ演出無し

#フェイス画像参照の定義
#1Pmaster
,LoadImageDef,miko,"data/event/pic/miko/face.pat"#名前,ソースファイル名
,DefineObject,miko,miko,1p,240,0,false#名前,グループ名,x,y,反転

#1Pslave
,LoadImageDef,hijiri,"data/event/pic/hijiri/face.pat"#名前,ソースファイル名
,DefineObject,hijiri2,hijiri,1p,240,0,false#名前,グループ名,x,y,反転

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

,LoadAnimationLocal,"data/actor/story_title/miko/title4.pat",1#ステージタイトル画像読み込み
,LoadAnimationLocal,"data/actor/story_name/koishi/name.pat",1#敵肩書画像読み込み
,LoadAnimationLocal,"data/actor/story_name/ichirin/name2.pat",1#敵肩書画像読み込み
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
,ImageDef,miko,普1,0,0
,ImageDef,hijiri2,普2,0,0
,ImageDef,yukari,嬉1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Sleep,60#スリープ命令　指定数値フレーム待ちます

#タイトルコール出現(現在未実装)
,Function,"::battle.Show_StageTitle()"#タイトルコール出現
,Sleep,150

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる
,Sleep,50

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普2,0,0
ここは何処？\,a,0,0,"Where are we?"
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
#会話テキスト、\nで改行、末尾\でキー入力を待ちます\,吹き出し指定,表示座標補正X,表示座標補正Y
ライブ会場だ\nこれからプリズムリバー楽団の\nライブが行われるぞ\,a,0,0,"The concert hall. \nThe Prismriver concert will be begin soon."
,ClearBalloon,miko#対象の吹き出し消去

#ここでこういう演出が欲しい、という注文があったらガンガン本文に注釈文挟んでください
#可能な限り対応しますぞ
# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,驚1,0,0
ここに誰かが現れるのかしら\,a,0,0,"I wonder if someone will appear."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,普2,0,0
いや、ここに寄ったのは営業だ\n観客の前で演説をする\,a,0,0,"No, I made a stop for business. \nI plan to address the audience."
,ClearBalloon,miko#吹き出し消去

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,汗1,0,0
え？　営業？　えー？\nそんなの聞いてないよー\,a,0,0,"Hm? Business? \nI didn't hear anything about this."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,余1,0,0
#0１２３４５６７８９０１２３４
支持者を集めるというのは\nこういう地道な活動から\n始まるのだ\,a,0,0,"To gather followers, one must begin with small steps such as this."
,ClearBalloon,miko#吹き出し消去

,Hide,miko,-1280,
,Hide,hijiri2,-1280,
,Function,"::battle.team[1].current.StageIn_Special()"#実行チームが画面上から出現
,Sleep,90#スリープ命令　指定数値フレーム待ちます

,Show,yukari,-1280,&	#対象フェイス表示開始
,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,嬉1,0,0
ライブ、楽しみねぇ\,a,0,0,"A concert. Exciting."
,ClearBalloon,yukari

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,驚1,0,0
貴方は……確か\n幻想郷を裏で牛耳っているという\,a,0,0,"You……I've heard you rule the Gensokyo from behind the scenes."
,ClearBalloon,miko#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普2,0,0
あら、完全憑依の調査？\n誰に頼まれた訳でも無く\n精が出るわね\,a,0,0,"Oh my, a Perfect Possession investigation? \nYou work hard without being asked."
,ClearBalloon,yukari

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,惑1,0,0
何しに出てきた？\nまさかライブを見に来た\nなんてことは無いよな\,a,0,0,"What did you come here for? \nI doubt it's to see the concert…"
,ClearBalloon,miko#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,余1,0,0
#0１２３４５６７８９０１２３４
商売敵で組むなんて……\,a,0,0,"To work with your business rival……"
最後、二人で戦う形になって\n残念な結果になるのが目に見える\,a,0,0,"In the end, I see that the two of you will end up fighting each other \nwith an unfortunate result."
,ClearBalloon,yukari

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,怒1,0,0
質問に答えよ\nここに何しに来たのだ？\,a,0,0,"Answer my question. \nWhat are you here for?"
,ClearBalloon,miko#吹き出し消去

,SetFocus,yukari		,#発言中キャラを指定
,ImageDef,yukari,普1,0,0
#0１２３４５６７８９０１２３４
ねえ、貴方達の調査の続き\n私に引き継がせて貰えないかしら\,a,0,0,"Your investigation, could you let me take it over?"
,ClearBalloon,yukari

,SetFocus,miko		,	#発言キャラを指定
,ImageDef,miko,驚1,0,0
後から出てきて\n情報をよこせ、と言うのか！\,a,0,0,"You mean to say, hand over our information?"
,ImageDef,miko,怒1,0,0
下らん、下らなすぎるぞ！\n心底失望したわ！\,b,0,0,"Absurd, absurd! \nI'm deeply disappointed."
,ImageDef,miko,決1,0,0
二対一だからといって\n遠慮することは無い\n全力で行くぞ！\,b,0,0,"Just because it's two vs. 1, there's no need to hold back. \nWe will fight at full force!"
,ClearBalloon,miko#吹き出し消去

,Function,"::sound.StopBGM(1000)",# BGM停止 1000=一秒掛けてフェードアウト

#全員フェイス撤去
,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
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
,ImageDef,miko,負1,0,0
,ImageDef,hijiri2,負1,0,0
,ImageDef,yukari,普1,0,0

,Show,miko,-1280	,&#フェイス表示開始(現在フェイスの表示がSetFocusと紐づけられているため、顔の同時出現ができないため、今後対応します
#,Show,hijiri2,-1280	,&
,Show,yukari,-1280	,&#フェイス表示開始

,SetFocus,miko
,SetFocus,yukari
,ImageDef,yukari,余1,0,0
#0１２３４５６７８９０１２３４
さあ、調査結果を教えてくれる？\n私は本気では負けたくないの\,a,0,0,"Now, will you share the investigation results? \nI seriously don't want to lose."
,ClearBalloon,yukari

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
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
,ImageDef,miko,怒1,0,0
,ImageDef,hijiri2,余1,0,0
,ImageDef,yukari,普1,0,0

,Show,miko,-1280	,&#フェイス表示開始
,Show,yukari,-1280	,&#フェイス表示開始


,SetFocus,yukari,&
,SetFocus,miko		,
,ImageDef,miko,怒1,0,0
お前、本気では無いな\nこれでは興が乗らん\,a,0,0,"You're not serious. \nThis isn't interesting."
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,普2,0,0
もう十分よ\n貴方達の調査結果は\n戦い方で判ったわ\,a,0,0,"It's enough. \nI figured out your investigation results from your fighting methods."
#0１２３４５６７８９０１２３４
それでは私の方からも情報を……\,c,0,0,"And now some information from me."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,惑1,0,0
情報？\,a,0,0,"Information?"
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,普,0,0
私はすでに\n完全憑依異変の黒幕を掴んでいる\,a,0,0,"I have already figured out the mastermind \nbehind the Perfect Possession Incident."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,驚1,0,0
なんだと？\,a,0,0,"What did you say?"
,ClearBalloon,miko

,SetFocus,yukari
,ImageDef,yukari,惑1,0,0
#0１２３４５６７８９０１２３４
でもね、そいつを打ち破る\n手段が判らないの\,a,0,0,"But the means to destroy this fellow, I don't know."
だから情報が欲しかった\nというのは本当よ\,a,0,0,"So it was true I wanted information."
,ClearBalloon,yukari

,SetFocus,miko		,
,ImageDef,miko,怒1,0,0
そんな話、誰が信じられる……\,a,0,0,"Who can believe that kind of story……"
お前が黒幕である可能性の方が\n存分にあるではないか！\,a,0,0,"There's a good chance that you are the mastermind!"
,ClearBalloon,miko

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,Show,hijiri2,-1280,	#対象フェイス表示開始
,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普1,0,0
……今噂になっていないもので\n私達が掴んでいる情報は\,a,0,0,"……We've found information that's not yet a rumor."
#0１２３４５６７８９０１２３４
,ImageDef,hijiri2,普2,0,0
同意完全憑依の場合は\nマスター側に憑依解除の\n主導権があり\,a,0,0,"With consensual Perfect Possession, \nthe master has the power to cancel possession."
,ImageDef,yukari,驚1,0,0
強制完全憑依の場合は\nスレイブ側に主導権がある\nと言うこと\,a,0,0,"With enforced Perfect Possession, the slave has that power."
,ClearBalloon,hijiri2

# =====
,Hide,hijiri2,-1280, &
,Function,"::battle.team[0].current.Team_Change_Master(null)",		# マスターに入れ替わる

,SetFocus,miko		,
,ImageDef,miko,怒1,0,0
おい\,a,0,0,"Hey."
,ClearBalloon,miko

# =====
,Hide,miko,-1280, &
,Function,"::battle.team[0].current.Team_Change_Slave(null)",		# スレイブに入れ替わる

,SetFocus,hijiri2		,#発言中キャラを指定
,ImageDef,hijiri2,普1,0,0
#0１２３４５６７８９０１２３４
悩みを打ち明ける色んな人間を\n見てきた私には\,a,0,0,"I've seen many humans confide in their troubles."
相手が嘘を吐いているかどうか\nなんてすぐに判る\,a,0,0,"I can tell if one is lying, right away."
,ImageDef,hijiri2,惑1,0,0
こいつは半分嘘を吐いているけど\n黒幕を掴んでいるというのは\n嘘では無いわ\,a,0,0,"Half of her stories are lies but it's true that she has found the mastermind."
,ImageDef,hijiri2,普2,0,0
暗に、情報を提供すれば\n私達が探し求めている\n黒幕を教えてくれる\,a,0,0,"She's hinting that If we secretly provide information."
,ImageDef,hijiri2,余1,0,0
って匂わせてるんだから\nこちらとしては教えた方が\n早いでしょ？\,a,0,0,"she'll tell us something about the mastermind. \nSo wouldn't it be faster to share our information?"
,ClearBalloon,hijiri2

,SetFocus,yukari
,ImageDef,yukari,普2,0,0
#0１２３４５６７８９０１２３４
ふっふっふ\,a,0,0,"Hehehe."
,ImageDef,yukari,普1,0,0
そっちの僧侶の方が\n世渡り上手そうね\,a,0,0,"This monk is street smart."
,ImageDef,yukari,嬉1,0,0
本当にいい情報が聞けたわ\nでは、こちらからも最高の情報を\n教えてあげる\,a,0,0,"I heard some good information. \nNow I will share some of mine."
,ClearBalloon,yukari

,Function,"::sound.StopBGM(1500);"
,Function,"::battle.Go_NextStage();"

,Hide,miko,-1280,&	#　&でつなぐと「処理を終えたら次へ進む」系の命令を同時に実行可能
,Hide,hijiri2,-1280,&　#これは四人分のフェイス画像を同時に1280ドット外へ向けて撤収させています
,Hide,yukari,-1280,&　#　&でつながない場合、一人ずつフェイス画像が撤収していきます
,Hide,hijiri2,-1280,

,Sleep,60

,End
