# Yoron!

## 概要
意見の分かれる議題に対し、投票形式で世論をはっきりさせるためのサービスです。
投票結果をグラフ化することで、世の中の意見を見える化します。

***URL***
http://yoronjp.org

## 使い方
***投票***
各トピックページに移動し、プルダウンから選択肢を選び投票ボタンを押すことで投票が可能です。
一度投票すると、同じトピックに対して２４時間は再投票することができません。

***トピック投稿***
トピック投稿ページから、タイトル、名前、本文、選択肢を入力し、投稿ボタンを押下します。
同一IPからのトピック投稿は３時間に１度までです。

## こだわったポイント
・イタズラ防止のため、IPによる投票やトピック投稿の制限をできるようにした。
・あらゆる端末に対応できるよう、レスポンシブデザインを採用した。

## 開発環境
言語：Ruby
フレームワーク:Ruby on Rails
DB:MySQL


## 今後の展望
以下の機能の追加を検討しています。
・現在は投稿したトピックが全ユーザーに公開されていますが、学校のクラスやサークルなど限られたユーザーのみが投票に参加できるよう、非公開のトピック投稿ができる機能を追加する
・再投票までの期間や、投票可能期間をトピック投稿者が設定できるようにする

## 課題
本サイトはユーザーの投票ありきのサービスであるが、現在アクセスが少なくサイト本来の存在意義を果たせていない。

## 解決案
・Twitterアカウントを作り、トピックに関するツイートをしているユーザーにリプライを送ることで認知度を上げていく
　→実験的にリプライを送ってみたところ、思ったよりも多くアクセスが集まった。ただしリプライを送る作業はかなり手間なので、自動でリプライできるbotの開発を検討中。
・Webサービスを紹介しているサイトに登録し、被リンクを増やす

## コンタクト
yoronjp1@gmail.com
