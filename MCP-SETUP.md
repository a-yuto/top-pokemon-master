# Playwright MCP Server セットアップガイド

## セットアップ完了状況

✅ Playwright MCPサーバーの導入が完了しました！

### 完了した作業

1. **Claude Desktop設定の更新** ✅
   - `/mnt/c/Users/guita/AppData/Roaming/Claude/claude_desktop_config.json`に設定追加

2. **プロジェクト設定** ✅
   - `.mcp/config.json` - プロジェクト用MCP設定
   - `mcp-scenarios/` - テストシナリオディレクトリ
     - `pokemon-search.js` - ポケモン検索テスト
     - `speed-quiz.js` - 素早さクイズテスト
     - `pokedex.js` - ポケモン図鑑テスト

3. **package.jsonへのスクリプト追加** ✅
   - `npm run mcp:test` - MCPサーバーのテスト実行
   - `npm run mcp:install` - MCP依存関係のインストール
   - `npm run mcp:setup` - Playwrightブラウザのセットアップ

4. **依存関係のインストール** ✅
   - `@playwright/mcp@0.0.37` インストール済み
   - Chromiumブラウザ インストール済み

## 使用方法

### 1. Claude Desktopを再起動

Windowsで以下を実行：
1. Claude Desktopを完全に終了
2. Claude Desktopを再起動

### 2. MCPサーバーの動作確認

Claude Desktopで以下のコマンドを試してください：

```
「Playwrightでlocalhost:1234を開いて」
「ポケモン検索ページをテストして」
「素早さクイズを自動操作して」
```

### 3. プロジェクトでの直接実行

```bash
# MCPサーバーのテスト実行
npm run mcp:test

# 開発サーバーが起動していることを確認
npm start
```

## トラブルシューティング

### WSL環境での注意事項

WSL環境では、システム依存関係が必要な場合があります：

```bash
# 必要に応じて実行
sudo apt-get install libpango-1.0-0
```

### Claude Desktopで認識されない場合

1. 設定ファイルのパスを確認：
   - Windows: `C:\Users\guita\AppData\Roaming\Claude\claude_desktop_config.json`

2. 設定内容を確認：
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp@latest"]
    }
  }
}
```

3. Claude Desktopのログを確認：
   - `C:\Users\guita\AppData\Roaming\Claude\logs\`

## テストシナリオの拡張

新しいテストシナリオを追加する場合は、`mcp-scenarios/`ディレクトリに新しいJSファイルを作成してください。

例：
```javascript
export const myScenario = {
  name: "My Test",
  baseUrl: "http://localhost:1234",
  steps: [
    // テストステップを定義
  ]
};
```

## 参考リンク

- [Playwright MCP GitHub](https://github.com/microsoft/playwright-mcp)
- [Model Context Protocol Docs](https://modelcontextprotocol.io)