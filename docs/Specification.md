# アプリ名
オフライン郵便番号検索

# 種別、カテゴリ
* iOSアプリ
* 無料（広告なし）
* カテゴリ
　App Store > 辞書／辞典／その他
　　or
　App Store > ナビゲーション

# 要件定義
* 全機能オフラインで使える（データ更新以外）
* 郵便番号から住所が探せる
* 住所から郵便番号が探せる
* 結果の住所をコピーできる
* 住所データを更新できる（要通信）

# 基本設計
* ホーム
 * 住所データの更新ボタン
 * 検索履歴（カテゴリ、キーワード）
* カテゴリで探す
 * 「都道府県 > 市区町村 > 地名」の選択で文字入力なしで探す
 * 例）東京都 > 港区 > 赤坂 > 詳細画面
* キーワードで探す
 * 検索窓に「住所、郵便番号」を入力すると検索結果がサジェストされる
 * インクリメンタルサーチ（1文字入力毎に検索結果を更新）
* 詳細画面
 * 表示項目は「郵便番号、住所、読み仮名、コピーボタン」


# UI設計
* 全体構成
 * タブバー（Tabbed Application）
 * ナビゲーションバー
* ホーム画面
 * データ更新ボタン（UIButton）
 * 検索履歴（TableView + TableViewCell）
* カテゴリ画面
 * カテゴリ一覧（TableView + TableViewCell）
* 検索画面
 * 検索窓（SearchBox）
 * 検索結果（TableView + TableViewCell）
* 詳細画面
 * コピーボタン（ UIButton）
 * 詳細情報（郵便番号、住所、読み仮名）：（TableView + TableViewCell）


# DB設計
* 郵便番号（PostalCode）
* 検索履歴（History）
  * 郵便番号（7桁） // Primary
  * 住所
  * 更新日時

# 利用フレームワーク
* 拡張ライブラリ：RxSwift
* API：Alamofire、SwiftyJSON
* DB：Realm

# 詳細設計
* class/ファイル一覧

# 開発環境
* Xcode 7.3.1
* Swift 2.5
* RxSwift 2.3.1
* Realm Swift 1.0.0
* CocoaPods 0.3.9
