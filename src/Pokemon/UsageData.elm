module Pokemon.UsageData exposing
    ( UsageRanking
    , season34Rankings
    , findRankByPokemonId
    , findRankByPokemonName
    , selectTop10
    , selectTopN
    , selectTop50Pokemon
    , selectTop150Pokemon
    )

import Pokemon.Data exposing (findPokemonById, findPokemonByName)
import Pokemon.Types exposing (Pokemon)


type alias UsageRanking =
    { rank : Int
    , pokemonId : Int
    , name : String
    }


season34Rankings : List UsageRanking
season34Rankings =
    [ { rank = 1, pokemonId = 1003, name = "ディンルー" }
    , { rank = 2, pokemonId = 1002, name = "パオジアン" }
    , { rank = 3, pokemonId = 10194, name = "バドレックス(黒馬)" }
    , { rank = 4, pokemonId = 977, name = "ヘイラッシャ" }
    , { rank = 5, pokemonId = 987, name = "ハバタクカミ" }
    , { rank = 6, pokemonId = 493, name = "アルセウス" }
    , { rank = 7, pokemonId = 1007, name = "コライドン" }
    , { rank = 8, pokemonId = 1008, name = "ミライドン" }
    , { rank = 9, pokemonId = 892, name = "ウーラオス" }
    , { rank = 10, pokemonId = 645, name = "ランドロス" }
    , { rank = 11, pokemonId = 970, name = "キラフロル" }
    , { rank = 12, pokemonId = 472, name = "グライオン" }
    , { rank = 13, pokemonId = 250, name = "ホウオウ" }
    , { rank = 14, pokemonId = 888, name = "ザシアン" }
    , { rank = 15, pokemonId = 149, name = "カイリュー" }
    , { rank = 16, pokemonId = 778, name = "ミミッキュ" }
    , { rank = 17, pokemonId = 1017, name = "オーガポン" }
    , { rank = 18, pokemonId = 382, name = "カイオーガ" }
    , { rank = 19, pokemonId = 980, name = "ドオー" }
    , { rank = 20, pokemonId = 934, name = "キョジオーン" }
    , { rank = 21, pokemonId = 901, name = "ガチグマ" }
    , { rank = 22, pokemonId = 903, name = "オオニューラ" }
    , { rank = 23, pokemonId = 861, name = "オーロンゲ" }
    , { rank = 24, pokemonId = 1018, name = "ブリジュラス" }
    , { rank = 25, pokemonId = 132, name = "メタモン" }
    , { rank = 26, pokemonId = 792, name = "ルナアーラ" }
    , { rank = 27, pokemonId = 990, name = "テツノワダチ" }
    , { rank = 28, pokemonId = 594, name = "ママンボウ" }
    , { rank = 29, pokemonId = 552, name = "モモワロウ" }
    , { rank = 30, pokemonId = 1015, name = "ムゲンダイナ" }
    , { rank = 31, pokemonId = 905, name = "ラブトロス" }
    , { rank = 32, pokemonId = 1019, name = "ウネルミナモ" }
    , { rank = 33, pokemonId = 986, name = "サケブシッポ" }
    , { rank = 34, pokemonId = 464, name = "ドサイドン" }
    , { rank = 35, pokemonId = 76, name = "ゴローニャ" }
    , { rank = 36, pokemonId = 965, name = "ノココッチ" }
    , { rank = 37, pokemonId = 993, name = "テツノイバラ" }
    , { rank = 38, pokemonId = 1001, name = "コオリッポ" }
    , { rank = 39, pokemonId = 995, name = "テツノイサハ" }
    , { rank = 40, pokemonId = 143, name = "カビゴン" }
    , { rank = 41, pokemonId = 644, name = "ゼクロム" }
    , { rank = 42, pokemonId = 235, name = "ドーブル" }
    , { rank = 43, pokemonId = 643, name = "レシラム" }
    , { rank = 44, pokemonId = 1004, name = "イダイナキバ" }
    , { rank = 45, pokemonId = 984, name = "アラブルタケ" }
    , { rank = 46, pokemonId = 1016, name = "ウォーグル" }
    , { rank = 47, pokemonId = 989, name = "テツノコウベ" }
    , { rank = 48, pokemonId = 988, name = "テツノブジン" }
    , { rank = 49, pokemonId = 1025, name = "テラパゴス" }
    , { rank = 50, pokemonId = 985, name = "スナノケガワ" }
    , { rank = 51, pokemonId = 487, name = "ギラティナ" }
    , { rank = 52, pokemonId = 248, name = "バンギラス" }
    , { rank = 53, pokemonId = 889, name = "ザマゼンタ" }
    , { rank = 54, pokemonId = 908, name = "マスカーニャ" }
    , { rank = 55, pokemonId = 823, name = "アーマーガア" }
    , { rank = 56, pokemonId = 991, name = "テツノツツミ" }
    , { rank = 57, pokemonId = 1000, name = "サーフゴー" }
    , { rank = 58, pokemonId = 113, name = "ラッキー" }
    , { rank = 59, pokemonId = 492, name = "シェイミ" }
    , { rank = 60, pokemonId = 547, name = "エルフーン" }
    , { rank = 61, pokemonId = 184, name = "マリルリ" }
    , { rank = 62, pokemonId = 937, name = "ソウブレイズ" }
    , { rank = 63, pokemonId = 887, name = "ドラパルト" }
    , { rank = 64, pokemonId = 648, name = "メロエッタ" }
    , { rank = 65, pokemonId = 748, name = "ドヒドイデ" }
    , { rank = 66, pokemonId = 646, name = "キュレム" }
    , { rank = 67, pokemonId = 38, name = "キュウコン" }
    , { rank = 68, pokemonId = 706, name = "ヌメルゴン" }
    , { rank = 69, pokemonId = 385, name = "ジラーチ" }
    , { rank = 70, pokemonId = 384, name = "レックウザ" }
    , { rank = 71, pokemonId = 233, name = "ポリゴン２" }
    , { rank = 72, pokemonId = 485, name = "ヒードラン" }
    , { rank = 73, pokemonId = 450, name = "カバルドン" }
    , { rank = 74, pokemonId = 197, name = "ブラッキー" }
    , { rank = 75, pokemonId = 571, name = "ゾロアーク" }
    , { rank = 76, pokemonId = 474, name = "ポリゴンZ" }
    , { rank = 77, pokemonId = 475, name = "エルレイド" }
    , { rank = 78, pokemonId = 936, name = "グレンアルマ" }
    , { rank = 79, pokemonId = 996, name = "フリージオ" }
    , { rank = 80, pokemonId = 483, name = "ディアルガ" }
    , { rank = 81, pokemonId = 484, name = "パルキア" }
    , { rank = 82, pokemonId = 717, name = "イベルタル" }
    , { rank = 83, pokemonId = 716, name = "ゼルネアス" }
    , { rank = 84, pokemonId = 719, name = "ディアンシー" }
    , { rank = 85, pokemonId = 720, name = "フーパ" }
    , { rank = 86, pokemonId = 721, name = "ボルケニオン" }
    , { rank = 87, pokemonId = 791, name = "ソルガレオ" }
    , { rank = 88, pokemonId = 381, name = "ラティオス" }
    , { rank = 89, pokemonId = 1021, name = "タケルライコ" }
    , { rank = 90, pokemonId = 992, name = "テツノカイナ" }
    , { rank = 91, pokemonId = 994, name = "テツノドクガ" }
    , { rank = 92, pokemonId = 1013, name = "ヤバソチャ" }
    , { rank = 93, pokemonId = 576, name = "ゴチルゼル" }
    , { rank = 94, pokemonId = 1023, name = "テツノカシラ" }
    , { rank = 95, pokemonId = 894, name = "レジエレキ" }
    , { rank = 96, pokemonId = 94, name = "ゲンガー" }
    , { rank = 97, pokemonId = 752, name = "オニシズクモ" }
    , { rank = 98, pokemonId = 279, name = "ペリッパー" }
    , { rank = 99, pokemonId = 530, name = "ドリュウズ" }
    , { rank = 100, pokemonId = 904, name = "ハリーマン" }
    , { rank = 101, pokemonId = 488, name = "クレセリア" }
    , { rank = 102, pokemonId = 637, name = "ウルガモス" }
    , { rank = 103, pokemonId = 900, name = "バサギリ" }
    , { rank = 104, pokemonId = 130, name = "ギャラドス" }
    , { rank = 105, pokemonId = 145, name = "サンダー" }
    , { rank = 106, pokemonId = 925, name = "イッカネズミ" }
    , { rank = 107, pokemonId = 196, name = "エーフィ" }
    , { rank = 108, pokemonId = 956, name = "クエスパトラ" }
    , { rank = 109, pokemonId = 227, name = "エアームド" }
    , { rank = 110, pokemonId = 1020, name = "ウガツホムラ" }
    , { rank = 111, pokemonId = 242, name = "ハピナス" }
    , { rank = 112, pokemonId = 380, name = "ラティアス" }
    , { rank = 113, pokemonId = 893, name = "ザルード" }
    , { rank = 114, pokemonId = 895, name = "レジドラゴ" }
    , { rank = 115, pokemonId = 896, name = "ブリザポス" }
    , { rank = 116, pokemonId = 897, name = "レイスポス" }
    , { rank = 117, pokemonId = 902, name = "オーロット" }
    , { rank = 118, pokemonId = 924, name = "タイカイデン" }
    , { rank = 119, pokemonId = 959, name = "ナカヌチャン" }
    , { rank = 120, pokemonId = 289, name = "ケッキング" }
    , { rank = 121, pokemonId = 906, name = "ニャイキング" }
    , { rank = 122, pokemonId = 907, name = "フラエッテ" }
    , { rank = 123, pokemonId = 909, name = "ウェーニバル" }
    , { rank = 124, pokemonId = 910, name = "ラウドボーン" }
    , { rank = 125, pokemonId = 912, name = "クルマユ" }
    , { rank = 126, pokemonId = 913, name = "ハルクジラ" }
    , { rank = 127, pokemonId = 914, name = "コノヨザル" }
    , { rank = 128, pokemonId = 915, name = "ドドゲザン" }
    , { rank = 129, pokemonId = 916, name = "イルカマン" }
    , { rank = 130, pokemonId = 917, name = "ミミズズ" }
    , { rank = 131, pokemonId = 918, name = "キョジオーン" }
    , { rank = 132, pokemonId = 919, name = "ナンジャモ" }
    , { rank = 133, pokemonId = 920, name = "セグレイブ" }
    , { rank = 134, pokemonId = 921, name = "カヌチャン" }
    , { rank = 135, pokemonId = 581, name = "スワンナ" }
    , { rank = 136, pokemonId = 598, name = "ナットレイ" }
    , { rank = 137, pokemonId = 598, name = "ナットレイ" }
    , { rank = 138, pokemonId = 609, name = "シャンデラ" }
    , { rank = 139, pokemonId = 615, name = "フリージオ" }
    , { rank = 140, pokemonId = 618, name = "マッギョ" }
    , { rank = 141, pokemonId = 621, name = "クリムガン" }
    , { rank = 142, pokemonId = 623, name = "ゴルーグ" }
    , { rank = 143, pokemonId = 625, name = "キリキザン" }
    , { rank = 144, pokemonId = 626, name = "バッフロン" }
    , { rank = 145, pokemonId = 627, name = "ワシボン" }
    , { rank = 146, pokemonId = 628, name = "ウォーグル" }
    , { rank = 147, pokemonId = 630, name = "バルジーナ" }
    , { rank = 148, pokemonId = 631, name = "クイタラン" }
    , { rank = 149, pokemonId = 632, name = "アイアント" }
    , { rank = 150, pokemonId = 635, name = "サザンドラ" }
    ]


findRankByPokemonId : Int -> Maybe Int
findRankByPokemonId targetId =
    season34Rankings
        |> List.filter (\ranking -> ranking.pokemonId == targetId)
        |> List.head
        |> Maybe.map .rank


selectTop10 : List UsageRanking
selectTop10 =
    selectTopN 10


selectTopN : Int -> List UsageRanking
selectTopN n =
    season34Rankings
        |> List.take n


findRankByPokemonName : String -> Maybe Int
findRankByPokemonName targetName =
    season34Rankings
        |> List.filter (\ranking -> ranking.name == targetName)
        |> List.head
        |> Maybe.map .rank


-- 使用率上位50位のポケモンのみを取得する関数（名前ベースのマッチング）
selectTop50Pokemon : List Pokemon
selectTop50Pokemon =
    let
        getPokemonByNameFromRanking ranking =
            findPokemonByName ranking.name
    in
    season34Rankings
        |> List.take 50
        |> List.filterMap getPokemonByNameFromRanking


-- 使用率上位150位のポケモンのみを取得する関数（名前ベースのマッチング）
selectTop150Pokemon : List Pokemon
selectTop150Pokemon =
    let
        getPokemonByNameFromRanking ranking =
            findPokemonByName ranking.name
    in
    season34Rankings
        |> List.filterMap getPokemonByNameFromRanking