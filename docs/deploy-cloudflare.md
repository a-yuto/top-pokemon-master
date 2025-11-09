# Cloudflare Pages デプロイガイド

Cloudflare Pages と Git 連携で `top-pokemon-master` をデプロイするための手順をまとめます。GitHub などのリモートリポジトリに `main` ブランチを用意し、Cloudflare 側で自動ビルド・自動デプロイを行う前提です。

## 1. 事前準備

- Cloudflare アカウントを作成し、Pages が有効化されていることを確認する。
- リポジトリを GitHub / GitLab / Bitbucket など Cloudflare が対応する Git プロバイダにホストする。
- `main` ブランチが常にデプロイ可能な状態を保てるよう、CI で `npm test` と静的解析を通す運用を整える。
- 秘匿情報（API Key など）はリポジトリに含めず、Cloudflare Pages の環境変数で設定する。

## 2. Cloudflare Pages プロジェクト作成

1. Cloudflare ダッシュボード → Pages → **Create a project** を選択。
2. **Connect to Git** を選び、対象のリポジトリを選択。
3. デフォルトブランチに `main` を指定（本番デプロイ対象）。必要に応じて `preview` / `develop` など別ブランチも後から設定できる。

## 3. ビルド設定

| 設定項目        | 値                         | 補足                                      |
|----------------|---------------------------|-------------------------------------------|
| Framework preset | `None`                    | Elm Pages は独自ビルド。                 |
| Build command  | `npm run build`           | `elm-pages build` を呼び出し `dist/` を生成。 |
| Build output directory | `dist`              | 既存のビルド成果物ディレクトリ。           |
| Node version   | `18.19.0` など Elm Pages がサポートする安定版 | Pages の **Environment Variables → Node.js compatibility flags** または `NODE_VERSION` で指定。 |
| Install command | 空欄（デフォルト）        | `npm install` が自動実行される。必要なら明示指定。 |

## 4. 環境変数・シークレット

Cloudflare ダッシュボード → Pages → 対象プロジェクト → **Settings → Environment Variables** で設定する。

- `NODE_VERSION=18.19.0`（Elm Pages の推奨バージョンに合わせる）
- その他 API キー等が必要な場合は `Production` と `Preview` 両方に設定
- CI 同様、`npm_CONFIG_USERCONFIG` 等の特殊設定は不要

## 5. Git 連携とデプロイ運用

1. `main` に push/merge すると自動で本番デプロイが走る。PR ブランチは「Preview Deployments」として自動的に配信。
2. Merge 前に CI で `npm test` と静的解析を通し、失敗時は merge させない。
3. Pages 側でデプロイごとのログを確認し、ビルド失敗時は `Deployments` タブで再実行またはローカルで再現する。
4. 運用ルール：開発者は `ping localhost` で開発環境を確認し、完成後 push → PR → CI → Cloudflare プレビューの順で検証。

## 6. カスタムドメインと HTTPS

1. Cloudflare Pages プロジェクト → **Custom domains** → `Set up a custom domain`。
2. DNS を Cloudflare に移行済みなら自動で A/AAAA/CNAME を設定。別管理の場合は指示に従って CNAME を追加。
3. Cloudflare が自動発行する SSL 証明書を利用し、HTTPS 化が即時反映される。

## 7. トラブルシューティング

- **ビルド失敗**: ログに `elm-pages` 実行エラーが出た場合、`npm install` → `npm run build` をローカルで再現し原因を特定。依存パッケージを追加した場合は `package-lock.json` を更新してコミットする。
- **環境変数不足**: 403/500 が出た場合は Pages の環境変数が揃っているか確認。Production/Preview の両方に同じ値を設定したか確認する。
- **キャッシュ問題**: `Deployments → ... → Invalidate cache` を実行するか、新しいコミットを push する。

以上で Cloudflare Pages への Git 連携デプロイ体制を構築できる。
