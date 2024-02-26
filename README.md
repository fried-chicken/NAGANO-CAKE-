#ながのCAKE

#通販について

#実装機能

##顧客側

##管理者側
|機能名|説明|非ログイン時利用可否|
|---|---|---|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用できるようになる。|⚪︎|
|ログアウト機能|・ログインしている状態からログアウト状態にする。<br>・ログイン時のみ利用できる機能が利用できなくなる。|×|
|注文履歴一覧表示機能|・過去の注文概要を一覧で確認することができる。|×|
|注文履歴詳細表示機能|・注文の詳細（注文商品や個数など）を確認することができる。<br>・注文ステータス、製作ステータスを変更することができる。|×|
|顧客一覧表示機能|・顧客情報を一覧で確認することができる。|×|
|顧客詳細情報表示機能|・顧客の詳細情報を確認することができる。<br>・顧客のステータス（有効/退会）を切り替えることができる。|×|
|商品一覧表示機能|・登録商品を一覧で確認することができる。|×|
|商品詳細情報表示機能|・商品の詳細情報を確認することができる|×|
|商品情報変更機能|・商品の登録情報を変更することができる。<br>・販売ステータスを変更することができる。|×|
|ジャンル設定機能|・ジャンルの追加・変更・ステータス切り替えを行うことができる。|×|

#使用方法
##インストール
$ git clone git@github.com:fried-chicken/NAGANO-CAKE-ver.1.git (SSH) <br>
$ cd NAGANO-CAKE<br>
$ bundle install<br>
$ rails db:migrate<br>

#テスト
ターミナル（もしくはコマンドプロンプト）で上記の作業を行った後、ローカルサーバーにアクセスしてご覧ください。

【管理者用アカウント：ログイン】<br>
URLを/admin/sign_upにし管理者アカウトを作成<br>

【顧客用アカウント：ログイン】 <br>
新規登録でアカウント作成<br>

#使用言語
・HTML&CSS<br>
・Ruby<br>
・フレームワーク<br>
・Rails<br>

#Gem
・bootstrap<br>
・devise<br>
・kaminari<br>

#作成者
チーム名【 fried-chicken 】<br>
・山田竜聖<br>
・和田一樹<br>
・斎藤創太<br>
・林和磨<br>