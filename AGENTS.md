# Repository Guidelines

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 重要

### 参照するドキュメント
../code-guideline/以下にあるドキュメント に必ず従いコードを記述すること。

### 必ず守ること
- **すべての関数に「必ず」unit testを書いてください
- **pipe operator (`|>`) の使用を避ける** - 代わりに通常の関数適用を使用
- **匿名関数の使用を避ける** - 代わりに名前付きヘルパー関数を定義
- **可読性を重視** - コードの意図を明確にする名前付き関数を優先

### 悪い例
```elm
-- 避けるべき書き方
result = 
    data
        |> List.filter (\x -> x.id == targetId)
        |> List.head
```

### 良い例
```elm
-- 推奨する書き方
hasSameId : Int -> Item -> Bool
hasSameId targetId item =
    item.id == targetId

result = 
    List.head (List.filter (hasSameId targetId) data)
```

## 開発のヒント
- Elmは静的解析が強力な言語です。動的な実行確認をする前に静的な確認を必ず行って下さい。
- 新しいページを追加する場合は`app/Route/`にElmファイルを作成
- スタイルは`public/style.css`で管理（ルートのstyle.cssは使用しない）
- BackendTaskを使用してビルド時にデータを取得可能
- カスタムバックエンドタスクは`custom-backend-task.ts`で定義
- 実装は省略せずに行ってください。タイプが関わる記述は大変ですが、省略は厳禁です。
- ファイルサイズは気にするな。コードがいくら長くなろうと気にするな

## プロジェクト概要

このプロジェクトはElm Pagesフレームワークを使用した静的サイトジェネレーターです。Elm言語で書かれたフロントエンドアプリケーションで、Netlifyへのデプロイ設定が含まれています。

## 開発コマンド

### 基本コマンド
- **開発サーバー起動**: `npm start` - ポート1234でローカル開発サーバーを起動
- **本番ビルド**: `npm run build` - 本番用の静的ファイルを`dist/`に生成
- **依存関係インストール**: `npm install` - 初回セットアップ時に実行（自動でelm-toolingもインストール）
- **テスト実行**: `npm test` - ユニットテストを実行（elm-testを使用）

## プロジェクト構造とアーキテクチャ

### ディレクトリ構造
- `app/` - メインアプリケーションコード
  - `Route/` - 各ページコンポーネント（ファイル名がURLパスに対応）
  - `Shared.elm` - アプリケーション全体で共有される状態とロジック
  - `Effect.elm` - カスタムエフェクト（サイドエフェクト）の定義
  - `Api.elm` - APIルート定義（サーバーレス関数）
  - `Site.elm` - サイトメタデータ設定
  - `View.elm` - 共通ビューヘルパー
  - `ErrorPage.elm` - エラーページの処理
- `.elm-pages/` - 自動生成されるディレクトリ（編集不可）
- `public/` - 静的アセット（画像、フォントなど）
- `functions/` - Netlify Functions（サーバーレス関数）
- `dist/` - ビルド出力ディレクトリ
- `tests/` - ユニットテストファイル（13ファイル、136テスト）
  - `tests/PokemonDataTest.elm` - ポケモンデータ関数のテスト
  - `tests/MoveDataTest.elm` - 技データ関数のテスト
  - `tests/WeightedRandomTest.elm` - 重み付きランダム選択のテスト
  - `tests/SpeedQuizIntegrationTest.elm` - SpeedQuizの統合テスト
  - `tests/BattleTypesTest.elm` - バトル用型のテスト
  - `tests/AbilityDataTest.elm` - 特性データのテスト
  - `tests/SpeedTableTest.elm` - 素早さ表のテスト
  - その他のテストファイル

### ルーティングシステム
Elm Pagesは規約ベースのルーティングを採用：
- `app/Route/Index.elm` → `/`
- `app/Route/Hello.elm` → `/hello`
- `app/Route/Blog/Slug_.elm` → `/blog/:slug`（動的ルート）

各ルートモジュールは`StatelessRoute`または`StatefulRoute`として定義し、以下を含む：
- `data`: BackendTaskでのデータフェッチング
- `head`: SEOメタデータ
- `view`: ページのビューレンダリング

### 技術スタック
- **Elm 0.19.1** - メインのプログラミング言語
- **elm-pages 3.0.24** - 静的サイトジェネレーター
- **Vite** - ビルドツール
- **TypeScript** - カスタムバックエンドタスク用
- **Netlify** - デプロイメントプラットフォーム

### 設定ファイル
- `elm.json` - Elmの依存関係とソースディレクトリ
- `elm-pages.config.mjs` - elm-pagesとViteの設定
- `netlify.toml` - Netlifyデプロイ設定
- `elm-tooling.json` - Elmツールのバージョン管理

## ポケモン関連ページ

### 実装済みページ
- **素早さクイズ** (`/speed-quiz`) - `app/Route/SpeedQuiz.elm`
  - 種族値クイズモード：ポケモンの種族値での素早さ比較
  - 実数値クイズモード：努力値・性格・持ち物を含む実数値での素早さ比較
- **素早さ表** (`/speed-table`) - `app/Route/SpeedTable.elm`
  - 使用率Top50ポケモンの素早さ実数値を散布図形式で表示
  - 4つの設定での実数値比較：努力値0、努力値252、努力値252+性格1.1倍、努力値252+性格1.1倍+持ち物1.5倍
  - 横軸に素早さ値、同速のポケモンは縦方向にずらして表示
  - 各ポケモン名と実数値を表示
- **ポケモン検索** (`/search`) - `app/Route/Search.elm`
- **ポケモン図鑑一覧** (`/pokedex`) - `app/Route/Pokedex/Index.elm`
- **個別ポケモン詳細** (`/pokedex/:id`) - `app/Route/Pokedex/Id_.elm`
- **挨拶ページ** (`/greet`) - `app/Route/Greet.elm`

### ポケモンデータアーキテクチャ

#### データ型定義
- `src/Pokemon/Types.elm` - ポケモンと基本型の定義
  - `Pokemon` - ポケモンの基本情報（id、name、stats、types等）
  - `PokemonType` - 全171種類のタイプ組み合わせ（単タイプ18 + 複合タイプ153）
  - `Stats` - 6つの基本ステータス（HP、攻撃、防御、特攻、特防、素早さ）
  - `Evolution`、`EvolutionMethod` - 進化情報
- `src/Pokemon/Move.elm` - 技の型定義
  - `Move` - 技の詳細情報（威力、分類、効果、フラグ等）
  - `MoveCategory` - Physical/Special/Status
  - 30個以上のBooleanフラグで技の特性を表現
  - ステータス変化、状態異常、天候・フィールド効果
- `src/Pokemon/BattleTypes.elm` - バトル用の型定義
  - `BattleKata` - 実戦用ポケモン型（努力値、性格、個体値、持ち物を含む）
  - `Nature` - 25種類の性格と補正値
  - `EffortValues`、`IndividualValues` - 努力値と個体値
  - `calculateRealStats` - 実数値計算関数（レベル50固定）

#### データモジュール
- `src/Pokemon/Data.elm` - **1,201匹全てのポケモンデータ**
  - `allPokemon : List Pokemon` - 全ポケモンのリスト
  - `findPokemonById : Int -> Maybe Pokemon` - ID検索
  - `findPokemonByName : String -> Maybe Pokemon` - 名前検索
- `src/Pokemon/MoveData.elm` - **828の技データ全て**
  - `allMoves : List Move` - 全技のリスト
  - `findMoveById : Int -> Maybe Move` - 技のID検索
  - `findMoveByName : String -> Maybe Move` - 技の名前検索
- `src/Pokemon/AbilityData.elm` - **306の特性データ全て**
  - `Ability` - 特性の型定義（id、name、englishName、description）
  - `allAbilities : List Ability` - 全特性のリスト
  - `findAbilityById : Int -> Maybe Ability` - 特性のID検索
  - `findAbilityByName : String -> Maybe Ability` - 特性の名前検索

#### データ変換スクリプト
- `scripts/convert-data.js` - pokemon-saikyouデータをJSONに変換
- `scripts/convert-to-elm.js` - JSONデータをElm構造体に変換
- 実行：`node scripts/convert-to-elm.js`

### ディレクトリ構造
- `public/images/pokemon/sprites/` - ポケモンスプライト画像
- `public/images/pokemon/icons/` - ポケモンアイコン画像
- `public/data/pokemon/` - JSON形式のポケモンデータ（変換済み）

### 重み付きランダム選択システム
- `src/WeightedRandom.elm` - 使用率ランキングに基づく重み付き選択システム
- **指数的重み付け**: `2^(8 - rank/20)` で計算（1位≈247, 150位=1）
- **上位30位**: 65%の確率で出現、**下位30位**: 1%の確率で出現
- SpeedQuizで競技環境に近い出題頻度を実現
- **BattleKata生成機能**:
  - `generateWeightedBattleKataPair` - 重み付きポケモン選択 + ランダム型選択
  - `BattleKataConfig` - ポケモンごとの型設定（名前、性格、努力値、持ち物）
  - 2段階選択: 1.使用率による重み付きポケモン選択 → 2.そのポケモンの型からランダム選択

#### 重み付きランダムの確率分布
- 1位（ディンルー）: 約2.2%の確率
- 16位（ミミッキュ）: 約1.8%の確率  
- 30位（ムゲンダイナ）: 約1.4%の確率
- 72位（ジラーチ）: 約0.3%の確率
- 126位（ハピナス）: 約0.01%の確率

#### 指数的重み計算の実装例
```elm
-- 使用率ランクから指数的重みを計算
calculateWeight : Int -> Int
calculateWeight rank =
    let
        exponent = 8.0 - (toFloat rank) / 20.0
        exponentialWeight = 2.0 ^ exponent
    in
    max 1 (round exponentialWeight)
```

### 使用率データ統合
- `src/Pokemon/UsageData.elm` - シーズン34の使用率ランキング（150位まで）
  - `findRankByPokemonId : Int -> Maybe Int` - ポケモンIDからランク検索
  - `findRankByPokemonName : String -> Maybe Int` - ポケモン名からランク検索
  - `selectTop10 : List UsageRanking` - 上位10位のランキング選択
  - `selectTopN : Int -> List UsageRanking` - 上位N位のランキング選択
  - `selectTop150Pokemon : List Pokemon` - 有効なTop150ポケモン選択（実際は135匹）
- **名前ベースマッチング**を使用 - WebサイトIDとDB IDの不整合を回避
- **ID不整合の例**: ディンルー（サイト: 1003, DB: 994）→名前で解決

### テスト戦略
- **テスト駆動開発（TDD）を採用** - 実装前にテストを作成
- **109個のテスト**で包括的にカバー（2025年9月時点）
- `tests/WeightedRandomTest.elm` - 重み計算とアルゴリズムの基本テスト
- `tests/SpeedQuizIntegrationTest.elm` - SpeedQuizとWeightedRandomの統合テスト
- **統計的テストは不要** - 基本的な動作確認のみ実施
- **`npm test`でテスト実行** - コード変更後は必ずテストを実行
- **pipe operatorと匿名関数を使わない** - テストコードでも同じ原則を適用
- **テストは具体的に** - 期待する動作を明確に記述

#### 匿名関数の回避例
```elm
-- 悪い例
Expect.all
    [ \_ -> Expect.atLeast minValue actualValue
    , \_ -> Expect.atMost maxValue actualValue
    ] ()

-- 良い例  
let
    isAboveMin = actualValue >= minValue
    isBelowMax = actualValue <= maxValue
    isInValidRange = isAboveMin && isBelowMax
in
Expect.equal True isInValidRange
```

### データ整合性とエラーハンドリング
- 重複排除とフォールバック処理で堅牢性を確保
- `ensureUniquePair`で同じポケモンペアの生成を回避
- `getDefaultPokemon`でフォールバック処理
- ランク範囲外（0以下、151以上）での安全な重み計算

### 素早さクイズの実装詳細
- **デュアルモードクイズシステム**:
  - `QuizMode` - BaseStatsMode（種族値）とRealStatsMode（実数値）の切り替え
  - `QuestionData` - 種族値用とBattleKata用の問題データを統合
  - モード切り替えUI - 画面上部のトグルボタンで簡単切り替え
- **実数値計算**:
  - 計算式：`((種族値*2+個体値+努力値/4)*Lv/100+5) * 性格補正 * 持ち物補正`
  - レベル50固定、個体値31固定
  - 努力値は252または0の振り分け
  - 性格補正は1.1、1.0、0.9の3パターン
  - 持ち物補正は1.5（こだわりスカーフ）または1.0

## コード品質とガイドライン遵守

### 命名規約の統一（2025年9月実施）
**背景**: `../code-guideline/naming-guideline.md` に従って関数名を統一
- **検索機能**: `get*` → `find*` に変更（検索動作を正確に表現）
- **選択機能**: `get*` → `select*` に変更（選択動作を正確に表現）

**対応済み関数**:
- `getPokemonById` → `findPokemonById`
- `getPokemonByName` → `findPokemonByName`
- `getAbilityById` → `findAbilityById`
- `getAbilityByName` → `findAbilityByName`
- `getMoveById` → `findMoveById`
- `getMoveByName` → `findMoveByName`
- `getRankByPokemonId` → `findRankByPokemonId`
- `getRankByPokemonName` → `findRankByPokemonName`
- `getTop10` → `selectTop10`
- `getTopN` → `selectTopN`
- `getTop150Pokemon` → `selectTop150Pokemon`

**対応済みファイル数**: 全15ファイル（src 5ファイル + app 1ファイル + tests 9ファイル）
**テスト結果**: 109テスト全て成功

### コメントガイドライン遵守（2025年9月実施）
**背景**: `../code-guideline/comment-guideline.md` に従ってコメント品質を向上
- **削除対象**: 型名や関数名から明らかなコメント
- **追加対象**: 設計意図、具体例、制約条件、問題マーカー
- **改善例**:
  - 具体的な計算例: `-- 実例: calculateWeight 1 → 256, calculateWeight 30 → 35`
  - 設計意図説明: `-- 2段階選択: 1.使用率による重み付きポケモン選択 → 2.そのポケモンの型からランダム選択`
  - 問題マーカー: `-- FixMe: データ不整合時のハードコードされたフォールバック`

**対応済みファイル**: `WeightedRandom.elm`, `SpeedQuiz.elm`, `BattleTypes.elm`

### モバイル対応（2025年9月実施）
**素早さ表（SpeedTable）のレスポンシブ対応を実装済み**
- 768px以下でグリッドレイアウトに変更
- 固定幅3000pxを廃止し、可変幅レイアウトに変更
- スマートフォンでの横スクロール問題を解決
- 素早さ順にソート表示（高い順）
- タッチ操作に最適化したUIサイズ

### GitHub Issue管理
**issueテンプレートの整備（2025年9月実施）**
- `docs/github-issue-template.md` - 標準化されたissueテンプレートを作成
- issue #3（実数値クイズ問題）を基にテンプレートを設計
- 「要件を詰める項目」セクションで実装前の仕様明確化を促進
- チェックボックス形式で議論の進捗を可視化

**GitHub Projects「Pokemon Project」の運用**
プロジェクト管理のためのステータス管理システムを導入：

1. **Just Idea** - テンプレートに従っていないissue
   - 新規作成されたissue
   - テンプレートに沿って内容を整理し、Ready to Implementに移動

2. **Ready To Implement** - テンプレートに従っているissue
   - 実装に着手できる状態
   - 要件が明確化され、技術的詳細が記載済み

3. **In Progress** - 実装中のもの
   - 開発者がアサインされ、実装作業が進行中

4. **Awaiting Human Review** - 実装完了、人間のレビュー待ち
   - 実装が完了し、人間によるレビューを待っている状態
   - レビュー完了後はDoneに移動
   - 修正が必要な場合は別の新しいissueを作成

5. **Done** - 完了したissue
   - レビューも含めて全ての作業が完了

6. **Do Not But Resolved** - 実装不要で解決済み
   - issueは作成されたが、他の方法で問題が解決
   - 実装を行わずに完了扱い

**チケット分解のガイドライン**
大規模なissueの実装前に以下の基準でチケット分解を検討：

**分解判定基準**:
- 実装で3ファイル以上の修正・作成が必要になりそうな場合

**分解時のルール**:
1. **ファイル数制限**: 一つのチケットで修正するファイル数は2以下
2. **依存関係最小化**: チケット間の依存関係を最小限に抑える
3. **依存関係の明記**: 依存関係がある場合は各チケットで明確に記載

**分解例**:
```
元: ポケモン検索機能 (3ファイル以上)
↓
分解後:
- チケットA: 検索ロジックの実装 (SearchEngine.elm)
- チケットB: 検索UIの実装 (Search.elm)
- チケットC: 検索結果表示の実装 (SearchResult.elm)
  依存: チケットA、B完了後
```

### 既知の問題
- **実数値クイズモードの問題**: speed-quizページで実数値が表示されクイズになっていない（GitHub issue作成済み）
  - 該当箇所: `app/Route/SpeedQuiz.elm`の389行目
  - 修正対象: `viewBattleKataButton`関数

- ユーザーにlocalhostで確認するときは、pingでlocalhostにサーバーが建っていることを確認してからにしてください
- タスクの完了はユニットテストがすべて通ること、静的解析が通ることは必要条件とします
