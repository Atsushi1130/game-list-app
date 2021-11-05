使用環境
-----------
ruby 2.6.8

rails 6.1.4

heroku

起動
-------
`git clone https://github.com/Atsushi1130/game-list-app myApp`

`cd myApp`

`rails db:migrate`

`rails s`

→webpackerでエラーが出た場合

`rails webpacker:install`

`rails webpacker:compile`

を行ってから再度

`rails s`


アプリ概要
------
日本国内で発売されたゲームの情報を共有するためのSNSです。
誰でもゲームソフトに対してレビューをして、投稿することができます。
投稿にはコメントを残すことも可能です。
