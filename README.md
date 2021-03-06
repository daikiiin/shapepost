# README
[![Image from Gyazo](https://i.gyazo.com/34668a2f62bfb921a255804eda095515.jpg)](https://gyazo.com/34668a2f62bfb921a255804eda095515)
# ShapePost
**自分の習慣の定着や成果を簡単に記録できるかつ不特定多数の人に見られてる環境を作ろう！**

**自分の成果を残したいかつ不特定多数（同じ目的の人たち）に見られてる環境で自分を律するためのアプリをテーマに作成しました**


## 💫 App URL
### **https://shapepost.herokuapp.com/**

# 本番環境
#### ログイン情報（テスト用）
* Email ：test@test
* password :111aaa
#### basic認証
* ID :nomotti
* password :8888

# 制作背景
**昨今の健康志向ブームに乗っかってダイエット管理サイトを作ろうと思った。最初にどういうものを作ろうかなと考えたときに運動や食事制限諸々ある中でダイエットの一番の難敵になるのが自己管理や習慣の定着だと考えたのでそれらを手助けできる手軽な記録機能かつ不特定多数の人に見られていることによるモチベーションの向上を図れるようなサイトを作ろうと思い立った。**

# Demo
## トップページ（ログイン画面 新規登録画面)
[![Image from Gyazo](https://i.gyazo.com/19b8eadfbf8bf4bee7bb67d613033612.png)](https://gyazo.com/19b8eadfbf8bf4bee7bb67d613033612)

[![Image from Gyazo](https://i.gyazo.com/d81e2bde2eb131866ac1ca3c8eb2f731.png)](https://gyazo.com/d81e2bde2eb131866ac1ca3c8eb2f731)

## 投稿画面
[![Image from Gyazo](https://i.gyazo.com/e3045b7666092c7ae14fed4f390f79f9.png)](https://gyazo.com/e3045b7666092c7ae14fed4f390f79f9)
## 投稿表示画面
[![Image from Gyazo](https://i.gyazo.com/29a24634201358b8a230a3b70129dfbe.jpg)](https://gyazo.com/29a24634201358b8a230a3b70129dfbe)
## 詳細画面
[![Image from Gyazo](https://i.gyazo.com/c3db5406f6d6fe0cd2397f70e352e53c.png)](https://gyazo.com/c3db5406f6d6fe0cd2397f70e352e53c)
## マイページ画面
[![Image from Gyazo](https://i.gyazo.com/1c0a5e8b1117eedab94b5100242f7661.jpg)](https://gyazo.com/1c0a5e8b1117eedab94b5100242f7661)

# 🔥 Features
* devise scopeを使いトップページをログイン画面にすることで多少の匿名性向上
* 自分の習慣の定着や成果を記録できるようにするのが目的のためプロフィール登録を最低限なものにすることで手軽さと匿名性の向上を図った。
* 自分の成果を残したいかつ不特定多数（同じ目的の人たち）に見られてる環境で自分を律するためのサイトを心掛けた。
* 一週間の自分の変化などがパッと見て分かるような画面にした。
* ちょっとした記録サイトとしての手軽さを追求した。
* 投稿数が多くなるとページ毎で移動可能になる。

 
# 使用技術(開発環境)
# バックエンド
**ruby,ruby on rails**
# フロントエンド
**Sass,javascript,jquery,bootstrap**
# データベース
**MySQL,SequelPro**
# webサーバー(本番環境)
**heroku**
# ソース管理
**github, githubDesktop**
# テスト
**RSpec**
# エディタ
**VSCode**

# 課題や今後実装したい機能
* javascriptの動的な動きや計算機能を今後追加したい
* まだ大量のデータを保存する予定はないが今後はAWSのS3を用いて画像を保存できるようにする
* レスポンシブデザインをもっと心掛けて実装していくことが課題と感じた。

# DB設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |
| hight              | integer | null: false              | 
| weight             | integer | null: false              |
| age                | integer | null: false              |
| sex_id             | integer | null: false              |
| training_status_id | integer | null: false              |
| training_goal_id   | integer | null: false              |

### Association

- has_many : posts
- has_many : comments

## posts テーブル

| Column              | Type    | Options     |
| --------------------| ------  | ----------- |
| name                | string  | null: false |
| explain             | text    | null: false | 
| training_status_id  | integer | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | null: false |
| user     | references | null: false, foreign_key: true |
| post     | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :post
