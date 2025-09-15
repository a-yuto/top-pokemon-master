// Pokemon Search Test Scenario
export const searchScenario = {
  name: "Pokemon Search Test",
  description: "ポケモン検索機能のテストシナリオ",
  baseUrl: "http://localhost:1234",
  steps: [
    {
      action: "navigate",
      url: "/search",
      description: "検索ページへ移動"
    },
    {
      action: "wait",
      selector: "#search-input",
      description: "検索入力欄の表示を待つ"
    },
    {
      action: "fill",
      selector: "#search-input",
      text: "ピカチュウ",
      description: "ピカチュウを検索"
    },
    {
      action: "click",
      selector: "#search-button",
      description: "検索ボタンをクリック"
    },
    {
      action: "wait",
      selector: ".pokemon-result",
      description: "検索結果の表示を待つ"
    },
    {
      action: "verify",
      selector: ".pokemon-name",
      expectedText: "ピカチュウ",
      description: "ピカチュウが表示されることを確認"
    },
    {
      action: "screenshot",
      filename: "pokemon-search-result.png",
      description: "検索結果のスクリーンショットを保存"
    }
  ]
};