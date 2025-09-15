// Pokedex Test Scenario  
export const pokedexScenario = {
  name: "Pokedex Navigation Test",
  description: "ポケモン図鑑のナビゲーションテストシナリオ",
  baseUrl: "http://localhost:1234",
  steps: [
    {
      action: "navigate",
      url: "/pokedex",
      description: "ポケモン図鑑一覧ページへ移動"
    },
    {
      action: "wait",
      selector: ".pokemon-list",
      description: "ポケモンリストの表示を待つ"
    },
    {
      action: "verify",
      selector: ".pokemon-item",
      minCount: 10,
      description: "少なくとも10個のポケモンが表示されることを確認"
    },
    {
      action: "click",
      selector: ".pokemon-item:first-child a",
      description: "最初のポケモンをクリック"
    },
    {
      action: "wait",
      selector: ".pokemon-detail",
      description: "ポケモン詳細ページの表示を待つ"
    },
    {
      action: "verify",
      selector: ".pokemon-stats",
      exists: true,
      description: "ステータス情報が表示されることを確認"
    },
    {
      action: "verify",
      selector: ".pokemon-types",
      exists: true,
      description: "タイプ情報が表示されることを確認"
    },
    {
      action: "screenshot",
      filename: "pokedex-detail.png",
      description: "ポケモン詳細ページのスクリーンショットを保存"
    },
    {
      action: "click",
      selector: ".back-to-list",
      description: "一覧へ戻る"
    },
    {
      action: "wait",
      selector: ".pokemon-list",
      description: "一覧ページへ戻ったことを確認"
    }
  ]
};