// Speed Quiz Test Scenario
export const speedQuizScenario = {
  name: "Speed Quiz Test",
  description: "素早さクイズ機能のテストシナリオ",
  baseUrl: "http://localhost:1234",
  steps: [
    {
      action: "navigate",
      url: "/speed-quiz",
      description: "素早さクイズページへ移動"
    },
    {
      action: "wait",
      selector: ".quiz-container",
      description: "クイズコンテナの表示を待つ"
    },
    {
      action: "verify",
      selector: ".pokemon-option",
      count: 2,
      description: "2つのポケモンオプションが表示されることを確認"
    },
    {
      action: "click",
      selector: ".pokemon-option:first-child",
      description: "最初のポケモンを選択"
    },
    {
      action: "wait",
      selector: ".result-display",
      timeout: 2000,
      description: "結果表示を待つ"
    },
    {
      action: "verify",
      selector: ".score",
      exists: true,
      description: "スコアが表示されることを確認"
    },
    {
      action: "screenshot",
      filename: "speed-quiz-result.png",
      description: "クイズ結果のスクリーンショットを保存"
    },
    {
      action: "click",
      selector: ".next-question-button",
      description: "次の問題へ進む"
    }
  ]
};