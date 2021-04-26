# README
[![Image from Gyazo](https://i.gyazo.com/34668a2f62bfb921a255804eda095515.jpg)](https://gyazo.com/34668a2f62bfb921a255804eda095515)
# ShapePost

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
**昨今の健康志向ブームに乗っかってダイエット管理サイトを作ろうと思った。最初にどういうものを作ろうかなと考えたときに運動や食事制限諸々ある中でダイエットの一番の難敵になるのが自己管理や習慣の定着だと考えたのでそれらを手助けできる記録機能かつモチベーションの向上を図れるようなサイトを作ろうと思い立った。**

# Demo
## トップページ（ログイン画面 新規登録画面)
[![Image from Gyazo](https://i.gyazo.com/19b8eadfbf8bf4bee7bb67d613033612.png)](https://gyazo.com/19b8eadfbf8bf4bee7bb67d613033612)

[![Image from Gyazo](https://i.gyazo.com/d81e2bde2eb131866ac1ca3c8eb2f731.png)](https://gyazo.com/d81e2bde2eb131866ac1ca3c8eb2f731)

## 投稿画面
[![Image from Gyazo](https://i.gyazo.com/3bff7ef39603fb1100866811baabaf11.png)](https://gyazo.com/3bff7ef39603fb1100866811baabaf11)
## 投稿表示画面
[![Image from Gyazo](https://i.gyazo.com/1d6e63c82faae16555c2c895449faab8.jpg)](https://gyazo.com/1d6e63c82faae16555c2c895449faab8)
## 詳細画面
[![Image from Gyazo](https://i.gyazo.com/6980cfca11f22850794aa358d2bbd156.jpg)](https://gyazo.com/6980cfca11f22850794aa358d2bbd156)
## マイページ画面
[![Image from Gyazo](https://i.gyazo.com/32b2194c25aa36d7d5a02bfe518a640b.jpg)](https://gyazo.com/32b2194c25aa36d7d5a02bfe518a640b)

# 🔥 Features
* devise scopeを使いトップページをログイン画面にすることで多少の匿名性向上
* 自分の成果を残したいかつ不特定多数（同じ目的の人たち）に見られてる環境で自分を律するためのサイトを心掛けた。
* 一週間の自分の変化などがパッと見て分かるような画面にした。
* ちょっとした記録サイトとしての手軽さを追求した。
 
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
* AWSのS3を用いて画像を保存したい
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
